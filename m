Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170D39498F
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0B96F640;
	Sat, 29 May 2021 00:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE5F6F445
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id q1so7763512lfo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvzeyvDy1xdeBc4uK6A7R0W8Vw/um7Ed3knLuhC/TnA=;
 b=pTwqkuHtud0tteBZxcBrUnqxpJ0HYxRU00T1mQhdENxYa+wjEscXWaKF5LYNvpHQcY
 IkShm/LqJgOcrHjulZcMnLimJmLmamXKILb2fcYMkyRnQUUjdI1wcxu8PaDAVw7tm6Qi
 ivJys7JjySImxz0NszfW0xrax4yFccFEzUTsxHIO32tWYWfaifvS/jGRYhOOJ0nirmO2
 cAa8REngikyzgVfS5Iq/nlffA7l82LVXMyMUGOp1wxJMruZRnHmiBUxNI/5Q5WDI1wXu
 p7FcdY6aD8E7FQu18/N9kjupqQpCKW179038z7KC6xOV3hzyJMxwFyaSSMBtj4+CACLb
 Av+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvzeyvDy1xdeBc4uK6A7R0W8Vw/um7Ed3knLuhC/TnA=;
 b=ssQ3kXxnwT9+TqX1xPlKtvybjUc82sMtY7LvFmEPzfiYGZxR439yj1S+fkOXRZsvWb
 EFpfu6V4iNIb89Fc2aCz4yB4AjG1CWx2yQiA7xPRb2wi9YQGfsOSuUUGo7fdgHiHobEx
 RF/h5HS7aUIRtAO0xUNg9ZQyrzpvUdlF+QizBaJP2knI1C2kNok3YzRtMGTsk6bYSlr2
 tcU2OX+f4P0uSqTzP7O8pg4cpXpjeGGwiI4/bJ41T6z9kcEpX+ZWAx4eHzod4VfcOW+0
 SL17q4iE0xJp8AjzVG5BRQDLwqfcBCp7SY+mEPfXoKWr0nuGkjQRCOe+cmpsQ4mzfZx3
 T4+w==
X-Gm-Message-State: AOAM533bturv1r0ZCKh/dFbmTXavB2a214qqfWVUxonAqhVqgn3dc0Kh
 jSpOQDNegKAQD9UMREivbDcXew==
X-Google-Smtp-Source: ABdhPJxJ2CxztJeoislkUI++sMIrhOi8K/oexmzicJetBP2+dMcva6hq+LsiHVuRCOfQbcRWnelKIQ==
X-Received: by 2002:a05:6512:3126:: with SMTP id
 p6mr6899890lfd.621.1622247920587; 
 Fri, 28 May 2021 17:25:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 6/8] drm/msm: port msm_disp_snapshot to dump_state
Date: Sat, 29 May 2021 03:25:06 +0300
Message-Id: <20210529002508.3839467-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change msm_disp_snapshot to use dump_state API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig                   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  |  2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 21 +------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 56 ++++++-------------
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                 |  2 +-
 drivers/gpu/drm/msm/dsi/dsi.h                 |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  9 +--
 drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
 14 files changed, 38 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 10f693ea89d3..d3e151ffa1f7 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select SYNC_FILE
 	select PM_OPP
 	select NVMEM
+	select DUMP_STATE
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e500a9294528..d85f425db087 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -799,7 +799,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 	dpu_core_irq_uninstall(dpu_kms);
 }
 
