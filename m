Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF125FDF7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 18:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E16E4BA;
	Mon,  7 Sep 2020 16:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F166E4BA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 16:03:46 +0000 (UTC)
Received: from trochilidae.toradex.int (31-10-206-124.static.upc.ch
 [31.10.206.124])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 85A7B5C05BC;
 Mon,  7 Sep 2020 18:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1599494624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=CpO14UbtP2tQcbPOTl7yEqP11tbFzj3QRmh1sYkSBmQ=;
 b=kY1bUQBRzxxuDEzULSy5YKhMgXtt+FppllGokTl2wN7Zrr+5S2pndPiuPfCKvOMbOOTUJ6
 W/LnlT5SqKQsodfi2kerN5OWY2hOdjoaTViz/spqAClFEYcHVfvnSJYzlzza08198AlZ9q
 xv4SMxvXhHv9zAC0dXdQIF7SfBwQqXE=
From: Stefan Agner <stefan@agner.ch>
To: marex@denx.de,
	stefan@agner.ch
Subject: [PATCH] drm: mxsfb: check framebuffer pitch
Date: Mon,  7 Sep 2020 18:03:43 +0200
Message-Id: <20200907160343.124405-1-stefan@agner.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lcdif IP does not support a framebuffer pitch (stride) other than
the CRTC width. Check for equality and reject the state otherwise.

This prevents a distorted picture when using 640x800 and running the
Mesa graphics stack. Mesa tires to use a cache aligned stride, which
leads at that particular resolution to width != stride. Currently
Mesa has no fallback behavior, but rejecting this configuration allows
userspace to handle the issue correctly.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index b721b8b262ce..79aa14027f91 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_crtc_state *crtc_state;
+	unsigned int pitch;
+	int ret;
 
 	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
 						   &mxsfb->crtc);
 
-	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   false, true);
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  false, true);
+	if (ret || !plane_state->visible)
+		return ret;
+
+	pitch = crtc_state->mode.hdisplay *
+		plane_state->fb->format->cpp[0];
+	if (plane_state->fb->pitches[0] != pitch) {
+		dev_err(plane->dev->dev,
+			"Invalid pitch: fb and crtc widths must be the same");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
