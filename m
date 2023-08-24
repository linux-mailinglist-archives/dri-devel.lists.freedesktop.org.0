Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32689787367
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C0810E57E;
	Thu, 24 Aug 2023 15:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C596810E57B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:03:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxg_BFcedklpAbAA--.56614S3;
 Thu, 24 Aug 2023 23:03:33 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c5EcedkEYBiAA--.42989S3; 
 Thu, 24 Aug 2023 23:03:33 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v5 1/2] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Date: Thu, 24 Aug 2023 23:03:31 +0800
Message-Id: <20230824150332.6434-2-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824150332.6434-1-suijingfeng@loongson.cn>
References: <20230824150332.6434-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c5EcedkEYBiAA--.42989S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFWrCF1xXr4xWFWUZw1kJFc_yoW5tF4kpr
 WfGFyrtrZ5Gw4fGrW3tF4jqF15Ar93Cry0kFW29wn3CF13JrykWr1FyFZ0qryUJ397XF43
 JF4ayF1DGayDJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU88HUDUUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the vga_is_firmware_default() function only works on x86 and
ia64, it is a no-op on the rest of the architectures. This patch completes
the implementation for it, the added code tries to capture the PCI (e) VGA
device that owns the firmware framebuffer, since only one GPU could own
the firmware fb, things are almost done once we have determined the boot
VGA device. As the PCI resource relocation do have a influence on the
results of identification, we make it available on architectures where PCI
resource relocation does happen at first. Because this patch is more
important for those architectures(such as arm, arm64, loongarch, mips and
risc-v etc).

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 76 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..bc5fcc855513 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -60,7 +60,8 @@ static int vga_count, vga_decode_count;
 static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
-
+/* The PCI(e) device who owns the firmware framebuffer */
+static struct pci_dev *pdev_boot_vga;
 
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
@@ -571,6 +572,9 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
 
 		return true;
 	}
+#else
+	if (pdev_boot_vga && pdev_boot_vga == pdev)
+		return true;
 #endif
 	return false;
 }
@@ -1555,3 +1559,73 @@ static int __init vga_arb_device_init(void)
 	return rc;
 }
 subsys_initcall_sync(vga_arb_device_init);
+
+/*
+ * Get the physical address range that the firmware framebuffer occupies.
+ *
+ * Note that the global screen_info is arch-specific, thus CONFIG_SYSFB is
+ * chosen as compile-time conditional to suppress linkage problems on non-x86
+ * architectures.
+ *
+ * Returns true on success, otherwise return false.
+ */
+static bool vga_arb_get_firmware_fb_range(u64 *start, u64 *end)
+{
+	u64 fb_start = 0;
+	u64 fb_size = 0;
+	u64 fb_end;
+
+#if defined(CONFIG_X86) || defined(CONFIG_IA64) || defined(CONFIG_SYSFB)
+	fb_start = screen_info.lfb_base;
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_start |= (u64)screen_info.ext_lfb_base << 32;
+
+	fb_size = screen_info.lfb_size;
+#endif
+
+	/* No firmware framebuffer support */
+	if (!fb_start || !fb_size)
+		return false;
+
+	fb_end = fb_start + fb_size - 1;
+
+	*start = fb_start;
+	*end = fb_end;
+
+	return true;
+}
+
+/*
+ * Identify the PCI VGA device that contains the firmware framebuffer
+ */
+static void pci_boot_vga_capturer(struct pci_dev *pdev)
+{
+	u64 fb_start, fb_end;
+	struct resource *res;
+	unsigned int i;
+
+	if (pdev_boot_vga)
+		return;
+
+	if (!vga_arb_get_firmware_fb_range(&fb_start, &fb_end))
+		return;
+
+	pci_dev_for_each_resource(pdev, res, i) {
+		if (resource_type(res) != IORESOURCE_MEM)
+			continue;
+
+		if (!res->start || !res->end)
+			continue;
+
+		if (res->start <= fb_start && fb_end <= res->end) {
+			pdev_boot_vga = pdev;
+
+			vgaarb_info(&pdev->dev,
+				    "BAR %u: %pR contains firmware FB [0x%llx-0x%llx]\n",
+				    i, res, fb_start, fb_end);
+			break;
+		}
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
+			       8, pci_boot_vga_capturer);
-- 
2.34.1

