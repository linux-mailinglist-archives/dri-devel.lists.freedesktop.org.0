Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2056901E37
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7510E3EA;
	Mon, 10 Jun 2024 09:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NTPMinbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E97810E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmJSx7rgddASyMl5reNwBFP1bVpLulSbLJtH1TuMUGc=;
 b=NTPMinbzXTVjDRCaqfxIa3L6m3NFnfrcInhnoHH67Q/igrZvI0mfgiUVKotCBaYJbNsv5w
 FEy4SbGOQ+qeNRAuduQKJr4hMSq/pJ5mCoW3b/7ViDlk6J1G0qA+glD/keZmLV6vFrc9e/
 cmQPmkkdWqcmLHzMYIlth5OONhSaVXA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-XRjDCwhjNJyH6n2cD9nwNQ-1; Mon, 10 Jun 2024 05:32:04 -0400
X-MC-Unique: XRjDCwhjNJyH6n2cD9nwNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4217f4b7355so1940355e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011923; x=1718616723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmJSx7rgddASyMl5reNwBFP1bVpLulSbLJtH1TuMUGc=;
 b=luwwDTrVD8DmnyaxEesQtOWtyrhw7i9Wzb1Pj8QDPkrnJs+OH3uX7NkYAs5nZTZ5mf
 RLi9a6r3jx/5btOm6sZOnjzEJXfnufl0/fM6tsPWeK9f4y1QPkjNPF0mliB7biO/WygM
 WQRP2giUzHIcQMTZ9zD/ErXe3uRnqyWMxt1q/oj6QrdMVeXXd1nnoFy19TS1QkJzo/Ul
 ddg2X4IdeZoLOUxbi9IJHP9iQjbkoWdmXza1pRd8ztbNklemZJkKyrAs1JT8WJ16wXUv
 BZ+4Wn1upE7vhBKlX3ovIUN9aFBE1m3Cqb3jP4kOEfCZEp0rfK5JVIf46OT1RvPejgjC
 /ixQ==
X-Gm-Message-State: AOJu0Yx/wqI4KSA67JW6C/jMWLtgJjGCVB3ePaBKCR6StV8ZBdrb026M
 G4mP9oCg9LYoJyLN5jNzpTYkgocqAvRzs4jNdSxEBLdsWy2RXbLCUjiwMNmaATpS5FYWoTq5QxY
 bgw7k2DGidqBQ4Cah3dHcD5gLc65osLSXfAw7nPdhJkptmKzcYKM4N4HcePZ+s+a9Lw==
X-Received: by 2002:a5d:588e:0:b0:34d:b5d6:fe4b with SMTP id
 ffacd0b85a97d-35efedd2e3emr6479279f8f.4.1718011923296; 
 Mon, 10 Jun 2024 02:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFZ+dzVu/w9la4npo4bAizHSvmjDBY8n1VN8yj/JR9K0tLafmUbMQC7IVGgJtAV8KXMW0tQg==
X-Received: by 2002:a5d:588e:0:b0:34d:b5d6:fe4b with SMTP id
 ffacd0b85a97d-35efedd2e3emr6479261f8f.4.1718011922783; 
 Mon, 10 Jun 2024 02:32:02 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:02 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 03/13] PCI: Reimplement plural devres functions
Date: Mon, 10 Jun 2024 11:31:25 +0200
Message-ID: <20240610093149.20640-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240610093149.20640-1-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
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

When the original PCI devres API was implemented, priority was given to the
creation of a set of "plural functions" such as pcim_request_regions().
These functions have bit masks as parameters to specify which BARs shall
get mapped. Most users, however, only use those to map 1-3 BARs.

A complete set of "singular functions" does not exist.

As functions mapping / requesting multiple BARs at once have (almost) no
mechanism in C to return the resources to the caller of the plural
function, the PCI devres API utilizes the iomap-table administrated by the
function pcim_iomap_table().

The entire PCI devres API was strongly tied to that table which only allows
for mapping whole, complete BARs, as the BAR's index is used as table
index. Consequently, it's not possible to, e.g., have a pcim_iomap_range()
function with that mechanism.

