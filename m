Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF1B52ACB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9D810EA2F;
	Thu, 11 Sep 2025 07:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9xynmmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1910EA2F;
 Thu, 11 Sep 2025 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577469; x=1789113469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IAxgNbJGd3/oP9q1FLQX9YXGLqA1E1HjfwvAaKjpyHI=;
 b=m9xynmmo2eVQwaZ0VCOr89ZE4IWh6BwNwWvc6zXk3EfRp6ACnFqCf0WZ
 I2tOYYvfcjk3XrIsFqfvA3M2i1GU84RjJxu/61IPmxGENT+cp7/seNupG
 T7KslAdoryN5L/+O5NEjCgeQ6uOXjjqSGFYj87V1YJuR2XJzzMKfVqN+L
 hu1Bu0XotZj4epG3yP4H+OsmDGBvh7Fdt99wnh7Ev+ka1bT7pDMvRcf2G
 OiMsgKXOoWQ4xZjb8HE7gNmt3pvWL1FdsbQlgQpVrQ+cu3YUQIyM1X0S7
 SaBSxvu1wKHOeT0eNUmWyk7WW+NOSFQZTAZkY7N72DmMxT+pniNokRPRh Q==;
X-CSE-ConnectionGUID: GpG5RTdtTHCdCyGsxvz0kw==
X-CSE-MsgGUID: XIHgsYyDSYyWpzXRp8esbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70999291"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="70999291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:57:28 -0700
X-CSE-ConnectionGUID: gmapQe/zSUKriqtkGuXbwg==
X-CSE-MsgGUID: W5vBlPAvSlSbgBpu2YqvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173186230"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.187])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:57:19 -0700
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
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 05/11] PCI: Add pci_rebar_size_supported() helper
Date: Thu, 11 Sep 2025 10:55:59 +0300
Message-Id: <20250911075605.5277-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
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

Many callers of pci_rebar_get_possible_sizes() are interested in
finding out if a particular BAR Size (PCIe r6.2 sec. 7.8.6.3) is
supported by the particular BAR.

Add pci_rebar_size_supported() into PCI core to make it easy for the
drivers to determine if the BAR Size is supported or not.

Use the new function in pci_resize_resource() and in
pci_iov_vf_bar_set_size().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c   |  7 +------
 drivers/pci/rebar.c | 29 +++++++++++++++++++++++------
 include/linux/pci.h |  1 +
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index ac4375954c94..51844a9176a0 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1334,7 +1334,6 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
  */
 int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 {
-	u32 sizes;
 	int ret;
 
 	if (!pci_resource_is_iov(resno))
@@ -1343,11 +1342,7 @@ int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 	if (pci_iov_is_memory_decoding_enabled(dev))
 		return -EBUSY;
 
-	sizes = pci_rebar_get_possible_sizes(dev, resno);
-	if (!sizes)
-		return -ENOTSUPP;
-
-	if (!(sizes & BIT(size)))
+	if (!pci_rebar_size_supported(dev, resno, size))
 		return -EINVAL;
 
 	ret = pci_rebar_set_size(dev, resno, size);
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 64315dd8b6bb..735d9afd6ab1 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -3,6 +3,7 @@
  * PCI Resizable BAR Extended Capability handling.
  */
 
+#include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -124,6 +125,27 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
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
+	u64 sizes;
+
+	sizes = pci_rebar_get_possible_sizes(pdev, bar);
+	if (!sizes)
+		return false;
+
+	return BIT(size) & sizes;
+}
+EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
+
 /**
  * pci_rebar_get_current_size - get the current size of a Resizable BAR
  * @pdev: PCI device
@@ -231,7 +253,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
-	u32 sizes;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -245,11 +266,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
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
index 6f0c31290675..917c3b897739 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1423,6 +1423,7 @@ void pci_release_resource(struct pci_dev *dev, int resno);
 int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
-- 
2.39.5

