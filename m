Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD26AC77E8
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9188A10E6F3;
	Thu, 29 May 2025 05:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsH+ngUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF33A10E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497435; x=1780033435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZFjs4Khd7IU0ICvoXheVso0w6spur8+isJHyAW1QoRM=;
 b=UsH+ngUDuwtVmpyjY6Fw6qfMMF0XCHYvi4pdbWcFsGhDtmJaZwEwL+Tk
 ggfJ885zjmlBZEm50grXcM853WblDNl04vVG0/cY2+FZ6gF21kBKdToEw
 YOSU2ADkIQPgh0WqwZ392RZ9iT2FDyts1ZQJcYlFHSeP/0qE+Ic3aNGEF
 D9w6BULzZDhBox6raJKkKcXsUJVItOlqVzaHXluRpFNdi243url2iP+V+
 fp1dkFWXzsX+Y9DeuWYQHTZaKLHsa9mL+aMxrznVBhtwk2ihP7N/llWmE
 7+rpK2GEDm2ah0tFYXIgopiQcXfIGsqUgNoHaT6+MzIpSbvwO697P3Us3 w==;
X-CSE-ConnectionGUID: NHF4veuNSpOfAFvEGUR7nQ==
X-CSE-MsgGUID: fCE3uQoWQ0CDfWDQD2kPNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963308"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:54 -0700
X-CSE-ConnectionGUID: eeF3BdF1Si2VogXNH8xFMA==
X-CSE-MsgGUID: 9iw3/0VWQOWyF22z10R/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443541"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:47 -0700
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
Subject: [RFC PATCH 21/30] iommufd/vdevice: Add TSM Guest request uAPI
Date: Thu, 29 May 2025 13:35:04 +0800
Message-Id: <20250529053513.1592088-22-yilun.xu@linux.intel.com>
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

From: Alexey Kardashevskiy <aik@amd.com>

Add TSM Guest request uAPI against iommufd_vdevice to forward various
TSM attestation & acceptance requests from guest to TSM driver/secure
firmware. This uAPI takes function only after TSM Bind.

After a vPCI device is locked down by TSM Bind, CoCo VM should attest
and accept the device in its TEE. These operations needs interaction
with secure firmware and the device, but doesn't impact the device
management from host's POV. It doesn't change the fact that host should
not touch some part of the device (see TDISP spec) to keep the trusted
assignment, and host could exit trusted assignment and roll back
everything by TSM Unbind.

So the TSM Guest request becomes a passthrough channel for CoCo VM to
exchange request/response blobs with TSM driver/secure firmware. The
definition of this IOCTL illustates this idea.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  1 +
 drivers/iommu/iommufd/main.c            |  3 ++
 drivers/iommu/iommufd/viommu.c          | 39 +++++++++++++++++++++++++
 include/uapi/linux/iommufd.h            | 28 ++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 0db9a0e53a77..610dc2efcdd5 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -609,6 +609,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_viommu_destroy(struct iommufd_object *obj);
 int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_vdevice_destroy(struct iommufd_object *obj);
