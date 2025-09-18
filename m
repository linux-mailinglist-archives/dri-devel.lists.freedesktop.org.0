Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603FB86F97
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 22:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D2810E906;
	Thu, 18 Sep 2025 20:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoW9O0kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A4810E901;
 Thu, 18 Sep 2025 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758229162; x=1789765162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1N5u2uZNEdRh0AXqZeut8mXdoEDnRWB0FRWb3AvMEI4=;
 b=IoW9O0kGIMZmkPoO8HfhUu0emumfa9OtOeqf4v/GOtmVwtZVdyukHfOz
 5ERcCzNXgbyrY3E/BeRTTI4HIF1WzXNbcQtoY4m8+jreOsHAd2RSlS/zK
 jBVTlV2rGorHw/UwtCdXP5+4qOfnzzEShS3427l9ifwegCh49RDybfaqD
 2YWRdiPAB/waLdytERjmcKL6HFC/Ga6MGk+6rM1m0UlXw4HsGUmK8zmFZ
 ChLqtbT1kLs/fsnyfRzO9YJABtdCk/YlKsXzb/BAe3i4L6kQODjRMB5UI
 DzIIjXYtoD14jur8VkBG5TwRpdBiV5rB+r7Q3YvUbccM5jFc2dW0UQVv0 A==;
X-CSE-ConnectionGUID: 8/Lu/xA9SVSo14sH7uoU8g==
X-CSE-MsgGUID: WaByRdMYTeeVOIwzKIPeFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="63205067"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="63205067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 13:59:21 -0700
X-CSE-ConnectionGUID: Esn+u7iERu+JPTUxHhRfjA==
X-CSE-MsgGUID: qB58IITmT4OlWH96t96TrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="174915020"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 13:59:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Simon Richter <Simon.Richter@hogyros.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/xe: Move rebar to be done earlier
Date: Thu, 18 Sep 2025 13:58:57 -0700
Message-ID: <20250918-xe-pci-rebar-2-v1-2-6c094702a074@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

There may be cases in which the BAR0 also needs to move to accommodate
the bigger BAR2. However if it's not released, the BAR2 resize fails.
During the vram probe it can't be released as it's already in use by
xe_mmio for early register access.

Add a new function in xe_vram and let xe_pci call it directly before
even early device probe. This allows the BAR2 to resize in cases BAR0
also needs to move:

	[] xe 0000:03:00.0: vgaarb: deactivate vga console
	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
	[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x44007fffff 64bit pref]
	[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
	[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000 dgfx:1 gfx:Xe2_HPG (20.02) ...

As shown above, it happens even before we try to read any register for
platform identification.

All the rebar logic is more pci-specific than xe-specific and can be
done very early in the probe sequence. In future it would be good to
move it out of xe_vram.c, but this refactor is left for later.

Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: <stable@vger.kernel.org> # 6.12+
Link: https://lore.kernel.org/intel-xe/fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- Use res->parent to test resource assignment and avoid resetting
  resources unnecessarily (Ilpo)
- Use pci_dev_for_each_resource() to loop through the resources and
  release resource with same type as lmembar (Ilpo)
---
 drivers/gpu/drm/xe/xe_pci.c  |  2 ++
 drivers/gpu/drm/xe/xe_vram.c | 34 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vram.h |  1 +
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 77bee811a1501..95c8aafc0810e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -868,6 +868,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_vram_resize_bar(xe);
+
 	err = xe_device_probe_early(xe);
 	/*
 	 * In Boot Survivability mode, no drm card is exposed and driver
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedbb..652df7a5f4f65 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -26,15 +26,35 @@
 
 #define BAR_SIZE_SHIFT 20
 
-static void
-_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+/*
+ * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
+ * assigned IORESOURCE_MEM_64 BARs
+ */
+static void release_bars(struct pci_dev *pdev)
+{
+	struct resource *res;
+	int i;
+
+	pci_dev_for_each_resource(pdev, res, i) {
+		/* Resource already un-assigned, do not reset it */
+		if (!res->parent)
+			continue;
+
+		/* No need to release unrelated BARs */
+		if (!(res->flags & IORESOURCE_MEM_64))
+			continue;
+
+		pci_release_resource(pdev, i);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int bar_size = pci_rebar_bytes_to_size(size);
 	int ret;
 
-	if (pci_resource_len(pdev, resno))
-		pci_release_resource(pdev, resno);
+	release_bars(pdev);
 
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
@@ -50,7 +70,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  * if force_vram_bar_size is set, attempt to set to the requested size
  * else set to maximum possible size
  */
-static void resize_vram_bar(struct xe_device *xe)
+void xe_vram_resize_bar(struct xe_device *xe)
 {
 	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -119,7 +139,7 @@ static void resize_vram_bar(struct xe_device *xe)
 	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
 
-	_resize_bar(xe, LMEM_BAR, rebar_size);
+	resize_bar(xe, LMEM_BAR, rebar_size);
 
 	pci_assign_unassigned_bus_resources(pdev->bus);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
@@ -148,8 +168,6 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 		return -ENXIO;
 	}
 
-	resize_vram_bar(xe);
-
 	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
 	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
 	if (!lmem_bar->io_size)
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 72860f714fc66..13505cfb184dc 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,6 +11,7 @@
 struct xe_device;
 struct xe_vram_region;
 
+void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);

-- 
2.50.1

