Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BB3D377A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C586F8C5;
	Fri, 23 Jul 2021 09:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76B56F8C5;
 Fri, 23 Jul 2021 09:15:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D50BC60ED4;
 Fri, 23 Jul 2021 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627031739;
 bh=SE6snYvEeeZ9b06fLIc5TbNhAAvsQE2VfQEDDanskLQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ahof7/VWmPmw0D21oaa1MW95ypJ8UCeqvOHW0gxCOovI1GP4WDQob2SBP6z6mG5kM
 rdkvSamfwj66jEMJkDqwBeIhZ650s1C2OzzobetoM2lIqESrHUshs/SfneFj1zoFcI
 QfhI6pP8cT4as2G8hKYqUcmCyj+/HzjzfUpZzRkiQqDh6JwEL9YFRXHOSy3sL9PNq4
 fOkHTpqtF7RxRupdpMFNpgGck7vrfreFZIlP3dg22xQnZru3tT0q0FySu6P+SJnPAh
 WN3506dobl/mPLCtlxUSq/yHH9Ulb8oLe3H+71W6DJSqy9gCbW2fv3UMuAW3TGnKKH
 HZXUqs24iWNdQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
Date: Fri, 23 Jul 2021 11:15:27 +0200
Message-Id: <20210723091534.1730564-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When the backlight support is disabled, the driver fails to build:

drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
 1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
      |                                                           ^~
drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
 1670 |         if (backlight && backlight->uses_dpcd) {
      |                                   ^~
drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
 1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
      |                                                                ^~

The patch that introduced the problem already contains some #ifdef
checks, so just add another one that makes it build again.

Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 093e1f7163b3..fcf53e24db21 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1659,20 +1659,23 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
-	struct nouveau_backlight *backlight = nv_connector->backlight;
 	struct drm_dp_aux *aux = &nv_connector->aux;
-	int ret;
 	u8 pwr;
 
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_backlight *backlight = nv_connector->backlight;
+
 	if (backlight && backlight->uses_dpcd) {
-		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
+		int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
+
 		if (ret < 0)
 			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
 				 nv_connector->base.base.id, nv_connector->base.name, ret);
 	}
+#endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
 		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
-- 
2.29.2