+int iommufd_vdevice_tsm_guest_request_ioctl(struct iommufd_ucmd *ucmd);
 
 struct iommufd_vdevice {
 	struct iommufd_object obj;
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3df468f64e7d..17c5b2cb6ab1 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -320,6 +320,7 @@ union ucmd_buffer {
 	struct iommu_veventq_alloc veventq;
 	struct iommu_vfio_ioas vfio_ioas;
 	struct iommu_viommu_alloc viommu;
+	struct iommu_vdevice_tsm_guest_request gr;
 #ifdef CONFIG_IOMMUFD_TEST
 	struct iommu_test_cmd test;
 #endif
@@ -379,6 +380,8 @@ static const struct iommufd_ioctl_op iommufd_ioctl_ops[] = {
 		 __reserved),
 	IOCTL_OP(IOMMU_VIOMMU_ALLOC, iommufd_viommu_alloc_ioctl,
 		 struct iommu_viommu_alloc, out_viommu_id),
+	IOCTL_OP(IOMMU_VDEVICE_TSM_GUEST_REQUEST, iommufd_vdevice_tsm_guest_request_ioctl,
+		 struct iommu_vdevice_tsm_guest_request, resp_uptr),
 #ifdef CONFIG_IOMMUFD_TEST
 	IOCTL_OP(IOMMU_TEST_CMD, iommufd_test, struct iommu_test_cmd, last),
 #endif
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 8437e936c278..c64ce1a9f87d 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -303,3 +303,42 @@ void iommufd_vdevice_tsm_unbind(struct iommufd_vdevice *vdev)
 out_unlock:
 	mutex_unlock(&vdev->tsm_lock);
 }
+
+int iommufd_vdevice_tsm_guest_request_ioctl(struct iommufd_ucmd *ucmd)
+{
+	struct iommu_vdevice_tsm_guest_request *cmd = ucmd->cmd;
+	struct pci_tsm_guest_req_info info = {
+		.type = cmd->type,
+		.type_info = u64_to_user_ptr(cmd->type_info_uptr),
+		.type_info_len = cmd->type_info_len,
+		.req = u64_to_user_ptr(cmd->req_uptr),
+		.req_len = cmd->req_len,
+		.resp = u64_to_user_ptr(cmd->resp_uptr),
+		.resp_len = cmd->resp_len,
+	};
+	struct iommufd_vdevice *vdev;
+	int rc;
+
+	vdev = container_of(iommufd_get_object(ucmd->ictx, cmd->vdevice_id,
+					       IOMMUFD_OBJ_VDEVICE),
+			    struct iommufd_vdevice, obj);
+	if (IS_ERR(vdev))
+		return PTR_ERR(vdev);
+
+	mutex_lock(&vdev->tsm_lock);
+	if (!vdev->tsm_bound) {
+		rc = -ENOENT;
+		goto out_unlock;
+	}
+
+	rc = pci_tsm_guest_req(to_pci_dev(vdev->dev), &info);
+	if (rc)
+		goto out_unlock;
+
+	cmd->resp_len = info.resp_len;
+	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
+out_unlock:
+	mutex_unlock(&vdev->tsm_lock);
+	iommufd_put_object(ucmd->ictx, &vdev->obj);
+	return rc;
+}
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index f29b6c44655e..b8170fe3d700 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -56,6 +56,7 @@ enum {
 	IOMMUFD_CMD_VDEVICE_ALLOC = 0x91,
 	IOMMUFD_CMD_IOAS_CHANGE_PROCESS = 0x92,
 	IOMMUFD_CMD_VEVENTQ_ALLOC = 0x93,
+	IOMMUFD_CMD_VDEVICE_TSM_GUEST_REQUEST = 0x94,
 };
 
 /**
@@ -1141,4 +1142,31 @@ struct iommu_veventq_alloc {
 	__u32 __reserved;
 };
 #define IOMMU_VEVENTQ_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VEVENTQ_ALLOC)
+
+/**
+ * struct iommu_vdevice_tsm_guest_request - ioctl(IOMMU_VDEVICE_TSM_GUEST_REQUEST)
+ * @size: sizeof(struct iommu_vdevice_tsm_guest_request)
+ * @vdevice_id: vDevice ID the guest request is for
+ * @type: identify the format of the following blobs
+ * @type_info_len: the blob size for @type_info_uptr
+ * @req_len: the blob size for @req_uptr, filled by guest
+ * @resp_len: for input, the blob size for @resp_uptr, filled by guest
+ *	      for output, the size of actual response data, filled by host
+ * @type_info_uptr: extra input/output info, e.g. firmware error code
+ * @req_uptr: request data buffer filled by guest
+ * @resp_uptr: response data buffer filled by host
+ */
+struct iommu_vdevice_tsm_guest_request {
+	__u32 size;
+	__u32 vdevice_id;
+	__u32 type;
+	__u32 type_info_len;
+	__u32 req_len;
+	__u32 resp_len;
+	__aligned_u64 type_info_uptr;
+	__aligned_u64 req_uptr;
+	__aligned_u64 resp_uptr;
+};
+#define IOMMU_VDEVICE_TSM_GUEST_REQUEST _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VDEVICE_TSM_GUEST_REQUEST)
+
 #endif
-- 
2.25.1