An additional problem is that the PCI devres API has been implemented in a
sort of "hybrid-mode": Some unmanaged functions have managed counterparts
(e.g.: pci_iomap() <-> pcim_iomap()), making their managed nature obvious
to the programmer. However, the region-request functions in pci.c, prefixed
with pci_, behave either managed or unmanaged, depending on whether
pci_enable_device() or pcim_enable_device() has been called in advance.

This hybrid API is confusing and should be more cleanly separated by
providing always-managed functions prefixed with pcim_.

Thus, the existing PCI devres API is not desirable because:

  a) The vast majority of the users of the plural functions only ever sets
     a single bit in the bit mask, consequently making them singular
     functions anyways.

  b) There is no mechanism to request / iomap only part of a BAR.

  c) The iomap-table mechanism is over-engineered and complicated. Even
     worse, some users index over the table administration function
     directly, e.g.:

       void __iomem *mapping = pcim_iomap_table(pdev)[my_index];

     This can not perform bounds checks; an invalid index won't cause
     return of -EINVAL or even NULL, resulting in undefined behavior.

  d) region-request functions being sometimes managed and sometimes not
     is bug-provoking.

Implement a set of internal helper functions that don't have the problem of
a hybrid nature that their counter parts in pci.c have. Write those helpers
in a generic manner so that they can easily be extended to, e.g., ranged
mappings and requests.

Implement a set of singular functions that use devres as it's intended and
use those singular functions to reimplement the plural functions.

Link: https://lore.kernel.org/r/20240605081605.18769-5-pstanner@redhat.com
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/devres.c | 608 ++++++++++++++++++++++++++++++++++++++-----
 drivers/pci/pci.c    |  22 ++
 drivers/pci/pci.h    |   5 +
 3 files changed, 568 insertions(+), 67 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 845d6fab0ce7..82f71f5e164a 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -4,14 +4,243 @@
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
+ *
+ * 2. The region-request-functions in pci.c do become managed IF the device has
+ *    been enabled with pcim_enable_device() instead of pci_enable_device().
+ *    This resulted in the API becoming inconsistent: Some functions have an
+ *    obviously managed counter-part (e.g., pci_iomap() <-> pcim_iomap()),
+ *    whereas some don't and are never managed, while others don't and are
+ *    _sometimes_ managed (e.g. pci_request_region()).
+ *
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
 
+/*
+ * Legacy struct storing addresses to whole mapped BARs.
+ */
 struct pcim_iomap_devres {
-	void __iomem *table[PCIM_IOMAP_MAX];
+	void __iomem *table[PCI_STD_NUM_BARS];
+};
+
+enum pcim_addr_devres_type {
+	/* Default initializer. */
+	PCIM_ADDR_DEVRES_TYPE_INVALID,
+
+	/* A requested region spanning an entire BAR. */
+	PCIM_ADDR_DEVRES_TYPE_REGION,
+
+	/*
+	 * A requested region spanning an entire BAR, and a mapping for
+	 * the entire BAR.
+	 */
+	PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING,
+
+	/*
+	 * A mapping within a BAR, either spanning the whole BAR or just a
+	 * range.  Without a requested region.
+	 */
+	PCIM_ADDR_DEVRES_TYPE_MAPPING,
 };
 
