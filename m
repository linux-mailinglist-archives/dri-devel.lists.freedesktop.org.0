Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1350790164
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1F210E823;
	Fri,  1 Sep 2023 17:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8C10E81F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381Gu4IA020646; Fri, 1 Sep 2023 17:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GdDJWpuNPTVHMeLRnqVCvO713EWNJCWD844POi6E74U=;
 b=V3guexkWJUmJv+XwpMW4LzZGNPbRDveveZ+xd0Iul/3rCN0VLWgHiraDtaQjOdwjncrd
 G5WH5gEDmR+5kZbSFa4j+g6r9ip3bzzDiWz1V9+z0VW0C07pj4gndrN30aaAVUMUS3he
 lJKN33FlAwyzRc+2AXTfwKbq9WdTVYuJPFyw5S9bVUqw1MOA50/qWdSI9O+n/Th6QKiz
 xkuw4x79fHt4hJoIZWOJDIa5V69O5eD2zgjk+drGMgLn6TLSe+Xb8+wmI58csK4NzMKp
 WH0an6OT5MvzwCIyONP/9RVq6Z0Uz6uo4+Bhi9+P8xVLZiiG1V+fqoRzLGzyJyOyoHQm lA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3suc9k1de8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNG4r021165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:16 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:16 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 4/7] accel/qaic: Undo slicing setup done in
 qaic_attach_slicing_bo()
Date: Fri, 1 Sep 2023 11:22:44 -0600
Message-ID: <20230901172247.11410-5-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: qpbRF9F6FH4n_0X5MpNf5FKkZxVDuwXy
X-Proofpoint-ORIG-GUID: qpbRF9F6FH4n_0X5MpNf5FKkZxVDuwXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309010163
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

qaic_attach_slicing_bo() updates slicing config on BO. Use the existing
function qaic_free_slices_bo() to remove slicing config done in
qaic_attach_slicing_bo().

Use qaic_free_slices_bo() to cleanup release_dbc()

This would be helpful when we introduce a new IOCTL to detach slicing
configuration onto a BO.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 6a802497834c..c4b8b4bf0200 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -154,6 +154,7 @@ static void free_slice(struct kref *kref)
 {
 	struct bo_slice *slice = container_of(kref, struct bo_slice, ref_count);
 
+	slice->bo->total_slice_nents -= slice->nents;
 	list_del(&slice->slice);
 	drm_gem_object_put(&slice->bo->base);
 	sg_free_table(slice->sgt);
@@ -890,6 +891,9 @@ static void qaic_free_slices_bo(struct qaic_bo *bo)
 
 	list_for_each_entry_safe(slice, temp, &bo->slices, slice)
 		kref_put(&slice->ref_count, free_slice);
+	if (WARN_ON_ONCE(bo->total_slice_nents != 0))
+		bo->total_slice_nents = 0;
+	bo->nr_slice = 0;
 }
 
 static int qaic_attach_slicing_bo(struct qaic_device *qdev, struct qaic_bo *bo,
@@ -1851,7 +1855,6 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id)
 
 void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 {
-	struct bo_slice *slice, *slice_temp;
 	struct qaic_bo *bo, *bo_temp;
 	struct dma_bridge_chan *dbc;
 
@@ -1869,12 +1872,10 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	dbc->usr = NULL;
 
 	list_for_each_entry_safe(bo, bo_temp, &dbc->bo_lists, bo_list) {
+		qaic_free_slices_bo(bo);
 		qaic_unprepare_bo(qdev, bo);
-		list_for_each_entry_safe(slice, slice_temp, &bo->slices, slice)
-			kref_put(&slice->ref_count, free_slice);
 		bo->sliced = false;
 		INIT_LIST_HEAD(&bo->slices);
-		bo->total_slice_nents = 0;
 		bo->nr_slice_xfer_done = 0;
 		bo->queued = false;
 		bo->req_id = 0;
-- 
2.40.1

