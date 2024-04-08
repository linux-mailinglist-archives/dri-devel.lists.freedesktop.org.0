Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39289BA8B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702F31122B3;
	Mon,  8 Apr 2024 08:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IsGECYVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DD61122B1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712565873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGl/WiYyl03csxXvxZlcWXagee+4QnpV5olmqS0ZP5c=;
 b=IsGECYVjR8swaAPJF9zYPPdkt//7GXuxAzY0c3PCHPpzqgxusTn/9QvlzYGY0EJfB2F75l
 9SUcWBIX9wJ7jFRYtPdB4Sk5diK2ckv4E66TsKBapFLLeVz5fkaJQaPjmIvXSP9NJ+9oro
 uvH2sasvcifhhJhwJ+De9C+1qGzk5mE=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-hQnADVXAPqiXxuXOZlsPdA-1; Mon, 08 Apr 2024 04:44:31 -0400
X-MC-Unique: hQnADVXAPqiXxuXOZlsPdA-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-479d74a7adeso386894137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565871; x=1713170671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGl/WiYyl03csxXvxZlcWXagee+4QnpV5olmqS0ZP5c=;
 b=UyIT6Q8etkv368Czz4hLWqNBsVOSiluRc4qkGhAeDUnD+3KEOVsB1CmeVMFNX1Ll9X
 iayAuV6LY342jO4YyYj/O+T8OSmzKuGlO9NIB6ffwkwe6Jfo0HFUt7zKAlZmdG2xC4F4
 hV1yHvCFqK1OVzHdaW626peYVywTDbBdL1qzxDgrXmwoP0FEIBhMeK4mMqROk+uGvndl
 3QzJf31qjVB5JXfP1ZnplSjzsEOL/zr9Cd0ITDbfjS1wJLYjwp0emYCD/VzHOzlTveNV
 GxDg0tdeLkAtfoF2WkxJr5lPETUkz2rx60eL9gvf+LhCyQpTNOwhRqrYaSCubGqrzUYt
 Zxzg==
X-Gm-Message-State: AOJu0YzigIveumt1dmwByojlhELlQdJwug56hNKAcW6N3t+xy3BfcTm9
 d+qtW6UgjRXGAzNLymu8Rdu2lZUjC2WsaoFqPasPB7rsL6aGSer6O4qjXn0grWAnhPnKbtD9EvD
 KQk3teUjX9VLlql/BRx6HstaCqdqI/W/XoMIwgYVi+4EEPkGI5iTln0L9to5/hc3W6g==
X-Received: by 2002:a67:e94b:0:b0:478:927e:cad7 with SMTP id
 p11-20020a67e94b000000b00478927ecad7mr4722680vso.2.1712565870864; 
 Mon, 08 Apr 2024 01:44:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7pg8a34r+F0NDlPtOCbWwZQhzYztTbSbF04flxCxq4Ua5vvn37CBZZ3pHG0IEf3vQ3CmUXg==
X-Received: by 2002:a67:e94b:0:b0:478:927e:cad7 with SMTP id
 p11-20020a67e94b000000b00478927ecad7mr4722661vso.2.1712565870375; 
 Mon, 08 Apr 2024 01:44:30 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 oo15-20020a05620a530f00b0078d54e39f6csm2036989qkn.23.2024.04.08.01.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:44:30 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v6 01/10] PCI: Add new set of devres functions
Date: Mon,  8 Apr 2024 10:44:13 +0200
Message-ID: <20240408084423.6697-2-pstanner@redhat.com>
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

The PCI devres API is not extensible to partial BAR mappings and has
bug-provoking features. Improve that by providing better alternatives.

When the original PCI devres API was implemented, priority was given to
the creation of a set of "plural functions" such as
pcim_request_regions(). These functions have bit masks as parameters to
specify which BARs shall get mapped. Most users, however, only use those
to map 1-3 BARs.

A complete set of "singular functions" does not exist.

As functions mapping / requesting multiple BARs at once have (almost) no
mechanism in C to return the resources to the caller of the plural
function, the PCI devres API utilizes the iomap-table administrated by the
function pcim_iomap_table().

The entire PCI devres API was strongly tied to that table
which only allows for mapping whole, complete BARs, as the BAR's index
is used as table index. Consequently, it's not possible to, e.g., have a
pcim_iomap_range() function with that mechanism.

An additional problem is hat the PCI devres API has been ipmlemented in
a sort of "hybrid-mode": Some unmanaged functions have managed
counterparts (e.g.: pci_iomap() <-> pcim_iomap()), making their managed
nature obvious to the programmer. However, the region-request functions
in pci.c, prefixed with pci_, behave either managed or unmanaged,
depending on whether pci_enable_device() or pcim_enable_device() has
been called in advance.

This hybrid API is confusing and should be more cleanly separated by
providing always-managed functions prefixed with pcim_.

