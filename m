Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F1A5F8DE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A948710E8C8;
	Thu, 13 Mar 2025 14:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fKx3wcBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AE910E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jfqbTogBQfZBAvo5+hgu1ElWG7xy8vqbanJEH6ae3IU=; b=fKx3wcBYz6Tbl3i/aQf4UuhCKt
 +QQcDij8vD/WOEYesCnKB1WJSvWYeLs8kHrtOkhORB7Zd8KoI29x3N/czwMpRrbQ39bhRrmR7hxkm
 t7bbLWAfvjjQMYVAtDzUFIeeVbtGkZmj8lOrpeUrntE99HYorQZaBBLIfnFwX+ddt6Npr8rqqxvZa
 2BwHv0zeBf+y+cz+PgkQYDoy1DfJskaAVzDiY43qRMVP5W7CTDLN+k8/TQnCtmjjehPablDITv3pI
 JvKfssECcXd7l45eag2B3cX7UzvuH4GiB4t61C8dQ4KIob9OvQL/O1zeNe+SrOKEoZ4sAC153ReNz
 H8i/T9TQ==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsjpb-008Cju-ME; Thu, 13 Mar 2025 15:46:49 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 13 Mar 2025 11:43:28 -0300
Subject: [PATCH v4 3/7] drm/v3d: Associate a V3D tech revision to all
 supported devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-v3d-gpu-reset-fixes-v4-3-c1e780d8e096@igalia.com>
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
In-Reply-To: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16568; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=and1MkEbVKM89UZHLKRuPI5+epaOEPd8O7H7MgVByIw=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0u/IVb4DQxsrjkHu61aiAvuwNuoTG+bY/koic
 JQo2YbzDuGJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9LvyAAKCRA/8w6Kdoj6
 qgy5B/4lGmNTrraVxvka9Ar4zMQ3rqUeBH5qOGV63G/EEYc5TH/OSedHfvNuHm9PbN54xQE3S0w
 U47Vuj4wjYdhZAbjfkAQPa+TW74K9X31nd/z0zfHMYdNA/HG7aXu1J/v0RhoD6ZqpaW8fIMHTdT
 0q2i7F4+qiwmSB1o82I+kV60LHDQpy9yxwLdNZ+q43NgV90qV3hmICQXBaMBH7cjizEXyXII+7n
 cywtzejO6HMjJpMWJDu1/SWB/A0srSQsPNq1xegrgtgWm90R6fohJcHts1kzIaueE7d4LJ9xEwh
 F82V4rIu8UVXhYuUfuu5WJeP0Jz/eif7ymibOrZB+jSmFl6i
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

The V3D driver currently determines the GPU tech version (33, 41...)
by reading a register. This approach has worked so far since this
information wasn’t needed before powering on the GPU.

V3D 7.1 introduces new registers that must be written to power on the
GPU, requiring us to know the V3D version beforehand. To address this,
associate each supported SoC with the corresponding VideoCore GPU version
as part of the device data.

