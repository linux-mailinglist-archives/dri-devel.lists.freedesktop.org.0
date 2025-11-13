Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B7C59533
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349610E911;
	Thu, 13 Nov 2025 18:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DszZ9EAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050810E910;
 Thu, 13 Nov 2025 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056937; x=1794592937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KWVOrKsnU84ElVsjEKI0K/T3KtiSa/Dqo7sQOK27lBk=;
 b=DszZ9EAY18JjrG8FXOHL8ec1Z8Z1/2SZYdPtX/Xu8AIiiRqDkRwgVNSm
 yToEGBsKUiVMwiYHYge4Ilgy4WHtDMIJiJZyJrWc2f3FPFl4kGe1EIimm
 6C26TG2XbGR76g8Z5Ao9OSK7B9qMpjavsSMHO2B51P+u39QPKORgRFrom
 8LO5py2qqqIwRqtNGmrpWHIS9T2bfrVJFOCEZN87SdInN9WvMgi9Nyhwd
 2uUYuO4DohWw4jvxVmOswecAOujCgOMu383+Rkkxqkj03vwZuoMTFyYXo
 OUQu04oRvESHCCUGpXsZ9D3U0DS6DqevN8Ad0fJZlX/DZubSfRj7k419j g==;
X-CSE-ConnectionGUID: 7V5rVFqwQuq2YtLql/r5bA==
X-CSE-MsgGUID: dS0MHvNqRjCJYfFZv4gJng==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75826979"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75826979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:16 -0800
X-CSE-ConnectionGUID: Y7CnD/rTTVepfEB7EGIrsQ==
X-CSE-MsgGUID: XnANxvDfQWuTaAIM0jt+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188823097"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 05/11] PCI: Add pci_rebar_size_supported() helper
Date: Thu, 13 Nov 2025 20:00:47 +0200
Message-Id: <20251113180053.27944-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
References: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Many callers of pci_rebar_get_possible_sizes() are interested in finding
out if a particular encoded BAR Size (PCIe r7.0, sec 7.8.6.3) is supported
by the particular BAR.

Add pci_rebar_size_supported() into PCI core to make it easy for the
drivers to determine if the BAR size is supported or not.

Use the new function in pci_resize_resource() and in
pci_iov_vf_bar_set_size().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/pci/iov.c   |  8 +-------
 drivers/pci/rebar.c | 25 +++++++++++++++++++------
 include/linux/pci.h |  1 +
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 04b675e90963..71ed85d38508 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1339,19 +1339,13 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
  */
 int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 {
-	u32 sizes;
-
 	if (!pci_resource_is_iov(resno))
 		return -EINVAL;
 
 	if (pci_iov_is_memory_decoding_enabled(dev))
 		return -EBUSY;
 
-	sizes = pci_rebar_get_possible_sizes(dev, resno);
-	if (!sizes)
-		return -ENOTSUPP;
-
-	if (!(sizes & BIT(size)))
+	if (!pci_rebar_size_supported(dev, resno, size))
 		return -EINVAL;
 
 	return pci_rebar_set_size(dev, resno, size);
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index e5c0ea6d6063..0e7bf2d380cf 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -3,6 +3,7 @@
  * PCI Resizable BAR Extended Capability handling.
  */
 
+#include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -124,6 +125,23 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 }
 EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
 
+/**
+ * pci_rebar_size_supported - check if size is supported for BAR
+ * @pdev: PCI device
+ * @bar: BAR to check
+ * @size: size as defined in the PCIe spec (0=1MB, 31=128TB)
+ *
+ * Return: %true if @bar is resizable and @size is a supported, otherwise
+ *	   %false.
+ */
+bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
+{
+	u64 sizes = pci_rebar_get_possible_sizes(pdev, bar);
+
+	return BIT(size) & sizes;
+}
+EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
+
 /**
  * pci_rebar_get_current_size - get the current size of a Resizable BAR
  * @pdev: PCI device
@@ -252,7 +270,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size,
 {
 	struct pci_host_bridge *host;
 	int old, ret;
-	u32 sizes;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -262,11 +279,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size,
 	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
-	sizes = pci_rebar_get_possible_sizes(dev, resno);
-	if (!sizes)
-		return -ENOTSUPP;
-
-	if (!(sizes & BIT(size)))
+	if (!pci_rebar_size_supported(dev, resno, size))
 		return -EINVAL;
 
 	old = pci_rebar_get_current_size(dev, resno);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 33b27e0c4f3e..0ef827cfaf0c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1424,6 +1424,7 @@ int pci_release_resource(struct pci_dev *dev, int resno);
 int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size,
 				     int exclude_bars);
 
-- 
2.39.5

