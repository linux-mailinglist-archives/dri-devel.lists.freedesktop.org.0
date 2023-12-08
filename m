Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F8980A92A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC1A10EAD1;
	Fri,  8 Dec 2023 16:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B58910EAD1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:35:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8CGemR004916; Fri, 8 Dec 2023 16:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=NdlAGbxC7moav9i7VA6fnZ588joDqnqqBfzR1Wq6x5Y=;
 b=GDoY1CgI4eGSQHnqwAvUdRWvBjEhk9XFoxfj6AraA5QMyVvwXeZKUg7NunhF1gaCE7gg
 ihAq9QWWezOMWErcm/AAnJPnwrfHLL4W8Mr/R33BD+++twH0RxWvPeGK+q8W8tnnIXRA
 uxmVq0rD1n5f9d7FQFJmjR56mpo8CdXX8DNcmMnJTlk4IxgmAv+3XukBosHDLOJZXMQA
 QXBoCkTi9laV0BeSdwOlo88eqvLkYhVo8MN1y9VUM3VCYjAJ8gaM3KJG3meJj8wMuZu5
 IS/kCboWup2fSC4rSY+OKyqq7tzLz2aJvXmO/vPdL40y3Re7V868B1P6HdpD2Mj5iu6R RQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuj96jpgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:35:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZFZF002090
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:35:15 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:14 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 1/7] accel/qaic: Deprecate ->size field from attach slice
 IOCTL structure
Date: Fri, 8 Dec 2023 09:34:51 -0700
Message-ID: <20231208163457.1295993-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MKzUgjI5TTPjnjfUaUb0iDYxtbdQNOXz
X-Proofpoint-ORIG-GUID: MKzUgjI5TTPjnjfUaUb0iDYxtbdQNOXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

->size in struct qaic_attach_slice_hdr is redundant since we have BO handle
and its size can be retrieved from base BO structure.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 17 ++++-------------
 include/uapi/drm/qaic_accel.h  | 13 +------------
 2 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index cf2898eda7ae..0c6f1328df68 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -830,9 +830,6 @@ static int qaic_prepare_import_bo(struct qaic_bo *bo, struct qaic_attach_slice_h
 	struct sg_table *sgt;
 	int ret;
 
-	if (obj->import_attach->dmabuf->size < hdr->size)
-		return -EINVAL;
-
 	sgt = dma_buf_map_attachment(obj->import_attach, hdr->dir);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
@@ -849,9 +846,6 @@ static int qaic_prepare_export_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 {
 	int ret;
 
-	if (bo->base.size < hdr->size)
-		return -EINVAL;
-
 	ret = dma_map_sgtable(&qdev->pdev->dev, bo->sgt, hdr->dir, 0);
 	if (ret)
 		return -EFAULT;
@@ -952,9 +946,6 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	if (arg_size / args->hdr.count != sizeof(*slice_ent))
 		return -EINVAL;
 
-	if (args->hdr.size == 0)
-		return -EINVAL;
-
 	if (!(args->hdr.dir == DMA_TO_DEVICE || args->hdr.dir == DMA_FROM_DEVICE))
 		return -EINVAL;
 
@@ -994,16 +985,16 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 		goto free_slice_ent;
 	}
 
-	ret = qaic_validate_req(qdev, slice_ent, args->hdr.count, args->hdr.size);
-	if (ret)
-		goto free_slice_ent;
-
 	obj = drm_gem_object_lookup(file_priv, args->hdr.handle);
 	if (!obj) {
 		ret = -ENOENT;
 		goto free_slice_ent;
 	}
 
+	ret = qaic_validate_req(qdev, slice_ent, args->hdr.count, obj->size);
+	if (ret)
+		goto put_bo;
+
 	bo = to_qaic_bo(obj);
 	ret = mutex_lock_interruptible(&bo->lock);
 	if (ret)
diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
index 9dab32316aee..d3ca876a08e9 100644
--- a/include/uapi/drm/qaic_accel.h
+++ b/include/uapi/drm/qaic_accel.h
@@ -242,18 +242,7 @@ struct qaic_attach_slice_entry {
  * @dbc_id: In. Associate the sliced BO with this DBC.
  * @handle: In. GEM handle of the BO to slice.
  * @dir: In. Direction of data flow. 1 = DMA_TO_DEVICE, 2 = DMA_FROM_DEVICE
- * @size: In. Total length of BO being used. This should not exceed base
- *	  size of BO (struct drm_gem_object.base)
- *	  For BOs being allocated using DRM_IOCTL_QAIC_CREATE_BO, size of
- *	  BO requested is PAGE_SIZE aligned then allocated hence allocated
- *	  BO size maybe bigger. This size should not exceed the new
- *	  PAGE_SIZE aligned BO size.
- * @dev_addr: In. Device address this slice pushes to or pulls from.
- * @db_addr: In. Address of the doorbell to ring.
- * @db_data: In. Data to write to the doorbell.
- * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is for
- *	    inactive doorbells.
- * @offset: In. Start of this slice as an offset from the start of the BO.
+ * @size: Deprecated. This value is ignored and size of @handle is used instead.
  */
 struct qaic_attach_slice_hdr {
 	__u32 count;
-- 
2.34.1

