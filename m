Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9D41F35E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B096EE84;
	Fri,  1 Oct 2021 17:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705196EE7E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:42:19 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so12438612otb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGy9mZiNTcV5etgHVGwymerH3fD0AS7MvJ9UyCdIkU8=;
 b=pSXnf5t3uN2nk/PMuB0dqtPx9YN0bcx4Cww9UiRSa3YIWXAZ/G2XefKyl5PfpJFIg4
 B2BIDMF/OB3TP4uHWCpsEuBHkTiFQyzjsVFcquOPna/7ZU+Mn7vh4SSF8wOeokzI1CBH
 4Xv2IuRUhyrRTcaM/HFtjub5MkmGefaP2MMUgY/lFekvV9KPUFkQ8XbxePk9Oj1NrOPg
 48xHgEC5HCkEgRlg2WLPPVu0+gkEEtl6qDOzAmvoQtjr84YzkdnESTQlYfe0LT/PAft2
 4iyi5QEWAAq19NvOX1AEB1UccBGHbfiOfhBOwost4buDjdOsNOHXhMVkKChYRZMT3tlV
 WwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGy9mZiNTcV5etgHVGwymerH3fD0AS7MvJ9UyCdIkU8=;
 b=797CYQehbXFHUToBh+hTgKfg4SLGhU/B6ztPuaVdmC0v6Aly2adOI+ao0ivpNMl+KO
 s6ZgVLTK9ltPU5NzwehL4bxwyvgfO07mtUFsrWzkoK6g7r4EdFsRuCvDMnDk4d62yOb+
 qiqNgJf28r+Mnx8BG3HGWpK2drvLbNpTN2J1bgUU7I87yUMR0ACe+wMv9fTznle+kfTl
 +zPuaN91GJVa/Bl2K9t4Mu7qCzi7EHrpeWXSkYYqPECg3qUd7X+Uwa03353T3VEdMAOQ
 elTWs8EvQKDgWMxAVrgZOtxCOT7WFAqijqgIeU3JVX9puYHvA9G3DBQ0wo34CLgSK/+d
 i9uQ==
X-Gm-Message-State: AOAM533jLT7JiSTCIO2WWKj22rKL/MOWXbPHRfBqOcyU9EK24075snyV
 P5OiY6gbrnfb2WZGgFuQRW0lDA==
X-Google-Smtp-Source: ABdhPJx3m2wy8IAaUPUVCfzhP0H0R0i6hF+gkOftCdjDpiVkShrIQ5V26+z56YN1dZGnnZJ/iARM6g==
X-Received: by 2002:a05:6830:204d:: with SMTP id
 f13mr11309371otp.123.1633110138622; 
 Fri, 01 Oct 2021 10:42:18 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u15sm1369264oon.35.2021.10.01.10.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:42:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] drm/msm/dp: Store each subblock in the io region
Date: Fri,  1 Oct 2021 10:43:59 -0700
Message-Id: <20211001174400.981707-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001174400.981707-1-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
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

Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
DP block. So split the dss_io_data memory region into a set of
sub-regions, to make it possible in the next patch to specify each of
the sub-regions individually.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Skipped the unnecessary reorder in struct dss_io_region 

 drivers/gpu/drm/msm/dp/dp_catalog.c | 64 +++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 28 +++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.h  |  9 +++-
 3 files changed, 53 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index cc2bb8295329..6ae9b29044b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -24,15 +24,6 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
-#define MSM_DP_CONTROLLER_AHB_OFFSET	0x0000
-#define MSM_DP_CONTROLLER_AHB_SIZE	0x0200
-#define MSM_DP_CONTROLLER_AUX_OFFSET	0x0200
-#define MSM_DP_CONTROLLER_AUX_SIZE	0x0200
-#define MSM_DP_CONTROLLER_LINK_OFFSET	0x0400
-#define MSM_DP_CONTROLLER_LINK_SIZE	0x0C00
-#define MSM_DP_CONTROLLER_P0_OFFSET	0x1000
-#define MSM_DP_CONTROLLER_P0_SIZE	0x0400
-
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_I2C_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -66,82 +57,77 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 			struct dp_catalog_private, dp_catalog);
+	struct dss_io_data *dss = &catalog->io->dp_controller;
 
