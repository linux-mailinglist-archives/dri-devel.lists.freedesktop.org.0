Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4022A83F89
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DF210E8C9;
	Thu, 10 Apr 2025 09:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="nmt5ASDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247F10E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:55:42 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A60F8Z032471;
 Thu, 10 Apr 2025 10:55:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=O
 PCc5bsUkhOjxSkKC0VEJsPaUv6CLcVy4YCCUXYPk5w=; b=nmt5ASDn9Cx8lIoML
 Zsgf0DP213vnpN+Rrpo+C/SD9NYkGFeyvbtDvfNnhBYXz5lfNgRO6JV+AH2svy3D
 bu4DnsZFnMuHBms7kiu6Sl7meFCQwyELj8bXLEN0GH9vL7qV+6BatVqhqSyTUADI
 6HY0GSxy2QygBkOW9z8OFGBjqaHrQhUsO9mnNL966woicAF9WnR/N3oaGM2FhzD1
 smW0F+BPq4o7ZqSv/dE31X/6c0mwJpX+UwO44GTVEYIVc5zuubl7a/Ri6V4N9f+E
 iUG6sNaVCwHfwdlfMYXmuntpVmPQMII1Etc9XGxOYgUL3GslX6D24eQ8L2XU8Evz
 JVjEw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45w86h1d34-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Apr 2025 10:55:31 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:28 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:14 +0100
Subject: [PATCH v6 15/18] drm/imagination: Use cached memory with dma_coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-15-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5416;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=oXgKG7puAsM6iPgFGgfa6QIBdh7qPncOh3LUqY7AuMg=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9o0wWM6p+r8yeVmTiuFefvDjRpm1t0O8G/XP/trX
 oGULHN+RykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEykbx3D/2ibiGU/g80uTN51
 6xTnPOGNtkvDZq9o5W2Qa2f0Fd1rw8bwh3v/xmj9Qxe5d9Rp7at9csz+4DHnjS0BB/bOOi216PI
 fETYA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MLNgmNZl c=1 sm=1 tr=0 ts=67f79593 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=DhOxMJxG4ji0TGcJNekA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: lBKgYrHROR18R_-NbROR0Tg9GX12cm1b
X-Proofpoint-ORIG-GUID: lBKgYrHROR18R_-NbROR0Tg9GX12cm1b
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

The TI k3-j721s2 platform does not allow us to use uncached memory
(which is what the driver currently does) without disabling cache snooping
on the AXI ACE-Lite interface, which would be too much of a performance
hit.

Given the platform is dma-coherent, we can simply force all
device-accessible memory allocations through the CPU cache. In fact, this
can be done whenever the dma_coherent attribute is present.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-15-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-15-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-15-143b3dbef02f@imgtec.com
Changes in v3:
- Change from a workaround to a regular codepath
- Add missing <linux/property.h> include
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-19-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-19-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_gem.c | 10 +++++++---
 drivers/gpu/drm/imagination/pvr_gem.h |  6 ++++--
 drivers/gpu/drm/imagination/pvr_mmu.c |  8 +++++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index f692a41875507232ee6e844ccb1f980425f2e9b7..a66cf082af2445044beb286c2d5350849512adb1 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -19,6 +19,7 @@
 #include <linux/log2.h>
 #include <linux/mutex.h>
 #include <linux/pagemap.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/scatterlist.h>
 
@@ -334,6 +335,7 @@ struct drm_gem_object *pvr_gem_create_object(struct drm_device *drm_dev, size_t
 struct pvr_gem_object *
 pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct drm_gem_shmem_object *shmem_obj;
 	struct pvr_gem_object *pvr_obj;
 	struct sg_table *sgt;
@@ -343,7 +345,10 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 	if (size == 0 || !pvr_gem_object_flags_validate(flags))
 		return ERR_PTR(-EINVAL);
 
-	shmem_obj = drm_gem_shmem_create(from_pvr_device(pvr_dev), size);
+	if (device_get_dma_attr(drm_dev->dev) == DEV_DMA_COHERENT)
+		flags |= PVR_BO_CPU_CACHED;
+
+	shmem_obj = drm_gem_shmem_create(drm_dev, size);
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 
@@ -358,8 +363,7 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 		goto err_shmem_object_free;
 	}
 
-	dma_sync_sgtable_for_device(shmem_obj->base.dev->dev, sgt,
-				    DMA_BIDIRECTIONAL);
+	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
 
 	/*
 	 * Do this last because pvr_gem_object_zero() requires a fully
diff --git a/drivers/gpu/drm/imagination/pvr_gem.h b/drivers/gpu/drm/imagination/pvr_gem.h
index e0e5ea509a2e88a437b8d241ea13c7bab2220f56..c99f30cc62088c030bd8a806df79b738b62a968f 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.h
+++ b/drivers/gpu/drm/imagination/pvr_gem.h
@@ -44,8 +44,10 @@ struct pvr_file;
  * Bits not defined anywhere are "undefined".
  *
  * CPU mapping options
- *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set this
- *       flag to override this behaviour and map the object cached.
+ *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set
+ *       this flag to override this behaviour and map the object cached. If the dma_coherent
+ *       property is present in devicetree, all allocations will be mapped as if this flag was set.
+ *       This does not require any additional consideration at allocation time.
  *
  * Firmware options
  *    :PVR_BO_FW_NO_CLEAR_ON_RESET: By default, all FW objects are cleared and reinitialised on hard
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 4fe70610ed94cf707e631f8148af081a94f97327..450d476d183f0173d0ef03f0d8897fbeb04831a2 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -17,6 +17,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/kmemleak.h>
 #include <linux/minmax.h>
+#include <linux/property.h>
 #include <linux/sizes.h>
 
 #define PVR_SHIFT_FROM_SIZE(size_) (__builtin_ctzll(size_))
@@ -259,6 +260,7 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 	struct device *dev = from_pvr_device(pvr_dev)->dev;
 
 	struct page *raw_page;
+	pgprot_t prot;
 	int err;
 
 	dma_addr_t dma_addr;
@@ -268,7 +270,11 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 	if (!raw_page)
 		return -ENOMEM;
 
-	host_ptr = vmap(&raw_page, 1, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	prot = PAGE_KERNEL;
+	if (device_get_dma_attr(dev) != DEV_DMA_COHERENT)
+		prot = pgprot_writecombine(prot);
+
+	host_ptr = vmap(&raw_page, 1, VM_MAP, prot);
 	if (!host_ptr) {
 		err = -ENOMEM;
 		goto err_free_page;

-- 
2.49.0

