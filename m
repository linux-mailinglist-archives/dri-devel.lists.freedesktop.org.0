Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E031CCD8A8C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 10:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFF010E0C2;
	Tue, 23 Dec 2025 09:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f0f8pNMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC9310E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 09:55:05 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7f89d0b37f0so2920078b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766483705; x=1767088505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
 b=f0f8pNMr7nI7rQpf8r5Zj/nhYWvp9bVhxByYMIu5gcrcXzSw3x2u+xRb4i+9plqtif
 MA31SvOqs25pxtz9MpdhxE/8TuZdPTmZITHf6cVlD8OGe0s/QLwEZOqG9+zleyKLCLcB
 YJGkNPjvxSTWBSQokBv6JBg2ezbxA1w4JNA3Uj4AphKjdOQtiGyMCgyYOMn1lwuD8bOz
 d40R/1bViAUrDD5awkF44xTqqH6R0zmsc6L70TbPLcRuXg7pMoSYkQhfHBruuWMKxwlL
 8C00SfX0OgzYzLCyN+vDfR67GEWs5P/GxOuUMGGeeQdgqY+fNFR3Vj/OuEeC3atgh6z6
 o1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766483705; x=1767088505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPXyR+DtSHvjmSw63vey96VhbW0eHbWu1L3mVM+HHkU=;
 b=EcyLpjKGz4rrVp1JyM8521j+a4OIxbP7Nw6yWmPY0XriYBPD6wkiyBbimG+5myrDiH
 kgoOpinGxI1ng8dDwXTwaW7DFyzUFO6hOyncvloyeV4emy/1wvCLpFVmqfQi+zeLE0y9
 wOS8azNPJmV7R+4iRGymmU8SaKJAOKub3LGkwzmzHVAZC9CAaOSDNd5JPxCl5ki5yTrL
 VpQvkSLoxlc4RbQXy8RyH3YtArruDIix8zIzg/vw+NPYpExozzrQcqxi/X5rEdJZgZi1
 LOBIWJLH4HnPZ125B5y7F/l44YHMmcQ8oxyY6cAAD3VypSllFh6TYE4WWQG3azdw9g8v
 Km9A==
X-Gm-Message-State: AOJu0Ywp/hv3exy3NTwbhHwwg1y4VoADN6Z4YfBGl3jqZlpESttAAjVv
 j+9KMUiGNKKgiFukWjuAyEJcYA1vsxohFqnhCYq79xP+vOixR0I84hMN
X-Gm-Gg: AY/fxX7P8tdXJ+UZmJLbqwXmg75DsI6Lhvmb7/UUmtSXFJXL3NdSVk5kGSkWpC2AZ+0
 Dg2kFu+n38j1fTtLGTpE2+mcaqUiFylSTiHjJjslb48X87BsmAz8JnsDx5ckeqEED7y00kKKZAg
 r/VIernO8HhDg7wD+NuXf8cpeUOKarzCK3oyfe6icEz+rO6qwAO+lReLJ1MA+A7QKV9iD+TF/Tp
 WiDZxQJxzA5lWzq3sODG7WBK2wuwx28aE68Er0MRvke17N0saeDV6g5hnakCKc6UNbxOMPCpyHd
 v+ch278lQt2P2rapjVP/Rm9EY4YDSZf0nQp5sW22yLhD8aeDARikUSdBdGDq4RoWbngi1KldO1U
 B33fj4kOOK3NSBqIn9CPEJNjbvbLn192pNpytHHZZ03Jjb8UrTXT8w7o0iKcwHbLrJtaGCF+cy6
 P1FQXEYbRPaddMBQwbWzTTCXU89M3x
X-Google-Smtp-Source: AGHT+IEdzNfnqNUJyDypKzn3dPYc29vkogAq63TVtVQNeWPmClzH/fQB7OhCe8Q/j5leeIRr37dB1w==
X-Received: by 2002:a05:6a20:6a07:b0:371:7666:648c with SMTP id
 adf61e73a8af0-3769f3351f4mr13306712637.24.1766483704666; 
 Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d776ebsm124413885ad.99.2025.12.23.01.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 01:55:04 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 lkp@intel.com, abhiraj21put@gmail.com
Subject: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_* helpers
 in mtk_crtc.c
Date: Tue, 23 Dec 2025 15:24:34 +0530
Message-ID: <20251223095434.492041-1-abhiraj21put@gmail.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com/
Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
---
v2:
- Fix unused variable warning when CONFIG_MTK_CMDQ is disabled
- Added Reported-by and Closes tags
Link to v1:
https://lore.kernel.org/all/20251217070303.689913-1-abhiraj21put@gmail.com/
 drivers/gpu/drm/mediatek/mtk_crtc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5f..bca2e40bca54 100644
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
 
@@ -648,10 +650,11 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	struct drm_device *dev = mtk_crtc->base.dev;
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
2.34.1

