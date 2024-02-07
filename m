Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E909A84C24B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 03:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DADB10FEA5;
	Wed,  7 Feb 2024 02:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pXs9T3GS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F310FEA5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 02:15:18 +0000 (UTC)
X-UUID: ba374f78c55e11ee9e680517dc993faa-20240207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LIwzj4PRSE8nZMkJ2P9QCkeQYE9U4jv4prf+NbUnZEo=; 
 b=pXs9T3GSaFRL+9lavQVguUQm4h9+mqQLEoNcxtgbC1Ava9JCnszt77d/gpMJkr/eGbOwHIQljWXm1REdZqvrCLap6rY3qX/8n+os3ickp9d/kS8ekBn8a85/XdrMowzB4im1+xZ+qvQo1EzxGpGcf5QvuSVoLNvwjhIusDlX/IU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:b58a890d-924b-4820-98ba-ed0caef50c45, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:2ac43380-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba374f78c55e11ee9e680517dc993faa-20240207
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1457236482; Wed, 07 Feb 2024 10:15:13 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Feb 2024 10:15:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Feb 2024 10:15:12 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Hsiao
 Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Date: Wed, 7 Feb 2024 10:15:10 +0800
Message-ID: <20240207021510.24035-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240207021510.24035-1-shawn.sung@mediatek.com>
References: <20240207021510.24035-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

We found a stability issue on MT8188 when connecting an external monitor
in 2560x1440@144Hz mode. Checked with the designer, there is a function
called "prefetch" which is working during VBP (triggered by VSYNC).
If the duration of VBP is too short, the throughput requirement could
increase more than 3 times and lead to stability issues.

The mode settings that VDOSYS supports are mainly affected by clock
rate and throughput, display driver should filter these settings
according to the SoC's limitation to avoid unstable conditions.

Since currently the mode filter is only available on MT8195 and MT8188
and they share the same compatible name, the reference number (8250)
is hard coded instead of in the driver data.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 56 +++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 17 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 17 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 12 ++++
 6 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index eb738f14f09e3..4a5661334fb1a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -72,6 +72,8 @@ void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int
 			      struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+enum drm_mode_status mtk_merge_mode_valid(struct device *dev,
+					  const struct drm_display_mode *mode);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
@@ -130,6 +132,8 @@ unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
+enum drm_mode_status mtk_ovl_adaptor_mode_valid(struct device *dev,
+						const struct drm_display_mode *mode);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index c19fb1836034d..6b065ee254455 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -223,6 +223,62 @@ void mtk_merge_clk_disable(struct device *dev)
 	clk_disable_unprepare(priv->clk);
 }
 
+enum drm_mode_status mtk_merge_mode_valid(struct device *dev,
+					  const struct drm_display_mode *mode)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+	unsigned long rate = 0;
+
+	rate = clk_get_rate(priv->clk);
+
+	/* Convert to KHz and round the number */
+	rate = (rate + 500) / 1000;
+
+	if (rate && mode->clock > rate) {
+		dev_dbg(dev, "invalid clock: %d (>%lu)\n", mode->clock, rate);
+		return MODE_CLOCK_HIGH;
+	}
+
+	/*
+	 * Measure the bandwidth requirement of hardware prefetch (per frame)
+	 *
+	 * let N = prefetch buffer size in lines
+	 *         (ex. N=3, then prefetch buffer size = 3 lines)
+	 *
+	 * prefetch size = htotal * N (pixels)
+	 * time per line = 1 / fps / vtotal (seconds)
+	 * duration      = vbp * time per line
+	 *               = vbp / fps / vtotal
+	 *
+	 * data rate = prefetch size / duration
+	 *           = htotal * N / (vbp / fps / vtotal)
+	 *           = htotal * vtotal * fps * N / vbp
+	 *           = clk * N / vbp (pixels per second)
+	 *
+	 * Say 4K60 (CAE-861) is the maximum mode supported by the SoC
+	 * data rate = 594000K * N / 72 = 8250 (standard)
+	 * (remove K*N because of the same unit)
+	 *
+	 * For 2560x1440@144 (clk=583600K, vbp=17):
+	 * rate = 583600 / 17 ~= 34329 > 8250 (NG)
+	 *
+	 * For 2560x1440@120 (clk=497760K, vbp=77):
+	 * rate = 497760 / 77 ~= 6464 < 8250 (OK)
+	 *
+	 * Bandwidth requirement of hardware prefetch increases significantly
+	 * when the VBP decreases (more than 4x in this example).
+	 */
+	rate = mode->clock / (mode->vtotal - mode->vsync_end);
+
+	if (rate > 8250) {
+		dev_dbg(dev, "invalid rate: %lu (>8250): " DRM_MODE_FMT "\n",
+			rate, DRM_MODE_ARG(mode));
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
 static int mtk_disp_merge_bind(struct device *dev, struct device *master,
 			       void *data)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 10d23e76acaa9..6d4334955e3d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -88,6 +88,7 @@ static const struct mtk_ddp_comp_funcs ethdr = {
 static const struct mtk_ddp_comp_funcs merge = {
 	.clk_enable = mtk_merge_clk_enable,
 	.clk_disable = mtk_merge_clk_disable,
+	.mode_valid = mtk_merge_mode_valid,
 };
 
 static const struct mtk_ddp_comp_funcs padding = {
@@ -341,6 +342,22 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev)
 	}
 }
 
