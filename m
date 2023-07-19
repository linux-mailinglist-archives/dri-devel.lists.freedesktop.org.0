Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB3759596
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C21910E49F;
	Wed, 19 Jul 2023 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2284610E493
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:41:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9834960B5E;
 Wed, 19 Jul 2023 12:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88321C43391;
 Wed, 19 Jul 2023 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689770491;
 bh=9fW6U6BHu4TUL4RWpVUJbdMggGEj9FTfMpLEh+DKB4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bQx8YO5rdZGaGJpL2Tgt6DTW/RbyR/A8QofqucAc+4eXdqqSGZqRJ1SkbMDzh4BLI
 2NLToZZIHIF9hyPL+Cyk9ib9veIe3JFCFQPNi1M5+29webS34B7tOY2yr6coi1kyR9
 68cbQ5j1lku+Y3+WAYkMKAfJYmwUgtN18hZyJw7RPd8HjbKYCKDKOoyZuP0RMlDEPX
 GCkx3VMGRM6F3nmHYu2QILv1caInSzegNyJm5qhaqJg/HU5Vh3+s6GYahBrXTRz+u2
 q5NpRtNW4/xAU+AMW7Nj2hyg2oXsH5ekaaNx3M1dPNTw9WEqMuc5GB/KyGcnL8ktIs
 NotTDXWPm4GSw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 8/9] hyperv: avoid dependency on screen_info
Date: Wed, 19 Jul 2023 14:39:43 +0200
Message-Id: <20230719123944.3438363-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The two hyperv framebuffer drivers (hyperv_fb or hyperv_drm_drv) access the
global screen_info in order to take over from the sysfb framebuffer, which
in turn could be handled by simplefb, simpledrm or efifb. Similarly, the
vmbus_drv code marks the original EFI framebuffer as reserved, but this
is not required if there is no sysfb.

As a preparation for making screen_info itself more local to the sysfb
helper code, add a compile-time conditional in all three files that relate
to hyperv fb and just skip this code if there is no sysfb that needs to
be unregistered.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 7 ++++---
 drivers/hv/vmbus_drv.c                  | 6 ++++--
 drivers/video/fbdev/hyperv_fb.c         | 8 ++++----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 8026118c6e033..9a44a00effc24 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -73,9 +73,10 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 	struct drm_device *dev = &hv->dev;
 	int ret;
 
-	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
-						     screen_info.lfb_size,
-						     &hyperv_driver);
+	if (IS_ENABLED(CONFIG_SYSFB))
+		drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
+							     screen_info.lfb_size,
+							     &hyperv_driver);
 
 	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 67f95a29aeca5..5bc059e8a9f5f 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2100,8 +2100,10 @@ static void __maybe_unused vmbus_reserve_fb(void)
 
 	if (efi_enabled(EFI_BOOT)) {
 		/* Gen2 VM: get FB base from EFI framebuffer */
-		start = screen_info.lfb_base;
-		size = max_t(__u32, screen_info.lfb_size, 0x800000);
+		if (IS_ENABLED(CONFIG_SYSFB)) {
+			start = screen_info.lfb_base;
+			size = max_t(__u32, screen_info.lfb_size, 0x800000);
+		}
 	} else {
 		/* Gen1 VM: get FB base from PCI */
 		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index b331452aab4fb..7e0d1c4235549 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1030,7 +1030,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			goto getmem_done;
 		}
 		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
-	} else {
+	} else if (IS_ENABLED(CONFIG_SYSFB)) {
 		base = screen_info.lfb_base;
 		size = screen_info.lfb_size;
 	}
@@ -1076,13 +1076,13 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 getmem_done:
 	aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
 
-	if (gen2vm) {
+	if (!gen2vm) {
+		pci_dev_put(pdev);
+	} else if (IS_ENABLED(CONFIG_SYSFB)) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
 		screen_info.lfb_size = 0;
 		screen_info.lfb_base = 0;
 		screen_info.orig_video_isVGA = 0;
-	} else {
-		pci_dev_put(pdev);
 	}
 
 	return 0;
-- 
2.39.2

