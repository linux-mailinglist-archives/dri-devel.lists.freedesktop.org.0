Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785F80A920
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D19010EACB;
	Fri,  8 Dec 2023 16:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6881B10EACB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:35:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8DMCaK017074; Fri, 8 Dec 2023 16:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=wslA03eLR8fb2ZO7CPHbYXv0yuuWhhTg4rDenPYGeEw=;
 b=nQuMB6kS1wpSFMn6kqQM5mtPpnZkSNjJVO46J4hhGr8xTrfkZrRd2hYlBnH2OtVKnY0o
 +/ieYIc3AE+1gWbjphTgPhOYUBOlMHFLgwvmvZgjbM0Amp6JNoN9n8Tnc9Uzop6UMw74
 xzVgV4FXevoqxDYpGMvu3KgE71G6M7Bo0bXysfSnrh9AwimNgGLLIm1QktO9RZS/gqUa
 0zl29TzVsGoZ5sLebfsJDADTkA6+I3n10Q+/ISUJNLLRG45ZZ/zYSrwPVk+fXfF8IySj
 JcxHSmA8ho1NfQ0LVDZZT9PDWw/yab+29lUrRqEy/5nSdtviR9blPeOE18elh3Y+PrRr rA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuphga008-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:35:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZGn1002114
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:35:16 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:15 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 2/7] accel/qaic: Remove bo->queued field
Date: Fri, 8 Dec 2023 09:34:52 -0700
Message-ID: <20231208163457.1295993-3-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6tBK6rUuThKwUgDDFeoHXlLEszld3srZ
X-Proofpoint-GUID: 6tBK6rUuThKwUgDDFeoHXlLEszld3srZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

->queued field is used to track whether the BO is submitted to hardware for
DMA or not. Since same information can be retrieved using ->xfer_list field
of same structure remove ->queued as it is redundant.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic.h      |  2 --
 drivers/accel/qaic/qaic_data.c | 23 +++++++++++------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 582836f9538f..2b3ef588b717 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -191,8 +191,6 @@ struct qaic_bo {
 	u32			nr_slice;
 	/* Number of slice that have been transferred by DMA engine */
 	u32			nr_slice_xfer_done;
-	/* true = BO is queued for execution, true = BO is not queued */
-	bool			queued;
 	/*
 	 * If true then user has attached slicing information to this BO by
 	 * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 0c6f1328df68..89ab8fa19315 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -141,6 +141,11 @@ struct dbc_rsp {
 	__le16	status;
 } __packed;
 
+static inline bool bo_queued(struct qaic_bo *bo)
+{
+	return !list_empty(&bo->xfer_list);
+}
+
 inline int get_dbc_req_elem_size(void)
 {
 	return sizeof(struct dbc_req);
@@ -648,6 +653,7 @@ static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
 	}
 	complete_all(&bo->xfer_done);
 	INIT_LIST_HEAD(&bo->slices);
+	INIT_LIST_HEAD(&bo->xfer_list);
 }
 
 static struct qaic_bo *qaic_alloc_init_bo(void)
@@ -1166,7 +1172,6 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 	struct bo_slice *slice;
 	unsigned long flags;
 	struct qaic_bo *bo;
-	bool queued;
 	int i, j;
 	int ret;
 
@@ -1198,9 +1203,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 		}
 
 		spin_lock_irqsave(&dbc->xfer_lock, flags);
-		queued = bo->queued;
-		bo->queued = true;
-		if (queued) {
+		if (bo_queued(bo)) {
 			spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 			ret = -EINVAL;
 			goto unlock_bo;
@@ -1223,7 +1226,6 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 			else
 				ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
 			if (ret) {
-				bo->queued = false;
 				spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 				goto unlock_bo;
 			}
@@ -1246,8 +1248,7 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 		spin_lock_irqsave(&dbc->xfer_lock, flags);
 		bo = list_last_entry(&dbc->xfer_list, struct qaic_bo, xfer_list);
 		obj = &bo->base;
-		bo->queued = false;
-		list_del(&bo->xfer_list);
+		list_del_init(&bo->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
 		drm_gem_object_put(obj);
@@ -1608,8 +1609,7 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
 			 */
 			dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
 			bo->nr_slice_xfer_done = 0;
-			bo->queued = false;
-			list_del(&bo->xfer_list);
+			list_del_init(&bo->xfer_list);
 			bo->perf_stats.req_processed_ts = ktime_get_ns();
 			complete_all(&bo->xfer_done);
 			drm_gem_object_put(&bo->base);
@@ -1868,7 +1868,7 @@ int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 
 	/* Check if BO is committed to H/W for DMA */
 	spin_lock_irqsave(&dbc->xfer_lock, flags);
-	if (bo->queued) {
+	if (bo_queued(bo)) {
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		ret = -EBUSY;
 		goto unlock_ch_srcu;
@@ -1898,8 +1898,7 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
 	spin_lock_irqsave(&dbc->xfer_lock, flags);
 	while (!list_empty(&dbc->xfer_list)) {
 		bo = list_first_entry(&dbc->xfer_list, typeof(*bo), xfer_list);
-		bo->queued = false;
-		list_del(&bo->xfer_list);
+		list_del_init(&bo->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 		bo->nr_slice_xfer_done = 0;
 		bo->req_id = 0;
-- 
2.34.1

