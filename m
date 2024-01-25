Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC983D058
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1C410EE96;
	Thu, 25 Jan 2024 23:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576DF10ECF8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2cf3a095ba6so11174291fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223768; x=1706828568; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EPgkhGQ6zER9SACuWkra57baVOgflgf9HfV1jDO/gQk=;
 b=FLWsm6qtCECqtElmljqWBtuLxdQ6e3krbDKe/Mt7ZGMeYK0oSZZOhnFQbi5ijcQjL+
 0GGVoXvWXkMdxAXzvKK7mzI2iyCgdHGxR/f0AIE2idGw72DlFKhkNbCUf7cAZC/CBeif
 JMZFTZOTE+XZPJ1Jrx7HtwUYrgZvMTvnDdvVWRSpWSaqBLYBGFuh/21qbu8nq0dzOgR3
 cxnEN6/7FERlIsiOlBWrZ+6rHjbkgvEsUW9MIDH9gEFp8mvaIG5u+T7d8+2ksHIYBPuG
 7l0Jv/jRZdUbzWvhm262RWhvEhqkWBGmsblQYO7A5tLd2JThrDVOMwfS82hh2gLEhLUj
 K8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223768; x=1706828568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPgkhGQ6zER9SACuWkra57baVOgflgf9HfV1jDO/gQk=;
 b=dn5qlSDDOjEQuXc37DpK6dqkGKFm7vG9+MeUBTpEfUv/Q/ecj4mgIZpOfZiHoPl4Ku
 cXMX0aYRr0WOUfgA6wOOq56OacNTBoC9orxET9EEFiPXmQ0uy7eytGnhdUruhb4blbgF
 m4402LNfU3ZpOembFN1VjmnmctcyBX2VyzzVeIu9DB9BC96giIGD6nLqrnQEHDtniijX
 6wUXqVB3wqktOreu9XC93wTZVtRTOb3RtsUjsher7RzMJ7S5VtCmX8Tabyy6BKoaMFmU
 PgYDdhEh1HjrHBQeBVVa+GzFKdqv2yMtIHyrJS0+jhGB+/RQEvBIThejS1XhRU9lvdhO
 JR6Q==
X-Gm-Message-State: AOJu0YzEZKzVAVurMk37zyLy3hoGzFtDK5y4+nYa2UM/v6Mteeyt76gx
 AnC1UwLYkoTk13hEUC4IRqhFhcn6qbKkUuk3XxB1qVlu1yyUFn9kIUtPO+zhTXg=
X-Google-Smtp-Source: AGHT+IE/o8+ehoh+QJYpoEHp9Ue/I+CxXBc+6FYjDzxInd7h/nwvNPkYWq2wjVOgUWE0gpMLR73zGg==
X-Received: by 2002:a2e:8084:0:b0:2cf:2e11:a7e7 with SMTP id
 i4-20020a2e8084000000b002cf2e11a7e7mr211138ljg.104.1706223768621; 
 Thu, 25 Jan 2024 15:02:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:41 +0200
Subject: [PATCH v3 12/15] drm/msm/dp: move all IO handling to dp_catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-12-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=15683;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4haPu/EU0pKy8SZtYGHLRCJK+SOCPq9DESc6lfR/q/8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qmFx0d0U9nKfyZnLDmc7xas4aFzr1pza8r1mdULk428
 H+3aqdeJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmMrGM/SdjcT/vnqqIBJGl
 n4JPFzaycM25mB834Ybl9LePb6hHXsnrKr9fHi1wW10k2XHKaZHs76yOgXnXz/v95Pm069ZnXzH
 xfbc02Hd/Ebzoe/LYzas/9UzLJn6U2W3gz+140EfGvN7hbPSuaL61S/X0t0vlZ4vNfHbQ2IHznp
 fR/ZScCROyyuTdXML3hgu3FvQWphizsDB1iygVctz3nnmTM4PToOGp32f2qFfvPv+s+d5TwqN8M
 /rdj9xLmX3p8baul10ZdCJtp2loqB+RvxsRcXe5q23J+TuZnz4kKUQdT3zj7+yoviPA79mOaxua
 /ONu8N7MUMqe5baAackTWValj51LtdlWf313Zo8yQ7orAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than parsing the I/O addresses from dp_parser and then passing
them via a struct pointer to dp_catalog, handle I/O region parsing in
dp_catalog and drop it from dp_parser.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 125 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   6 +-
 drivers/gpu/drm/msm/dp/dp_parser.c  |  73 +--------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  26 +-------
 5 files changed, 114 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4c6207797c99..541aac2cb246 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/platform_device.h>
 #include <linux/rational.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -53,10 +54,31 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_DEFAULT_AHB_OFFSET	0x0000