+/*
+ * This struct envelops IO or MEM addresses, i.e., mappings and region
+ * requests, because those are very frequently requested and released
+ * together.
+ */
+struct pcim_addr_devres {
+	enum pcim_addr_devres_type type;
+	void __iomem *baseaddr;
+	unsigned long offset;
+	unsigned long len;
+	short bar;
+};
+
+static inline void pcim_addr_devres_clear(struct pcim_addr_devres *res)
+{
+	memset(res, 0, sizeof(*res));
+	res->bar = -1;
+}
+
+/*
+ * The following functions, __pcim_*_region*, exist as counterparts to the
+ * versions from pci.c - which, unfortunately, can be in "hybrid mode", i.e.,
+ * sometimes managed, sometimes not.
+ *
+ * To separate the APIs cleanly, we define our own, simplified versions here.
+ */
+
+/**
+ * __pcim_request_region_range - Request a ranged region
+ * @pdev: PCI device the region belongs to
+ * @bar: BAR the range is within
+ * @offset: offset from the BAR's start address
+ * @maxlen: length in bytes, beginning at @offset
+ * @name: name associated with the request
+ * @req_flags: flags for the request, e.g., for kernel-exclusive requests
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ *
+ * Request a range within a device's PCI BAR.  Sanity check the input.
+ */
+static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long maxlen,
+		const char *name, int req_flags)
+{
+	resource_size_t start = pci_resource_start(pdev, bar);
+	resource_size_t len = pci_resource_len(pdev, bar);
+	unsigned long dev_flags = pci_resource_flags(pdev, bar);
+
+	if (start == 0 || len == 0) /* Unused BAR. */
+		return 0;
+	if (len <= offset)
+		return  -EINVAL;
+
+	start += offset;
+	len -= offset;
+
+	if (len > maxlen && maxlen != 0)
+		len = maxlen;
+
+	if (dev_flags & IORESOURCE_IO) {
+		if (!request_region(start, len, name))
+			return -EBUSY;
+	} else if (dev_flags & IORESOURCE_MEM) {
+		if (!__request_mem_region(start, len, name, req_flags))
+			return -EBUSY;
+	} else {
+		/* That's not a device we can request anything on. */
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void __pcim_release_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long maxlen)
+{
+	resource_size_t start = pci_resource_start(pdev, bar);
+	resource_size_t len = pci_resource_len(pdev, bar);
+	unsigned long flags = pci_resource_flags(pdev, bar);
+
+	if (len <= offset || start == 0)
+		return;
+
+	if (len == 0 || maxlen == 0) /* This an unused BAR. Do nothing. */
+		return;
+
+	start += offset;
+	len -= offset;
+
+	if (len > maxlen)
+		len = maxlen;
+
+	if (flags & IORESOURCE_IO)
+		release_region(start, len);
+	else if (flags & IORESOURCE_MEM)
+		release_mem_region(start, len);
+}
+
+static int __pcim_request_region(struct pci_dev *pdev, int bar,
+		const char *name, int flags)
+{
+	unsigned long offset = 0;
+	unsigned long len = pci_resource_len(pdev, bar);
+
+	return __pcim_request_region_range(pdev, bar, offset, len, name, flags);
+}
+
+static void __pcim_release_region(struct pci_dev *pdev, int bar)
+{
+	unsigned long offset = 0;
+	unsigned long len = pci_resource_len(pdev, bar);
+
+	__pcim_release_region_range(pdev, bar, offset, len);
+}
+
+static void pcim_addr_resource_release(struct device *dev, void *resource_raw)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pcim_addr_devres *res = resource_raw;
+
+	switch (res->type) {
+	case PCIM_ADDR_DEVRES_TYPE_REGION:
+		__pcim_release_region(pdev, res->bar);
+		break;
+	case PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING:
+		pci_iounmap(pdev, res->baseaddr);
+		__pcim_release_region(pdev, res->bar);
+		break;
+	case PCIM_ADDR_DEVRES_TYPE_MAPPING:
+		pci_iounmap(pdev, res->baseaddr);
+		break;
+	default:
+		break;
+	}
+}
+
+static struct pcim_addr_devres *pcim_addr_devres_alloc(struct pci_dev *pdev)
+{
+	struct pcim_addr_devres *res;
+
+	res = devres_alloc_node(pcim_addr_resource_release, sizeof(*res),
+			GFP_KERNEL, dev_to_node(&pdev->dev));
+	if (res)
+		pcim_addr_devres_clear(res);
+	return res;
+}
+
+/* Just for consistency and readability. */
+static inline void pcim_addr_devres_free(struct pcim_addr_devres *res)
+{
+	devres_free(res);
+}
+
+/*
+ * Used by devres to identify a pcim_addr_devres.
+ */
+static int pcim_addr_resources_match(struct device *dev, void *a_raw, void *b_raw)
+{
+	struct pcim_addr_devres *a, *b;
+
+	a = a_raw;
+	b = b_raw;
+
+	if (a->type != b->type)
+		return 0;
+
+	switch (a->type) {
+	case PCIM_ADDR_DEVRES_TYPE_REGION:
+	case PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING:
+		return a->bar == b->bar;
+	case PCIM_ADDR_DEVRES_TYPE_MAPPING:
+		return a->baseaddr == b->baseaddr;
+	default:
+		return 0;
+	}
+}
 
 static void devm_pci_unmap_iospace(struct device *dev, void *ptr)
 {
@@ -92,8 +321,8 @@ EXPORT_SYMBOL(devm_pci_remap_cfgspace);
  *
  * All operations are managed and will be undone on driver detach.
  *
- * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
- * on failure. Usage example::
+ * Returns a pointer to the remapped memory or an IOMEM_ERR_PTR() encoded error
+ * code on failure. Usage example::
  *
  *	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  *	base = devm_pci_remap_cfg_resource(&pdev->dev, res);
@@ -172,6 +401,17 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_devres *this = res;
 	int i;
 
+	/*
+	 * This is legacy code.
+	 *
+	 * All regions requested by a pcim_ function do get released through
+	 * pcim_addr_resource_release(). Thanks to the hybrid nature of the pci_
+	 * region-request functions, this for-loop has to release the regions
+	 * if they have been requested by such a function.
+	 *
+	 * TODO: Remove this once all users of pcim_enable_device() PLUS
+	 * pci-region-request-functions have been ported to pcim_ functions.
+	 */
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (mask_contains_bar(this->region_mask, i))
 			pci_release_region(dev, i);
@@ -258,19 +498,21 @@ EXPORT_SYMBOL(pcim_pin_device);
 
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
  * pcim_iomap_table - access iomap allocation table
  * @pdev: PCI device to access iomap table for
  *
+ * Returns:
+ * Const pointer to array of __iomem pointers on success NULL on failure.
+ *
  * Access iomap allocation table for @dev.  If iomap table doesn't
  * exist and @pdev is managed, it will be allocated.  All iomaps
  * recorded in the iomap table are automatically unmapped on driver
@@ -343,30 +585,67 @@ static void pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
 	}
 }
 
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
 	void __iomem *mapping;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return NULL;
