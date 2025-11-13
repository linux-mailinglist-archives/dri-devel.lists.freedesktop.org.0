Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E02C59566
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAE10E91E;
	Thu, 13 Nov 2025 18:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X45YUh3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3027D10E91C;
 Thu, 13 Nov 2025 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763057015; x=1794593015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+MXZ4DY1vw/qz4xqKxtxsAAGCa9o+jzDmGdXpGbA0I=;
 b=X45YUh3wQCUPgQJC29oDCFxEV+xpKBuXoKGpAsTgOoLteAJNIB6aA/Nu
 tqezzy2IUa1gsIoEVgZlDYGrhpFytm4X8s8uE0yQq8L3Rik+BI2/SLavm
 N+Uj1n7SidYknUzogBNU64T140pRcrxEFX21ggrWIPkBN3rmp0w6Au9YV
 r90HB2eFVR79/RLSzIAVehwnrMeWzneWuok81QQCtJmCZz79WUxqCKa78
 0m7KYHQWZgBDmrT7ZNbyPi/PCxLVpNfH/MMMJ2dUSOX+MbNvbD+PXwrz+
 SteaEgzIPF4buluVBkVSEcz+rbIT3TNL9+oAZwVYGMMTMvwe22PbnOBBI Q==;
X-CSE-ConnectionGUID: igoaKlFeQqu/gJ2ABlk8iA==
X-CSE-MsgGUID: +IoblAnYSNiXqJDByyMVcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65186451"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65186451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:03:34 -0800
X-CSE-ConnectionGUID: 4jHij2NnTPunN/MfNXLzSQ==
X-CSE-MsgGUID: T9yigM35Qiyv2xnabZItlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194001432"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:03:27 -0800
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 11/11] PCI: Convert BAR sizes bitmasks to u64
Date: Thu, 13 Nov 2025 20:00:53 +0200
Message-Id: <20251113180053.27944-12-ilpo.jarvinen@linux.intel.com>
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

PCIe r7.0, sec 7.8.6, defines resizable BAR sizes beyond the currently
supported maximum of 128TB, which will require more than u32 to store the
entire bitmask.

Convert Resizable BAR related functions to use u64 bitmask for BAR sizes to
make the typing more future-proof.

The support for the larger BAR sizes themselves is not added at this point.

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
index 524469f8a4bd..10f8a73e190b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -69,7 +69,7 @@ static void resize_vram_bar(struct xe_device *xe)
 
 		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
 			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
 				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
 				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
 				 (u64)current_size >> 20);
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 71ed85d38508..00784a60ba80 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1367,7 +1367,7 @@ EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
 u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
 {
 	u64 vf_len = pci_resource_len(dev, resno);
-	u32 sizes;
+	u64 sizes;
 
 	if (!num_vfs)
 		return 0;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 2a1b5456c2dc..cb512bf0df7c 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1587,7 +1587,7 @@ static ssize_t __resource_resize_show(struct device *dev, int n, char *buf)
 	pci_config_pm_runtime_get(pdev);
 
 	ret = sysfs_emit(buf, "%016llx\n",
-			 (u64)pci_rebar_get_possible_sizes(pdev, n));
+			 pci_rebar_get_possible_sizes(pdev, n));
 
 	pci_config_pm_runtime_put(pdev);
 
diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index d85d458c7007..8f7af3053cd8 100644
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
index 898bc3a4e8e7..4b7f4c08b5c7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1423,7 +1423,7 @@ int pci_release_resource(struct pci_dev *dev, int resno);
 /* Resizable BAR related routines */
 int pci_rebar_bytes_to_size(u64 bytes);
 resource_size_t pci_rebar_size_to_bytes(int size);
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+u64 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size);
 int pci_rebar_get_max_size(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size,
-- 
2.39.5

