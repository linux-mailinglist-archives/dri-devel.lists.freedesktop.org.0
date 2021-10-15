Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A08B42E992
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAA06ECE4;
	Fri, 15 Oct 2021 07:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45436ECE4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:00:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A83706108B;
 Fri, 15 Oct 2021 07:00:04 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V7 10/11] PCI/VGA: Use unsigned format string to print lock
 counts
Date: Fri, 15 Oct 2021 14:58:43 +0800
Message-Id: <20211015065844.2957617-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211015065844.2957617-1-chenhuacai@loongson.cn>
References: <20211015061512.2941859-1-chenhuacai@loongson.cn>
 <20211015065844.2957617-1-chenhuacai@loongson.cn>
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
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/vga/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 7f52db439c11..8d07279cb49d 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -1103,7 +1103,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 
 	/* Fill the buffer with infos */
 	len = snprintf(lbuf, 1024,
-		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%d:%d)\n",
+		       "count:%d,PCI:%s,decodes=%s,owns=%s,locks=%s(%u:%u)\n",
 		       vga_decode_count, pci_name(pdev),
 		       vga_iostate_to_str(vgadev->decodes),
 		       vga_iostate_to_str(vgadev->owns),
-- 
2.27.0

