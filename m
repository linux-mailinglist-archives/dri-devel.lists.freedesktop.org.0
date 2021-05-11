Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3392E379E49
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F39F6E9B8;
	Tue, 11 May 2021 04:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC0B6E9B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:20:57 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 p6-20020a4adc060000b02901f9a8fc324fso3950231oov.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kq1BhPeNrbUbILjy2DK6JPnYvHJ/R6XjYtFB4u6ooZo=;
 b=kHL5D5deXsZOxircr2d9YXoUtkdt2CM+LoQokUnzGEgxtP9VctNeMk2I4xulnVIx9B
 I3d6oJt3l6FdI2U+U5sM7JBrGnG7FHb3dF5J08p80nS/u7ppBVKEfJaT1c9crm65ntuR
 G1aElnw2pE/tmcdiFJkW0L4FebcnuqBNLEFWiEDm7WisddSY73aKVrFwvyokexbhvZPY
 zWrqVSzGK3jaK1AjmUsitmxhWBS5uufwi4Sy18+/SjeF//lZLZl6nNq/nX4+gvukOX8G
 2PPm0QdFONuY/WrL6dbUgIK3u9SPqJZ9FJoT8uHGaD/ayf3009tDyng65l8ohNczcnoJ
 6mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kq1BhPeNrbUbILjy2DK6JPnYvHJ/R6XjYtFB4u6ooZo=;
 b=KUoDQrSg4dOAqU02djC46Lsu0RDjF5CjcA6N6fNItH4wCikgENqIUdUiUN7k8BQPR3
 W8jfZxfGvyxMVHRAeWHWBFgPN4PXsI/aSy4rB1vzYA8+KdVRnP8lpwRny5t+S1zhjpUX
 bETdl+JnH8nEaoluFHAweMGkwH0XSAV9eBb9XeEbpbPDL0JIWvtu/S+913sCoMxgvo5i
 OeZ2H0KqG7dZhe95eCyS0CPbtefkiWJ70OJa17heZEtU1dVgA1jnbmXzc8e0mQeDBG4W
 DwsqHCGgdPhue2JUBftlwdeVGdWldEe8dmS3EcE5r5YkipOL9f/U0c/uKDtqBFfJSQaU
 BICw==
X-Gm-Message-State: AOAM5325Qfm+18ZE1zoBB2nUS43UpRUVf+LLkyM1KW/COe5J7hfNzmcS
 75hgQPy6992/GVORtF355tcF0Q==
X-Google-Smtp-Source: ABdhPJwKuNNy2kRhMwTgm81Gdl6iG6M7SkQfGa39BybDaqSWaphX9RBimZ6aYvIPx9p7BNyl/rpVzg==
X-Received: by 2002:a4a:b186:: with SMTP id c6mr4829155ooo.28.1620706856599;
 Mon, 10 May 2021 21:20:56 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:20:56 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Subject: [PATCH 2/4] drm/msm/dp: Store each subblock in the io region
Date: Mon, 10 May 2021 23:20:41 -0500
Message-Id: <20210511042043.592802-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
DP block. So move the offsets into dss_io_data, to make it possible in
the next patch to specify alternative offsets and sizes of these
segments.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 57 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 10 +++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  8 ++++
 3 files changed, 33 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 2eb37ee48e42..a0449a2867e4 100644
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
@@ -64,75 +55,67 @@ struct dp_catalog_private {
 
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.aux + offset);
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
+	writel(data, catalog->io->dp_controller.aux + offset);
 }
 
 static inline u32 dp_read_ahb(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.ahb + offset);
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
+	writel(data, catalog->io->dp_controller.ahb + offset);
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
+	writel(data, catalog->io->dp_controller.p0 + offset);
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
+	return readl_relaxed(catalog->io->dp_controller.p0 + offset);
 }
 
 static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
 {
-	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
-	return readl_relaxed(catalog->io->dp_controller.base + offset);
+	return readl_relaxed(catalog->io->dp_controller.link + offset);
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
+	writel(data, catalog->io->dp_controller.link + offset);
 }
 
 /* aux related catalog functions */
@@ -267,29 +250,21 @@ static void dump_regs(void __iomem *base, int len)
 
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
+	dump_regs(io->ahb, io->ahb_len);
 
 	pr_info("AUXCLK regs\n");
-	offset = MSM_DP_CONTROLLER_AUX_OFFSET;
-	len = MSM_DP_CONTROLLER_AUX_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->aux, io->aux_len);
 
 	pr_info("LCLK regs\n");
-	offset = MSM_DP_CONTROLLER_LINK_OFFSET;
-	len = MSM_DP_CONTROLLER_LINK_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->link, io->link_len);
 
 	pr_info("P0CLK regs\n");
-	offset = MSM_DP_CONTROLLER_P0_OFFSET;
-	len = MSM_DP_CONTROLLER_P0_SIZE;
-	dump_regs(catalog->io->dp_controller.base + offset, len);
+	dump_regs(io->p0, io->p0_len);
 }
 
 int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
@@ -454,8 +429,7 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io->dp_controller.base +
-					MSM_DP_CONTROLLER_LINK_OFFSET +
+	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -502,8 +476,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
 				struct dp_catalog_private, dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io->dp_controller.base +
-				MSM_DP_CONTROLLER_LINK_OFFSET +
+	ret = readl_poll_timeout(catalog->io->dp_controller.link +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..51ec85b4803b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -250,6 +250,7 @@ static int dp_parser_clock(struct dp_parser *parser)
 
 static int dp_parser_parse(struct dp_parser *parser)
 {
+	struct dss_io_data *io = &parser->io.dp_controller;
 	int rc = 0;
 
 	if (!parser) {
@@ -275,6 +276,15 @@ static int dp_parser_parse(struct dp_parser *parser)
 	 */
 	parser->regulator_cfg = &sdm845_dp_reg_cfg;
 
+	io->ahb = io->base + 0x0;
+	io->ahb_len = 0x200;
+	io->aux = io->base + 0x200;
+	io->aux_len = 0x200;
+	io->link = io->base + 0x400;
+	io->link_len = 0x600;
+	io->p0 = io->base + 0x1000;
+	io->p0_len = 0x400;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..ff4774109c63 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -28,6 +28,14 @@ enum dp_pm_type {
 struct dss_io_data {
 	u32 len;
 	void __iomem *base;
+	void __iomem *ahb;
+	size_t ahb_len;
+	void __iomem *aux;
+	size_t aux_len;
+	void __iomem *link;
+	size_t link_len;
+	void __iomem *p0;
+	size_t p0_len;
 };
 
 static inline const char *dp_parser_pm_name(enum dp_pm_type module)
-- 
2.29.2

