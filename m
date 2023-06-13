Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3772D7CD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 05:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4909310E2FE;
	Tue, 13 Jun 2023 03:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7AE010E2FE;
 Tue, 13 Jun 2023 03:02:27 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:47948.1267835893
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B628610033A;
 Tue, 13 Jun 2023 11:02:22 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 2eb90189369545dd91f8f29cc5b53ba2 for bhelgaas@google.com; 
 Tue, 13 Jun 2023 11:02:26 CST
X-Transaction-ID: 2eb90189369545dd91f8f29cc5b53ba2
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 7/8] drm/amdgpu: Implement the is_boot_device callback
 function
Date: Tue, 13 Jun 2023 11:01:50 +0800
Message-Id: <20230613030151.216625-8-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613030151.216625-1-15330273260@189.cn>
References: <20230613030151.216625-1-15330273260@189.cn>
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
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-fbdev@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

[why]

The vga_is_firmware_default() defined in drivers/pci/vgaarb.c is
arch-dependent, it's a dummy on non-x86 architectures currently.
This made VGAARB lost an important condition for the arbitration.
It could still be wrong even if we remove the #ifdef and #endif guards.
because the PCI bar will move (resource re-allocation).

[how]

The device that owns the firmware framebuffer should be the default boot
device. This patch adds an arch-independent function to enforce this rule.
The vgaarb subsystem will call back to amdgpu_is_boot_device() function
when drm/amdgpu is successfully bound to an AMDGPU device.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
CC: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7a096f2d5c16..77624e8062d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3560,6 +3560,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
+static bool amdgpu_is_boot_device(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_gmc *gmc = &adev->gmc;
+
+	return drm_aperture_contain_firmware_fb(gmc->aper_base, gmc->aper_size);
+}
+
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3960,7 +3969,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
+		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode,
+				    amdgpu_is_boot_device);
 
 	px = amdgpu_device_supports_px(ddev);
 
-- 
2.25.1

