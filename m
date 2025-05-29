Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA0AC77DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0325410E6EC;
	Thu, 29 May 2025 05:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhjfCBpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423510E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497402; x=1780033402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sJ+poZNAA+vU0Y1aNtnd5Xw3yJEQigl4o9A/3/bVeQ=;
 b=YhjfCBpOTPW+de7iNTJU+wvO38pD/PYRQ+No4dTYLdheXWgCb6zy/XDR
 YJCE3m74BNZc/QplRep/kVitHZS8I9CXjxpGsNwNPeF/Ah7OOyUSc+lAt
 u0r886sH+7/mh/okGt3UNEUwsCK/DeaVp7W4pzEBkEimLHhLxzmqZpHI9
 OWtTdQUc8Nc/ZzbOz9Z5bnibqy6xLquhkVTPXy11jAVWqMgCcx9/KaMXS
 MQI0WelXNUbq/wRzpVxZEEQu1bBbpwEM5CDBtZBrlExAl9AmlBri7Dpf1
 X2e1rXVpcO12bebVvYkRflKDXUsyVnbLB37jNE3BZs4PfXzb+mvVCwxCL Q==;
X-CSE-ConnectionGUID: fb9fkIgjTGywxb4wcLJ+Vg==
X-CSE-MsgGUID: N736ebBURvqGFFTNYeoBmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963212"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:21 -0700
X-CSE-ConnectionGUID: V/DubCh8TMKiJEbyh03JUQ==
X-CSE-MsgGUID: 19kO3jWHS7m725iMeywwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443422"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:14 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 16/30] iommufd/viommu: track the kvm pointer & its
 refcount in viommu core
Date: Thu, 29 May 2025 13:34:59 +0800
Message-Id: <20250529053513.1592088-17-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
MIME-Version: 1.0
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

Track the kvm pointer and its refcount in viommu core. The kvm pointer
will be used later to support TSM Bind feature, which tells the secure
firmware the connection between a vPCI device and a CoCo VM.

There is existing need to reference kvm pointer in viommu [1], but in
that series kvm pointer is used & tracked in platform iommu drivers.
While in Confidential Computing (CC) case, viommu should manage a
generic routine for TSM Bind, i.e. call pci_tsm_bind(pdev, kvm, tdi_id)
So it is better the viommu core keeps and tracks the kvm pointer.

[1] https://lore.kernel.org/all/20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com/

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/iommu/iommufd/viommu.c | 62 ++++++++++++++++++++++++++++++++++
 include/linux/iommufd.h        |  3 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 488905989b7c..2fcef3f8d1a5 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -1,8 +1,68 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES
  */
+#if IS_ENABLED(CONFIG_KVM)
+#include <linux/kvm_host.h>
+#endif
+
 #include "iommufd_private.h"
 
+#if IS_ENABLED(CONFIG_KVM)
+static void viommu_get_kvm_safe(struct iommufd_viommu *viommu, struct kvm *kvm)
+{
+	void (*pfn)(struct kvm *kvm);
+	bool (*fn)(struct kvm *kvm);
+	bool ret;
+
+	if (!kvm)
+		return;
+
+	pfn = symbol_get(kvm_put_kvm);
+	if (WARN_ON(!pfn))
+		return;
+
+	fn = symbol_get(kvm_get_kvm_safe);
+	if (WARN_ON(!fn)) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	ret = fn(kvm);
+	symbol_put(kvm_get_kvm_safe);
+	if (!ret) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	viommu->put_kvm = pfn;
+	viommu->kvm = kvm;
+}
+
+static void viommu_put_kvm(struct iommufd_viommu *viommu)
+{
+	if (!viommu->kvm)
+		return;
+
+	if (WARN_ON(!viommu->put_kvm))
+		goto clear;
+
+	viommu->put_kvm(viommu->kvm);
+	viommu->put_kvm = NULL;
+	symbol_put(kvm_put_kvm);
+
+clear:
+	viommu->kvm = NULL;
+}
+#else
+static void viommu_get_kvm_safe(struct iommufd_viommu *viommu, struct kvm *kvm)
+{
+}
+
+static void viommu_put_kvm(struct iommufd_viommu *viommu)
+{
+}
+#endif
+
 void iommufd_viommu_destroy(struct iommufd_object *obj)
 {
 	struct iommufd_viommu *viommu =
@@ -10,6 +70,7 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
 
 	if (viommu->ops && viommu->ops->destroy)
 		viommu->ops->destroy(viommu);
+	viommu_put_kvm(viommu);
 	refcount_dec(&viommu->hwpt->common.obj.users);
 	xa_destroy(&viommu->vdevs);
 }
@@ -68,6 +129,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	 * on its own.
 	 */
 	viommu->iommu_dev = __iommu_get_iommu_dev(idev->dev);
+	viommu_get_kvm_safe(viommu, idev->kvm);
 
 	cmd->out_viommu_id = viommu->obj.id;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 2b2d6095309c..2712421802b9 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -104,6 +104,9 @@ struct iommufd_viommu {
 	struct rw_semaphore veventqs_rwsem;
 
 	unsigned int type;
+
+	struct kvm *kvm;
+	void (*put_kvm)(struct kvm *kvm);
 };
 
 /**
-- 
2.25.1

