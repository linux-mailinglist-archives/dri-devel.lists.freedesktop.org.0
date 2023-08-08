Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A946774E53
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F5A10E209;
	Tue,  8 Aug 2023 22:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-120.mta1.migadu.com (out-120.mta1.migadu.com
 [IPv6:2001:41d0:203:375::78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E910E208
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkFV97CQa3g6DrhggAXuzog1hzg5W10mASK1ByxDhpo=;
 b=PHfyGfjJY9Ur7O6u9zSuqLtFOfBXyBXUUFDLn09wdIeOTXwBdqdeMkEVbAfYkp+pfrdwJh
 D5tcQm5d30zgqXzASPmeEsy3pgGMANJ4IzoPHXwSO2Y+GD73xe/yMnpf71ZJqNKtBbj1lo
 lXO2AMWaiQes21PRybH44bgkLzjtuk4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 02/11] PCI: Add the pci_get_class_masked() helper
Date: Wed,  9 Aug 2023 06:34:03 +0800
Message-Id: <20230808223412.1743176-3-sui.jingfeng@linux.dev>
In-Reply-To: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
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
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because there is no good way to get the mask member used to searching for
devices that conform to a specific PCI class code, an application needs to
process all PCI display devices can achieve its goal as follows:

pdev = NULL;
do {
	pdev = pci_get_class_masked(PCI_BASE_CLASS_DISPLAY << 16, 0xFF0000, pdev);
	if (pdev)
		do_something_for_pci_display_device(pdev);
} while (pdev);

While previously, we just can not ignore Sub-Class code and the Programming
Interface byte when do the searching.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/search.c | 30 ++++++++++++++++++++++++++++++
 include/linux/pci.h  |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index b4c138a6ec02..f1c15aea868b 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -334,6 +334,36 @@ struct pci_dev *pci_get_device(unsigned int vendor, unsigned int device,
 }
 EXPORT_SYMBOL(pci_get_device);
 
+/**
+ * pci_get_class_masked - begin or continue searching for a PCI device by class and mask
+ * @class: search for a PCI device with this class designation
+ * @from: Previous PCI device found in search, or %NULL for new search.
+ *
+ * Iterates through the list of known PCI devices.  If a PCI device is
+ * found with a matching @class, the reference count to the device is
+ * incremented and a pointer to its device structure is returned.
+ * Otherwise, %NULL is returned.
+ * A new search is initiated by passing %NULL as the @from argument.
+ * Otherwise if @from is not %NULL, searches continue from next device
+ * on the global list.  The reference count for @from is always decremented
+ * if it is not %NULL.
+ */
+struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
+				     struct pci_dev *from)
+{
+	struct pci_device_id id = {
+		.vendor = PCI_ANY_ID,
+		.device = PCI_ANY_ID,
+		.subvendor = PCI_ANY_ID,
+		.subdevice = PCI_ANY_ID,
+		.class_mask = mask,
+		.class = class,
+	};
+
+	return pci_get_dev_by_id(&id, from);
+}
+EXPORT_SYMBOL(pci_get_class_masked);
+
 /**
  * pci_get_class - begin or continue searching for a PCI device by class
  * @class: search for a PCI device with this class designation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0ff7500772e6..b20e7ba844bf 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1180,6 +1180,9 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus, unsigned int devfn);
 struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
 					    unsigned int devfn);
 struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
+struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int mask,
+				     struct pci_dev *from);
+
 int pci_dev_present(const struct pci_device_id *ids);
 
 int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
@@ -1895,6 +1898,10 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
 					    struct pci_dev *from)
 { return NULL; }
 
+static inline struct pci_dev *pci_get_class_masked(unsigned int class,
+						   unsigned int mask,
+						   struct pci_dev *from)
+{ return NULL; }
 
 static inline int pci_dev_present(const struct pci_device_id *ids)
 { return 0; }
-- 
2.34.1