+#define DP_DEFAULT_AHB_SIZE	0x0200
+#define DP_DEFAULT_AUX_OFFSET	0x0200
+#define DP_DEFAULT_AUX_SIZE	0x0200
+#define DP_DEFAULT_LINK_OFFSET	0x0400
+#define DP_DEFAULT_LINK_SIZE	0x0C00
+#define DP_DEFAULT_P0_OFFSET	0x1000
+#define DP_DEFAULT_P0_SIZE	0x0400
+
+struct dss_io_region {
+	size_t len;
+	void __iomem *base;
+};
+
+struct dss_io_data {
+	struct dss_io_region ahb;
+	struct dss_io_region aux;
+	struct dss_io_region link;
+	struct dss_io_region p0;
+};
+
 struct dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct dp_io *io;
+	struct dss_io_data io;
 	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct dp_catalog dp_catalog;
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
@@ -66,7 +88,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 			struct dp_catalog_private, dp_catalog);
-	struct dss_io_data *dss = &catalog->io->dp_controller;
+	struct dss_io_data *dss = &catalog->io;
 
 	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
 	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
@@ -76,7 +98,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.aux.base + offset);
+	return readl_relaxed(catalog->io.aux.base + offset);
 }
 
 static inline void dp_write_aux(struct dp_catalog_private *catalog,
@@ -86,12 +108,12 @@ static inline void dp_write_aux(struct dp_catalog_private *catalog,
 	 * To make sure aux reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.aux.base + offset);
+	writel(data, catalog->io.aux.base + offset);
 }
 
 static inline u32 dp_read_ahb(const struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.ahb.base + offset);
+	return readl_relaxed(catalog->io.ahb.base + offset);
 }
 
 static inline void dp_write_ahb(struct dp_catalog_private *catalog,
@@ -101,7 +123,7 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.ahb.base + offset);
+	writel(data, catalog->io.ahb.base + offset);
 }
 
 static inline void dp_write_p0(struct dp_catalog_private *catalog,
@@ -111,7 +133,7 @@ static inline void dp_write_p0(struct dp_catalog_private *catalog,
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.p0.base + offset);
+	writel(data, catalog->io.p0.base + offset);
 }
 
 static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
@@ -121,12 +143,12 @@ static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io->dp_controller.p0.base + offset);
+	return readl_relaxed(catalog->io.p0.base + offset);
 }
 
 static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io->dp_controller.link.base + offset);
+	return readl_relaxed(catalog->io.link.base + offset);
 }
 
 static inline void dp_write_link(struct dp_catalog_private *catalog,
@@ -136,7 +158,7 @@ static inline void dp_write_link(struct dp_catalog_private *catalog,
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.link.base + offset);
+	writel(data, catalog->io.link.base + offset);
 }
 
 /* aux related catalog functions */
@@ -248,7 +270,7 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* poll for hpd connected status every 2ms and timeout after 500ms */
-	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
+	return readl_poll_timeout(catalog->io.aux.base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				2000, 500000);
@@ -276,7 +298,7 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
-	struct dss_io_data *io = &catalog->io->dp_controller;
+	struct dss_io_data *io = &catalog->io;
 
 	pr_info("AHB regs\n");
 	dump_regs(io->ahb.base, io->ahb.len);
