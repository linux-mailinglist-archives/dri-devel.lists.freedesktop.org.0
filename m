Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AAE9BD148
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CE710E5D7;
	Tue,  5 Nov 2024 15:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="B+9dEdqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8BB10E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 15:58:49 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5EF3v6003827;
 Tue, 5 Nov 2024 15:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=v
 TBNXwShOctAnRg444GiJWE4kZLTZvEaedRuNtFLN3I=; b=B+9dEdqsy7ci6naDA
 rPwVDC9hY6kmM4Rl0iWo97WhAzU1ZulMifDNAKxEUzitpXkfBx1nrrkHkqza0GBv
 558F18NAD/cWq1nnd8wWCnhrcWmjebUkiIx21ycl7DlIuIxg34q8X5LqfLGJEUVw
 ZG/RlUQ8LLMXrqgUyUyR2h5iW5J3HKiZI7IymzBcfPAmeApUZeTbHpjUmMNUJhP1
 MjJDzDijs+tFkUZyozFwGPACGOnVuxsXBNkWAKoZOELa3mqmH35D+jMiLXalkXVI
 EI4aLjiSDW16aHrGf/opKZ2uq+Nbr64AaHIngPBIF/R5CHDpUihvUX9LS1u3LB4U
 wtE3w==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42nb7wta0y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Nov 2024 15:58:39 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:37 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:25 +0000
Subject: [PATCH 19/21] drm/imagination: Add device_memory_force_cpu_cached
 override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-19-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6916;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=7Jh8O6t/depA4EIHEpaCD9RLKpiLBdRO6OyeujP1TNw=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcwvq71c8PzusrqEjxI2N0/zef164rGpa//6XZcO5
 t3yUryd1VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATeaDA8M9y4/HkUyaLqn4U
 7O1cJPq184xMl/UvDhm9TVu3Vm3Wc6xmZJhxulHKeVvG8rr+hfG2Gi07eZ8trzmd/sTL9OKBowo
 ee7kB
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=ddzS3mXe c=1 sm=1 tr=0 ts=672a40af cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8
 a=ZhBkjoDcyXaoxMow2pUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: mursqpEUzF4oJanQnaLTYxiOI0KBYfu0
X-Proofpoint-ORIG-GUID: mursqpEUzF4oJanQnaLTYxiOI0KBYfu0
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

The TI k3-j721s2 platform has a bug relating to cache snooping on the AXI
ACE-Lite interface. Disabling cache snooping altogether would also resolve
the issue, but is considered more of a performance hit.

Given the platform is dma-coherent, forcing all device-accessible memory
allocations through the CPU cache is the preferred solution.

