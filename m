Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1F9838A93
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB3010E6F9;
	Tue, 23 Jan 2024 09:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67210E716
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpZRO/hie2DZUp2YXXFB6DWr6YyvZQ+0hRYwdS7yjHA=;
 b=DwAfKScuqXi/Xa/2ZX60eFCOWdRHPR35OjY6Mr/0y7OD9zKdnTn1onVg10rhH+NWhqmvcK
 k/Gm+y2CLLgbZqdL0ahBZdhEh2swYSnHkDTtt1Mg+J7/uygRfl/TSXYXSqsYa42rL1dRw1
 n4afkBq2H/4SAmY7RrbNWVfrOkEmF6g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-KBtrBYcgOT6AOqBtbrPtLA-1; Tue, 23 Jan 2024 04:44:48 -0500
X-MC-Unique: KBtrBYcgOT6AOqBtbrPtLA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78313358d3bso124591985a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003087; x=1706607887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpZRO/hie2DZUp2YXXFB6DWr6YyvZQ+0hRYwdS7yjHA=;
 b=mYqXXE3aMw7ddvvxNkkOEonMpMQxk9D9Yagf0Pn8OmaAq2pLA/5BymPzuZMfafo859
 7OAwK1rXTinidaggdm/7UmOsPImJvpE/goWdJfOqPk50Kf3pKjtJxXTofSoIB8yUyeKQ
 ChrhZcQLnqPYXoFI3ai/+WQJJblh/FMvw0kPaM/IFPyWZ2KhJs51XNwQRtcISSARBU+B
 kKQRegM4QkjhZnEH20hTmVNkkO8SccpNA+9WZlUevMajGP1tPVK3Cy8Ds10jdYN6QgBv
 6BVuuLfnlJHXWgoDud6VVq9FvSc1Zg6mvV/NR2NSoEqgp/971d+SwM0xTaKZLM925VOS
 2fmQ==
X-Gm-Message-State: AOJu0YxswvjtkIFXYgSGaoBblU/E0MMt1xCYNe4iWCmKE2ohOkLV/sXG
 1OQSaZbw5LDG8EnewnPrmBy+ijuw+7xJfJ6oYCJytwgGnCUe8ca33IV5LZg4WECfvjJyJ8w0OoB
 3ZZE5KmuWiKPdMBRo7wfb/yDEuqZbjSwvxAAzaeXvtSHqaGzMJg81Gr2zxYM0LMKdNg==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id
 d5-20020a05621421c500b00686944387b1mr4376844qvh.2.1706003087122; 
 Tue, 23 Jan 2024 01:44:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1SFf08MgexIBddX9oF8uSmYRaM8hwsuStyxuECGlCd9+ZZiXl7daBL1Z/0ofsLOoLxLG1rw==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id
 d5-20020a05621421c500b00686944387b1mr4376831qvh.2.1706003086677; 
 Tue, 23 Jan 2024 01:44:46 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:44:46 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 01/10] PCI: add new set of devres functions
Date: Tue, 23 Jan 2024 10:42:58 +0100
Message-ID: <20240123094317.15958-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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

Add devres.c to driver-api documentation.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 Documentation/driver-api/pci/pci.rst |   3 +
 drivers/pci/devres.c                 | 473 ++++++++++++++++++++++++++-
 include/linux/pci.h                  |  11 +
 3 files changed, 482 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/pci/pci.rst b/Documentation/driver-api/pci/pci.rst
index 4843cfad4f60..92b11775344e 100644
--- a/Documentation/driver-api/pci/pci.rst
+++ b/Documentation/driver-api/pci/pci.rst
@@ -4,6 +4,9 @@ PCI Support Library
 .. kernel-doc:: drivers/pci/pci.c
    :export:
 
+.. kernel-doc:: drivers/pci/devres.c
+   :export:
+
 .. kernel-doc:: drivers/pci/pci-driver.c
    :export:
 
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 4bd1e125bca1..91252856aa66 100644
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
+ * @exclusive: whether the mapping shall be exclusively for kernelspace
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ *
+ * Request a ranged region within a device's PCI BAR. This function performs
+ * sanity checks on the input.
+ */
+static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long maxlen,
+		const char *name, int exclusive)
+{
+	resource_size_t start = pci_resource_start(pdev, bar);
+	resource_size_t len = pci_resource_len(pdev, bar);
+	unsigned long flags = pci_resource_flags(pdev, bar);
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
+	if (flags & IORESOURCE_IO) {
+		if (!request_region(start, len, name))
+			return -EBUSY;
+	} else if (flags & IORESOURCE_MEM) {
+		if (!__request_mem_region(start, len, name, exclusive))
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
+		const char *name, int exclusive)
+{
+	unsigned long offset = 0;
+	unsigned long len = pci_resource_len(pdev, bar);
+
+	return __pcim_request_region_range(pdev, bar, offset, len, name, exclusive);
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
@@ -341,15 +546,80 @@ void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
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
@@ -402,7 +672,7 @@ EXPORT_SYMBOL(pcim_iomap_regions);
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
- * @name: Name used when requesting regions
+ * @name: Name associated with the requests
  *
  * Request all PCI BARs and iomap regions specified by @mask.
  */
@@ -448,3 +718,196 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
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
index 58a4c976c39b..1b45a4888703 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2314,10 +2314,21 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
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
2.43.0