-static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
+static void dpu_kms_mdp_snapshot(struct dump_state *disp_state, struct msm_kms *kms)
 {
 	int i;
 	struct dpu_kms *dpu_kms;
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index a4a7cb06bc87..c1f725c0cf60 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -42,7 +42,7 @@ static void _msm_disp_snapshot_work(struct kthread_work *work)
 	disp_state->dev = drm_dev->dev;
 	disp_state->drm_dev = drm_dev;
 
-	INIT_LIST_HEAD(&disp_state->blocks);
+	dump_state_init(&disp_state->dump);
 
 	/* Serialize dumping here */
 	mutex_lock(&kms->dump_mutex);
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index c92a9508c8d3..327df4892a9c 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/kthread.h>
 #include <linux/devcoredump.h>
+#include <linux/dump_state.h>
 #include <stdarg.h>
 #include "msm_kms.h"
 
@@ -47,27 +48,11 @@ struct msm_disp_state {
 	struct device *dev;
 	struct drm_device *drm_dev;
 
-	struct list_head blocks;
-
 	struct drm_atomic_state *atomic_state;
 
 	ktime_t timestamp;
-};
 
-/**
- * struct msm_disp_state_block - structure to store each hardware block state
- * @name: name of the block
- * @drm_dev: handle to the linked list head
- * @size: size of the register space of this hardware block
- * @state: array holding the register dump of this hardware block
- * @base_addr: starting address of this hardware block's register space
- */
-struct msm_disp_state_block {
-	char name[SZ_128];
-	struct list_head node;
-	unsigned int size;
-	u32 *state;
-	void __iomem *base_addr;
+	struct dump_state dump;
 };
 
 /**
@@ -130,7 +115,7 @@ void msm_disp_state_free(void *data);
  * Returns: none
  */
 __printf(4, 5)
-void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
+void msm_disp_snapshot_add_block(struct dump_state *disp_state, u32 len,
 		void __iomem *base_addr, const char *fmt, ...);
 
 #endif /* MSM_DISP_SNAPSHOT_H_ */
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..9f61e376bec2 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -7,13 +7,12 @@
 
 #include "msm_disp_snapshot.h"
 
-static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
+static void msm_disp_state_dump_regs(u32 *dump_addr, size_t aligned_len, void __iomem *base_addr)
 {
 	u32 len_padded;
 	u32 num_rows;
 	u32 x0, x4, x8, xc;
 	void __iomem *addr;
-	u32 *dump_addr = NULL;
 	void __iomem *end_addr;
 	int i;
 
@@ -23,12 +22,6 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	addr = base_addr;
 	end_addr = base_addr + aligned_len;
 
-	if (!(*reg))
-		*reg = kzalloc(len_padded, GFP_KERNEL);
-
-	if (*reg)
-		dump_addr = *reg;
-
 	for (i = 0; i < num_rows; i++) {
 		x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
 		x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
@@ -46,20 +39,16 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	}
 }
 
-static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_addr,
+static void msm_disp_state_print_regs(u32 *dump_addr, size_t len, void __iomem *base_addr,
 		struct drm_printer *p)
 {
 	int i;
-	u32 *dump_addr = NULL;
 	void __iomem *addr;
 	u32 num_rows;
 
 	addr = base_addr;
 	num_rows = len / REG_DUMP_ALIGN;
 
-	if (*reg)
-		dump_addr = *reg;
-
 	for (i = 0; i < num_rows; i++) {
 		drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
 				(unsigned long)(addr - base_addr),
@@ -71,7 +60,7 @@ static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_add
 
 void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 {
-	struct msm_disp_state_block *block, *tmp;
+	struct dump_state_block *block;
 
 	if (!p) {
 		DRM_ERROR("invalid drm printer\n");
@@ -84,9 +73,9 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 	drm_printf(p, "dpu devcoredump\n");
 	drm_printf(p, "timestamp %lld\n", ktime_to_ns(state->timestamp));
 
-	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
+	dump_state_for_each_block(&state->dump, block) {
 		drm_printf(p, "====================%s================\n", block->name);
-		msm_disp_state_print_regs(&block->state, block->size, block->base_addr, p);
+		msm_disp_state_print_regs((u32 *)block->state, block->size, block->base_addr, p);
 	}
 
 	drm_printf(p, "===================dpu drm state================\n");
@@ -127,17 +116,17 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	kms = priv->kms;
 
 	if (priv->dp)
-		msm_dp_snapshot(disp_state, priv->dp);
+		msm_dp_snapshot(&disp_state->dump, priv->dp);
 
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
 			continue;
 
-		msm_dsi_snapshot(disp_state, priv->dsi[i]);
+		msm_dsi_snapshot(&disp_state->dump, priv->dsi[i]);
 	}
 
 	if (kms->funcs->snapshot)
-		kms->funcs->snapshot(disp_state, kms);
+		kms->funcs->snapshot(&disp_state->dump, kms);
 
 	msm_disp_capture_atomic_state(disp_state);
 }
@@ -145,43 +134,30 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 void msm_disp_state_free(void *data)
 {
 	struct msm_disp_state *disp_state = data;
-	struct msm_disp_state_block *block, *tmp;
 
 	if (disp_state->atomic_state) {
 		drm_atomic_state_put(disp_state->atomic_state);
 		disp_state->atomic_state = NULL;
 	}
 
-	list_for_each_entry_safe(block, tmp, &disp_state->blocks, node) {
-		list_del(&block->node);
-		kfree(block->state);
-		kfree(block);
-	}
+	dump_state_free_blocks(&disp_state->dump);
 
 	kfree(disp_state);
 }
 
-void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
+void msm_disp_snapshot_add_block(struct dump_state *disp_state, u32 len,
 		void __iomem *base_addr, const char *fmt, ...)
 {
-	struct msm_disp_state_block *new_blk;
-	struct va_format vaf;
+	struct dump_state_block *new_blk;
 	va_list va;
 
-	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
-
 	va_start(va, fmt);
-
-	vaf.fmt = fmt;
-	vaf.va = &va;
-	snprintf(new_blk->name, sizeof(new_blk->name), "%pV", &vaf);
-
+	new_blk = dump_state_allocate_block_va(base_addr, ALIGN(len, REG_DUMP_ALIGN), GFP_KERNEL, fmt, va);
 	va_end(va);
 
-	INIT_LIST_HEAD(&new_blk->node);
-	new_blk->size = ALIGN(len, REG_DUMP_ALIGN);
-	new_blk->base_addr = base_addr;
+	if (IS_ERR(new_blk))
+		return;
 
-	msm_disp_state_dump_regs(&new_blk->state, new_blk->size, base_addr);
-	list_add(&new_blk->node, &disp_state->blocks);
+	msm_disp_state_dump_regs((u32 *)new_blk->state, new_blk->size, base_addr);
+	dump_state_add_block(disp_state, new_blk);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 854c41d05b19..1155571beef4 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -15,6 +15,7 @@
 
 #include "dp_catalog.h"
 #include "dp_reg.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
@@ -62,7 +63,7 @@ struct dp_catalog_private {
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
 
-void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state)
+void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct dump_state *disp_state)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 			struct dp_catalog_private, dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index e7e8b13d1753..9fc9019fac35 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -7,9 +7,9 @@
 #define _DP_CATALOG_H_
 
 #include <drm/drm_modes.h>
+#include <linux/dump_state.h>
 
 #include "dp_parser.h"
-#include "disp/msm_disp_snapshot.h"
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
@@ -73,7 +73,7 @@ struct dp_catalog {
 };
 
 /* Debug module */
-void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
+void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct dump_state *disp_state);
 
 /* AUX APIs */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf9c64534624..0ef4080e1e79 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1039,7 +1039,7 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 		dp_display->link->test_video.test_bit_depth);
 }
 