@@ -500,7 +522,7 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link.base +
+	ret = readx_poll_timeout(readl, catalog->io.link.base +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -563,7 +585,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io->dp_controller.link.base +
+	ret = readl_poll_timeout(catalog->io.link.base +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -945,21 +967,84 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
 	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
-struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
+static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
-	struct dp_catalog_private *catalog;
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
+	if (!IS_ERR(base))
+		*len = resource_size(res);
+
+	return base;
+}
+
+static int dp_catalog_get_io(struct dp_catalog_private *catalog)
+{
+	struct platform_device *pdev = to_platform_device(catalog->dev);
+	struct dss_io_data *dss = &catalog->io;
+
+	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
+	if (IS_ERR(dss->ahb.base))
+		return PTR_ERR(dss->ahb.base);
 
-	if (!io) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-EINVAL);
+	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	if (IS_ERR(dss->aux.base)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -EINVAL here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux.base) == -EINVAL) {
+			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+			dss->aux.len = DP_DEFAULT_AUX_SIZE;
+			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+			dss->link.len = DP_DEFAULT_LINK_SIZE;
+			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+			dss->p0.len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
+			return PTR_ERR(dss->aux.base);
+		}
+	} else {
+		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		if (IS_ERR(dss->link.base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
+			return PTR_ERR(dss->link.base);
+		}
+
+		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		if (IS_ERR(dss->p0.base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
+			return PTR_ERR(dss->p0.base);
+		}
 	}
 
+	return 0;
+}
+
+struct dp_catalog *dp_catalog_get(struct device *dev)
+{
+	struct dp_catalog_private *catalog;
+	int ret;
+
 	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
 	if (!catalog)
 		return ERR_PTR(-ENOMEM);
 
 	catalog->dev = dev;
-	catalog->io = io;
+
+	ret = dp_catalog_get_io(catalog);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return &catalog->dp_catalog;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f3f58d4b8de..989e4c4fd6fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -126,7 +126,7 @@ void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
 void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
 
-struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io);
+struct dp_catalog *dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
 void dp_catalog_audio_get_header(struct dp_catalog *catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8388e04bd0f..5ad96989c5f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -721,7 +721,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
+	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
 		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
@@ -730,7 +730,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->aux = dp_aux_get(dev, dp->catalog,
-			     dp->parser->io.phy,
+			     dp->parser->phy,
 			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
@@ -761,7 +761,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
-			       dp->parser->io.phy);
+			       dp->parser->phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index de7cfc340f0c..2d0dd4353cdf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -13,80 +13,13 @@
 #include "dp_parser.h"
 #include "dp_reg.h"
 
-#define DP_DEFAULT_AHB_OFFSET	0x0000
-#define DP_DEFAULT_AHB_SIZE	0x0200
-#define DP_DEFAULT_AUX_OFFSET	0x0200
-#define DP_DEFAULT_AUX_SIZE	0x0200
-#define DP_DEFAULT_LINK_OFFSET	0x0400
-#define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
-
-static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
-{
-	struct resource *res;
-	void __iomem *base;
-
-	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
-	if (!IS_ERR(base))
-		*len = resource_size(res);
-
-	return base;
-}
-
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
 	struct platform_device *pdev = parser->pdev;
-	struct dp_io *io = &parser->io;
-	struct dss_io_data *dss = &io->dp_controller;
-
-	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
-	if (IS_ERR(dss->ahb.base))
-		return PTR_ERR(dss->ahb.base);
-
-	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
-	if (IS_ERR(dss->aux.base)) {
-		/*
-		 * The initial binding had a single reg, but in order to
-		 * support variation in the sub-region sizes this was split.
-		 * dp_ioremap() will fail with -EINVAL here if only a single
-		 * reg is specified, so fill in the sub-region offsets and
-		 * lengths based on this single region.
-		 */
-		if (PTR_ERR(dss->aux.base) == -EINVAL) {
-			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-				DRM_ERROR("legacy memory region not large enough\n");
-				return -EINVAL;
-			}
-
-			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-			dss->aux.len = DP_DEFAULT_AUX_SIZE;
-			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-			dss->link.len = DP_DEFAULT_LINK_SIZE;
-			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-			dss->p0.len = DP_DEFAULT_P0_SIZE;
-		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
-			return PTR_ERR(dss->aux.base);
-		}
-	} else {
-		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
-		if (IS_ERR(dss->link.base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
-			return PTR_ERR(dss->link.base);
-		}
-
-		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
-		if (IS_ERR(dss->p0.base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
-			return PTR_ERR(dss->p0.base);
-		}
-	}
 
-	io->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(io->phy))
-		return PTR_ERR(io->phy);
+	parser->phy = devm_phy_get(&pdev->dev, "dp");
+	if (IS_ERR(parser->phy))
+		return PTR_ERR(parser->phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index b28052e87101..7306768547a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -14,37 +14,15 @@
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
-struct dss_io_region {
-	size_t len;
-	void __iomem *base;
-};
-
-struct dss_io_data {
-	struct dss_io_region ahb;
-	struct dss_io_region aux;
-	struct dss_io_region link;
-	struct dss_io_region p0;
-};
-
-/**
- * struct dp_ctrl_resource - controller's IO related data
- *
- * @dp_controller: Display Port controller mapped memory address
- * @phy_io: phy's mapped memory address
- */
-struct dp_io {
-	struct dss_io_data dp_controller;
-	struct phy *phy;
-};
-
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
  * @pdev: platform data of the client
+ * @phy: PHY handle
  */
 struct dp_parser {
 	struct platform_device *pdev;
-	struct dp_io io;
+	struct phy *phy;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;

-- 
2.39.2