Implement this workaround so that it can later be enabled for the TI
k3-j721s2 platform.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 11 ++++++++++-
 drivers/gpu/drm/imagination/pvr_device.h | 11 +++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  2 +-
 drivers/gpu/drm/imagination/pvr_gem.c    |  3 +++
 drivers/gpu/drm/imagination/pvr_gem.h    |  7 +++++--
 drivers/gpu/drm/imagination/pvr_mmu.c    |  7 ++++++-
 6 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 2ce46b9a8ab7609faebeeb4e7820751b00047806..ffc177c383c1be16061eff0290c347918b0991f7 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -24,6 +24,7 @@
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
@@ -635,6 +636,7 @@ bool
 pvr_device_overrides_validate(struct pvr_device *pvr_dev,
 			      const struct pvr_device_overrides *overrides)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	bool ret = true;
 
 	/*
@@ -643,7 +645,14 @@ pvr_device_overrides_validate(struct pvr_device *pvr_dev,
 	 *
 	 * Note that this function may be called early during device initialization
 	 * so it should not be assumed that @pvr_dev is ready for normal use yet.
-	 */
+	*/
+
+	if (overrides->device_memory_force_cpu_cached &&
+	    device_get_dma_attr(drm_dev->dev) != DEV_DMA_COHERENT) {
+		drm_err(drm_dev,
+			"Specifying device_memory_force_cpu_cached override without dma-coherent attribute is unsupported.");
+		ret = false;
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ad0a02a37154099542247dfc62f411c10f4e41f4..7ae14899db24f4c747e8cf4d61d252eb403713f4 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -60,8 +60,19 @@ struct pvr_fw_version {
 /**
  * struct pvr_device_overrides - Hardware-level overrides loaded from
  * MODULE_DEVICE_TABLE() or similar.
+ *
+ * @device_memory_force_cpu_cached: By default, all device memory buffer objects
+ * are mapped write-combined on the CPU (see %PVR_BO_CPU_CACHED) including MMU
+ * page table backing pages which do not use the regular device memory objects.
+ * This override forces all CPU mappings to be mapped cached instead. Since this
+ * could require additional cache maintenance operations to be performed,
+ * pvr_device_overrides_validate() ensures that the dma-coherent attribute is
+ * set when this override is specified. Required on some TI platforms where a
+ * bug causes device-to-cpu cache snooping to behave incorrectly when
+ * interacting with cpu-uncached memory.
  */
 struct pvr_device_overrides {
+	bool device_memory_force_cpu_cached;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index b56ee2cda9b54c4388a6eef38b0ff81acdb05874..e074cfb0d2055b5387dbb142ca972108977f9854 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1490,7 +1490,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 	pvr_power_domains_fini(pvr_dev);
 }
 
-static const struct pvr_device_overrides pvr_device_overrides_default = {};
+static const struct pvr_device_overrides pvr_device_overrides_default = { 0 };
 
 /*
  * Always specify &pvr_device_overrides_default instead of %NULL for &struct of_device_id->data so
diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index 6a8c81fe8c1e85c2130a4fe90fce35b6a2be35aa..c67c30518f89af3de2e617a9b65e5cd78870fa2c 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -345,6 +345,9 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 	if (size == 0 || !pvr_gem_object_flags_validate(flags))
 		return ERR_PTR(-EINVAL);
 
+	if (PVR_HAS_OVERRIDE(pvr_dev, device_memory_force_cpu_cached))
+		flags |= PVR_BO_CPU_CACHED;
+
 	shmem_obj = drm_gem_shmem_create(from_pvr_device(pvr_dev), size);
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
diff --git a/drivers/gpu/drm/imagination/pvr_gem.h b/drivers/gpu/drm/imagination/pvr_gem.h
index e0e5ea509a2e88a437b8d241ea13c7bab2220f56..9b3cbcbe48dfbbc8be211a8a409699a43452e178 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.h
+++ b/drivers/gpu/drm/imagination/pvr_gem.h
@@ -44,8 +44,11 @@ struct pvr_file;
  * Bits not defined anywhere are "undefined".
  *
  * CPU mapping options
- *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set this
- *       flag to override this behaviour and map the object cached.
+ *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set
+ *       this flag to override this behaviour and map the object cached. If
+ *       &struct pvr_device_overrides->device_memory_force_cpu_cached is specified, all allocations
+ *       will be mapped as if this flag was set. This does not require any additional consideration
+ *       at allocation time since the override is only valid if the dma-coherent attribute is set.
  *
  * Firmware options
  *    :PVR_BO_FW_NO_CLEAR_ON_RESET: By default, all FW objects are cleared and reinitialised on hard
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 4fe70610ed94cf707e631f8148af081a94f97327..7c7deb29b735308eaed26900f2f54a838382c255 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -259,6 +259,7 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 	struct device *dev = from_pvr_device(pvr_dev)->dev;
 
 	struct page *raw_page;
+	pgprot_t prot;
 	int err;
 
 	dma_addr_t dma_addr;
@@ -268,7 +269,11 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 	if (!raw_page)
 		return -ENOMEM;
 
-	host_ptr = vmap(&raw_page, 1, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	prot = PAGE_KERNEL;
+	if (!PVR_HAS_OVERRIDE(pvr_dev, device_memory_force_cpu_cached))
+		prot = pgprot_writecombine(prot);
+
+	host_ptr = vmap(&raw_page, 1, VM_MAP, prot);
 	if (!host_ptr) {
 		err = -ENOMEM;
 		goto err_free_page;

-- 
2.47.0

