Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D479015A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B92410E81D;
	Fri,  1 Sep 2023 17:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7310E81B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381FOkfw011343; Fri, 1 Sep 2023 17:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rwPUkzd9SUwwoaofgMIGGc69RX700agWAb3AhcsFPSE=;
 b=WaMTxXKYTedOex2p/D7grdTqgNRj+SH5S1gHbZW//xgCX5AjG+e/FhU5ps3Vut3CcFJC
 H2kOAqcQGeK5GH+iodNPo8pmewZ1Hw03ZcW3Vj2dfBYB5cj5vznJTC15RA29IFy83G7o
 nNRM6me2VPA4k9DqmG1kZJx7YO3ER0onXyEAlCI0pACfJHqWQD3jkAyEHyhUJ54BeP4m
 1N0Qbv5Z2ZceAZPzdhWuAl6xXsh87G+yNDD8ZQf/qH/SsiM7+KyV+6fzAHFD7O09P9eK
 7vsYhOxoLypuTlKnidCn6NkuOt10+YxHcorTOcQZ5wTGckHj+I8K0h4RWjk9INctvrKR Vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3su89e9y79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNCwS025373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:12 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:11 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 1/7] accel/qaic: Remove ->size field from struct qaic_bo
Date: Fri, 1 Sep 2023 11:22:41 -0600
Message-ID: <20230901172247.11410-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230901172247.11410-1-quic_jhugo@quicinc.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: egsVXZKw46mpQZLoFACIgzpudFzMyAnx
X-Proofpoint-GUID: egsVXZKw46mpQZLoFACIgzpudFzMyAnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010163
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

->size field in struct qaic_bo stores user requested buffer size for
allocate path or size of the dmabuf(PRIME). Now for allocate path driver
allocates a BO of size which is PAGE_SIZE aligned, this size is already
stored in base BO structure (struct drm_gem_object).

So difference is ->size of struct qaic_bo stores the raw value coming from
user and ->size in struct drm_gem_object stores the PAGE_SZIE aligned size.

Do not use ->size from struct qaic_bo for any validation or operation
instead use ->size from struct drm_gem_object since we already have
allocated that much memory then why not use it. Only validate if user
is trying to use more then the BO size. This make the driver more flexible.

After this change ->size field of struct qaic_bo becomes redundant. Remove
it.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic.h      |  2 --
 drivers/accel/qaic/qaic_data.c | 10 +++-------
 include/uapi/drm/qaic_accel.h  | 12 ++++++------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index f2bd637a0d4e..27cf66dbd5a5 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -158,8 +158,6 @@ struct qaic_bo {
 	struct drm_gem_object	base;
 	/* Scatter/gather table for allocate/imported BO */
 	struct sg_table		*sgt;
-	/* BO size requested by user. GEM object might be bigger in size. */
-	u64			size;
 	/* Head in list of slices of this BO */
 	struct list_head	slices;
 	/* Total nents, for all slices of this BO */
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index a90b64b325b4..09b5c6a52cb3 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -579,7 +579,7 @@ static void qaic_gem_print_info(struct drm_printer *p, unsigned int indent,
 {
 	struct qaic_bo *bo = to_qaic_bo(obj);
 
-	drm_printf_indent(p, indent, "user requested size=%llu\n", bo->size);
+	drm_printf_indent(p, indent, "BO DMA direction %d\n", bo->dir);
 }
 
 static const struct vm_operations_struct drm_vm_ops = {
@@ -695,8 +695,6 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (ret)
 		goto free_bo;
 
-	bo->size = args->size;
-
 	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
 	if (ret)
 		goto free_sgt;
@@ -828,7 +826,6 @@ static int qaic_prepare_import_bo(struct qaic_bo *bo, struct qaic_attach_slice_h
 	}
 
 	bo->sgt = sgt;
-	bo->size = hdr->size;
 
 	return 0;
 }
@@ -838,7 +835,7 @@ static int qaic_prepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 {
 	int ret;
 
-	if (bo->size != hdr->size)
+	if (bo->base.size < hdr->size)
 		return -EINVAL;
 
 	ret = dma_map_sgtable(&qdev->pdev->dev, bo->sgt, hdr->dir, 0);
@@ -868,7 +865,6 @@ static void qaic_unprepare_import_bo(struct qaic_bo *bo)
 {
 	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, bo->dir);
 	bo->sgt = NULL;
-	bo->size = 0;
 }
 
 static void qaic_unprepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo)
@@ -1190,7 +1186,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 			goto failed_to_send_bo;
 		}
 
-		if (is_partial && pexec[i].resize > bo->size) {
+		if (is_partial && pexec[i].resize > bo->base.size) {
 			ret = -EINVAL;
 			goto failed_to_send_bo;
 		}
diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
index 2d348744a853..f89880b7bfb6 100644
--- a/include/uapi/drm/qaic_accel.h
+++ b/include/uapi/drm/qaic_accel.h
@@ -242,12 +242,12 @@ struct qaic_attach_slice_entry {
  * @dbc_id: In. Associate the sliced BO with this DBC.
  * @handle: In. GEM handle of the BO to slice.
  * @dir: In. Direction of data flow. 1 = DMA_TO_DEVICE, 2 = DMA_FROM_DEVICE
- * @size: In. Total length of the BO.
- *	  If BO is imported (DMABUF/PRIME) then this size
- *	  should not exceed the size of DMABUF provided.
- *	  If BO is allocated using DRM_IOCTL_QAIC_CREATE_BO
- *	  then this size should be exactly same as the size
- *	  provided during DRM_IOCTL_QAIC_CREATE_BO.
+ * @size: In. Total length of BO being used. This should not exceed base
+ *	  size of BO (struct drm_gem_object.base)
+ *	  For BOs being allocated using DRM_IOCTL_QAIC_CREATE_BO, size of
+ *	  BO requested is PAGE_SIZE aligned then allocated hence allocated
+ *	  BO size maybe bigger. This size should not exceed the new
+ *	  PAGE_SIZE aligned BO size.
  * @dev_addr: In. Device address this slice pushes to or pulls from.
  * @db_addr: In. Address of the doorbell to ring.
  * @db_data: In. Data to write to the doorbell.
-- 
2.40.1

