Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920334DA1D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B06E529;
	Mon, 29 Mar 2021 22:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E076E529;
 Mon, 29 Mar 2021 22:22:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E1BD6198F;
 Mon, 29 Mar 2021 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056524;
 bh=4OIjZQwfuRswgVajELggXaSNF5zPalP+P/YlKfUaqKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LRVNAGTLWr4MpCclCyKq0934vkecFi4TVjJ3bglDKPrXn6Cj5MPAo65Jyq0roGmPP
 En41g2e8yq6TygpdSCl9ZGRa6YUc+kZpcxSP3CNf3cTM2vkfXf1fKCZ/ivH4z4wfEs
 TCVkqZDa/X9TzS0FrMc0lue5Ih9Dn+o9Wp8h7d74YRdzB17OCOjBBurMpbXI7X5pIh
 LnDtbGDv4XjayM9j2QQtNecVzXaiEHMKZ2mU+0SQ6nR1XpF4eBKY0JcCsUqo0PfQ7C
 a1JeOmhQ/EZig13hnDBXQuObDz2vOI8bPe/4k/fnJCSn+B/8qIhwx1Jj8ux9r4GtI9
 yqrPmr4WSy77w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 24/38] drm/msm/disp/dpu1: icc path needs to be
 set before dpu runtime resume
Date: Mon, 29 Mar 2021 18:21:19 -0400
Message-Id: <20210329222133.2382393-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222133.2382393-1-sashal@kernel.org>
References: <20210329222133.2382393-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Kaehlcke <mka@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno@lists.freedesktop.org, Kalyan Thota <kalyant@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kalyan Thota <kalyant@codeaurora.org>

[ Upstream commit 627dc55c273dab308303a5217bd3e767d7083ddb ]

DPU runtime resume will request for a min vote on the AXI bus as
it is a necessary step before turning ON the AXI clock.

The change does below
1) Move the icc path set before requesting runtime get_sync.
2) remove the dependency of hw catalog for min ib vote
as it is initialized at a later point.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 374b0e8471e6..0f1b04ef61f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -43,6 +43,8 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
+#define MIN_IB_BW	400000000ULL /* Min ib vote 400MB */
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -931,6 +933,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
+	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
+		dpu_kms_parse_data_bus_icc_path(dpu_kms);
+
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 	dpu_kms->core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
@@ -1032,9 +1037,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_vbif_init_memtypes(dpu_kms);
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-		dpu_kms_parse_data_bus_icc_path(dpu_kms);
-
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	return 0;
@@ -1191,10 +1193,10 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
 	ddev = dpu_kms->dev;
 
+	WARN_ON(!(dpu_kms->num_paths));
 	/* Min vote of BW is required before turning on AXI clk */
 	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0,
-			dpu_kms->catalog->perf.min_dram_ib);
+		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (rc) {
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
