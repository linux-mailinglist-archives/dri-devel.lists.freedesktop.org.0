Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A487AB8914
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666110E8C4;
	Thu, 15 May 2025 14:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B447B10E8C4;
 Thu, 15 May 2025 14:18:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-01 (Coremail) with SMTP id qwCowADni_yb9yVoS_LMFQ--.6807S2;
 Thu, 15 May 2025 22:18:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm: radeon: ci_dpm: Add error handling for
 ci_send_msg_to_smc_with_parameter()
Date: Thu, 15 May 2025 22:17:40 +0800
Message-ID: <20250515141740.1324-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADni_yb9yVoS_LMFQ--.6807S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1kKFW5uw4Utw4rJw4kCrg_yoW8KFW8pa
 yxCFyYyrZ5AayrWwsFyw4UAryrAwsrXFWxJrsrKw43Z34ayFyrJF13uryayFW0yryvgFya
 vrn2y3W8Zr4UCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfU52NtDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4DA2glvjTL+AAAsz
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

The ci_enable_uvd_dpm() calls ci_send_msg_to_smc_with_parameter()
but does not check the return value. This could lead to the execution
with potentially invalid data. A proper implementation can be found
in the ci_fan_ctrl_start_smc_fan_control().

Add a check after calling ci_send_msg_to_smc_with_parameter(), return
-EINVAL if the sending fails.

Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
Cc: stable@vger.kernel.org # v3.12
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index abe9d65cc460..3877863c6893 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -3889,6 +3889,7 @@ static int ci_enable_uvd_dpm(struct radeon_device *rdev, bool enable)
 	struct ci_power_info *pi = ci_get_pi(rdev);
 	const struct radeon_clock_and_voltage_limits *max_limits;
 	int i;
+	PPSMC_Result result;
 
 	if (rdev->pm.dpm.ac_power)
 		max_limits = &rdev->pm.dpm.dyn_state.max_clock_voltage_on_ac;
@@ -3907,24 +3908,30 @@ static int ci_enable_uvd_dpm(struct radeon_device *rdev, bool enable)
 			}
 		}
 
-		ci_send_msg_to_smc_with_parameter(rdev,
+		result = ci_send_msg_to_smc_with_parameter(rdev,
 						  PPSMC_MSG_UVDDPM_SetEnabledMask,
 						  pi->dpm_level_enable_mask.uvd_dpm_enable_mask);
+		if (result != PPSMC_Result_OK)
+			return -EINVAL;
 
 		if (pi->last_mclk_dpm_enable_mask & 0x1) {
 			pi->uvd_enabled = true;
 			pi->dpm_level_enable_mask.mclk_dpm_enable_mask &= 0xFFFFFFFE;
-			ci_send_msg_to_smc_with_parameter(rdev,
+			result = ci_send_msg_to_smc_with_parameter(rdev,
 							  PPSMC_MSG_MCLKDPM_SetEnabledMask,
 							  pi->dpm_level_enable_mask.mclk_dpm_enable_mask);
+			if (result != PPSMC_Result_OK)
+				return -EINVAL;
 		}
 	} else {
 		if (pi->last_mclk_dpm_enable_mask & 0x1) {
 			pi->uvd_enabled = false;
 			pi->dpm_level_enable_mask.mclk_dpm_enable_mask |= 1;
-			ci_send_msg_to_smc_with_parameter(rdev,
+			result = ci_send_msg_to_smc_with_parameter(rdev,
 							  PPSMC_MSG_MCLKDPM_SetEnabledMask,
 							  pi->dpm_level_enable_mask.mclk_dpm_enable_mask);
+			if (result != PPSMC_Result_OK)
+				return -EINVAL;
 		}
 	}
 
-- 
2.42.0.windows.2

