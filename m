Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC17DEE3A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 09:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555B510E152;
	Thu,  2 Nov 2023 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA75710E737
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 16:02:18 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1159)
 id 6738C20B74C0; Wed,  1 Nov 2023 09:02:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6738C20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1698854538;
 bh=JjKagOQc7XVCsOzjX5mQZCyIjlKEf/+UGuI8XDR24n4=;
 h=From:To:Cc:Subject:Date:From;
 b=Yj+KLdDWCXSntyvw2Ee6orRF9hr+VRDlMQZ0OP7j+7KKotau1/PdptyJC7tbAC0MA
 T9ZzO0RudXLO3xp7WDdEZPcm7CXEFHNzDzi0YWOig14lgfEgoK0FBK91M7ed/LS1OM
 VdWEZh1X7+XnzywI3maf4YfsadR90ULFkZIIVd/8=
From: Nischala Yelchuri <niyelchu@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 deller@gmx.de
Subject: [PATCH] Replace ioremap_cache() with memremap()
Date: Wed,  1 Nov 2023 09:01:48 -0700
Message-Id: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:35:03 +0000
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
Cc: niyelchu@microsoft.com, singhabhinav9051571833@gmail.com,
 mhklinux@outlook.com, mhkelley@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current Hyper-V code for CoCo VMs uses ioremap_cache() to map normal memory as decrypted.
ioremap_cache() is ideally used to map I/O device memory when it has the characteristics
of normal memory. It should not be used to map normal memory as the returned pointer
has the __iomem attribute.

Fix current code by replacing ioremap_cache() with memremap().

No functional change intended.

Signed-off-by: Nischala Yelchuri <niyelchu@linux.microsoft.com>
---
 arch/x86/hyperv/hv_init.c               |  6 +++---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c |  2 +-
 drivers/hv/hv.c                         | 13 +++++++------
 drivers/video/fbdev/hyperv_fb.c         |  6 +++---
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 21556ad87..fae43c040 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -68,9 +68,9 @@ static int hyperv_init_ghcb(void)
 	 */
 	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
 
-	/* Mask out vTOM bit. ioremap_cache() maps decrypted */
+	/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
 	ghcb_gpa &= ~ms_hyperv.shared_gpa_boundary;
-	ghcb_va = (void *)ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
+	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP_DEC);
 	if (!ghcb_va)
 		return -ENOMEM;
 
@@ -238,7 +238,7 @@ static int hv_cpu_die(unsigned int cpu)
 	if (hv_ghcb_pg) {
 		ghcb_va = (void **)this_cpu_ptr(hv_ghcb_pg);
 		if (*ghcb_va)
-			iounmap(*ghcb_va);
+			memunmap(*ghcb_va);
 		*ghcb_va = NULL;
 	}
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index d511d17c5..d6fec9bd3 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -92,7 +92,7 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 	 * connect to display properly for ARM64 Linux VM, as the host also maps
 	 * the VRAM cacheable.
 	 */
-	hv->vram = ioremap_cache(hv->mem->start, hv->fb_size);
+	hv->vram = memremap(hv->mem->start, hv->fb_size, MEMREMAP_WB | MEMREMAP_DEC);
 	if (!hv->vram) {
 		drm_err(dev, "Failed to map vram\n");
 		ret = -ENOMEM;
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 51e5018ac..399bfa392 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -274,11 +274,12 @@ void hv_synic_enable_regs(unsigned int cpu)
 	simp.simp_enabled = 1;
 
 	if (ms_hyperv.paravisor_present || hv_root_partition) {
-		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
+		/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
 		u64 base = (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
 				~ms_hyperv.shared_gpa_boundary;
 		hv_cpu->synic_message_page
-			= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
+			= memremap(base,
+				   HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP_DEC);
 		if (!hv_cpu->synic_message_page)
 			pr_err("Fail to map synic message page.\n");
 	} else {
@@ -293,11 +294,11 @@ void hv_synic_enable_regs(unsigned int cpu)
 	siefp.siefp_enabled = 1;
 
 	if (ms_hyperv.paravisor_present || hv_root_partition) {
-		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
+		/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
 		u64 base = (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
 				~ms_hyperv.shared_gpa_boundary;
 		hv_cpu->synic_event_page
-			= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
+			= memremap(base, HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP_DEC);
 		if (!hv_cpu->synic_event_page)
 			pr_err("Fail to map synic event page.\n");
 	} else {
@@ -376,7 +377,7 @@ void hv_synic_disable_regs(unsigned int cpu)
 	 */
 	simp.simp_enabled = 0;
 	if (ms_hyperv.paravisor_present || hv_root_partition) {
-		iounmap(hv_cpu->synic_message_page);
+		memunmap(hv_cpu->synic_message_page);
 		hv_cpu->synic_message_page = NULL;
 	} else {
 		simp.base_simp_gpa = 0;
@@ -388,7 +389,7 @@ void hv_synic_disable_regs(unsigned int cpu)
 	siefp.siefp_enabled = 0;
 
 	if (ms_hyperv.paravisor_present || hv_root_partition) {
-		iounmap(hv_cpu->synic_event_page);
+		memunmap(hv_cpu->synic_event_page);
 		hv_cpu->synic_event_page = NULL;
 	} else {
 		siefp.base_siefp_gpa = 0;
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index bf59daf86..cd9ec1f6c 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1034,7 +1034,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	 * VM Connect to display properly for ARM64 Linux VM, as the host also
 	 * maps the VRAM cacheable.
 	 */
-	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
+	fb_virt = memremap(par->mem->start, screen_fb_size, MEMREMAP_WB | MEMREMAP_DEC);
 	if (!fb_virt)
 		goto err2;
 
@@ -1068,7 +1068,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	return 0;
 
 err3:
-	iounmap(fb_virt);
+	memunmap(fb_virt);
 err2:
 	vmbus_free_mmio(par->mem->start, screen_fb_size);
 	par->mem = NULL;
@@ -1086,7 +1086,7 @@ static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
 
 	if (par->need_docopy) {
 		vfree(par->dio_vp);
-		iounmap(info->screen_base);
+		memunmap(info->screen_base);
 		vmbus_free_mmio(par->mem->start, screen_fb_size);
 	} else {
 		hvfb_release_phymem(hdev, info->fix.smem_start,
-- 
2.34.1

