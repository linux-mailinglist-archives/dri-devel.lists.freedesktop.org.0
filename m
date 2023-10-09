Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476387BECFE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73410E2F9;
	Mon,  9 Oct 2023 21:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101F410E2F8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57ABEB81737;
 Mon,  9 Oct 2023 21:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57782C433A9;
 Mon,  9 Oct 2023 21:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696886434;
 bh=IUe9zQKsuCSW8PZPXBcaUGQEXOnvJDkNFrZmACx/Wc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NmSWIJiIMcyJjUfY5qC1+UVpedpmfmM66fmZu9OPQGX55nM5F1ijugpZATvGMMYLN
 4OtJ68KWwnxC5sKEJHnXB0aPfh+L7jtRdvG3Ur9gFXkeieGSWAIA5v1RDLallZ7LaF
 ECZ4HTzfRXUiKmQKck0yRmHpvNA52NglqFMVnZjDkiAdX+Jc8CuUNLPfTEUBovYWNI
 KCj8GVKYtCzYKzH0wh/izBEtRrF1Kby4mGFn1lYaWezV/u9j863swaEgD7FOiPVxvg
 rv5hmStNIP5G+DhKDG1qddwfAUsgPb2O3uS107yfh00B9t616gUllJtrSz0BpX17wX
 Z9rWHJNyiE9Iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/9] hyperv: avoid dependency on screen_info
Date: Mon,  9 Oct 2023 23:18:44 +0200
Message-Id: <20231009211845.3136536-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009211845.3136536-1-arnd@kernel.org>
References: <20231009211845.3136536-1-arnd@kernel.org>
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 loongarch@lists.linux.dev,
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 7 ++++---
 drivers/hv/vmbus_drv.c                  | 6 ++++--
 drivers/video/fbdev/hyperv_fb.c         | 8 ++++----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 58b0b46a21e68..d511d17c5bdfc 100644
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
index edbb38f6956b9..b33d5abd9beb2 100644
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
index 2e27c6bd80442..bf59daf862fc7 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1010,7 +1010,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			goto getmem_done;
 		}
 		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
-	} else {
+	} else if (IS_ENABLED(CONFIG_SYSFB)) {
 		base = screen_info.lfb_base;
 		size = screen_info.lfb_size;
 	}
@@ -1056,13 +1056,13 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
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

