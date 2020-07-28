Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972A231299
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1E96E365;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF246E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595949409; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H/q18tgDo28MY8nE273GGLyuFx/gqWCWD9iMf0JujQ=;
 b=vU0Bk9vUzSHgl2tFFtaYIhbYSIV/kTIRr1bJTo2Ne3WsXSBS6g4T3DB9B584DfEExtwI5F
 XB0EpveIsi6UycCyqXAMdXvj2gjIj9+OT/LwBLv5nq//997U+SKdGMHrU5MJL9XS9qViM1
 ETvi54X38bnEI+ZuwGgzHd+tfls8xxc=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/ingenic: Handle errors of drm_atomic_get_plane_state
Date: Tue, 28 Jul 2020 17:16:40 +0200
Message-Id: <20200728151641.26124-2-paul@crapouillou.net>
In-Reply-To: <20200728151641.26124-1-paul@crapouillou.net>
References: <20200728151641.26124-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_get_plane_state() can return errors, so we need to handle
these.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ada990a7f911..64eabab3ef69 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -215,10 +215,17 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 
 	if (priv->soc_info->has_osd) {
 		f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
+		if (IS_ERR(f1_state))
+			return PTR_ERR(f1_state);
+
 		f0_state = drm_atomic_get_plane_state(state->state, &priv->f0);
+		if (IS_ERR(f0_state))
+			return PTR_ERR(f0_state);
 
 		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && priv->ipu_plane) {
 			ipu_state = drm_atomic_get_plane_state(state->state, priv->ipu_plane);
+			if (IS_ERR(ipu_state))
+				return PTR_ERR(ipu_state);
 
 			/* IPU and F1 planes cannot be enabled at the same time. */
 			if (f1_state->fb && ipu_state->fb) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
