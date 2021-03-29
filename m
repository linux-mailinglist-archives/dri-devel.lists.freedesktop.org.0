Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FDF34DA3A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 00:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15CB89F71;
	Mon, 29 Mar 2021 22:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDE589F85;
 Mon, 29 Mar 2021 22:22:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E20261996;
 Mon, 29 Mar 2021 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056568;
 bh=nta9ZA4FuS6G01NUtx1cgiXcXUSjXlOS2V8eeKtIHL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dq7FcoRc6ky7V2euHkeTHN18HI0GuF0QM19VqYMOeadpLkYHXktIkjd8XWDaxyVjr
 G2V3RxpGAGTXiLSSk/wQ3yie/WpMHrjAL/bhx6OniHXIJZR72Gn3qA3xl+l21MhvVL
 +KhCa8rQRi2TTEf9iQQIXxOcgL7QVfq+FjSKgLnhs8s6CeqcPt4UaxuitOOxgrfmr+
 Lcm7T+kEjRycAmhqsdbe26z7/x3/9+21pS0iViybfpWqA/q/z2NBmcNHRy2t7STQ5K
 T87UsoKlcctHsscg8ANmLIFnLvFZZkMvjTn0Ivw8hFwFm5JU0f0A9k1JDnrfTrs34+
 21DstIV3NGAyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 21/33] drm/msm/disp/dpu1: icc path needs to be
 set before dpu runtime resume
Date: Mon, 29 Mar 2021 18:22:09 -0400
Message-Id: <20210329222222.2382987-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222222.2382987-1-sashal@kernel.org>
References: <20210329222222.2382987-1-sashal@kernel.org>
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
index d93c44f6996d..e69ea810e18d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -43,6 +43,8 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
+#define MIN_IB_BW	400000000ULL /* Min ib vote 400MB */
+
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
@@ -929,6 +931,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
+	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
+		dpu_kms_parse_data_bus_icc_path(dpu_kms);
+
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 	dpu_kms->core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
@@ -1030,9 +1035,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_vbif_init_memtypes(dpu_kms);
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-		dpu_kms_parse_data_bus_icc_path(dpu_kms);
-
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	return 0;
@@ -1189,10 +1191,10 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
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
