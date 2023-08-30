Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D522C78D580
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70BB10E12C;
	Wed, 30 Aug 2023 11:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-247.mta0.migadu.com (out-247.mta0.migadu.com
 [91.218.175.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D5510E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:24:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693394149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Zg38/yfbHtNqcp81DKpY9eh6KOeHZbhiShVOmvA7V4=;
 b=jv3CuduPEnOmyI8RCuaM2tOrlJYrgKnWrIgY/SGdnDCtIaD1737g7qQZj11M3sQabQuS/T
 Nrx3PYIJaQeoUy4Eri1cT6M1NSRWACUCi8EUJw28uZQTTHIp051FWT1KU2Nxjfory8qhWa
 amSavgZwh8A/3Nlh1prwwA4ytPWkdqQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [-next 3/5] PCI/sysfs: Use pci_is_vga() helper
Date: Wed, 30 Aug 2023 19:15:30 +0800
Message-Id: <20230830111532.444535-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230830111532.444535-1-sui.jingfeng@linux.dev>
References: <20230830111532.444535-1-sui.jingfeng@linux.dev>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Instead of accessing the PCI_CLASS_DISPLAY_VGA and pdev->class directly.
The PCI_CLASS_NOT_DEFINED_VGA is defined to provide backward compatibility
for devices that were built before the class code field was defined. It
should be visiable via sysfs(boot_vga) as the normal VGA-compatible devices.

Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/pci-sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index d9eede2dbc0e..522708938563 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1552,10 +1552,10 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 	struct pci_dev *pdev = to_pci_dev(dev);
 
 	if (a == &dev_attr_boot_vga.attr)
-		if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
-			return 0;
+		if (pci_is_vga(pdev))
+			return a->mode;
 
-	return a->mode;
+	return 0;
 }
 
 static struct attribute *pci_dev_hp_attrs[] = {
-- 
2.34.1