+enum drm_mode_status mtk_ovl_adaptor_mode_valid(struct device *dev,
+						const struct drm_display_mode *mode)
+
+{
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev || !comp_matches[i].funcs->mode_valid)
+			continue;
+		return comp_matches[i].funcs->mode_valid(dev, mode);
+	}
+	return MODE_OK;
+}
+
 unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
 {
 	return MTK_OVL_ADAPTOR_LAYER_NUM;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 1dac8d0fbc669..14cf75fa217f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -212,6 +212,22 @@ static void mtk_drm_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(to_mtk_crtc_state(state));
 }
 
+static enum drm_mode_status
+mtk_drm_crtc_mode_valid(struct drm_crtc *crtc,
+			const struct drm_display_mode *mode)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	enum drm_mode_status status = MODE_OK;
+	int i;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		status = mtk_ddp_comp_mode_valid(mtk_crtc->ddp_comp[i], mode);
+		if (status != MODE_OK)
+			break;
+	}
+	return status;
+}
+
 static bool mtk_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 				    const struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode)
@@ -830,6 +846,7 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_fixup	= mtk_drm_crtc_mode_fixup,
 	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
+	.mode_valid	= mtk_drm_crtc_mode_valid,
 	.atomic_begin	= mtk_drm_crtc_atomic_begin,
 	.atomic_flush	= mtk_drm_crtc_atomic_flush,
 	.atomic_enable	= mtk_drm_crtc_atomic_enable,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 9633e860cc3ce..94590227c56a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -416,6 +416,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.remove = mtk_ovl_adaptor_remove_comp,
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
+	.mode_valid = mtk_ovl_adaptor_mode_valid,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index f8c7e8d8ddc12..215b7234ff13c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -12,6 +12,8 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
 
+#include <drm/drm_modes.h>
+
 struct device;
 struct device_node;
 struct drm_crtc;
@@ -84,6 +86,7 @@ struct mtk_ddp_comp_funcs {
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
 	unsigned int (*encoder_index)(struct device *dev);
+	enum drm_mode_status (*mode_valid)(struct device *dev, const struct drm_display_mode *mode);
 };
 
 struct mtk_ddp_comp {
@@ -125,6 +128,15 @@ static inline void mtk_ddp_comp_clk_disable(struct mtk_ddp_comp *comp)
 		comp->funcs->clk_disable(comp->dev);
 }
 
+static inline
+enum drm_mode_status mtk_ddp_comp_mode_valid(struct mtk_ddp_comp *comp,
+					     const struct drm_display_mode *mode)
+{
+	if (comp && comp->funcs && comp->funcs->mode_valid)
+		return comp->funcs->mode_valid(comp->dev, mode);
+	return MODE_OK;
+}
+
 static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
 				       unsigned int w, unsigned int h,
 				       unsigned int vrefresh, unsigned int bpc,
-- 
2.18.0

