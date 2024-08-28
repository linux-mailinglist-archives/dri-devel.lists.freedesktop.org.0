Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D1962567
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 13:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7127410E2F1;
	Wed, 28 Aug 2024 11:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="lVNoFK/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BE910E314;
 Wed, 28 Aug 2024 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1724842836;
 bh=rGkv8vXTKQNNDjP5vTcEOnsxxSzEmVf10njH6gZtvbg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=lVNoFK/KCHTP4ynQyOCcOeXrh08UYkTBcMhAivVVdOjFYiJ334pCccGHinCjXNboM
 9Pxj6rUeCP2hBgPiJAnp28mD2IZBUVRNqlpqvmXjCprn9t2qqMMWNnvrpVHbVMBFHq
 4YaDGGc02OLxeqQ9KdERcBKr7h0ksSuND7epbHXM=
X-QQ-mid: bizesmtp88t1724842792tz70z34i
X-QQ-Originating-IP: yURP3s+8jR7D8ND1Wq3RX+2ffkTw4oLhrct7u85Sa4c=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 28 Aug 2024 18:59:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8286794993761644341
From: WangYuli <wangyuli@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com,
 mario.limonciello@amd.com, le.ma@amd.com, Jun.Ma2@amd.com,
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com,
 wangyuli@uniontech.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Subject: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
Date: Wed, 28 Aug 2024 18:59:38 +0800
Message-ID: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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

From: wenlunpeng <wenlunpeng@uniontech.com>

The quirk is for reboot-stability.

A device reboot stress test has been observed to cause
random system hangs when amdgpu_dpm is enabled.

Disabling amdgpu_dpm can fix this.

However, a boot-param can still overwrite it to enable
amdgpu_dpm.

Serial log when error occurs:
...
Console: switching to colour frame buffer device 160x45
amdgpu 0000:01:00.0: fb0: amdgpudrmfb frame buffer device
[drm:amdgpu_device_ip_late_init] *ERROR* late_init of IP block <si_dpm> failed -22
amdgpu 0000:01:00.0: amdgpu_device_ip_late_init failed
amdgpu 0000:01:00.0: Fatal error during GPU init
[drm] amdgpu: finishing device.
Console: switching to colour dummy device 80x25
...

Signed-off-by: wenlunpeng <wenlunpeng@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 094498a0964b..81716fcac7cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -32,6 +32,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/cc_platform.h>
+#include <linux/dmi.h>
 #include <linux/dynamic_debug.h>
 #include <linux/module.h>
 #include <linux/mmu_notifier.h>
@@ -3023,10 +3024,32 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.dev_groups = amdgpu_sysfs_groups,
 };
 
+static int quirk_set_amdgpu_dpm_0(const struct dmi_system_id *dmi)
+{
+	amdgpu_dpm = 0;
+	pr_info("Identified '%s', set amdgpu_dpm to 0.\n", dmi->ident);
+	return 1;
+}
+
+static const struct dmi_system_id amdgpu_quirklist[] = {
+	{
+		.ident = "DS25 Desktop",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "THTF-SW831-1W-DS25_MB"),
+		},
+		.callback = quirk_set_amdgpu_dpm_0,
+	},
+	{}
+};
+
 static int __init amdgpu_init(void)
 {
 	int r;
 
+	/* quirks for some hardware, applied only when it's untouched */
+	if (amdgpu_dpm == -1)
+		dmi_check_system(amdgpu_quirklist);
+
 	if (drm_firmware_drivers_only())
 		return -EINVAL;
 
-- 
2.43.4

