Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562186E048
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F1810ECA7;
	Fri,  1 Mar 2024 11:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wh9JcPhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2910EC63
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709292617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCFPJagLzKx22WqKKTHp8qRZXi4Io4yhhz4S1+ryYYo=;
 b=Wh9JcPhNTzCFP9pNwPqtUn09eIAC5ZAPHrX1/hLfdDlEPtVG1WLaz58cUjbE7+725O3QfV
 YiMjiREbFTBU1uMTaZ/oedlLsed6OdT1chPPiTR02uphKaqOYN2KbTtt7RC+9oNU28EmxP
 ZmoYfPei4bFOIFRyIfY35wb+I/ZoepY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-_E_89nDaPMaBSrJXkUwgPA-1; Fri, 01 Mar 2024 06:30:15 -0500
X-MC-Unique: _E_89nDaPMaBSrJXkUwgPA-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-7dadf2f724aso245890241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709292614; x=1709897414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCFPJagLzKx22WqKKTHp8qRZXi4Io4yhhz4S1+ryYYo=;
 b=FMGS+4JQtEwQ4bOWjl1zuP+csAlTbzeZYUuN5LXIBSkSoimpqkf/0rDE/Pnrs24a6y
 CTzWWIrqqVh74eqaotxs/RE7IBn9VY80xfLYvHmsI2rdou3JO+nKSrVl4mMXRuYdPoAk
 SQSzwIO+CRAU6MFYa+JLA9Pjl9vhDQMrKE/eU+ziH9yNq5ba52CtQgBKYboZ02exL6UF
 gRE+SV4nWRmH4uW4tH8j8aXn+fM5jK7dgfPJ3LKUgendsDgXOaaH5NZ6hgw4UU3/CXXQ
 /VokUMt5SypMhdK3A7ntzMZx93EfINvnEtZQFnuFA1HsGncbOL4rl4o8RaYJgrr8qNie
 tM8g==
X-Gm-Message-State: AOJu0Yxt/V4Anum6wB9G6y6/FComckLm62D+TNkb0qAdj8uC74JahiEQ
 cGFXWMePKs7tA2ezMo6qkDA4QWYpcqu5wZCdZeQ2wD+kVHtM1z3VZ1WymyMluZ4X+wETeolVq4F
 V1B+B6d9nELQZr2gDZAXmcwF7i2iQKxdC8IynJ2gUsLNDiKwzpF36y2c4by4Hm2EjYg==
X-Received: by 2002:a05:6102:2a44:b0:472:60f4:b7e4 with SMTP id
 gt4-20020a0561022a4400b0047260f4b7e4mr691227vsb.2.1709292614341; 
 Fri, 01 Mar 2024 03:30:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ7tKzLQCVB9hTcVQJKnS8XGfAFUDMaRaJoN7pDCO81UnZvPFYgOSVp0LUiPtRvfviivVwUA==
X-Received: by 2002:a05:6102:2a44:b0:472:60f4:b7e4 with SMTP id
 gt4-20020a0561022a4400b0047260f4b7e4mr691204vsb.2.1709292613769; 
 Fri, 01 Mar 2024 03:30:13 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac86781000000b0042eb46d15bbsm1596239qtp.88.2024.03.01.03.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:30:13 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v4 02/10] PCI: Deprecate iomap-table functions
Date: Fri,  1 Mar 2024 12:29:50 +0100
Message-ID: <20240301112959.21947-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301112959.21947-1-pstanner@redhat.com>
References: <20240301112959.21947-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The old plural devres functions tie the PCI devres API to the
iomap-table mechanism which unfortunately is not extensible.

As the plural functions are almost never used with more than one bit set
in their bit-mask, deprecating them and encouraging users to use the new
singular functions instead is reasonable.

Furthermore, to make the implementation more consistent and extensible,
the plural functions should use the singular functions.

