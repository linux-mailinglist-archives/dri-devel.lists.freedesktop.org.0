Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7FABB36B
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 04:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D593C10E1FC;
	Mon, 19 May 2025 02:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3B10E1FC;
 Mon, 19 May 2025 02:41:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-03 (Coremail) with SMTP id rQCowAAHGvVEmipoO59DAQ--.10155S2;
 Mon, 19 May 2025 10:41:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm: radeon: ci_dpm: Add error handling in ci_enable_vce_dpm()
Date: Mon, 19 May 2025 10:40:35 +0800
Message-ID: <20250519024036.1119-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHGvVEmipoO59DAQ--.10155S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1DZr4ruF1fXF43tF4fZrb_yoW8WFW8p3
 yDWFyYyrZ5Aay8WanFyw4DAryruws7JFWxJFsFk345uw4ayFy8JF13XryayFy0vr92gFya
 vrn2k3WkZr4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOtC7UUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwHA2gqdbeYjQAAsb
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

The ci_enable_vce_dpm() calls ci_send_msg_to_smc_with_parameter()
but does not check the return value. A proper implementation can be
found in the ci_upload_dpm_level_enable_mask().

Add a check after calling ci_send_msg_to_smc_with_parameter(), return
-EINVAL if the sending fails.

Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
Cc: stable@vger.kernel.org # v3.12
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 3877863c6893..c4faaa16a5c4 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -3945,6 +3945,7 @@ static int ci_enable_vce_dpm(struct radeon_device *rdev, bool enable)
 	struct ci_power_info *pi = ci_get_pi(rdev);
 	const struct radeon_clock_and_voltage_limits *max_limits;
 	int i;
+	PPSMC_Result result;
 
 	if (rdev->pm.dpm.ac_power)
 		max_limits = &rdev->pm.dpm.dyn_state.max_clock_voltage_on_ac;
@@ -3962,9 +3963,11 @@ static int ci_enable_vce_dpm(struct radeon_device *rdev, bool enable)
 			}
 		}
 
-		ci_send_msg_to_smc_with_parameter(rdev,
-						  PPSMC_MSG_VCEDPM_SetEnabledMask,
-						  pi->dpm_level_enable_mask.vce_dpm_enable_mask);
+		result = ci_send_msg_to_smc_with_parameter(rdev,
+				PPSMC_MSG_VCEDPM_SetEnabledMask,
+				pi->dpm_level_enable_mask.vce_dpm_enable_mask);
+		if (result != PPSMC_Result_OK)
+			return -EINVAL;
 	}
 
 	return (ci_send_msg_to_smc(rdev, enable ?
-- 
2.42.0.windows.2