To prevent possible mistakes, add an assertion to verify that the version
specified in the device data matches the one reported by the hardware.
If there is a mismatch, the kernel will trigger a warning.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 126 +++++++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_drv.c     |  22 +++++--
 drivers/gpu/drm/v3d/v3d_drv.h     |  11 +++-
 drivers/gpu/drm/v3d/v3d_gem.c     |  10 +--
 drivers/gpu/drm/v3d/v3d_irq.c     |   6 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c |   4 +-
 drivers/gpu/drm/v3d/v3d_sched.c   |   6 +-
 7 files changed, 101 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 76816f2551c10026a775e4331ad7eb2f008cfb0a..7e789e181af0ac138044f194a29555c30ab01836 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -21,74 +21,74 @@ struct v3d_reg_def {
 };
 
 static const struct v3d_reg_def v3d_hub_reg_defs[] = {
-	REGDEF(33, 42, V3D_HUB_AXICFG),
-	REGDEF(33, 71, V3D_HUB_UIFCFG),
-	REGDEF(33, 71, V3D_HUB_IDENT0),
-	REGDEF(33, 71, V3D_HUB_IDENT1),
-	REGDEF(33, 71, V3D_HUB_IDENT2),
-	REGDEF(33, 71, V3D_HUB_IDENT3),
-	REGDEF(33, 71, V3D_HUB_INT_STS),
-	REGDEF(33, 71, V3D_HUB_INT_MSK_STS),
-
-	REGDEF(33, 71, V3D_MMU_CTL),
-	REGDEF(33, 71, V3D_MMU_VIO_ADDR),
-	REGDEF(33, 71, V3D_MMU_VIO_ID),
-	REGDEF(33, 71, V3D_MMU_DEBUG_INFO),
-
-	REGDEF(71, 71, V3D_GMP_STATUS(71)),
-	REGDEF(71, 71, V3D_GMP_CFG(71)),
-	REGDEF(71, 71, V3D_GMP_VIO_ADDR(71)),
+	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_HUB_AXICFG),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_UIFCFG),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT0),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT1),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT2),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT3),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_STS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_MSK_STS),
+
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_CTL),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ADDR),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ID),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_DEBUG_INFO),
+
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_STATUS(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_CFG(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_VIO_ADDR(71)),
 };
 
 static const struct v3d_reg_def v3d_gca_reg_defs[] = {
-	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN),
-	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN_ACK),
+	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN),
+	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN_ACK),
 };
 
 static const struct v3d_reg_def v3d_core_reg_defs[] = {
-	REGDEF(33, 71, V3D_CTL_IDENT0),
-	REGDEF(33, 71, V3D_CTL_IDENT1),
-	REGDEF(33, 71, V3D_CTL_IDENT2),
-	REGDEF(33, 71, V3D_CTL_MISCCFG),
-	REGDEF(33, 71, V3D_CTL_INT_STS),
-	REGDEF(33, 71, V3D_CTL_INT_MSK_STS),
-	REGDEF(33, 71, V3D_CLE_CT0CS),
-	REGDEF(33, 71, V3D_CLE_CT0CA),
-	REGDEF(33, 71, V3D_CLE_CT0EA),
-	REGDEF(33, 71, V3D_CLE_CT1CS),
-	REGDEF(33, 71, V3D_CLE_CT1CA),
-	REGDEF(33, 71, V3D_CLE_CT1EA),
-
-	REGDEF(33, 71, V3D_PTB_BPCA),
-	REGDEF(33, 71, V3D_PTB_BPCS),
-
-	REGDEF(33, 42, V3D_GMP_STATUS(33)),
-	REGDEF(33, 42, V3D_GMP_CFG(33)),
-	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),
-
-	REGDEF(33, 71, V3D_ERR_FDBGO),
-	REGDEF(33, 71, V3D_ERR_FDBGB),
-	REGDEF(33, 71, V3D_ERR_FDBGS),
-	REGDEF(33, 71, V3D_ERR_STAT),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT0),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT1),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT2),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_MISCCFG),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_STS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_MSK_STS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CA),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0EA),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CA),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1EA),
+
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCA),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCS),
+
+	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_STATUS(33)),
+	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_CFG(33)),
+	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_VIO_ADDR(33)),
+
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGO),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGB),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGS),
+	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_STAT),
 };
 
 static const struct v3d_reg_def v3d_csd_reg_defs[] = {
-	REGDEF(41, 71, V3D_CSD_STATUS),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
-	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG3(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG4(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG5(71)),
-	REGDEF(71, 71, V3D_CSD_CURRENT_CFG6(71)),
-	REGDEF(71, 71, V3D_V7_CSD_CURRENT_CFG7),
+	REGDEF(V3D_GEN_41, V3D_GEN_71, V3D_CSD_STATUS),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG0(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG1(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG2(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG3(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG4(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG5(41)),
+	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG6(41)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG0(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG1(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG2(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG3(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG4(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG5(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG6(71)),
+	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_V7_CSD_CURRENT_CFG7),
 };
 
 static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
@@ -164,7 +164,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 		   str_yes_no(ident2 & V3D_HUB_IDENT2_WITH_MMU));
 	seq_printf(m, "TFU:        %s\n",
 		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TFU));
-	if (v3d->ver <= 42) {
+	if (v3d->ver <= V3D_GEN_42) {
 		seq_printf(m, "TSY:        %s\n",
 			   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TSY));
 	}
@@ -196,11 +196,11 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 		seq_printf(m, "  QPUs:         %d\n", nslc * qups);
 		seq_printf(m, "  Semaphores:   %d\n",
 			   V3D_GET_FIELD(ident1, V3D_IDENT1_NSEM));
-		if (v3d->ver <= 42) {
+		if (v3d->ver <= V3D_GEN_42) {
 			seq_printf(m, "  BCG int:      %d\n",
 				   (ident2 & V3D_IDENT2_BCG_INT) != 0);
 		}
-		if (v3d->ver < 40) {
+		if (v3d->ver < V3D_GEN_41) {
 			seq_printf(m, "  Override TMU: %d\n",
 				   (misccfg & V3D_MISCCFG_OVRTMUOUT) != 0);
 		}
@@ -234,7 +234,7 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	int core = 0;
 	int measure_ms = 1000;
 
-	if (v3d->ver >= 40) {
+	if (v3d->ver >= V3D_GEN_41) {
 		int cycle_count_reg = V3D_PCTR_CYCLE_COUNT(v3d->ver);
 		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
 			       V3D_SET_FIELD_VER(cycle_count_reg,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 852015214e971c60f9939d34d893d8d8cb4e9b01..c63f0ed1bd8a3d5511085e76ed2fbd6ee7df6f80 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -17,6 +17,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sched/clock.h>
@@ -92,7 +93,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		args->value = 1;
 		return 0;
 	case DRM_V3D_PARAM_SUPPORTS_PERFMON:
-		args->value = (v3d->ver >= 40);
+		args->value = (v3d->ver >= V3D_GEN_41);
 		return 0;
 	case DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT:
 		args->value = 1;
@@ -254,10 +255,10 @@ static const struct drm_driver v3d_drm_driver = {
 };
 
 static const struct of_device_id v3d_of_match[] = {
-	{ .compatible = "brcm,2711-v3d" },
-	{ .compatible = "brcm,2712-v3d" },
-	{ .compatible = "brcm,7268-v3d" },
-	{ .compatible = "brcm,7278-v3d" },
+	{ .compatible = "brcm,2711-v3d", .data = (void *)V3D_GEN_42 },
+	{ .compatible = "brcm,2712-v3d", .data = (void *)V3D_GEN_71 },
+	{ .compatible = "brcm,7268-v3d", .data = (void *)V3D_GEN_33 },
+	{ .compatible = "brcm,7278-v3d", .data = (void *)V3D_GEN_41 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, v3d_of_match);
@@ -274,6 +275,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct drm_device *drm;
 	struct v3d_dev *v3d;
+	enum v3d_gen gen;
 	int ret;
 	u32 mmu_debug;
 	u32 ident1, ident3;
@@ -287,6 +289,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drm);
 
+	gen = (enum v3d_gen)of_device_get_match_data(dev);
+	v3d->ver = gen;
+
 	ret = map_regs(v3d, &v3d->hub_regs, "hub");
 	if (ret)
 		return ret;
@@ -316,6 +321,11 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
 	v3d->ver = (V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_TVER) * 10 +
 		    V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_REV));
+	/* Make sure that the V3D tech version retrieved from the HW is equal
+	 * to the one advertised by the device tree.
+	 */
+	WARN_ON(v3d->ver != gen);
+
 	v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
 	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
 
@@ -340,7 +350,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (v3d->ver < 41) {
+	if (v3d->ver < V3D_GEN_41) {
 		ret = map_regs(v3d, &v3d->gca_regs, "gca");
 		if (ret)
 			goto clk_disable;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 9deaefa0f95b71b842f1c5bef2c6a8a8ffc21fe2..de4a9e18f6a9039edf57f406ab1cee9dad4c0a49 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -94,11 +94,18 @@ struct v3d_perfmon {
 	u64 values[] __counted_by(ncounters);
 };
 
+enum v3d_gen {
+	V3D_GEN_33 = 33,
+	V3D_GEN_41 = 41,
+	V3D_GEN_42 = 42,
+	V3D_GEN_71 = 71,
+};
+
 struct v3d_dev {
 	struct drm_device drm;
 
 	/* Short representation (e.g. 33, 41) of the V3D tech version */
-	int ver;
+	enum v3d_gen ver;
 
 	/* Short representation (e.g. 5, 6) of the V3D tech revision */
 	int rev;
@@ -199,7 +206,7 @@ to_v3d_dev(struct drm_device *dev)
 static inline bool
 v3d_has_csd(struct v3d_dev *v3d)
 {
-	return v3d->ver >= 41;
+	return v3d->ver >= V3D_GEN_41;
 }
 
 #define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.dev)
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index b1e681630ded098de8aee691884368a959443812..1ea6d3832c2212d9cbbd90236478d18491f0ff14 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -25,7 +25,7 @@ v3d_init_core(struct v3d_dev *v3d, int core)
 	 * type.  If you want the default behavior, you can still put
 	 * "2" in the indirect texture state's output_type field.
 	 */
-	if (v3d->ver < 40)
+	if (v3d->ver < V3D_GEN_41)
 		V3D_CORE_WRITE(core, V3D_CTL_MISCCFG, V3D_MISCCFG_OVRTMUOUT);
 
 	/* Whenever we flush the L2T cache, we always want to flush
@@ -58,7 +58,7 @@ v3d_idle_axi(struct v3d_dev *v3d, int core)
 static void
 v3d_idle_gca(struct v3d_dev *v3d)
 {
-	if (v3d->ver >= 41)
+	if (v3d->ver >= V3D_GEN_41)
 		return;
 
 	V3D_GCA_WRITE(V3D_GCA_SAFE_SHUTDOWN, V3D_GCA_SAFE_SHUTDOWN_EN);
@@ -132,13 +132,13 @@ v3d_reset(struct v3d_dev *v3d)
 static void
 v3d_flush_l3(struct v3d_dev *v3d)
 {
-	if (v3d->ver < 41) {
+	if (v3d->ver < V3D_GEN_41) {
 		u32 gca_ctrl = V3D_GCA_READ(V3D_GCA_CACHE_CTRL);
 
 		V3D_GCA_WRITE(V3D_GCA_CACHE_CTRL,
 			      gca_ctrl | V3D_GCA_CACHE_CTRL_FLUSH);
 
-		if (v3d->ver < 33) {
+		if (v3d->ver < V3D_GEN_33) {
 			V3D_GCA_WRITE(V3D_GCA_CACHE_CTRL,
 				      gca_ctrl & ~V3D_GCA_CACHE_CTRL_FLUSH);
 		}
@@ -151,7 +151,7 @@ v3d_flush_l3(struct v3d_dev *v3d)
 static void
 v3d_invalidate_l2c(struct v3d_dev *v3d, int core)
 {
-	if (v3d->ver > 32)
+	if (v3d->ver >= V3D_GEN_33)
 		return;
 
 	V3D_CORE_WRITE(core, V3D_CTL_L2CACTL,
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 72b6a119412fa74f8771308e228305678a19ba43..29f63f572d35b7217e346f82b9afb0957a42bd39 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -143,7 +143,7 @@ v3d_irq(int irq, void *arg)
 	/* We shouldn't be triggering these if we have GMP in
 	 * always-allowed mode.
 	 */
-	if (v3d->ver < 71 && (intsts & V3D_INT_GMPV))
+	if (v3d->ver < V3D_GEN_71 && (intsts & V3D_INT_GMPV))
 		dev_err(v3d->drm.dev, "GMP violation\n");
 
 	/* V3D 4.2 wires the hub and core IRQs together, so if we &
@@ -200,7 +200,7 @@ v3d_hub_irq(int irq, void *arg)
 
 		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
-		if (v3d->ver >= 41) {
+		if (v3d->ver >= V3D_GEN_41) {
 			axi_id = axi_id >> 5;
 			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
 				client = v3d41_axi_ids[axi_id];
@@ -217,7 +217,7 @@ v3d_hub_irq(int irq, void *arg)
 		status = IRQ_HANDLED;
 	}
 
-	if (v3d->ver >= 71 && (intsts & V3D_V7_HUB_INT_GMPV)) {
+	if (v3d->ver >= V3D_GEN_71 && (intsts & V3D_V7_HUB_INT_GMPV)) {
 		dev_err(v3d->drm.dev, "GMP Violation\n");
 		status = IRQ_HANDLED;
 	}
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 3ebda2fa46fc4775c67d13d8f8131160ff6ca09d..9a3fe52558746e8523d4cf4ee433a90d94bffdbf 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -200,10 +200,10 @@ void v3d_perfmon_init(struct v3d_dev *v3d)
 	const struct v3d_perf_counter_desc *counters = NULL;
 	unsigned int max = 0;
 
-	if (v3d->ver >= 71) {
+	if (v3d->ver >= V3D_GEN_71) {
 		counters = v3d_v71_performance_counters;
 		max = ARRAY_SIZE(v3d_v71_performance_counters);
-	} else if (v3d->ver >= 42) {
+	} else if (v3d->ver >= V3D_GEN_42) {
 		counters = v3d_v42_performance_counters;
 		max = ARRAY_SIZE(v3d_v42_performance_counters);
 	}
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 34c42d6e12cde656d3b51a18be324976199eceae..b3be08b0ca9188564f9fb6aa32694940a5fadc9d 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -357,11 +357,11 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	V3D_WRITE(V3D_TFU_ICA(v3d->ver), job->args.ica);
 	V3D_WRITE(V3D_TFU_IUA(v3d->ver), job->args.iua);
 	V3D_WRITE(V3D_TFU_IOA(v3d->ver), job->args.ioa);
-	if (v3d->ver >= 71)
+	if (v3d->ver >= V3D_GEN_71)
 		V3D_WRITE(V3D_V7_TFU_IOC, job->args.v71.ioc);
 	V3D_WRITE(V3D_TFU_IOS(v3d->ver), job->args.ios);
 	V3D_WRITE(V3D_TFU_COEF0(v3d->ver), job->args.coef[0]);
-	if (v3d->ver >= 71 || (job->args.coef[0] & V3D_TFU_COEF0_USECOEF)) {
+	if (v3d->ver >= V3D_GEN_71 || (job->args.coef[0] & V3D_TFU_COEF0_USECOEF)) {
 		V3D_WRITE(V3D_TFU_COEF1(v3d->ver), job->args.coef[1]);
 		V3D_WRITE(V3D_TFU_COEF2(v3d->ver), job->args.coef[2]);
 		V3D_WRITE(V3D_TFU_COEF3(v3d->ver), job->args.coef[3]);
@@ -412,7 +412,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	 *
 	 * XXX: Set the CFG7 register
 	 */
-	if (v3d->ver >= 71)
+	if (v3d->ver >= V3D_GEN_71)
 		V3D_CORE_WRITE(0, V3D_V7_CSD_QUEUED_CFG7, 0);
 
 	/* CFG0 write kicks off the job. */

-- 
Git-154)

