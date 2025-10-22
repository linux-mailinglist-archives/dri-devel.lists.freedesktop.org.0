Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53436BFC2B2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDA410E78D;
	Wed, 22 Oct 2025 13:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjKLXAB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45910E789;
 Wed, 22 Oct 2025 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140052; x=1792676052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NnK9to6RIZmxaZL3gi7Oswhg9ylc7A55F0MMZSj83l4=;
 b=SjKLXAB0bLY9r2xy4sf6AbUNixv0gsDckG6OFOcG+b73Zdwqb0tba0kK
 g0WT4e25KW1Hwn+ut81NczbfSnJZyEGXJLBNxjR3WzRaHi5cuzZBDkrVl
 xTdvzTfCZ1WyuphCf0ED8FC2DbR6/Zrar02BRZMrEzmP5kWqU1+Ncz57x
 rifDvbwZAHJCrepPkwDt3mo0GbL9FYa7qQ2XRVmb+sdWeOJmiJOEZ1shh
 0FkchFY4vNOqns/NsU14Nj8kf8QiX1F8lqlY/piNpQPD6UANcmswAyTpq
 43BW7vAO19AsjzGu06EU7ejfd0uk9ZM+IIpt2iAcW0enX61+S93ZhK5PW A==;
X-CSE-ConnectionGUID: GQtMzAzRQiyAaY1t8SpQNg==
X-CSE-MsgGUID: nMArYIWOSwK1SHVVFb7iBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67152370"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="67152370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:12 -0700
X-CSE-ConnectionGUID: uPn5dYWYTCeb9BTPiqzFNA==
X-CSE-MsgGUID: RZoJpDH8TLKqnY+DttFJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189001328"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:34:04 -0700
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
Subject: [PATCH v3 02/11] PCI: Cleanup pci_rebar_bytes_to_size() and move into
 rebar.c
Date: Wed, 22 Oct 2025 16:33:22 +0300
Message-Id: <20251022133331.4357-3-ilpo.jarvinen@linux.intel.com>
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

Move pci_rebar_bytes_to_size() from include/linux/pci.h into rebar.c as
it does not look very trivial and is not expected to be performance
critical.

Convert literals to use a newly added PCI_REBAR_MIN_SIZE define.

Also add kernel doc for the function as the function is exported.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <mjruhl@habana.ai>
---
 drivers/pci/rebar.c | 23 +++++++++++++++++++++++
 include/linux/pci.h | 10 +++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 8deee5bb33fa..342b47022a5a 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -7,11 +7,34 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/ioport.h>
+#include <linux/log2.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include "pci.h"
 
+#define PCI_REBAR_MIN_SIZE	((resource_size_t)SZ_1M)
+
+/**
+ * pci_rebar_bytes_to_size - Convert size in bytes to PCI BAR Size
+ * @bytes: size in bytes
+ *
+ * Convert bytes to BAR Size in Resizable BAR Capability (PCIe r6.2,
+ * sec. 7.8.6.3).
+ *
+ * Return: BAR Size as defined in the PCIe spec (0=1MB, 31=128TB).
+ */
+int pci_rebar_bytes_to_size(u64 bytes)
+{
+	int rebar_minsize = ilog2(PCI_REBAR_MIN_SIZE);
+
+	bytes = roundup_pow_of_two(bytes);
+
+	return max(ilog2(bytes), rebar_minsize) - rebar_minsize;
+}
+EXPORT_SYMBOL_GPL(pci_rebar_bytes_to_size);
+
 void pci_rebar_init(struct pci_dev *pdev)
 {
 	pdev->rebar_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e..540221d0df0b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1419,16 +1419,12 @@ void pcibios_reset_secondary_bus(struct pci_dev *dev);
 void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
 int pci_release_resource(struct pci_dev *dev, int resno);
-static inline int pci_rebar_bytes_to_size(u64 bytes)
-{
-	bytes = roundup_pow_of_two(bytes);
-
-	/* Return BAR size as defined in the resizable BAR specification */
-	return max(ilog2(bytes), 20) - 20;
-}
 
+/* Resizable BAR related routines */
+int pci_rebar_bytes_to_size(u64 bytes);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
+
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
 bool pci_device_is_present(struct pci_dev *pdev);
 void pci_ignore_hotplug(struct pci_dev *dev);
-- 
2.39.5

