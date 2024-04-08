Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9389BA8E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26131122B8;
	Mon,  8 Apr 2024 08:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Eug9FUJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4D91122B1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712565875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDZi8OyO2ki9S6Zh60QzK63dKBZTZry9vjBIilxrucg=;
 b=Eug9FUJTZcNxqfi/U6xoJJwVmVFUBtgTi1AoWf9C+aDFhuaOZSkllZaOyUqx2DRWtDREWT
 1wAUBl/qWDojyYrIdRRL0rWMRqJlxmKKJArnbFvm5jflm8SFnR7U62eBXGu6RxuX+jU1wS
 RpqMQOwbpVpapvS/kJ4IOYE3IaTJos8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-EghyqSKEMW6oQ34XF-vnAA-1; Mon, 08 Apr 2024 04:44:34 -0400
X-MC-Unique: EghyqSKEMW6oQ34XF-vnAA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78a5e62931cso55267885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565873; x=1713170673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDZi8OyO2ki9S6Zh60QzK63dKBZTZry9vjBIilxrucg=;
 b=k8vHmWlCgT2q2+kyOyXo0Kw/8CFvmNQSIMtd+9R0vKB4B+WPlKPHitGHUd6TOhPM9m
 LZYJ+CQmdJkCDCjImPd3x5+QrnsP6+dolOnUW9u7DjmpNPbvgoN6E921+rW2nd2wnS2A
 OdwjFswjz/Cuje/bN1w6ySwsY2M4G4aw0TAHzmew1N64AjcMeR9neeBXKYKIGn2+5vPR
 ZUQUdHo8uOcqKUn65OkOc2us2bm41TcrZht9FtXsEMdN3EpqNMPjuAn+O6fU54qfJnhB
 gpZE+zRfD+s0CBuPjMbyaqhcyNMJB822D4pp0r6SSOTJn3OU72SE8h4xHP4avUx+OCcU
 4Xrw==
X-Gm-Message-State: AOJu0Yw/I9M77ZPar86174sot0KTbVjVsqUkeyvXjMT1FDcUS/nYhXhc
 XGE6FzNch2xNF1j99hh/kqzw4vCJ25iQTHnMPq06JLAHO/SqzvZqu2flS/et3e1VNobpiJPB8g1
 4uwQ5z1FGWT7ALWcDy9kFzUhEcbCppbfczqJhS+U9gl5Nd99aZdVwUCSS+cpB+W8igA==
X-Received: by 2002:a05:620a:1793:b0:78d:67a6:4f34 with SMTP id
 ay19-20020a05620a179300b0078d67a64f34mr1448785qkb.2.1712565873080; 
 Mon, 08 Apr 2024 01:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWgL9knBfa1ppaRo/MWzGcZu9JjIrTt+jY6ko23oRvZvI1kI+Me4Evyvhh8oQZaO4qNZqApQ==
X-Received: by 2002:a05:620a:1793:b0:78d:67a6:4f34 with SMTP id
 ay19-20020a05620a179300b0078d67a64f34mr1448774qkb.2.1712565872646; 
 Mon, 08 Apr 2024 01:44:32 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 oo15-20020a05620a530f00b0078d54e39f6csm2036989qkn.23.2024.04.08.01.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:44:32 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v6 02/10] PCI: Deprecate iomap-table functions
Date: Mon,  8 Apr 2024 10:44:14 +0200
Message-ID: <20240408084423.6697-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408084423.6697-1-pstanner@redhat.com>
References: <20240408084423.6697-1-pstanner@redhat.com>
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
 drivers/pci/devres.c | 372 +++++++++++++++++++++++++++++++++----------
 drivers/pci/pci.c    |  20 +++
 drivers/pci/pci.h    |   5 +
 include/linux/pci.h  |   2 +
 4 files changed, 316 insertions(+), 83 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 6a653e1a1acb..bd24bad187d9 100644
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
 
@@ -613,106 +746,179 @@ void pcim_iounmap_region(struct pci_dev *pdev, int bar)
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
+	 * If bar is larger than 0, then pcim_iomap() above has most likely
+	 * failed because of -EINVAL. If it is equal 0, most likely the table
+	 * couldn't be created, indicating -ENOMEM.
+	 */
+	ret = bar > 0 ? -EINVAL : -ENOMEM;
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
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
index e5f243dd4288..b5d21d8207d6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3880,6 +3880,16 @@ void pci_release_region(struct pci_dev *pdev, int bar)
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
@@ -3924,6 +3934,16 @@ static int __pci_request_region(struct pci_dev *pdev, int bar,
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
index 17fed1846847..171884aba8e1 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -828,6 +828,11 @@ struct pci_devres {
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
index e7df30e620c7..5782ad034178 100644
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
2.44.0