Add new wrapper to request / release all BARs.
Make the plural functions call into the singular functions.
Mark the plural functions as deprecated.
Remove as much of the iomap-table-mechanism as possible.
Add comments describing the path towards a cleaned-up API.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 374 +++++++++++++++++++++++++++++++++----------
 drivers/pci/pci.c    |  20 +++
 drivers/pci/pci.h    |   5 +
 include/linux/pci.h  |   2 +
 4 files changed, 318 insertions(+), 83 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 6a653e1a1acb..bc31e3a8cc04 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -4,15 +4,43 @@
 #include "pci.h"
 
 /*
- * PCI iomap devres
+ * On the state of PCI's devres implementation:
+ *
+ * The older devres API for PCI has two significant problems:
+ *
+ * 1. It is very strongly tied to the statically allocated mapping table in
+ *    struct pcim_iomap_devres below. This is mostly solved in the sense of the
+ *    pcim_ functions in this file providing things like ranged mapping by
+ *    bypassing this table, wheras the functions that were present in the old
+ *    API still enter the mapping addresses into the table for users of the old
+ *    API.
+ * 2. The region-request-functions in pci.c do become managed IF the device has
+ *    been enabled with pcim_enable_device() instead of pci_enable_device().
+ *    This resulted in the API becoming inconsistent: Some functions have an
+ *    obviously managed counter-part (e.g., pci_iomap() <-> pcim_iomap()),
+ *    whereas some don't and are never managed, while others don't and are
+ *    _sometimes_ managed (e.g. pci_request_region()).
+ *    Consequently, in the new API, region requests performed by the pcim_
+ *    functions are automatically cleaned up through the devres callback
+ *    pcim_addr_resource_release(), while requests performed by
+ *    pcim_enable_device() + pci_*region*() are automatically cleaned up
+ *    through the for-loop in pcim_release().
+ *
+ * TODO 1:
+ * Remove the legacy table entirely once all calls to pcim_iomap_table() in
+ * the kernel have been removed.
+ *
+ * TODO 2:
+ * Port everyone calling pcim_enable_device() + pci_*region*() to using the
+ * pcim_ functions. Then, remove all devres functionality from pci_*region*()
+ * functions and remove the associated cleanups described above in point #2.
  */
-#define PCIM_IOMAP_MAX	PCI_STD_NUM_BARS
 
 /*
  * Legacy struct storing addresses to whole mapped BARs.
  */
 struct pcim_iomap_devres {
-	void __iomem *table[PCIM_IOMAP_MAX];
+	void __iomem *table[PCI_STD_NUM_BARS];
 };
 
 enum pcim_addr_devres_type {
@@ -373,6 +401,16 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_devres *this = res;
 	int i;
 
+	/*
+	 * This is legacy code.
+	 * All regions requested by a pcim_ function do get released through
+	 * pcim_addr_resource_release(). Thanks to the hybrid nature of the pci_
+	 * region-request functions, this for-loop has to release the regions
+	 * if they have been requested by such a function.
+	 *
+	 * TODO: Remove this once all users of pcim_enable_device() PLUS
+	 * pci-region-request-functions have been ported to pcim_ functions.
+	 */
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (this->region_mask & (1 << i))
 			pci_release_region(dev, i);
@@ -459,19 +497,21 @@ EXPORT_SYMBOL(pcim_pin_device);
 
 static void pcim_iomap_release(struct device *gendev, void *res)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-	struct pcim_iomap_devres *this = res;
-	int i;
-
-	for (i = 0; i < PCIM_IOMAP_MAX; i++)
-		if (this->table[i])
-			pci_iounmap(dev, this->table[i]);
+	/*
+	 * Do nothing. This is legacy code.
+	 *
+	 * Cleanup of the mappings is now done directly through the callbacks
+	 * registered when creating them.
+	 */
 }
 
 /**
- * pcim_iomap_table - access iomap allocation table
+ * pcim_iomap_table - access iomap allocation table (DEPRECATED)
  * @pdev: PCI device to access iomap table for
  *
+ * Returns:
+ * Const pointer to array of __iomem pointers on success NULL on failure.
+ *
  * Access iomap allocation table for @dev.  If iomap table doesn't
  * exist and @pdev is managed, it will be allocated.  All iomaps
  * recorded in the iomap table are automatically unmapped on driver
@@ -480,6 +520,11 @@ static void pcim_iomap_release(struct device *gendev, void *res)
  * This function might sleep when the table is first allocated but can
  * be safely called without context and guaranteed to succeed once
  * allocated.
+ *
+ * This function is DEPRECATED. Do not use it in new code.
+ * Instead, obtain a mapping's address directly from one of the pcim_* mapping
+ * functions. For example:
+ * void __iomem *mappy = pcim_iomap(pdev, barnr, length);
  */
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 {
@@ -498,27 +543,114 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_iomap_table);
 
