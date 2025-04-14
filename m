Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78854A877FE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 08:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDFD10E111;
	Mon, 14 Apr 2025 06:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A910E111;
 Mon, 14 Apr 2025 06:36:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-05 (Coremail) with SMTP id zQCowABHhQ3xrPxn6qzlCA--.18678S2;
 Mon, 14 Apr 2025 14:36:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH RESEND] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Fix wrong
 return value of fiji_populate_smc_boot_level()
Date: Mon, 14 Apr 2025 14:36:11 +0800
Message-ID: <20250414063611.2100-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHhQ3xrPxn6qzlCA--.18678S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF43Wr4xZw43CF4kCF47CFg_yoW5GF15pr
 WDXrZIv39YyanrJrnrtFs2qr4S9FyxJFW8G3y7C34rZw1UtrW8Zr40ya4ayF48GFyIkws3
 X342gFWUGr4Ika7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8D7aUUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgMA2f8nB469QAAsd
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

The return value of fiji_populate_smc_boot_level() is always 0, which
represent the failure of the function. The result of phm_find_boot_level()
should be recored and return. An error handling is also needed to
phm_find_boot_level() to reset the boot level when the function fails.
A proper implementation can be found in tonga_populate_smc_boot_level().

Fixes: dcaf3483ae46 ("drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unused variable 'result'")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2956..7d0cb3741b94 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -1600,19 +1600,28 @@ static int fiji_populate_smc_uvd_level(struct pp_hwmgr *hwmgr,
 static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
 		struct SMU73_Discrete_DpmTable *table)
 {
+	int result = 0;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	table->GraphicsBootLevel = 0;
 	table->MemoryBootLevel = 0;
 
 	/* find boot level from dpm table */
-	phm_find_boot_level(&(data->dpm_table.sclk_table),
-			    data->vbios_boot_state.sclk_bootup_value,
-			    (uint32_t *)&(table->GraphicsBootLevel));
+	result = phm_find_boot_level(&(data->dpm_table.sclk_table),
+				     data->vbios_boot_state.sclk_bootup_value,
+				     (uint32_t *)&(table->GraphicsBootLevel));
+	if (result) {
+		table->GraphicsBootLevel = 0;
+		return 0;
+	}
 
-	phm_find_boot_level(&(data->dpm_table.mclk_table),
-			    data->vbios_boot_state.mclk_bootup_value,
-			    (uint32_t *)&(table->MemoryBootLevel));
+	result = phm_find_boot_level(&(data->dpm_table.mclk_table),
+				     data->vbios_boot_state.mclk_bootup_value,
+				     (uint32_t *)&(table->MemoryBootLevel));
+	if (result) {
+		table->MemoryBootLevel = 0;
+		return 0;
+	}
 
 	table->BootVddc  = data->vbios_boot_state.vddc_bootup_value *
 			VOLTAGE_SCALE;
@@ -1625,7 +1634,7 @@ static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
 	CONVERT_FROM_HOST_TO_SMC_US(table->BootVddci);
 	CONVERT_FROM_HOST_TO_SMC_US(table->BootMVdd);
 
-	return 0;
+	return result;
 }
 
 static int fiji_populate_smc_initailial_state(struct pp_hwmgr *hwmgr)
-- 
2.42.0.windows.2