+	res->type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
 
 	mapping = pci_iomap(pdev, bar, maxlen);
 	if (!mapping)
-		return NULL;
+		goto err_iomap;
+	res->baseaddr = mapping;
 
 	if (pcim_add_mapping_to_legacy_table(pdev, mapping, bar) != 0)
 		goto err_table;
 
+	devres_add(&pdev->dev, res);
 	return mapping;
 
 err_table:
 	pci_iounmap(pdev, mapping);
+err_iomap:
+	pcim_addr_devres_free(res);
 	return NULL;
 }
 EXPORT_SYMBOL(pcim_iomap);
@@ -376,91 +655,291 @@ EXPORT_SYMBOL(pcim_iomap);
  * @pdev: PCI device to iounmap for
  * @addr: Address to unmap
  *
- * Managed pci_iounmap().  @addr must have been mapped using pcim_iomap().
+ * Managed pci_iounmap(). @addr must have been mapped using a pcim_* mapping
+ * function.
  */
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
 {
-	pci_iounmap(pdev, addr);
+	struct pcim_addr_devres res_searched;
+
+	pcim_addr_devres_clear(&res_searched);
+	res_searched.type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
+	res_searched.baseaddr = addr;
+
+	if (devres_release(&pdev->dev, pcim_addr_resource_release,
+			pcim_addr_resources_match, &res_searched) != 0) {
+		/* Doesn't exist. User passed nonsense. */
+		return;
+	}
 
 	pcim_remove_mapping_from_legacy_table(pdev, addr);
 }
 EXPORT_SYMBOL(pcim_iounmap);
 