-void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
+void msm_dp_snapshot(struct dump_state *disp_state, struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
 	struct drm_device *drm;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75afc12a7b25..ce76edfa681a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,7 +266,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
+void msm_dsi_snapshot(struct dump_state *disp_state, struct msm_dsi *msm_dsi)
 {
 	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
 	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index d64db1badd4b..9ccdf1563cf2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -147,7 +147,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
-void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
+void msm_dsi_host_snapshot(struct dump_state *disp_state, struct mipi_dsi_host *host);
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
@@ -169,7 +169,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
+void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d5b73c031ee..72e48d83189d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2438,7 +2438,7 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 	return of_drm_find_bridge(msm_host->device_node);
 }
 
-void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host)
+void msm_dsi_host_snapshot(struct dump_state *disp_state, struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index b7b178cc318b..10ac875d89ac 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -872,7 +872,7 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 	if (phy)
 		phy->usecase = uc;
 }
-void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
+void msm_dsi_phy_snapshot(struct dump_state *disp_state, struct msm_dsi_phy *phy)
 {
 	msm_disp_snapshot_add_block(disp_state,
 			phy->base_size, phy->base,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ba60bf6f124c..32601212f02a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
+#include <linux/dump_state.h>
 #include <linux/module.h>
 #include <linux/component.h>
 #include <linux/platform_device.h>
@@ -43,7 +44,6 @@ struct msm_gem_submit;
 struct msm_fence_context;
 struct msm_gem_address_space;
 struct msm_gem_vma;
-struct msm_disp_state;
 
 #define MAX_CRTCS      8
 #define MAX_PLANES     20
@@ -341,7 +341,7 @@ void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
+void msm_dsi_snapshot(struct dump_state *disp_state, struct msm_dsi *msm_dsi);
 
 #else
 static inline void __init msm_dsi_register(void)
@@ -356,7 +356,7 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 {
 	return -EINVAL;
 }
-static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
+static inline void msm_dsi_snapshot(struct dump_state *disp_state, struct msm_dsi *msm_dsi)
 {
 }
 
@@ -374,7 +374,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
-void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
+struct dump_state;
+void msm_dp_snapshot(struct dump_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..da27b94b11bf 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -124,7 +124,7 @@ struct msm_kms_funcs {
 	void (*destroy)(struct msm_kms *kms);
 
 	/* snapshot: */
-	void (*snapshot)(struct msm_disp_state *disp_state, struct msm_kms *kms);
+	void (*snapshot)(struct dump_state *disp_state, struct msm_kms *kms);
 
 #ifdef CONFIG_DEBUG_FS
 	/* debugfs: */
-- 
2.30.2

