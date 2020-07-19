Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90A22589A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003C16E02F;
	Mon, 20 Jul 2020 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75B882B5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595151520; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=4rTWGEb0TCGTaJ2JZjGbv3v8RlhO7/L0QwLQpPrWcug=;
 b=r0bAcO7F3neDY0RyulTXBBvvWuOMNDtLcerHQlbi7lSSukiwE84E4zJs0IYoWP+4OeAuce
 gDQpaxz2CIRGh6eUNFF47sTPUXES8zX5M/PmS4UUBmBnyL4ow2LAKVf0dd6jwa2FiAMHnV
 rkATg1J0JYFlzqEfLjNrq9WfPiWKy6c=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/ingenic: Silence uninitialized-variable warning
Date: Sun, 19 Jul 2020 11:38:34 +0200
Message-Id: <20200719093834.14084-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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

Silence compiler warning about used but uninitialized 'ipu_state'
variable. In practice, the variable would never be used when
uninitialized, but the compiler cannot know that 'priv->ipu_plane' will
always be NULL if CONFIG_INGENIC_IPU is disabled.

Silence the warning by initializing the value to NULL.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b6d946fbeaf5..ada990a7f911 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -198,7 +198,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 					 struct drm_crtc_state *state)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
-	struct drm_plane_state *f1_state, *f0_state, *ipu_state;
+	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
 	long rate;
 
 	if (!drm_atomic_crtc_needs_modeset(state))
@@ -229,7 +229,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 
 		/* If all the planes are disabled, we won't get a VBLANK IRQ */
 		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
-				  !(priv->ipu_plane && ipu_state->fb);
+				  !(ipu_state && ipu_state->fb);
 	}
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
