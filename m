Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A296B5744A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6CB10E347;
	Mon, 15 Sep 2025 09:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnLubFCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833DD10E340;
 Mon, 15 Sep 2025 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927696; x=1789463696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+6Fv0qxouEzFgCczwmS+CHk+F/6UXgZ5FbJQnoSQiI=;
 b=HnLubFCasvw5tqdrBPKArMEev+/C3K2g3J38/pxfBGcp2vQefO26zZDQ
 WlzefTDiLiRZB19shvII0msp8/9uf4/0Ps9bBY/uiZ62dRi2EXTQzFX3h
 I3tDz9UxMscmhqWBOj8IwRB2O7J1M8jRwhpsa5+AkiG2EdXwBdaCZaXD/
 7TLDGW3dx58qbrbvosdpzPosnZ5TDU+N/OUkIVTqNc7EQBbhajciACCq5
 XNJVGFbgWn1UAYVIfHubnb0T6efVhcGmfMzOnQiCSexiTLI9Wa/GbyxRD
 jQsJxQrSJYyQcTZwZOtOD3DmsQNlqFzbkYthht1Bj16fTzpXhK3dJ3sqm A==;
X-CSE-ConnectionGUID: I0W2bzk8RZ2kc7xu8G+rvg==
X-CSE-MsgGUID: +qUtt3aUTOq8AAWLiqoVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="82764132"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="82764132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:14:56 -0700
X-CSE-ConnectionGUID: 9p4wvxzCTjSTRXPNbUs6gg==
X-CSE-MsgGUID: pO2yxNeVQzCC0NO0XMHi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="173860751"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:14:47 -0700
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
Subject: [PATCH v2 03/11] PCI: Move pci_rebar_size_to_bytes() and export it
Date: Mon, 15 Sep 2025 12:13:50 +0300
Message-Id: <20250915091358.9203-4-ilpo.jarvinen@linux.intel.com>
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

pci_rebar_size_to_bytes() is in drivers/pci/pci.h but would be useful
for endpoint drivers as well.

Move the function into rebar.c and export it.

In addition, convert the literal to where the number comes from
(PCI_REBAR_MIN_SIZE).

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/pci.h   |  4 ----
 drivers/pci/rebar.c | 12 ++++++++++++
 include/linux/pci.h |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f1b30414b2f1..3d5068d6e195 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -929,10 +929,6 @@ void pci_rebar_init(struct pci_dev *pdev);
 void pci_restore_rebar_state(struct pci_dev *pdev);
 int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size);
-static inline u64 pci_rebar_size_to_bytes(int size)
-{
-	return 1ULL << (size + 20);
-}
 
 struct device_node;
 
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 95e00d8e0c89..0c943d9e3a08 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -35,6 +35,18 @@ int pci_rebar_bytes_to_size(u64 bytes)
 }
 EXPORT_SYMBOL_GPL(pci_rebar_bytes_to_size);
 
+/**
+ * pci_rebar_size_to_bytes - Convert BAR Size to bytes
+ * @size: BAR Size as defined in the PCIe spec (0=1MB, 31=128TB)
+ *
+ * Return: BAR size in bytes.
+ */
+resource_size_t pci_rebar_size_to_bytes(int size)
+{
+	return 1ULL << (size + ilog2(PCI_REBAR_MIN_SIZE));
+}
+EXPORT_SYMBOL_GPL(pci_rebar_size_to_bytes);
+
 void pci_rebar_init(struct pci_dev *pdev)
 {
 	pdev->rebar_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 894e9020b07d..6f0c31290675 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1421,6 +1421,7 @@ void pci_release_resource(struct pci_dev *dev, int resno);
 
 /* Resizable BAR related routines */
 int pci_rebar_bytes_to_size(u64 bytes);
+resource_size_t pci_rebar_size_to_bytes(int size);
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 
-- 
2.39.5

