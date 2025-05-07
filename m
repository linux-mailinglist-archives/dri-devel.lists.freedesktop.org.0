Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0412AAD243
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00B510E729;
	Wed,  7 May 2025 00:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="JIZ8+56g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041C810E72D;
 Wed,  7 May 2025 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=3Y0u94PWZ6EjfK8NWPzIbKbmqD0SQsUjymovjrrGw64=; b=JIZ8+56gS3ZuYu5l
 4OzPDqPDvHv8Ka+pcZXt7ggmIxVCZFQK+hDiezsujmKjjPk/CKJFbLsiKKir2M0XvtQdPVj9zgLpK
 MclU/olym7Yu0v00cn26Z+ZNHJsmkoJRp4DqI+Jpwc1IhFeNi+4yy7kHm6aKxe/DuV7B0QTJVeSnX
 RRTjayNNfGga72GCZ1IOVh7IpIDjuT+40X5Wab6l15NHNEODyI8k9KGL+sYBqq1fUConhKxBR5Z2b
 BO5Vdw+pa2He5//wKoLJsksq3DyL4JmibuwPA1gq17JPECGVEsI6CqU3nktld75qUaXxqp9geDdOm
 P1zjS1TbgClNOiewhA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uCSaJ-0021Kc-0l;
 Wed, 07 May 2025 00:24:27 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] drm/amd/pm/smu13: Remove unused smu_v3 functions
Date: Wed,  7 May 2025 01:24:25 +0100
Message-ID: <20250507002425.93421-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507002425.93421-1-linux@treblig.org>
References: <20250507002425.93421-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

smu_v13_0_display_clock_voltage_request() and
smu_v13_0_set_min_deep_sleep_dcefclk() were added in 2020 by
commit c05d1c401572 ("drm/amd/swsmu: add aldebaran smu13 ip support (v3)")
but have remained unused.

Remove them.

smu_v13_0_display_clock_voltage_request() was the only user
of smu_v13_0_set_hard_freq_limited_range().  Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  12 ---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 101 ------------------
 2 files changed, 113 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index cd03caffe317..6f74783472e5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -183,13 +183,6 @@ int smu_v13_0_disable_thermal_alert(struct smu_context *smu);
 
 int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value);
 
-int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk);
-
-int
-smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
-					struct pp_display_clock_request
-					*clock_req);
-
 uint32_t
 smu_v13_0_get_fan_control_mode(struct smu_context *smu);
 
@@ -226,11 +219,6 @@ int smu_v13_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_type clk_type,
 					  uint32_t min, uint32_t max, bool automatic);
 
-int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
-					  enum smu_clk_type clk_type,
-					  uint32_t min,
-					  uint32_t max);
-
 int smu_v13_0_set_performance_level(struct smu_context *smu,
 				    enum amd_dpm_forced_level level);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index ba5a9012dbd5..03242f65e262 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -709,18 +709,6 @@ int smu_v13_0_notify_memory_pool_location(struct smu_context *smu)
 	return ret;
 }
 
-int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk)
-{
-	int ret;
-
-	ret = smu_cmn_send_smc_msg_with_param(smu,
-					      SMU_MSG_SetMinDeepSleepDcefclk, clk, NULL);
-	if (ret)
-		dev_err(smu->adev->dev, "SMU13 attempt to set divider for DCEFCLK Failed!");
-
-	return ret;
-}
-
 int smu_v13_0_set_driver_table_location(struct smu_context *smu)
 {
 	struct smu_table *driver_table = &smu->smu_table.driver_table;
@@ -1073,56 +1061,6 @@ int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value)
 
 }
 
-int
-smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
-					struct pp_display_clock_request
-					*clock_req)
-{
-	enum amd_pp_clock_type clk_type = clock_req->clock_type;
-	int ret = 0;
-	enum smu_clk_type clk_select = 0;
-	uint32_t clk_freq = clock_req->clock_freq_in_khz / 1000;
-
-	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) ||
-	    smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
-		switch (clk_type) {
-		case amd_pp_dcef_clock:
-			clk_select = SMU_DCEFCLK;
-			break;
-		case amd_pp_disp_clock:
-			clk_select = SMU_DISPCLK;
-			break;
-		case amd_pp_pixel_clock:
-			clk_select = SMU_PIXCLK;
-			break;
-		case amd_pp_phy_clock:
-			clk_select = SMU_PHYCLK;
-			break;
-		case amd_pp_mem_clock:
-			clk_select = SMU_UCLK;
-			break;
-		default:
-			dev_info(smu->adev->dev, "[%s] Invalid Clock Type!", __func__);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (ret)
-			goto failed;
-
-		if (clk_select == SMU_UCLK && smu->disable_uclk_switch)
-			return 0;
-
-		ret = smu_v13_0_set_hard_freq_limited_range(smu, clk_select, clk_freq, 0);
-
-		if (clk_select == SMU_UCLK)
-			smu->hard_min_uclk_req_from_dal = clk_freq;
-	}
-
-failed:
-	return ret;
-}
-
 uint32_t smu_v13_0_get_fan_control_mode(struct smu_context *smu)
 {
 	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT))
@@ -1647,45 +1585,6 @@ int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu,
 	return ret;
 }
 
-int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
-					  enum smu_clk_type clk_type,
-					  uint32_t min,
-					  uint32_t max)
-{
-	int ret = 0, clk_id = 0;
-	uint32_t param;
-
-	if (min <= 0 && max <= 0)
-		return -EINVAL;
-
-	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
-		return 0;
-
-	clk_id = smu_cmn_to_asic_specific_index(smu,
-						CMN2ASIC_MAPPING_CLK,
-						clk_type);
-	if (clk_id < 0)
-		return clk_id;
-
-	if (max > 0) {
-		param = (uint32_t)((clk_id << 16) | (max & 0xffff));
-		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMaxByFreq,
-						      param, NULL);
-		if (ret)
-			return ret;
-	}
-
-	if (min > 0) {
-		param = (uint32_t)((clk_id << 16) | (min & 0xffff));
-		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinByFreq,
-						      param, NULL);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 int smu_v13_0_set_performance_level(struct smu_context *smu,
 				    enum amd_dpm_forced_level level)
 {
-- 
2.49.0

