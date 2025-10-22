Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB9BFC2E2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931D10E78A;
	Wed, 22 Oct 2025 13:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZoS1uJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F4410E794;
 Wed, 22 Oct 2025 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140091; x=1792676091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2Fhfh8UiaFwG9K8ze69qLMHeEgSfFO/h7elyAOg/0w=;
 b=kZoS1uJvgZyynGLzAGILxLq/Q2o23oqKIAhph5g6HeWCjS9SMOzb37MK
 3PcPbwwSiqf3xRrPGmYx3In8wt5Iu/XN1ZoIezTB0xDFN+SqMM8gxsNPp
 I5aR+VrrA2UonVH2DC5M7eRqoM0wWImO8VPO6KESrhkK3pYgOHqO7dgOj
 Z041XSz25eqZfdCj72vQCeYkgpdW1DGhUFWL9286+GdG3H/1PgzUNf2Wx
 pOhbYYeLnn7bclyGH71EqP+aiSf5OeTIaUSIwtwuC8GQGHVsrHuW+o4zb
 y1IBA6ym6gNcgNLQJQvvrufN3r21/hWAaymP80ucO6bun0Q6FhKQSZRUN w==;
X-CSE-ConnectionGUID: y0wn/cbyTb+4Msyd5/mTYw==
X-CSE-MsgGUID: iDTSoqDQTEm2XVl+LmMmiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67124155"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67124155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:50 -0700
X-CSE-ConnectionGUID: oPwrKvMlQlaAF0CWSOmDOw==
X-CSE-MsgGUID: fJFv78aGS3KYsH7qp1iVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="214520399"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:43 -0700
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
Subject: [PATCH v3 05/11] PCI: Add pci_rebar_size_supported() helper
Date: Wed, 22 Oct 2025 16:33:25 +0300
Message-Id: <20251022133331.4357-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
References: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
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
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/pci/iov.c   |  7 +------
 drivers/pci/rebar.c | 25 +++++++++++++++++++------
 include/linux/pci.h |  1 +
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 77dee43b7858..02f4e9cd3fbe 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1339,7 +1339,6 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
  */
 int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 {
-	u32 sizes;
 	int ret;
 
 	if (!pci_resource_is_iov(resno))
@@ -1348,11 +1347,7 @@ int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
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
index 17e7b664c4ce..067cd75b394b 100644
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
@@ -231,7 +249,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
-	u32 sizes;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -245,11 +262,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
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
index 0a50912c5ce5..cf833daddaee 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1424,6 +1424,7 @@ int pci_release_resource(struct pci_dev *dev, int resno);
 int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
-- 
2.39.5

