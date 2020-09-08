Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B232611AE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 14:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88406E821;
	Tue,  8 Sep 2020 12:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117D89FD4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 12:56:02 +0000 (UTC)
Received: from trochilidae.toradex.int (31-10-206-124.static.upc.ch
 [31.10.206.124])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6BFD55C4CAB;
 Tue,  8 Sep 2020 14:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1599569760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=qxfcotVSiPgSlKPB5rZ5xXDXpnK6trtv7RzFevjZqVc=;
 b=GpnxllrNBTG+jCZMxIjRiuwMkKDhmunZ5oYrsTtVr2FjWZ8FBeSR3aOGSCi7oxp+4zOEZD
 YK2pCIkK0Kx+ZXHdzzFoKzQv6R7cIYiuV7+Ho/qw0lMc2tEpjklLwNUcVrnZ/1kNm0HRUQ
 XuSQkc1BYcXovM4hqzcwycbL+krdrP0=
From: Stefan Agner <stefan@agner.ch>
To: marex@denx.de,
	stefan@agner.ch
Subject: [PATCH v2] drm: mxsfb: check framebuffer pitch
Date: Tue,  8 Sep 2020 14:55:58 +0200
Message-Id: <20200908125558.256843-1-stefan@agner.ch>
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
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lcdif IP does not support a framebuffer pitch (stride) other than
framebuffer width. Check for equality and reject the framebuffer
otherwise.

This prevents a distorted picture when using 640x800 and running the
Mesa graphics stack. Mesa tires to use a cache aligned stride, which
leads at that particular resolution to width != stride. Currently
Mesa has no fallback behavior, but rejecting this configuration allows
userspace to handle the issue correctly.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 8c549c3931af..fa6798d21029 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -21,6 +21,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_irq.h>
@@ -81,8 +82,26 @@ void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
 		clk_disable_unprepare(mxsfb->clk_axi);
 }
 
+static struct drm_framebuffer *
+mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	const struct drm_format_info *info;
+
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
+		dev_dbg(dev->dev, "Invalid pitch: fb width must match pitch\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+}
+
 static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
-	.fb_create		= drm_gem_fb_create,
+	.fb_create		= mxsfb_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
