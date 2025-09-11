Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7600B52AC1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800A310EA2E;
	Thu, 11 Sep 2025 07:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F20kHkx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACA610EA2D;
 Thu, 11 Sep 2025 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577421; x=1789113421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9So9Hm4LfyEfIeY7RhapjfQ3Ukt2khYOZJ5HNT4ZOg=;
 b=F20kHkx1upcmBQDBJBX366c9Q8l1dikIi/38S53viXeimnvaKDzsabWk
 dG1U3rphP3x38OXQT2+m7543FlMX4o5yEFgmdaTj5kQaRFW7CoM9TQ5OO
 o49QGJqic2AzQspYdfDj7MI76Yn16CPYBcOFNj3xosoGqOQHmy2rKMbZZ
 yqeag8ivyaLYZmVh4OWVUqQ4hWJHOK6vpx4sEY+CHLTGC0xFUDIHJnpNJ
 8lQMQ7/mEuJ+fq0QVcLgLRPXoOQ30RXzlROQafsI2MxBYmTbtcrui/uMR
 ah8oQ/sxFGPCMhYWb/VF3TUaF3sfRjS2EMCQfks2NX3v+magD7eHR83yN w==;
X-CSE-ConnectionGUID: fhkElNktS6KNY5x4fVBfJA==
X-CSE-MsgGUID: ZaFnirrNR0qVuX65u70MPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60012551"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="60012551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:57:00 -0700
X-CSE-ConnectionGUID: Xi6o+mGtSoq8d0LXCBXrgw==
X-CSE-MsgGUID: jIW8wEXmQkKG4CBqPlAaKw==
X-ExtLoop1: 1
Received: from opintica-mobl1 (HELO localhost) ([10.245.245.187])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:56:52 -0700
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
Subject: [PATCH 03/11] PCI: Move pci_rebar_size_to_bytes() and export it
Date: Thu, 11 Sep 2025 10:55:57 +0300
Message-Id: <20250911075605.5277-4-ilpo.jarvinen@linux.intel.com>
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

pci_rebar_size_to_bytes() is in drivers/pci/pci.h but would be useful
for endpoint drivers as well.

Move the function into rebar.c and export it.

In addition, convert the literal to where the number comes from
(PCI_REBAR_MIN_SIZE).

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
index 961bd43be02b..020ed7a1b3aa 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -35,6 +35,18 @@ int pci_rebar_bytes_to_size(u64 bytes)
 }
 EXPORT_SYMBOL_GPL(pci_rebar_bytes_to_size);
 
+/**
+ * pci_rebar_size_to_bytes - Convert BAR Size to bytes
+ * @size: BAR Size as defined in the PCIe spec (0=1MB, bit 31=128TB)
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

