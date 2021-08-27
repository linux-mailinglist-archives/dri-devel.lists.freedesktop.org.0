Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AA3F962E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDBC6E8F2;
	Fri, 27 Aug 2021 08:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC56E8F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:33:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DD0E60F4F;
 Fri, 27 Aug 2021 08:33:46 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>
Subject: [PATCH V4 03/10] PCI/VGA: Use unsigned format string to print lock
 counts
Date: Fri, 27 Aug 2021 16:31:22 +0800
Message-Id: <20210827083129.2781420-4-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210827083129.2781420-1-chenhuacai@loongson.cn>
References: <20210827083129.2781420-1-chenhuacai@loongson.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

In struct vga_device, io_lock_cnt and mem_lock_cnt are unsigned, but we
previously printed them with "%d", the signed decimal format.  Print them
with the unsigned format "%u" instead.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 61b57abcb014..e4153ab70481 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1022,7 +1022,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 
 	/* Fill the buffer with infos */
 	len = snprintf(lbuf, 1024,
-		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%d:%d)\n",
+		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%u:%u)\n",
 		       vga_decode_count, pci_name(pdev),
 		       vga_iostate_to_str(vgadev->decodes),
 		       vga_iostate_to_str(vgadev->owns),
-- 
2.27.0

