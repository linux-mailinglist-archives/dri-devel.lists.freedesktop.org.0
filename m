Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89679015C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CBC10E81B;
	Fri,  1 Sep 2023 17:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C0310E81B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381E3wYk001314; Fri, 1 Sep 2023 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=k58wOWEVcolCC/spgypIjYLfissn5vJH3SUJyYgcSRs=;
 b=eFJ5/cvYwVU8iMWzQXhOwXHTFFtZy2DGniKw1Y8bQx86Q+kcteHvWmczDWm9FAtlIVAe
 HB5x2Zz43n3SqCksLMTkAcrPrTvaDFeTu9ZbdcAS0x+ScRfjw9YEn+rEANEKzcbF5rxi
 X+zT0ZmDLACpTVB2DyU17wprux9L8ySp9yXeagrI8uyIe8xxlLZBugp5+X5Vgbgc+cNA
 8Vn4bLD/Bl1Cjui7p/VpLUG8MZOkTkFyBZU0BUdsDsqw7LhhimUEipW3x6SuXItwanx4
 hkAelFallCz4aPc+n+8k59/FdVe8Lr1oMSO9uK+ffsYqhDeC5gVnCxmj8d2OHKR+zbtt Sg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sug2h8ujh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNERm021141
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:14 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:13 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 2/7] accel/qaic: Update BO metadata in a central location
Date: Fri, 1 Sep 2023 11:22:42 -0600
Message-ID: <20230901172247.11410-3-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: unbNTDsIPibEaoHS29ELqjybzPP7QwJr
X-Proofpoint-ORIG-GUID: unbNTDsIPibEaoHS29ELqjybzPP7QwJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Update/Clean up BO metadata in a central location, this will help maintain
the code and looks cleaner.

Use qaic_unprepare_bo() to cleanup release_dbc()

Next few patches will be implementing detach IOCTL which will leverage
this patch.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 09b5c6a52cb3..710bd355ed8e 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -854,9 +854,9 @@ static int qaic_prepare_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 		ret = qaic_prepare_import_bo(bo, hdr);
 	else
 		ret = qaic_prepare_export_bo(qdev, bo, hdr);
-
-	if (ret == 0)
-		bo->dir = hdr->dir;
+	bo->dir = hdr->dir;
+	bo->dbc = &qdev->dbc[hdr->dbc_id];
+	bo->nr_slice = hdr->count;
 
 	return ret;
 }
@@ -880,6 +880,8 @@ static void qaic_unprepare_bo(struct qaic_device *qdev, struct qaic_bo *bo)
 		qaic_unprepare_export_bo(qdev, bo);
 
 	bo->dir = 0;
+	bo->dbc = NULL;
+	bo->nr_slice = 0;
 }
 
 static void qaic_free_slices_bo(struct qaic_bo *bo)
@@ -904,14 +906,13 @@ static int qaic_attach_slicing_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 		}
 	}
 
-	if (bo->total_slice_nents > qdev->dbc[hdr->dbc_id].nelem) {
+	if (bo->total_slice_nents > bo->dbc->nelem) {
 		qaic_free_slices_bo(bo);
 		return -ENOSPC;
 	}
 
 	bo->sliced = true;
-	bo->nr_slice = hdr->count;
-	list_add_tail(&bo->bo_list, &qdev->dbc[hdr->dbc_id].bo_lists);
+	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
 
 	return 0;
 }
@@ -1014,7 +1015,6 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	if (args->hdr.dir == DMA_TO_DEVICE)
 		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, args->hdr.dir);
 
-	bo->dbc = dbc;
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
 	drm_gem_object_put(obj);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
@@ -1870,14 +1870,12 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	dbc->usr = NULL;
 
 	list_for_each_entry_safe(bo, bo_temp, &dbc->bo_lists, bo_list) {
+		qaic_unprepare_bo(qdev, bo);
 		list_for_each_entry_safe(slice, slice_temp, &bo->slices, slice)
 			kref_put(&slice->ref_count, free_slice);
 		bo->sliced = false;
 		INIT_LIST_HEAD(&bo->slices);
 		bo->total_slice_nents = 0;
-		bo->dir = 0;
-		bo->dbc = NULL;
-		bo->nr_slice = 0;
 		bo->nr_slice_xfer_done = 0;
 		bo->queued = false;
 		bo->req_id = 0;
-- 
2.40.1