+/*
+ * Fill the legacy mapping-table, so that drivers using the old API
+ * can still get a BAR's mapping address through pcim_iomap_table().
+ */
+static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
+		 void __iomem *mapping, short bar)
+{
+	void __iomem **legacy_iomap_table;
+
+	if (bar >= PCI_STD_NUM_BARS)
+		return -EINVAL;
+
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	if (!legacy_iomap_table)
+		return -ENOMEM;
+
+	/* The legacy mechanism doesn't allow for duplicate mappings. */
+	WARN_ON(legacy_iomap_table[bar]);
+
+	legacy_iomap_table[bar] = mapping;
+
+	return 0;
+}
+
+/*
+ * Removes a mapping. The table only contains whole-bar-mappings, so this will
+ * never interfere with ranged mappings.
+ */
+static void pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
+		void __iomem *addr)
+{
+	short bar;
+	void __iomem **legacy_iomap_table;
+
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	if (!legacy_iomap_table)
+		return;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (legacy_iomap_table[bar] == addr) {
+			legacy_iomap_table[bar] = NULL;
+			return;
+		}
+	}
+}
+
+/*
+ * The same as pcim_remove_mapping_from_legacy_table(), but identifies the
+ * mapping by its BAR index.
+ */
+static void pcim_remove_bar_from_legacy_table(struct pci_dev *pdev, short bar)
+{
+	void __iomem **legacy_iomap_table;
+
+	if (bar >= PCI_STD_NUM_BARS)
+		return;
+
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	if (!legacy_iomap_table)
+		return;
+
+	legacy_iomap_table[bar] = NULL;
+}
+
 /**
  * pcim_iomap - Managed pcim_iomap()
  * @pdev: PCI device to iomap for
  * @bar: BAR to iomap
  * @maxlen: Maximum length of iomap
  *
- * Managed pci_iomap().  Map is automatically unmapped on driver
- * detach.
+ * Returns: __iomem pointer on success, NULL on failure.
+ *
+ * Managed pci_iomap(). Map is automatically unmapped on driver detach. If
+ * desired, unmap manually only with pcim_iounmap().
+ *
+ * This SHOULD only be used once per BAR.
+ *
+ * NOTE:
+ * Contrary to the other pcim_* functions, this function does not return an
+ * IOMEM_ERR_PTR() on failure, but a simple NULL. This is done for backwards
+ * compatibility.
  */
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen)
 {
-	void __iomem **tbl;
-
-	BUG_ON(bar >= PCIM_IOMAP_MAX);
+	void __iomem *mapping;
+	struct pcim_addr_devres *res;
 
-	tbl = (void __iomem **)pcim_iomap_table(pdev);
-	if (!tbl || tbl[bar])	/* duplicate mappings not allowed */
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
 		return NULL;
+	res->type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
+
+	mapping = pci_iomap(pdev, bar, maxlen);
+	if (!mapping)
+		goto err_iomap;
+	res->baseaddr = mapping;
+
+	if (pcim_add_mapping_to_legacy_table(pdev, mapping, bar) != 0)
+		goto err_table;
 
-	tbl[bar] = pci_iomap(pdev, bar, maxlen);
-	return tbl[bar];
+	devres_add(&pdev->dev, res);
+	return mapping;
+
+err_table:
+	pci_iounmap(pdev, mapping);
+err_iomap:
+	pcim_addr_devres_free(res);
+	return NULL;
 }
 EXPORT_SYMBOL(pcim_iomap);
 
@@ -527,23 +659,24 @@ EXPORT_SYMBOL(pcim_iomap);
  * @pdev: PCI device to iounmap for
  * @addr: Address to unmap
  *
- * Managed pci_iounmap().  @addr must have been mapped using pcim_iomap().
+ * Managed pci_iounmap(). @addr must have been mapped using pcim_iomap() or
+ * pcim_iomap_range().
  */
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
 {
-	void __iomem **tbl;
-	int i;
+	struct pcim_addr_devres res_searched;
 
-	pci_iounmap(pdev, addr);
+	pcim_addr_devres_clear(&res_searched);
+	res_searched.type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
+	res_searched.baseaddr = addr;
 
-	tbl = (void __iomem **)pcim_iomap_table(pdev);
-	BUG_ON(!tbl);
+	if (devres_release(&pdev->dev, pcim_addr_resource_release,
+			pcim_addr_resources_match, &res_searched) != 0) {
+		/* Doesn't exist. User passed nonsense. */
+		return;
+	}
 
-	for (i = 0; i < PCIM_IOMAP_MAX; i++)
-		if (tbl[i] == addr) {
-			tbl[i] = NULL;
-			return;
-		}
+	pcim_remove_mapping_from_legacy_table(pdev, addr);
 }
 EXPORT_SYMBOL(pcim_iounmap);
 
