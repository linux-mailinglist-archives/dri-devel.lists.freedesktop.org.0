Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB43F7E79
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 00:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4E86E436;
	Wed, 25 Aug 2021 22:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3D6E435
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:49 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso272373ooq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbJDvJ7/k7vSzJlT/cQdUuPB8pNiUCSXkLRC0Zxkhq4=;
 b=gD03EoGJRGj4BRbukOLl8cZoetc99D+Enq6Yppjp8ecHdtNkI8QrjG013Dh9qaXtdu
 KmPSQOCoxm6RiTnv6K7fujJAV6mdQJshwEexaLCNpnFCd2lRyGJ9YCiivk/yv6hrBjZO
 G1feGS5iMsTmfI7WCwJXYBLtOeg7CxrGNJlGAmtMJHWiEdLjTD6AIq6TkQY5wIPRKCZu
 ZmgjTzZRhIFV+53QeE2AkyyGgV78H80DnIQe5Uhy79eUubUyrOZPEFNUdVeMnEJRqK/N
 fhCErSnOZj0XkLuDgDUvFN6Mgj1RDjV810N/5arbflfneFw9LQ60MleCGVIZhTpZ93GZ
 1o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbJDvJ7/k7vSzJlT/cQdUuPB8pNiUCSXkLRC0Zxkhq4=;
 b=Wu/fQBJuaJ2FhJ8jAlHz4Uf/mXnmrjsFwjFDgcLekmqEXxihXH1oHdk6YI9LlZAsB6
 sW9P6X6bJkUudWH1DqGYzs2papfFpJN9HnWsKEUP+xK2NpcDUgQU0p0GX3uNQBk7coRv
 yGkEGXrme3MIfDWygs91XxePfWmMYG8Id269z3/kcqTZa3AoeKVFhKBbvxKkidQrSWBf
 9d2arvSXI04Qqw24vuI0uvGz0lCde83K1N4+xVqqgrOv4IBfRCvnCVi0USVGwuh6Y2ZA
 TsD5UMoLK4XsLQcN8/38WYJokT+5adtTC/V1Qs1LxrCzPavPTG9X449BRJzMOVTHXgqW
 IoIQ==
X-Gm-Message-State: AOAM5322Xw3m/7bYAzmOoMs74dgqVuMJtDNWu/VFksB05PpdXWbqaIbH
 SrFlnyZcoy4BgMwAhvXd4bWcyQ==
X-Google-Smtp-Source: ABdhPJwgjKA3BuieDD2mKwhq21YAJpEeJfthYSVGxJKQZg5JxGyJjJDKdxpB8eDJmAGfKU9l8V4ePQ==
X-Received: by 2002:a4a:8c33:: with SMTP id u48mr457546ooj.63.1629930288601;
 Wed, 25 Aug 2021 15:24:48 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/msm/dp: Store each subblock in the io region
Date: Wed, 25 Aug 2021 15:25:56 -0700
Message-Id: <20210825222557.1499104-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
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

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed nonsensical commit message
- Introduced dss_io_region to group base and len

 drivers/gpu/drm/msm/dp/dp_catalog.c | 64 +++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 28 +++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.h  | 11 ++++-
 3 files changed, 54 insertions(+), 49 deletions(-)

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
index 215065336268..4a7dad86159f 100644
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
@@ -40,9 +49,22 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
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
index dc62e70b1640..a95b05dbb11c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -25,9 +25,16 @@ enum dp_pm_type {
 	DP_MAX_PM
 };
 
-struct dss_io_data {
-	size_t len;
+struct dss_io_region {
 	void __iomem *base;
+	size_t len;
+};
+
+struct dss_io_data {
+	struct dss_io_region ahb;
+	struct dss_io_region aux;
+	struct dss_io_region link;
+	struct dss_io_region p0;
 };
 
 static inline const char *dp_parser_pm_name(enum dp_pm_type module)
-- 
2.29.2