-	msm_disp_snapshot_add_block(disp_state, catalog->io->dp_controller.len,
-			catalog->io->dp_controller.base, "dp_ctrl");
+	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
+	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
+	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
 }
 
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.aux.base + offset);
 }
 
 static inline void dp_write_aux(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
 	/*
 	 * To make sure aux reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.base + offset);
+	writel(data, catalog->io->dp_controller.aux.base + offset);
 }
 
 static inline u32 dp_read_ahb(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.ahb.base + offset);
 }
 
 static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
 	/*
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.base + offset);
+	writel(data, catalog->io->dp_controller.ahb.base + offset);
 }
 
 static inline void dp_write_p0(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	offset += MSM_DP_CONTROLLER_P0_OFFSET;
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.base + offset);
+	writel(data, catalog->io->dp_controller.p0.base + offset);
 }
 
 static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
 			       u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_P0_OFFSET;
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.p0.base + offset);
 }
 
 static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.link.base + offset);
 }
 
 static inline void dp_write_link(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
 	/*
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->dp_controller.base + offset);
+	writel(data, catalog->io->dp_controller.link.base + offset);
 }
 
 /* aux related catalog functions */
@@ -276,29 +262,21 @@ static void dump_regs(void __iomem *base, int len)
 
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 {
-	u32 offset, len;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
+	struct dss_io_data *io = &catalog->io->dp_controller;
 
 	pr_info("AHB regs\n");
-	offset = MSM_DP_CONTROLLER_AHB_OFFSET;
-	len = MSM_DP_CONTROLLER_AHB_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->ahb.base, io->ahb.len);
 
 	pr_info("AUXCLK regs\n");
-	offset = MSM_DP_CONTROLLER_AUX_OFFSET;
-	len = MSM_DP_CONTROLLER_AUX_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->aux.base, io->aux.len);
 
 	pr_info("LCLK regs\n");
-	offset = MSM_DP_CONTROLLER_LINK_OFFSET;
-	len = MSM_DP_CONTROLLER_LINK_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->link.base, io->link.len);
 
 	pr_info("P0CLK regs\n");
-	offset = MSM_DP_CONTROLLER_P0_OFFSET;
-	len = MSM_DP_CONTROLLER_P0_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->p0.base, io->p0.len);
 }
 
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
@@ -493,8 +471,7 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io->dp_controller.base +
-					MSM_DP_CONTROLLER_LINK_OFFSET +
+	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link.base +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -541,8 +518,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io->dp_controller.base +
-				MSM_DP_CONTROLLER_LINK_OFFSET +
+	ret = readl_poll_timeout(catalog->io->dp_controller.link.base +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index c05ba1990218..1f084b2b5bd3 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -11,6 +11,15 @@
 #include "dp_parser.h"
 #include "dp_reg.h"
 
+#define DP_DEFAULT_AHB_OFFSET	0x0000
+#define DP_DEFAULT_AHB_SIZE	0x0200
+#define DP_DEFAULT_AUX_OFFSET	0x0200
+#define DP_DEFAULT_AUX_SIZE	0x0200
+#define DP_DEFAULT_LINK_OFFSET	0x0400
+#define DP_DEFAULT_LINK_SIZE	0x0C00
+#define DP_DEFAULT_P0_OFFSET	0x1000
+#define DP_DEFAULT_P0_SIZE	0x0400
+
 static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 	.num = 2,
 	.regs = {
@@ -37,9 +46,22 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	struct dp_io *io = &parser->io;
 	struct dss_io_data *dss = &io->dp_controller;
 
-	dss->base = dp_ioremap(pdev, 0, &dss->len);
-	if (IS_ERR(dss->base))
-		return PTR_ERR(dss->base);
+	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
+	if (IS_ERR(dss->ahb.base))
+		return PTR_ERR(dss->ahb.base);
+
+	if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+		DRM_ERROR("legacy memory region not large enough\n");
+		return -EINVAL;
+	}
+
+	dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+	dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+	dss->aux.len = DP_DEFAULT_AUX_SIZE;
+	dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+	dss->link.len = DP_DEFAULT_LINK_SIZE;
+	dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+	dss->p0.len = DP_DEFAULT_P0_SIZE;
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index dc62e70b1640..dac10923abde 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -25,11 +25,18 @@ enum dp_pm_type {
 	DP_MAX_PM
 };
 
-struct dss_io_data {
+struct dss_io_region {
 	size_t len;
 	void __iomem *base;
 };
 
+struct dss_io_data {
+	struct dss_io_region ahb;
+	struct dss_io_region aux;
+	struct dss_io_region link;
+	struct dss_io_region p0;
+};
+
 static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 {
 	switch (module) {
-- 
2.29.2

