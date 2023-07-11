Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214774F62B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F310E400;
	Tue, 11 Jul 2023 16:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-11.mta1.migadu.com (out-11.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CE510E403
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:53:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689093812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qerYEjJsYQa89wBNUybGoMjyzLMs27H7zUPn+Dcw/G0=;
 b=cLX+YcBRiHpKikMeKMwG3mmNyBOCt0RfzhMRCQMFVMsE5PUvN0MMXatH5virGuBPf1bPzP
 TlrzyZr2xWSz6KpDcpt68BaSDQcRrPHi91BQyPlN45VH8b+lOC+BzDNGujXDPizGjou5oq
 GspWd6OWyS+7lx+YxAilLOZFQYnLH5E=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH v3 3/9] PCI/VGA: Switch to
 aperture_contain_firmware_fb_nonreloc()
Date: Wed, 12 Jul 2023 00:43:04 +0800
Message-Id: <20230711164310.791756-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230711164310.791756-1-sui.jingfeng@linux.dev>
References: <20230711164310.791756-1-sui.jingfeng@linux.dev>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The observation behind this is that we should avoid accessing the global
screen_info directly. Call the aperture_contain_firmware_fb_nonreloc()
function to implement the detection of whether an aperture contains the
firmware FB.

This patch helps to decouple the determination from the implementation.
Or, in other words, we intend to make the determination opaque to the
caller. The determination may choose to be arch-dependent or
arch-independent. But vgaarb, as a consumer of the determination,
shouldn't care how the does determination is implemented.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index bf96e085751d..953daf731b2c 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -14,6 +14,7 @@
 #define vgaarb_info(dev, fmt, arg...)	dev_info(dev, "vgaarb: " fmt, ##arg)
 #define vgaarb_err(dev, fmt, arg...)	dev_err(dev, "vgaarb: " fmt, ##arg)
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -26,7 +27,6 @@
 #include <linux/poll.h>
 #include <linux/miscdevice.h>
 #include <linux/slab.h>
-#include <linux/screen_info.h>
 #include <linux/vt.h>
 #include <linux/console.h>
 #include <linux/acpi.h>
@@ -558,20 +558,11 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
+/* Select the device owning the boot framebuffer if there is one */
 static bool vga_is_firmware_default(struct pci_dev *pdev)
 {
 #if defined(CONFIG_X86) || defined(CONFIG_IA64)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
 	struct resource *r;
-	u64 limit;
-
-	/* Select the device owning the boot framebuffer if there is one */
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
 
 	/* Does firmware framebuffer belong to us? */
 	pci_dev_for_each_resource(pdev, r) {
@@ -581,10 +572,8 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
 		if (!r->start || !r->end)
 			continue;
 
-		if (base < r->start || limit >= r->end)
-			continue;
-
-		return true;
+		if (aperture_contain_firmware_fb_nonreloc(r->start, r->end))
+			return true;
 	}
 #endif
 	return false;
-- 
2.25.1