+/**
+ * pcim_iomap_region - Request and iomap a PCI BAR
+ * @pdev: PCI device to map IO resources for
+ * @bar: Index of a BAR to map
+ * @name: Name associated with the request
+ *
+ * Returns: __iomem pointer on success, an IOMEM_ERR_PTR on failure.
+ *
+ * Mapping and region will get automatically released on driver detach. If
+ * desired, release manually only with pcim_iounmap_region().
+ */
+static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
+				       const char *name)
+{
+	int ret;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return IOMEM_ERR_PTR(-ENOMEM);
+
+	res->type = PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING;
+	res->bar = bar;
+
+	ret = __pcim_request_region(pdev, bar, name, 0);
+	if (ret != 0)
+		goto err_region;
+
+	res->baseaddr = pci_iomap(pdev, bar, 0);
+	if (!res->baseaddr) {
+		ret = -EINVAL;
+		goto err_iomap;
+	}
+
+	devres_add(&pdev->dev, res);
+	return res->baseaddr;
+
+err_iomap:
+	__pcim_release_region(pdev, bar);
+err_region:
+	pcim_addr_devres_free(res);
+
+	return IOMEM_ERR_PTR(ret);
+}
+
+/**
+ * pcim_iounmap_region - Unmap and release a PCI BAR
+ * @pdev: PCI device to operate on
+ * @bar: Index of BAR to unmap and release
+ *
+ * Unmap a BAR and release its region manually. Only pass BARs that were
+ * previously mapped by pcim_iomap_region().
+ */
+static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
+{
+	struct pcim_addr_devres res_searched;
+
+	pcim_addr_devres_clear(&res_searched);
+	res_searched.type = PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING;
+	res_searched.bar = bar;
+
+	devres_release(&pdev->dev, pcim_addr_resource_release,
+			pcim_addr_resources_match, &res_searched);
+}
+
 /**
  * pcim_iomap_regions - Request and iomap PCI BARs
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to request and iomap
- * @name: Name used when requesting regions
+ * @name: Name associated with the requests
+ *
+ * Returns: 0 on success, negative error code on failure.
  *
  * Request and iomap regions specified by @mask.
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
 
-		if (!mask_contains_bar(mask, i))
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
+static int _pcim_request_region(struct pci_dev *pdev, int bar, const char *name,
+		int request_flags)
+{
+	int ret;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return -ENOMEM;
+	res->type = PCIM_ADDR_DEVRES_TYPE_REGION;
+	res->bar = bar;
+
+	ret = __pcim_request_region(pdev, bar, name, request_flags);
+	if (ret != 0) {
+		pcim_addr_devres_free(res);
+		return ret;
 	}
 
+	devres_add(&pdev->dev, res);
 	return 0;
+}
 
- err_region:
-	pci_release_region(pdev, i);
- err_inval:
-	while (--i >= 0) {
-		if (!mask_contains_bar(mask, i))
-			continue;
-		pcim_iounmap(pdev, iomap[i]);
-		pci_release_region(pdev, i);
+/**
+ * pcim_request_region - Request a PCI BAR
+ * @pdev: PCI device to requestion region for
+ * @bar: Index of BAR to request
+ * @name: Name associated with the request
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ *
+ * Request region specified by @bar.
+ *
+ * The region will automatically be released on driver detach. If desired,
+ * release manually only with pcim_release_region().
+ */
+static int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
+{
+	return _pcim_request_region(pdev, bar, name, 0);
+}
+
+/**
+ * pcim_release_region - Release a PCI BAR
+ * @pdev: PCI device to operate on
+ * @bar: Index of BAR to release
+ *
+ * Release a region manually that was previously requested by
+ * pcim_request_region().
+ */
+static void pcim_release_region(struct pci_dev *pdev, int bar)
+{
+	struct pcim_addr_devres res_searched;
+
+	pcim_addr_devres_clear(&res_searched);
+	res_searched.type = PCIM_ADDR_DEVRES_TYPE_REGION;
+	res_searched.bar = bar;
+
+	devres_release(&pdev->dev, pcim_addr_resource_release,
+			pcim_addr_resources_match, &res_searched);
+}
+
+
+/**
+ * pcim_release_all_regions - Release all regions of a PCI-device
+ * @pdev: the PCI device
+ *
+ * Release all regions previously requested through pcim_request_region()
+ * or pcim_request_all_regions().
+ *
+ * Can be called from any context, i.e., not necessarily as a counterpart to
+ * pcim_request_all_regions().
+ */
+static void pcim_release_all_regions(struct pci_dev *pdev)
+{
+	short bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
+		pcim_release_region(pdev, bar);
+}
+
+/**
+ * pcim_request_all_regions - Request all regions
+ * @pdev: PCI device to map IO resources for
+ * @name: name associated with the request
+ *
+ * Returns: 0 on success, negative error code on failure.
+ *
+ * Requested regions will automatically be released at driver detach. If
+ * desired, release individual regions with pcim_release_region() or all of
+ * them at once with pcim_release_all_regions().
+ */
+static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
+{
+	int ret;
+	short bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		ret = pcim_request_region(pdev, bar, name);
+		if (ret != 0)
+			goto err;
 	}
 