Thus, the existing PCI devres API is not desirable because:
  a) The vast majority of the users of the plural functions only ever
     sets a single bit in the bit mask, consequently making them singular
     functions anyways.
  b) There is no mechanism to request / iomap only part of a BAR.
  c) The iomap-table mechanism is over-engineered and complicated. Even
     worse, some users index over the table administration function
     directly:
     void __iomem *mapping = pcim_iomap_table(pdev)[my_index];
     This can not perform bounds checks; an invalid index won't cause
     return of -EINVAL or even NULL, resulting in undefined behavior.
  d) region-request functions being sometimes managed and sometimes not
     is bug-provoking.

Implement a set of singular pcim_ functions that use devres directly and
bypass the legacy iomap table mechanism.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 473 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h  |  11 +
 2 files changed, 479 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 2c562b9eaf80..6a653e1a1acb 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -8,10 +8,215 @@
  */
 #define PCIM_IOMAP_MAX	PCI_STD_NUM_BARS
 
+/*
+ * Legacy struct storing addresses to whole mapped BARs.
+ */
 struct pcim_iomap_devres {
 	void __iomem *table[PCIM_IOMAP_MAX];
 };
 
+enum pcim_addr_devres_type {
+	/* Default initializer. */
+	PCIM_ADDR_DEVRES_TYPE_INVALID,
+
+	/* A region spanning an entire BAR. */
+	PCIM_ADDR_DEVRES_TYPE_REGION,
+
+	/* A region spanning an entire BAR, and a mapping for that whole BAR. */
+	PCIM_ADDR_DEVRES_TYPE_REGION_MAPPING,
+
+	/*
+	 * A mapping within a BAR, either spanning the whole BAR or just a range.
+	 * Without a requested region.
+	 */
+	PCIM_ADDR_DEVRES_TYPE_MAPPING,
+
+	/* A ranged region within a BAR, with a mapping spanning that range. */
+	PCIM_ADDR_DEVRES_TYPE_REGION_RANGE_MAPPING
+};
+
+/*
+ * This struct envelopes IO or MEM addresses, that means mappings and region
+ * requests, because those are very frequently requested and released together.
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
+ * @bar: The BAR the region is within
+ * @offset: offset from the BAR's start address
+ * @maxlen: length in bytes, beginning at @offset
+ * @name: name associated with the request
+ * @req_flags: flags for the request. For example for kernel-exclusive requests.
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ *
+ * Request a ranged region within a device's PCI BAR. This function performs
+ * sanity checks on the input.
+ */
+static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long maxlen,
+		const char *name, int req_flags)
+{
+	resource_size_t start = pci_resource_start(pdev, bar);
+	resource_size_t len = pci_resource_len(pdev, bar);
+	unsigned long dev_flags = pci_resource_flags(pdev, bar);
+
+	if (start == 0 || len == 0) /* That's an unused BAR. */
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
+	case PCIM_ADDR_DEVRES_TYPE_REGION_RANGE_MAPPING:
+		pci_iounmap(pdev, res->baseaddr);
+		__pcim_release_region_range(pdev, res->bar, res->offset, res->len);
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
+	case PCIM_ADDR_DEVRES_TYPE_REGION_RANGE_MAPPING:
+		return a->bar == b->bar && a->offset == b->offset && a->len == b->len;
+	default:
+		return 0;
+	}
+}
 
 static void devm_pci_unmap_iospace(struct device *dev, void *ptr)
 {
@@ -92,8 +297,8 @@ EXPORT_SYMBOL(devm_pci_remap_cfgspace);
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
@@ -339,15 +544,80 @@ void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
 			tbl[i] = NULL;
 			return;
 		}
-	WARN_ON(1);
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
+void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar, const char *name)
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
+EXPORT_SYMBOL(pcim_iomap_region);
+
+/**
+ * pcim_iounmap_region - Unmap and release a PCI BAR
+ * @pdev: PCI device to operate on
+ * @bar: Index of BAR to unmap and release
+ *
+ * Unmap a BAR and release its region manually. Only pass BARs that were
+ * previously mapped by pcim_iomap_region().
+ */
+void pcim_iounmap_region(struct pci_dev *pdev, int bar)
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
+EXPORT_SYMBOL(pcim_iounmap_region);
+
 /**
  * pcim_iomap_regions - Request and iomap PCI BARs
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to request and iomap
- * @name: Name used when requesting regions
+ * @name: Name associated with the requests
  *
  * Request and iomap regions specified by @mask.
  */
@@ -400,7 +670,7 @@ EXPORT_SYMBOL(pcim_iomap_regions);
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
- * @name: Name used when requesting regions
+ * @name: Name associated with the requests
  *
  * Request all PCI BARs and iomap regions specified by @mask.
  */
@@ -446,3 +716,196 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 	}
 }
 EXPORT_SYMBOL(pcim_iounmap_regions);
