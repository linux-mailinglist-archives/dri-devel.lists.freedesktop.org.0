Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885D790162
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F410E820;
	Fri,  1 Sep 2023 17:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7CF10E820
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381AXRmf030094; Fri, 1 Sep 2023 17:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Q+1ZsXtzfnOZpDrVk7f32Tfwuk2875coOzRrt1lkrUs=;
 b=UoTnjgV6FWKq1gLfWQ4lf2lbd/JnTooaeuUGkFfLk1UoDtTGarkxdMAoLsjV37DPxncK
 ikOE3PhvuiwHSNffwdsaYfkrlKdTm3aN6ySMeAJE9tCbpNUz1UEFXYKc7bkd52LT8i0l
 fByKmfpMtCkD4/zWSkM9j1hs3hWBForjOmR/DGH5Kr38wt+hFonrWZcZ2qCzOuF24dA5
 MxtMbv0Wd3hlf7bZQa3h3bGZ5oM5JBwocJvzeThmz1hH6QHpXGzYOa77fPrrPHa2Ak4n
 UpYqimKeIwbzahiY6XWfkYG/9VdO7WOO3p6jDtMl3zrR0mv1sB/NoNK/Gd5eMUcl8eJu ow== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3su89e9y7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNIuZ015074
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:18 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:17 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 5/7] accel/qaic: Clean up BO during flushing of transfer list
Date: Fri, 1 Sep 2023 11:22:45 -0600
Message-ID: <20230901172247.11410-6-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ULBLPvsrTltIfD6kDmKIzZKu1RAXlPRZ
X-Proofpoint-GUID: ULBLPvsrTltIfD6kDmKIzZKu1RAXlPRZ
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

Variables that are set while adding the corresponding BO in transfer list
should be cleaned when flushing them out of transfer list prematurely.

After this patch we do not need some of the cleanup done in release_dbc()

This patch would also pave the way to have a central location to clean BO,
during an undesired situation.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c4b8b4bf0200..6e44e00937af 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1808,6 +1808,12 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
 		bo->queued = false;
 		list_del(&bo->xfer_list);
 		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		bo->nr_slice_xfer_done = 0;
+		bo->req_id = 0;
+		bo->perf_stats.req_received_ts = 0;
+		bo->perf_stats.req_submit_ts = 0;
+		bo->perf_stats.req_processed_ts = 0;
+		bo->perf_stats.queue_level_before = 0;
 		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, bo->dir);
 		complete_all(&bo->xfer_done);
 		drm_gem_object_put(&bo->base);
@@ -1876,16 +1882,8 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 		qaic_unprepare_bo(qdev, bo);
 		bo->sliced = false;
 		INIT_LIST_HEAD(&bo->slices);
-		bo->nr_slice_xfer_done = 0;
-		bo->queued = false;
-		bo->req_id = 0;
 		init_completion(&bo->xfer_done);
-		complete_all(&bo->xfer_done);
 		list_del(&bo->bo_list);
-		bo->perf_stats.req_received_ts = 0;
-		bo->perf_stats.req_submit_ts = 0;
-		bo->perf_stats.req_processed_ts = 0;
-		bo->perf_stats.queue_level_before = 0;
 	}
 
 	dbc->in_use = false;
-- 
2.40.1

