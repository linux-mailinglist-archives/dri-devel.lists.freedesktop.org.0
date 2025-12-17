Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45326CC6548
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 08:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2EA10EBBE;
	Wed, 17 Dec 2025 07:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e/UhGgTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409ED10EBBE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 07:03:23 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a09d981507so2383675ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765955003; x=1766559803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iADtR7py4dtGWy06rD42XqEtE43GI8bd+5EMoGfsWAc=;
 b=e/UhGgTk68CLrRYuAaVuraaN5j6qM74EKby/z3nakd1doKQJ6sSRAayRM2IKqKqDjK
 Q2NQU47zjEN4t8GFzcSkm5h5ldVol81ZToHUGxuoAUSbl9SU0fip6Egb1x5vpQEJUxJT
 g1ivj8DLgM5o7Guk/PaOTCJtGo6sUnTHnYVhu4dQau1NdiMlAVJASSGPhtr5OdaLtBav
 MU9POJOCI6Xm3w8fT5Q0RIjH+4wasIE4zm/FIVWSRNZAvztvAT5AtCFeQmvLAUeOgAyQ
 NwoAnlnAkytvpn7+lf2IKnNgY9fFOVHBcEvN+dzcZ3vXAQbBcCOpu5Fp42eZallLhxdf
 Tq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765955003; x=1766559803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iADtR7py4dtGWy06rD42XqEtE43GI8bd+5EMoGfsWAc=;
 b=riHjlv2fNOh/HQFevfd6j26bvhTaOa+mvTzDwZNpsoTemwfY6mfaTHw8MjkoN0Mmr6
 ymsVzHw0PDZ++HhVL07VqOMbnwv1XrlQ3FVUK1zoaC4Fl6wgGXqXlYN7tDjoNB+epWnk
 ATeamKnxxndeqHuTOVNyHRyGhoiEP1oVe4kIgieJ3oKjXwqKHHHuPjgc5FDKSbK0WGDB
 MNNSgZrVvgSc0Sl/rKfSAM1+7GycIhFDSIwwt0CmLjsyCPUNYoutE9/qfwsMty/YPM74
 cxKtqUaU/jSVnJdU81EcmQ7Q8V0ZB79zAIZxjn2/Q318zchLJ40DuSzpgM9v/vWbpCEe
 wRjQ==
X-Gm-Message-State: AOJu0YwObKY4Nw95zLNRA0rMioVVwa0heDMU/pnGZo4OWLZBowHEnUxL
 glnRTZ2Ns8EihS880/8Gpvqj8PydFeIwSElAXiPPUIilxPiJw0RWDEVg
X-Gm-Gg: AY/fxX5X2GSIyEa+JnUlClq0fAbjUSKz4GUoZfAp//oxCJayGKyJTg6zIyjcjT8726K
 7UFiDyGYEuK3ORXGVTOhqGFFx8X9yCVhxqyPIBK3QeVqXEg5BEezprCzj4sqL03wzDR0pCEY7kC
 5vJJaEO/QJ2Tq6EYfzTMVi3dzDczn89uKlikJSYuuP1cvPVNR/wz+ifWSNEZOF5oYpWjEUyuCIk
 E4mJmTlcFHZ9K9/erK2nPtsmN4Kj+UkRRs2gozcKoA2DyMgZuL2rXXqEYNQIWlASvmFq3MnkOyP
 tmbUGdz+jAHJianmGqv1IGCprtb7tPD+//A1YRivtuQyMVCWieK1tLHIKkKSlz5c5/Doler7V3I
 yHjfpTqut2LsC3GSKcI7x/pQ2kK2S2ho2HxBcazSJwSteC64/YbbjBIQVZecYEkxLZK0gUYzn42
 nwdA1uLetwxv8JzOKd5qZC+APcXcT5
X-Google-Smtp-Source: AGHT+IGCYU18Ca2RWUMvCJ0sVnyeC8Bodbi6VqfzMnMmAkitSTRJ6ok0SBgg90i1lNAaAHGXG3JSBg==
X-Received: by 2002:a17:903:19ed:b0:2a0:b432:4a6 with SMTP id
 d9443c01a7336-2a0b43206d4mr128905375ad.15.1765955002656; 
 Tue, 16 Dec 2025 23:03:22 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29f173823dbsm159876425ad.12.2025.12.16.23.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 23:03:22 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 abhiraj21put@gmail.com
Subject: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_* helpers in
 mtk_crtc.c
Date: Wed, 17 Dec 2025 12:33:03 +0530
Message-ID: <20251217070303.689913-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace DRM_ERROR() and DRM_DEBUG_DRIVER() calls in
drivers/gpu/drm/mediatek/mtk_crtc.c with the corresponding drm__err()
and drm_dbg_driver() helpers.

The drm_*() logging helpers take a struct drm_device * argument,
allowing the DRM core to prefix log messages with the correct device
name and instance. This is required to correctly distinguish log
messages on systems with multiple GPUs.

This change aligns the Mediatek DRM driver with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5f..9f7e2c7fee93 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -227,11 +227,12 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 {
 	int ret;
 	int i;
+	struct drm_device *dev = mtk_crtc->base.dev;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		ret = mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
 		if (ret) {
-			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
+			drm_err(dev, "Failed to enable clock %d: %d\n", i, ret);
 			goto err;
 		}
 	}
@@ -343,6 +344,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned int width, height, vrefresh, bpc = MTK_MAX_BPC;
 	int ret;
 	int i;
@@ -371,19 +373,19 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 
 	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
+		drm_err(dev, "Failed to enable power domain: %d\n", ret);
 		return ret;
 	}
 
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
+		drm_err(dev, "Failed to enable mutex clock: %d\n", ret);
 		goto err_pm_runtime_put;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
-		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
+		drm_err(dev, "Failed to enable component clocks: %d\n", ret);
 		goto err_mutex_unprepare;
 	}
 
@@ -646,12 +648,13 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct drm_crtc *crtc = data;
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct drm_device *dev = mtk_crtc->base.dev;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
 		mtk_crtc_ddp_config(crtc, NULL);
 	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
-		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+		drm_err(dev, "mtk_crtc %d CMDQ execute command timeout!\n",
 			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
@@ -776,9 +779,10 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int ret;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 
 	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
@@ -803,9 +807,10 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct drm_device *dev = mtk_crtc->base.dev;
 	int i;
 
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
+	drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
 		return;
 
@@ -845,10 +850,11 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 									  crtc);
 	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_device *dev = mtk_crtc->base.dev;
 	unsigned long flags;
 
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
-		DRM_ERROR("new event while there is still a pending event\n");
+		drm_err(dev, "new event while there is still a pending event\n");
 
 	if (mtk_crtc_state->base.event) {
 		mtk_crtc_state->base.event->pipe = drm_crtc_index(crtc);
-- 
2.43.0