+
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
+	}
+
+	devres_add(&pdev->dev, res);
+	return 0;
+}
+
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
+int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
+{
+	return _pcim_request_region(pdev, bar, name, 0);
+}
+EXPORT_SYMBOL(pcim_request_region);
+
+/**
+ * pcim_release_region - Release a PCI BAR
+ * @pdev: PCI device to operate on
+ * @bar: Index of BAR to release
+ *
+ * Release a region manually that was previously requested by
+ * pcim_request_region().
+ */
+void pcim_release_region(struct pci_dev *pdev, int bar)
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
+EXPORT_SYMBOL(pcim_release_region);
+
+/**
+ * pcim_iomap_range - Create a ranged __iomap mapping within a PCI BAR
+ * @pdev: PCI device to map IO resources for
+ * @bar: Index of the BAR
+ * @offset: Offset from the begin of the BAR
+ * @len: Length in bytes for the mapping
+ *
+ * Returns: __iomem pointer on success, an IOMEM_ERR_PTR on failure.
+ *
+ * Creates a new IO-Mapping within the specified @bar, ranging from @offset to
+ * @offset + @len.
+ *
+ * The mapping will automatically get unmapped on driver detach. If desired,
+ * release manually only with pcim_iounmap().
+ */
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long len)
+{
+	void __iomem *mapping;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return IOMEM_ERR_PTR(-ENOMEM);
+
+	mapping = pci_iomap_range(pdev, bar, offset, len);
+	if (!mapping) {
+		pcim_addr_devres_free(res);
+		return IOMEM_ERR_PTR(-EINVAL);
+	}
+
+	res->type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
+	res->baseaddr = mapping;
+
+	/*
+	 * Ranged mappings don't get added to the legacy-table, since the table
+	 * only ever keeps track of whole BARs.
+	 */
+
+	devres_add(&pdev->dev, res);
+	return mapping;
+}
+EXPORT_SYMBOL(pcim_iomap_range);
+
+/**
+ * pcim_iomap_region_range - Request and map a range within a PCI BAR
+ * @pdev: PCI device to map IO resources for
+ * @bar: Index of BAR to request within
+ * @offset: Offset from the begin of the BAR
+ * @len: Length in bytes for the mapping
+ * @name: Name associated with the request
+ *
+ * Returns: __iomem pointer on success, an IOMEM_ERR_PTR on failure.
+ *
+ * Request region with a range specified by @offset and @len within @bar and
+ * iomap it.
+ *
+ * The region will automatically be released and the mapping be unmapped on
+ * driver detach. If desired, release manually only with
+ * pcim_iounmap_region_range().
+ *
+ * You probably should only use this function if you explicitly do not want to
+ * request the entire BAR. For most use-cases, combining pcim_request_region()
+ * and pcim_iomap_range() should be sufficient.
+ */
+void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long len, const char *name)
+{
+	int ret;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return IOMEM_ERR_PTR(-ENOMEM);
+
+	res->type = PCIM_ADDR_DEVRES_TYPE_REGION_RANGE_MAPPING;
+	res->bar = bar;
+	res->offset = offset;
+	res->len = len;
+
+	ret = __pcim_request_region_range(pdev, bar, offset, len, name, 0);
+	if (ret != 0)
+		goto err_region;
+
+	res->baseaddr = pci_iomap_range(pdev, bar, offset, len);
+	if (!res->baseaddr) {
+		ret = -EINVAL;
+		goto err_iomap;
+	}
+
+	devres_add(&pdev->dev, res);
+	return res->baseaddr;
+
+err_iomap:
+	__pcim_release_region_range(pdev, bar, offset, len);
+err_region:
+	pcim_addr_devres_free(res);
+
+	return IOMEM_ERR_PTR(ret);
+}
+EXPORT_SYMBOL(pcim_iomap_region_range);
+
+/**
+ * pcim_iounmap_region_range - Unmap and release a range within a PCI BAR
+ * @pdev: PCI device to operate on
+ * @bar: Index of BAR containing the range
+ * @offset: Offset from the begin of the BAR
+ * @len: Length in bytes for the mapping
+ *
+ * Unmaps and releases a memory area within the specified PCI BAR.
+ *
+ * This function may not be used to free only part of a range. Only use this
+ * function with the exact parameters you previously used successfully in
+ * pcim_iomap_region_range().
+ */
+void pcim_iounmap_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long len)
+{
+	struct pcim_addr_devres res_searched;
+	pcim_addr_devres_clear(&res_searched);
+
+	res_searched.type = PCIM_ADDR_DEVRES_TYPE_REGION_RANGE_MAPPING;
+	res_searched.bar = bar;
+	res_searched.offset = offset;
+	res_searched.len = len;
+
+	devres_release(&pdev->dev, pcim_addr_resource_release,
+			pcim_addr_resources_match, &res_searched);
+}
+EXPORT_SYMBOL(pcim_iounmap_region_range);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 16493426a04f..e7df30e620c7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2323,10 +2323,21 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
+void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar, const char *name);
+void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
+int pcim_request_region(struct pci_dev *pdev, int bar, const char *res_name);
+void pcim_release_region(struct pci_dev *pdev, int bar);
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+				unsigned long offset, unsigned long len);
+void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int bar,
+				       unsigned long offset, unsigned long len,
+				       const char *res_name);
+void pcim_iounmap_region_range(struct pci_dev *pdev, int bar,
+			       unsigned long offset, unsigned long len);
 
 extern int pci_pci_problems;
 #define PCIPCI_FAIL		1	/* No PCI PCI DMA */
-- 
2.44.0