@@ -613,106 +746,181 @@ void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 }
 EXPORT_SYMBOL(pcim_iounmap_region);
 
+static inline bool mask_contains_bar(int mask, int bar)
+{
+	return mask & BIT(bar);
+}
+
 /**
- * pcim_iomap_regions - Request and iomap PCI BARs
+ * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to request and iomap
  * @name: Name associated with the requests
  *
+ * Returns: 0 on success, negative error code on failure.
+ *
  * Request and iomap regions specified by @mask.
+ *
+ * This function is DEPRECATED. Don't use it in new code.
+ * Use pcim_iomap_region() instead.
  */
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 {
-	void __iomem * const *iomap;
-	int i, rc;
+	int ret;
+	short bar;
+	void __iomem *mapping;
 
-	iomap = pcim_iomap_table(pdev);
-	if (!iomap)
-		return -ENOMEM;
+	for (bar = 0; bar < DEVICE_COUNT_RESOURCE; bar++) {
+		if (!mask_contains_bar(mask, bar))
+			continue;
 
-	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
-		unsigned long len;
+		mapping = pcim_iomap_region(pdev, bar, name);
+		if (IS_ERR(mapping)) {
+			ret = PTR_ERR(mapping);
+			goto err;
+		}
+		ret = pcim_add_mapping_to_legacy_table(pdev, mapping, bar);
+		if (ret != 0)
+			goto err;
+	}
 
-		if (!(mask & (1 << i)))
-			continue;
+	return 0;
 
-		rc = -EINVAL;
-		len = pci_resource_len(pdev, i);
-		if (!len)
-			goto err_inval;
+err:
+	while (--bar >= 0) {
+		pcim_iounmap_region(pdev, bar);
+		pcim_remove_bar_from_legacy_table(pdev, bar);
+	}
 
-		rc = pci_request_region(pdev, i, name);
-		if (rc)
-			goto err_inval;
+	return ret;
+}
+EXPORT_SYMBOL(pcim_iomap_regions);
 
-		rc = -ENOMEM;
-		if (!pcim_iomap(pdev, i, 0))
-			goto err_region;
+/**
+ * pcim_release_all_regions - Release all regions of a PCI-device
+ * @pdev: the PCI device
+ *
+ * Will release all regions previously requested through pcim_request_region()
+ * or pcim_request_all_regions().
+ *
+ * Can be called from any context, i.e., not necessarily as a counterpart to
+ * pcim_request_all_regions().
+ */
+void pcim_release_all_regions(struct pci_dev *pdev)
+{
+	short bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
+		pcim_release_region(pdev, bar);
+}
+EXPORT_SYMBOL(pcim_release_all_regions);
+
+/**
+ * pcim_request_all_regions - Request all regions
+ * @pdev: PCI device to map IO resources for
+ * @name: name associated with the request
+ *
+ * Returns: 0 on success, negative error code on failure.
+ *
+ * Requested regions will automatically be released at driver detach. If desired,
+ * release individual regions with pcim_release_region() or all of them at once
+ * with pcim_release_all_regions().
+ */
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
+{
+	int ret;
+	short bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		ret = pcim_request_region(pdev, bar, name);
+		if (ret != 0)
+			goto err;
 	}
 
 	return 0;
 
- err_region:
-	pci_release_region(pdev, i);
- err_inval:
-	while (--i >= 0) {
-		if (!(mask & (1 << i)))
-			continue;
-		pcim_iounmap(pdev, iomap[i]);
-		pci_release_region(pdev, i);
-	}
+err:
+	pcim_release_all_regions(pdev);
 
-	return rc;
+	return ret;
 }
