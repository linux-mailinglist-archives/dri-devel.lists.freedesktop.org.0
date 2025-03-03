Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05EA4C397
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8F10E43A;
	Mon,  3 Mar 2025 14:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="LaFLFzVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5A10E43B;
 Mon,  3 Mar 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=NCcGpHSW32vENYyHk+1Go1rb3MBFVM15qU2VwPxGLTQ=; b=LaFLFzVFca63tNHt
 MFHhSQTdHARen5gH5yOeqOLa3VG6YqaBHlCXpqlPLlpoxWXOSIn8kbhLof3VXLRZvdmv+8gQyk4rm
 8Cc6AoVCi442tCpUZDIaJYcRReofzgvKEJUPyOL84WCBPmzUGmac9QPMCKp5tiiw87PmNiXtZ/J65
 AYiuxY5I5LdHPZmDoUTtaIplSoP9xF5ToT7bZHRYsXIqC1XHTnW3eFgADE9VLPx6ODx+CLZ9jldM1
 QhT3LP6VBaYQcPqsXL2kjaqpF4E1dt6tiZikN4RcJ3XEgZFdFwBdY/CSI4sSzTMbRSBsBJLERL68b
 +nunWdvbPnbLp6Px9g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tp6x2-0028PG-19;
 Mon, 03 Mar 2025 14:39:24 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, austin.zheng@amd.com, jun.lei@amd.com,
 kenneth.feng@amd.com, linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/6] drm/amdgpu: Remove ppatomfwctrl deadcode
Date: Mon,  3 Mar 2025 14:39:17 +0000
Message-ID: <20250303143922.36342-2-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303143922.36342-1-linux@treblig.org>
References: <20250303143922.36342-1-linux@treblig.org>
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

pp_atomfwctrl_get_pp_assign_pin() and pp_atomfwctrl_get_pp_assign_pin()
were added in 2017 by
commit 0d2c7569e196 ("drm/amdgpu: add new atomfirmware based helpers for
powerplay")
but have remained unused.

Remove them, and the helper functions they used.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c | 78 -------------------
 .../drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h |  3 -
 2 files changed, 81 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c
index 82d540334318..6120f14caab0 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c
@@ -158,84 +158,6 @@ int pp_atomfwctrl_get_voltage_table_v4(struct pp_hwmgr *hwmgr,
 	return result;
 }
 
- 
-static struct atom_gpio_pin_lut_v2_1 *pp_atomfwctrl_get_gpio_lookup_table(
-		struct pp_hwmgr *hwmgr)
-{
-	const void *table_address;
-	uint16_t idx;
-
-	idx = GetIndexIntoMasterDataTable(gpio_pin_lut);
-	table_address =	smu_atom_get_data_table(hwmgr->adev,
-			idx, NULL, NULL, NULL);
-	PP_ASSERT_WITH_CODE(table_address,
-			"Error retrieving BIOS Table Address!",
-			return NULL);
-
-	return (struct atom_gpio_pin_lut_v2_1 *)table_address;
-}
-
-static bool pp_atomfwctrl_lookup_gpio_pin(
-		struct atom_gpio_pin_lut_v2_1 *gpio_lookup_table,
-		const uint32_t pin_id,
-		struct pp_atomfwctrl_gpio_pin_assignment *gpio_pin_assignment)
-{
-	unsigned int size = le16_to_cpu(
-			gpio_lookup_table->table_header.structuresize);
-	unsigned int offset =
-			offsetof(struct atom_gpio_pin_lut_v2_1, gpio_pin[0]);
-	unsigned long start = (unsigned long)gpio_lookup_table;
-
-	while (offset < size) {
-		const struct  atom_gpio_pin_assignment *pin_assignment =
-				(const struct  atom_gpio_pin_assignment *)(start + offset);
-
-		if (pin_id == pin_assignment->gpio_id)  {
-			gpio_pin_assignment->uc_gpio_pin_bit_shift =
-					pin_assignment->gpio_bitshift;
-			gpio_pin_assignment->us_gpio_pin_aindex =
-					le16_to_cpu(pin_assignment->data_a_reg_index);
-			return true;
-		}
-		offset += offsetof(struct atom_gpio_pin_assignment, gpio_id) + 1;
-	}
-	return false;
-}
-
-/*
- * Returns TRUE if the given pin id find in lookup table.
- */
-bool pp_atomfwctrl_get_pp_assign_pin(struct pp_hwmgr *hwmgr,
-		const uint32_t pin_id,
-		struct pp_atomfwctrl_gpio_pin_assignment *gpio_pin_assignment)
-{
-	bool ret = false;
-	struct atom_gpio_pin_lut_v2_1 *gpio_lookup_table =
-			pp_atomfwctrl_get_gpio_lookup_table(hwmgr);
-
-	/* If we cannot find the table do NOT try to control this voltage. */
-	PP_ASSERT_WITH_CODE(gpio_lookup_table,
-			"Could not find GPIO lookup Table in BIOS.",
-			return false);
-
-	ret = pp_atomfwctrl_lookup_gpio_pin(gpio_lookup_table,
-			pin_id, gpio_pin_assignment);
-
-	return ret;
-}
-
-/*
- * Enter to SelfRefresh mode.
- * @param hwmgr
- */
-int pp_atomfwctrl_enter_self_refresh(struct pp_hwmgr *hwmgr)
-{
-	/* 0 - no action
-	 * 1 - leave power to video memory always on
-	 */
-	return 0;
-}
-
 /** pp_atomfwctrl_get_gpu_pll_dividers_vega10().
  *
  * @param hwmgr       input parameter: pointer to HwMgr
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
index e86e05c786d9..0d62903d5676 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
@@ -217,9 +217,6 @@ struct pp_atomfwctrl_smc_dpm_parameters {
 int pp_atomfwctrl_get_gpu_pll_dividers_vega10(struct pp_hwmgr *hwmgr,
 		uint32_t clock_type, uint32_t clock_value,
 		struct pp_atomfwctrl_clock_dividers_soc15 *dividers);
-int pp_atomfwctrl_enter_self_refresh(struct pp_hwmgr *hwmgr);
-bool pp_atomfwctrl_get_pp_assign_pin(struct pp_hwmgr *hwmgr, const uint32_t pin_id,
-		struct pp_atomfwctrl_gpio_pin_assignment *gpio_pin_assignment);
 
 int pp_atomfwctrl_get_voltage_table_v4(struct pp_hwmgr *hwmgr, uint8_t voltage_type,
 		uint8_t voltage_mode, struct pp_atomfwctrl_voltage_table *voltage_table);
-- 
2.48.1