-	return rc;
+	return 0;
+
+err:
+	pcim_release_all_regions(pdev);
+
+	return ret;
 }
-EXPORT_SYMBOL(pcim_iomap_regions);
 
 /**
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
- * @name: Name used when requesting regions
+ * @name: Name associated with the requests
+ *
+ * Returns: 0 on success, negative error code on failure.
  *
  * Request all PCI BARs and iomap regions specified by @mask.
+ *
+ * To release these resources manually, call pcim_release_region() for the
+ * regions and pcim_iounmap() for the mappings.
  */
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name)
 {
-	int request_mask = ((1 << 6) - 1) & ~mask;
-	int rc;
+	short bar;
+	int ret;
+	void __iomem **legacy_iomap_table;
 
-	rc = pci_request_selected_regions(pdev, request_mask, name);
-	if (rc)
-		return rc;
+	ret = pcim_request_all_regions(pdev, name);
+	if (ret != 0)
+		return ret;
 
-	rc = pcim_iomap_regions(pdev, mask, name);
-	if (rc)
-		pci_release_selected_regions(pdev, request_mask);
-	return rc;
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!mask_contains_bar(mask, bar))
+			continue;
+		if (!pcim_iomap(pdev, bar, 0))
+			goto err;
+	}
+
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
 
@@ -473,19 +952,14 @@ EXPORT_SYMBOL(pcim_iomap_regions_request_all);
  */
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 {
-	void __iomem * const *iomap;
-	int i;
+	short bar;
 
-	iomap = pcim_iomap_table(pdev);
-	if (!iomap)
-		return;
-
-	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
-		if (!mask_contains_bar(mask, i))
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
index 59e0949fb079..d94445f5f882 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3883,6 +3883,17 @@ void pci_release_region(struct pci_dev *pdev, int bar)
 		release_mem_region(pci_resource_start(pdev, bar),
 				pci_resource_len(pdev, bar));
 
+	/*
+	 * This devres utility makes this function sometimes managed
+	 * (when pcim_enable_device() has been called before).
+	 *
+	 * This is bad because it conflicts with the pcim_ functions being
+	 * exclusively responsible for managed PCI. Its "sometimes yes,
+	 * sometimes no" nature can cause bugs.
+	 *
+	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
+	 * a region request function have been ported to using pcim_ functions.
+	 */
 	dr = find_pci_dr(pdev);
 	if (dr)
 		dr->region_mask &= ~(1 << bar);
@@ -3927,6 +3938,17 @@ static int __pci_request_region(struct pci_dev *pdev, int bar,
 			goto err_out;
 	}
 
+	/*
+	 * This devres utility makes this function sometimes managed
+	 * (when pcim_enable_device() has been called before).
+	 *
+	 * This is bad because it conflicts with the pcim_ functions being
+	 * exclusively responsible for managed pci. Its "sometimes yes,
+	 * sometimes no" nature can cause bugs.
+	 *
+	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
+	 * a region request function have been ported to using pcim_ functions.
+	 */
 	dr = find_pci_dr(pdev);
 	if (dr)
 		dr->region_mask |= 1 << bar;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index fd44565c4756..c09487f5550c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -826,6 +826,11 @@ struct pci_devres {
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
 
-- 
2.45.0