-EXPORT_SYMBOL(pcim_iomap_regions);
+EXPORT_SYMBOL(pcim_request_all_regions);
 
 /**
- * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
+ * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones (DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
  * @name: Name associated with the requests
  *
+ * Returns: 0 on success, negative error code on failure.
+ *
  * Request all PCI BARs and iomap regions specified by @mask.
+ *
+ * To release these resources manually, call pcim_release_region() for the
+ * regions and pcim_iounmap() for the mappings.
+ *
+ * This function is DEPRECATED. Don't use it in new code.
+ * Use pcim_request_all_regions() + pcim_iomap*() instead.
  */
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name)
 {
-	int request_mask = ((1 << 6) - 1) & ~mask;
-	int rc;
+	short bar;
+	int ret;
+	void __iomem **legacy_iomap_table;
+
+	ret = pcim_request_all_regions(pdev, name);
+	if (ret != 0)
+		return ret;
 
-	rc = pci_request_selected_regions(pdev, request_mask, name);
-	if (rc)
-		return rc;
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!mask_contains_bar(mask, bar))
+			continue;
+		if (!pcim_iomap(pdev, bar, 0))
+			goto err;
+	}
 
-	rc = pcim_iomap_regions(pdev, mask, name);
-	if (rc)
-		pci_release_selected_regions(pdev, request_mask);
-	return rc;
+	return 0;
+
+err:
+	/*
+	 * Here it gets tricky: pcim_iomap() above has most likely
+	 * failed because it got an OOM when trying to create the
+	 * legacy-table.
+	 * We check here if that has happened. If not, pcim_iomap()
+	 * must have failed because of EINVAL.
+	 */
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	ret = legacy_iomap_table ? -EINVAL : -ENOMEM;
+
+	while (--bar >= 0)
+		pcim_iounmap(pdev, legacy_iomap_table[bar]);
+
+	pcim_release_all_regions(pdev);
+
+	return ret;
 }
 EXPORT_SYMBOL(pcim_iomap_regions_request_all);
 
 /**
- * pcim_iounmap_regions - Unmap and release PCI BARs
+ * pcim_iounmap_regions - Unmap and release PCI BARs (DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to unmap and release
  *
  * Unmap and release regions specified by @mask.
+ *
+ * This function is DEPRECATED. Don't use it in new code.
  */
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 {
-	void __iomem * const *iomap;
-	int i;
-
-	iomap = pcim_iomap_table(pdev);
-	if (!iomap)
-		return;
+	short bar;
 
-	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
-		if (!(mask & (1 << i)))
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!mask_contains_bar(mask, bar))
 			continue;
 
-		pcim_iounmap(pdev, iomap[i]);
-		pci_release_region(pdev, i);
+		pcim_iounmap_region(pdev, bar);
+		pcim_remove_bar_from_legacy_table(pdev, bar);
 	}
 }
 EXPORT_SYMBOL(pcim_iounmap_regions);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index cfc5b84dc9c9..e01e316de1c3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3864,6 +3864,16 @@ void pci_release_region(struct pci_dev *pdev, int bar)
 		release_mem_region(pci_resource_start(pdev, bar),
 				pci_resource_len(pdev, bar));
 
+	/*
+	 * This devres utility makes this function sometimes managed
+	 * (when pcim_enable_device() has been called before).
+	 * This is bad because it conflicts with the pcim_ functions being
+	 * exclusively responsible for managed pci. Its "sometimes yes, sometimes
+	 * no" nature can cause bugs.
+	 *
+	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
+	 * a region request function have been ported to using pcim_ functions.
+	 */
 	dr = find_pci_dr(pdev);
 	if (dr)
 		dr->region_mask &= ~(1 << bar);
@@ -3908,6 +3918,16 @@ static int __pci_request_region(struct pci_dev *pdev, int bar,
 			goto err_out;
 	}
 
+	/*
+	 * This devres utility makes this function sometimes managed
+	 * (when pcim_enable_device() has been called before).
+	 * This is bad because it conflicts with the pcim_ functions being
+	 * exclusively responsible for managed pci. Its "sometimes yes, sometimes
+	 * no" nature can cause bugs.
+	 *
+	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
+	 * a region request function have been ported to using pcim_ functions.
+	 */
 	dr = find_pci_dr(pdev);
 	if (dr)
 		dr->region_mask |= 1 << bar;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b217e74966eb..9d334bf4cbc4 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -830,6 +830,11 @@ struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
+
+	/*
+	 * TODO: remove the region_mask once everyone calling
+	 * pcim_enable_device() + pci_*region*() is ported to pcim_ functions.
+	 */
 	u32 region_mask;
 };
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 764aef7023e8..5d134e833546 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2331,6 +2331,8 @@ int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *res_name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
+void pcim_release_all_regions(struct pci_dev *pdev);
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
 				unsigned long offset, unsigned long len);
 void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int bar,
-- 
2.43.0

