Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E1791DF2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 21:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4CD10E3F2;
	Mon,  4 Sep 2023 19:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-229.mta1.migadu.com (out-229.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97210E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 19:57:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693857464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTyqdC4advhF1f2LWIzvXqUIn1S7wmBn4hXPYMV0KW4=;
 b=Knc/PQa5Wh7WbzPujlbqPJIvZyOiZUpkuNmq8G8cXeTxP9vcNZIHQiMsr4EXIJtKTFmhOY
 jIVySpNP8uVj4FDOPGVx/OV8DOZUz4fLOQ8ypLGh4wKVTxUTQ7YjxVOTT/SYxJtBfn72gN
 HeasxEJjrY21hUjU8uogIwElp3gvOuQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [RFC,
 drm-misc-next v4 4/9] drm/amdgpu: Implement .be_primary() callback
Date: Tue,  5 Sep 2023 03:57:19 +0800
Message-Id: <20230904195724.633404-5-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

On a machine with multiple GPUs, a Linux user has no control over which one
is primary at boot time. This patch tries to solve the mentioned problem by
implementing the .be_primary() callback. Pass amdgpu.modeset=10 on the
kernel cmd line if you really want the device bound by amdgpu drm driver to
be the primary video adapter, no matter what VGAARB say.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 13 ++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ecc4564ceac0..59bde6972a8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3507,6 +3507,14 @@ static void amdgpu_device_set_mcbp(struct amdgpu_device *adev)
 		DRM_INFO("MCBP is enabled\n");
 }
 
+static bool amdgpu_want_to_be_primary(struct pci_dev *pdev)
+{
+	if (amdgpu_modeset == 10)
+		return true;
+
+	return false;
+}
+
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3916,7 +3924,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * ignore it
 	 */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
+		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode,
+				    amdgpu_want_to_be_primary);
 
 	px = amdgpu_device_supports_px(ddev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81edf66dbea8..2592e24ce62c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -118,6 +118,7 @@
 #define KMS_DRIVER_MINOR	54
 #define KMS_DRIVER_PATCHLEVEL	0
 
+int amdgpu_modeset = -1;
 unsigned int amdgpu_vram_limit = UINT_MAX;
 int amdgpu_vis_vram_limit;
 int amdgpu_gart_size = -1; /* auto */
@@ -223,6 +224,13 @@ struct amdgpu_watchdog_timer amdgpu_watchdog_timer = {
 	.period = 0x0, /* default to 0x0 (timeout disable) */
 };
 
+/**
+ * DOC: modeset (int)
+ * Disable/Enable kernel modesetting (1 = enable, 0 = disable, -1 = auto (default)).
+ */
+MODULE_PARM_DESC(modeset, "Disable/Enable kernel modesetting");
+module_param_named(modeset, amdgpu_modeset, int, 0600);
+
 /**
  * DOC: vramlimit (int)
  * Restrict the total amount of VRAM in MiB for testing.  The default is 0 (Use full VRAM).
@@ -2872,7 +2880,10 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (drm_firmware_drivers_only())
+	if (drm_firmware_drivers_only() && amdgpu_modeset == -1)
+		return -EINVAL;
+
+	if (amdgpu_modeset == 0)
 		return -EINVAL;
 
 	r = amdgpu_sync_init();
-- 
2.34.1

