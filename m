Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B21AC77EA
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F52310E6F1;
	Thu, 29 May 2025 05:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8b7y7ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92A10E6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497442; x=1780033442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46/snHaJ8vYBoGpNl3amWuUUc5KyrzV3w87FzR6ysPU=;
 b=g8b7y7effiUGo53RV7pEwvRg8On1M2Ham0ZOnb2Kxxb5tQd4kCqPkTiJ
 OIuyTOkdN1wXkOPMQiIUX9HnWwi+4aa/Tk0o+9qNzsw9+44zF6bq83zml
 /n1mVLJPixBZXX5eZ+m1VafykTJe/w5FlR5DBKxIJyqg88XLbDoN6f3mr
 lvo+3DfStYtZ296cQHxzS4vBRGk7VNJpUPafO4JtCn3J/ZTKe9CG4UmU+
 Mg92XROhNCThe/mjihyAUAWr5Zr3E8RpXIf99n8kJvy0Pf4hRCC+DG741
 LqvN2OAVXjVwnt7Z2RTE+mRWK52uXSy60lE8SjsxdHBVZyCpYEJcZgOy9 g==;
X-CSE-ConnectionGUID: s88WSZV7TzqPuty6EIAlfw==
X-CSE-MsgGUID: TWK4s2D2QF2Rk3U+wFnLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963326"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:01 -0700
X-CSE-ConnectionGUID: J+8tvmNbRximREaBwYmdow==
X-CSE-MsgGUID: PinTgIsGSeusrosn1EdYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443588"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:54 -0700
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
Subject: [RFC PATCH 22/30] fixup! PCI/TSM: Change the guest request type
 definition
Date: Thu, 29 May 2025 13:35:05 +0800
Message-Id: <20250529053513.1592088-23-yilun.xu@linux.intel.com>
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

Move the guest_request_type to IOMMUFD uAPI header file so that
userspace could use it for IOMMUFD uAPI -
IOMMU_VDEVICE_TSM_GUEST_REQUEST.

Add __user marker to all blob pointers to indicate the TSM drivers'
responsibility to read out/fill in user data.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 include/linux/pci-tsm.h      | 12 ++++--------
 include/uapi/linux/iommufd.h |  8 ++++++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 1920ca591a42..737767f8a9c5 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -107,10 +107,6 @@ static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
 	return PCI_FUNC(pdev->devfn) == 0;
 }
 
-enum pci_tsm_guest_req_type {
-	PCI_TSM_GUEST_REQ_TDXC,
-};
-
 /**
  * struct pci_tsm_guest_req_info - parameter for pci_tsm_ops.guest_req()
  * @type: identify the format of the following blobs
@@ -123,12 +119,12 @@ enum pci_tsm_guest_req_type {
  *	      for output, the size of actual response data filled by host
  */
 struct pci_tsm_guest_req_info {
-	enum pci_tsm_guest_req_type type;
-	void *type_info;
+	u32 type;
+	void __user *type_info;
 	size_t type_info_len;
-	void *req;
+	void __user *req;
 	size_t req_len;
-	void *resp;
+	void __user *resp;
 	size_t resp_len;
 };
 
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index b8170fe3d700..7196bc295669 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -1143,6 +1143,14 @@ struct iommu_veventq_alloc {
 };
 #define IOMMU_VEVENTQ_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VEVENTQ_ALLOC)
 
+/**
+ * enum pci_tsm_guest_req_type - Specify the format of guest request blobs
+ * @PCI_TSM_GUEST_REQ_TDXC: Intel TDX Connect specific type
+ */
+enum pci_tsm_guest_req_type {
+	PCI_TSM_GUEST_REQ_TDXC,
+};
+
 /**
  * struct iommu_vdevice_tsm_guest_request - ioctl(IOMMU_VDEVICE_TSM_GUEST_REQUEST)
  * @size: sizeof(struct iommu_vdevice_tsm_guest_request)
-- 
2.25.1

