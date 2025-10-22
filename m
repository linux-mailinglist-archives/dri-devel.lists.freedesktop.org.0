Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00EBFC2E8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92AF10E790;
	Wed, 22 Oct 2025 13:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNDavfcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383410E7AB;
 Wed, 22 Oct 2025 13:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761140131; x=1792676131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54u3PDRaemdPochxtkYh61DrCq3MZ1of0SKbBIseOrk=;
 b=nNDavfcVMSXcPb4qoUAlHJ37m9H3To0HRSvoTKGdKv8cEe/GiJAnhhGX
 1Kt81EpzcbOsrLb0nPNeo6S3+wiYEBNNWBbtLbwq7QeLiUvrx/kDXOuCo
 mlTDgcN3+SGsF1efVPxaUDF+axCh0yXKP3eT43uMq67ziTefM0k8yuEHP
 qtJ0U211tCAylK41GIrZHMlzTKtfeLf2yRKOW0Pir1wrJg2KofoYokE+K
 g23VUBs2va1oJCglNTlz89yyEI7uS0OirHt5jZfbWao+Q9HzYlX3w4DPu
 r/sJ0VXdlgLE3VZZSyOo+xzLMafFt9LJgxTRm/DTn1KmPqC7zEKAEgYy0 Q==;
X-CSE-ConnectionGUID: S7VMVIGiRK+KLF8qFh4jFw==
X-CSE-MsgGUID: eiXhZ7+LRiq4Adiva4I8KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63183420"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63183420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:35:31 -0700
X-CSE-ConnectionGUID: Z1bNbHoxR7iEueWz+MvvEw==
X-CSE-MsgGUID: LEJOV63XQySmg6mVyJyRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183580120"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:35:23 -0700
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
Subject: [PATCH v3 08/11] PCI: Add pci_rebar_get_max_size()
Date: Wed, 22 Oct 2025 16:33:28 +0300
Message-Id: <20251022133331.4357-9-ilpo.jarvinen@linux.intel.com>
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

Add pci_rebar_get_max_size() into PCI core to allow simplifying code
that wants to know the maximum possible size for a Resizable BAR.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/rebar.c | 23 +++++++++++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 067cd75b394b..1c30beb80f85 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -5,6 +5,7 @@
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/ioport.h>
@@ -142,6 +143,28 @@ bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
 }
 EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
 
+/**
+ * pci_rebar_get_max_size - get the maximum supported size of a BAR
+ * @pdev: PCI device
+ * @bar: BAR to query
+ *
+ * Get the largest supported size of a resizable BAR as a size.
+ *
+ * Returns: the maximum BAR size as defined in the PCIe spec (0=1MB, 31=128TB),
+ *	     or %-NOENT on error.
+ */
+int pci_rebar_get_max_size(struct pci_dev *pdev, int bar)
+{
+	u32 sizes;
+
+	sizes = pci_rebar_get_possible_sizes(pdev, bar);
+	if (!sizes)
+		return -ENOENT;
+
+	return __fls(sizes);
+}
+EXPORT_SYMBOL_GPL(pci_rebar_get_max_size);
+
 /**
  * pci_rebar_get_current_size - get the current size of a Resizable BAR
  * @pdev: PCI device
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cf833daddaee..61dcf5ff7df6 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1425,6 +1425,7 @@ int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
+int pci_rebar_get_max_size(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
-- 
2.39.5

