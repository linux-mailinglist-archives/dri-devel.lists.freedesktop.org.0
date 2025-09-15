Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57858B5746B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B4710E3BD;
	Mon, 15 Sep 2025 09:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnADh7kL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263AF10E3BD;
 Mon, 15 Sep 2025 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927808; x=1789463808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMC8x2eBSJ4UoaxkrrTOqREVcL7ID4H/ORR4uPkIaKs=;
 b=AnADh7kL0Z6Y9dUgxb//Hgk/g5oah9T4FLyVaJ5KCCZ15jRKJ1Xhj3BG
 9OTEzMfH1zUELSUgQxyaXSq2UBj5b+rH7YB0SMYUbKwkq6SgjNKPUX7TV
 zGIaLlmU4F7YFFlv+t1Cx2jx9cM3Yx68Hli3VEMvJzu+0Q84GcXTm5W9h
 nXKRYB+4iBA938zy03M9hSyz3dyMmAmwBL+Y3rQ7acAwM1VYOXYktN7zl
 6F9rCEsVQinf/63MuOVNtsijwE6DKJU5Bom4Xg4W0DyDi5C8POQveCK/Q
 NZJGyk1Zas389jgS6uIQQmMRZMdX6jXsPHjNtNS1fD8NE9xqB+8xougt8 Q==;
X-CSE-ConnectionGUID: soG3mojCRjW5RdwFZiH9LQ==
X-CSE-MsgGUID: TIZnINDzQIKMKwaE46MjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="70857641"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="70857641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:16:47 -0700
X-CSE-ConnectionGUID: 0w9WvEPQRPa+8YXnCTITGQ==
X-CSE-MsgGUID: SJZwvFJSQ4O4aV07xwZEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174392724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:16:39 -0700
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
Subject: [PATCH v2 11/11] PCI: Convert BAR sizes bitmasks to u64
Date: Mon, 15 Sep 2025 12:13:58 +0300
Message-Id: <20250915091358.9203-12-ilpo.jarvinen@linux.intel.com>
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

PCIe r6.2 section 7.8.6 defines resizable BAR sizes beyond the
currently supported maximum of 128TB which will require more than u32
to store the entire bitmask.

Convert Resizable BAR related functions to use u64 bitmask for BAR
sizes to make the typing more future-proof.

The support for the larger BAR sizes themselves is not added at this
point.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 2 +-
 drivers/pci/iov.c            | 2 +-
 drivers/pci/pci-sysfs.c      | 2 +-
 drivers/pci/rebar.c          | 4 ++--
 include/linux/pci.h          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index ca02744fb369..22b998727eb2 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -70,7 +70,7 @@ static void resize_vram_bar(struct xe_device *xe)
 
 		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
 			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
 				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
 				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
 				 (u64)current_size >> 20);
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 51844a9176a0..d2741c4f3315 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1370,7 +1370,7 @@ EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
 u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
 {
 	u64 vf_len = pci_resource_len(dev, resno);
-	u32 sizes;
+	u64 sizes;
 
 	if (!num_vfs)
 		return 0;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 5eea14c1f7f5..b6920114d538 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1544,7 +1544,7 @@ static ssize_t __resource_resize_show(struct device *dev, int n, char *buf)
 	pci_config_pm_runtime_get(pdev);
 
 	ret = sysfs_emit(buf, "%016llx\n",
-			 (u64)pci_rebar_get_possible_sizes(pdev, n));
+			 pci_rebar_get_possible_sizes(pdev, n));
 
 	pci_config_pm_runtime_put(pdev);
 
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 27185892ada4..ea8620e4bc18 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -105,7 +105,7 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
  * Return: A bitmask of possible sizes (bit 0=1MB, bit 31=128TB), or %0 if
  *	   BAR isn't resizable.
  */
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
+u64 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 {
 	int pos;
 	u32 cap;
@@ -155,7 +155,7 @@ EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
  */
 int pci_rebar_get_max_size(struct pci_dev *pdev, int bar)
 {
-	u32 sizes;
+	u64 sizes;
 
 	sizes = pci_rebar_get_possible_sizes(pdev, bar);
 	if (!sizes)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index a4236aafad24..bb10c7eb49e2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1422,7 +1422,7 @@ void pci_release_resource(struct pci_dev *dev, int resno);
 /* Resizable BAR related routines */
 int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+u64 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
 int pci_rebar_get_max_size(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
-- 
2.39.5

