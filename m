Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4EB57460
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32010E3A3;
	Mon, 15 Sep 2025 09:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azdfyOHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0810E35B;
 Mon, 15 Sep 2025 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927760; x=1789463760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJY4djo7eguzCOM2nO94dvcUe+mrAxeDCViFz7bzar8=;
 b=azdfyOHZI6pNmPs3FfOopKUogsJ9XH6zLKnzKmdwo0hHKUJ1Ezik5EWC
 rPsutpxDg1E5Nbznt5zvAdIZRR9nrBhAk1E4+I3NTI56LHSuMcszVoG0o
 TdQLFMT49kYv78we3eeOmZ/CdJVLy1bRTL5G15ueV72MHomPMj6dwigW0
 83OdNGKjcCmj+jIDWTjfm9rbFa6r2PBQEb576Yc8k0Wi6il+uOVb2z6ai
 3jlPad8RMvtYys45Vsk3zHNX1pWk3fs0KnxbPyfwNwkRfv4/8P8pvPlFh
 4v6Fpdoz1Yy0vyTS+vKevHy7Q3W9lh/ngPRDiAXlpfPgCGo9bPyFeKOpI g==;
X-CSE-ConnectionGUID: yz3wHRL3ROmMYfBvyCw2/Q==
X-CSE-MsgGUID: 8QMz2z7sSMuNRc6QB18A5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59401340"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="59401340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:15:59 -0700
X-CSE-ConnectionGUID: AeOe3DUOSxy6O09tWHlr1g==
X-CSE-MsgGUID: YoiRCdCPQPa9rHSu4f3y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="175364064"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:15:52 -0700
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
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 08/11] PCI: Add pci_rebar_get_max_size()
Date: Mon, 15 Sep 2025 12:13:55 +0300
Message-Id: <20250915091358.9203-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
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
index 81e01cbadde7..27185892ada4 100644
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
index 917c3b897739..a4236aafad24 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1424,6 +1424,7 @@ int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
+int pci_rebar_get_max_size(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
-- 
2.39.5

