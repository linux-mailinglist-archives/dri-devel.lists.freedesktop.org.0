Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCE787FCF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4583310E602;
	Fri, 25 Aug 2023 06:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-54.mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A3310E109
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:27:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692944848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHmggkPoB6PVkfuQyqjiEi6pSxLj7NQb/O/moIUqI3Q=;
 b=gGlORSRXYl4gFoXXTmBWXlDv9M59x4zb6DH/yv9Me/t4nLyEdmV9ka2HJBT95q/hEQ5/qp
 o3h5Y41uekJhozAijzpufcmcPJKQeg9tw+djHsg1V7nZ/b88TT009/f84nAk9E2roApfBk
 Gc+swNB9ZjDJuDdVymWrbVncDrt8mN0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/5] PCI: Add the pci_get_base_class() helper
Date: Fri, 25 Aug 2023 14:27:10 +0800
Message-Id: <20230825062714.6325-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
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
Cc: alsa-devel@alsa-project.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is no function that can be used to get all PCI(e) devices in a
system by matching against its the PCI base class code only, while keep
the sub-class code and the programming interface ignored. Therefore, add
the pci_get_base_class() function to suit the need.

For example, if an application want to process all PCI(e) display devices
in a system, it can achieve such goal by writing the code as following:

pdev = NULL;
do {
    pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
    if (!pdev)
        break;

    do_something_for_pci_display_device(pdev);
} while (1);

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/search.c | 31 +++++++++++++++++++++++++++++++
 include/linux/pci.h  |  5 +++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index b4c138a6ec02..53840634fbfc 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -363,6 +363,37 @@ struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from)
 }
 EXPORT_SYMBOL(pci_get_class);
 
+/**
+ * pci_get_base_class - searching for a PCI device by matching against the base class code only
+ * @class: search for a PCI device with this base class code
+ * @from: Previous PCI device found in search, or %NULL for new search.
+ *
+ * Iterates through the list of known PCI devices. If a PCI device is found
+ * with a matching base class code, the reference count to the device is
+ * incremented. See pci_match_one_device() to figure out how does this works.
+ * A new search is initiated by passing %NULL as the @from argument.
+ * Otherwise if @from is not %NULL, searches continue from next device on the
+ * global list. The reference count for @from is always decremented if it is
+ * not %NULL.
+ *
+ * Returns:
+ * A pointer to a matched PCI device, %NULL Otherwise.
+ */
+struct pci_dev *pci_get_base_class(unsigned int class, struct pci_dev *from)
+{
+	struct pci_device_id id = {
+		.vendor = PCI_ANY_ID,
+		.device = PCI_ANY_ID,
+		.subvendor = PCI_ANY_ID,
+		.subdevice = PCI_ANY_ID,
+		.class_mask = 0xFF0000,
+		.class = class << 16,
+	};
+
+	return pci_get_dev_by_id(&id, from);
+}
+EXPORT_SYMBOL(pci_get_base_class);
+
 /**
  * pci_dev_present - Returns 1 if device matching the device list is present, 0 if not.
  * @ids: A pointer to a null terminated list of struct pci_device_id structures
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 71c85380676c..486ad959e1f9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1180,6 +1180,8 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus, unsigned int devfn);
 struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
 					    unsigned int devfn);
 struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
+struct pci_dev *pci_get_base_class(unsigned int class, struct pci_dev *from);
+
 int pci_dev_present(const struct pci_device_id *ids);
 
 int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
@@ -1896,6 +1898,9 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
 					    struct pci_dev *from)
 { return NULL; }
 
+static inline struct pci_dev *pci_get_base_class(unsigned int class,
+						 struct pci_dev *from)
+{ return NULL; }
 
 static inline int pci_dev_present(const struct pci_device_id *ids)
 { return 0; }
-- 
2.34.1

