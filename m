Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC878D584
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5128110E4FA;
	Wed, 30 Aug 2023 11:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-242.mta0.migadu.com (out-242.mta0.migadu.com
 [91.218.175.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E740A10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:24:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693394144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLVdHbG85+44P7qsiRYYVxfolXMOcHBsopMctAcePck=;
 b=J59qCFT0OBGdEmbDi4JY96Y0g2lOm/hwpx206PWQver8wN02CSpISQoonof/5wEaRuSTR5
 ouCPVB3GdJM3Uyt4LGtJGwvB4wkGB4hupMSzjpaR//dtI0uBmIqZbmOBuyKnZ/kB5JxLUi
 kgv1cwNYtl3n58wormShqGG2v91FWKM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [-next 1/5] PCI: Add the pci_is_vga() helper
Date: Wed, 30 Aug 2023 19:15:28 +0800
Message-Id: <20230830111532.444535-2-sui.jingfeng@linux.dev>
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

The PCI code and ID assignment specification defined four types of
display controllers for the display base class(03h), and the devices
with 0x00h sub-class code are VGA devices. VGA devices with programming
interface 0x00 is VGA-compatible, VGA devices with programming interface
0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
is defined to provide backward compatibility for devices that were built
before the class code field was defined. Hence, introduce the pci_is_vga()
helper, let it handle the details for us. It returns true if the PCI(e)
device being tested belongs to the VGA devices category.

Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 include/linux/pci.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cf6e0b057752..ace727001911 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -713,6 +713,33 @@ static inline bool pci_is_bridge(struct pci_dev *dev)
 		dev->hdr_type == PCI_HEADER_TYPE_CARDBUS;
 }
 
+/**
+ * The PCI code and ID assignment specification defined four types of
+ * display controllers for the display base class(03h), and the devices
+ * with 0x00h sub-class code are VGA devices. VGA devices with programming
+ * interface 0x00 is VGA-compatible, VGA devices with programming interface
+ * 0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
+ * is defined to provide backward compatibility for devices that were built
+ * before the class code field was defined. This means that it belong to the
+ * VGA devices category also.
+ *
+ * Returns:
+ * true if the PCI device is a VGA device, false otherwise.
+ */
+static inline bool pci_is_vga(struct pci_dev *pdev)
+{
+	if (!pdev)
+		return false;
+
+	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
+		return true;
+
+	if ((pdev->class >> 8) == PCI_CLASS_NOT_DEFINED_VGA)
+		return true;
+
+	return false;
+}
+
 #define for_each_pci_bridge(dev, bus)				\
 	list_for_each_entry(dev, &bus->devices, bus_list)	\
 		if (!pci_is_bridge(dev)) {} else
-- 
2.34.1

