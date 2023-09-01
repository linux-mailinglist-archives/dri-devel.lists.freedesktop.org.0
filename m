Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9105790163
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E03910E821;
	Fri,  1 Sep 2023 17:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305B10E820
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:23:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381CXVaZ028519; Fri, 1 Sep 2023 17:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=v+ZFYVt8TwW3ne31qm3BwcWTa36IClGhFRczA02sF0k=;
 b=BoS2G4pueHhH1jKk86LN9UWC23qiFJTPw7DsCYaJvWdgWJzs1/mB2WYmpmXpaQaiyHQ8
 MlUvIodxLXfPMIoNJRxZW78V+s7SiHxQY0jEdzExOzFQzCDW9tACx6rU0tCQsUMJvPiI
 41oYDaXScMUpTmtpJTaGrlqNwM+M9XXMFwSUPj1bW/v7YSiAQn4XkWof0WnkbgqR+yGw
 5m5jNKVqyuxDfU6mX/pyDqFhepKE8S7vFHcoj5tKZ+VoIdCBPl7SvdZ8eYEknqgwC8Jk
 tEpv74VtvYDNYFHyaCAAAW5p54gBYXPejObnxzLNhuu9s80klnnwc+lKRpDRiMCoQa8U IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sug2h8ujq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:23:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381HNJ2d011359
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 17:23:19 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 10:23:18 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 6/7] accel/qaic: Create a function to initialize BO
Date: Fri, 1 Sep 2023 11:22:46 -0600
Message-ID: <20230901172247.11410-7-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: QgVqeaaS8RqHKuNnlXsGVpD78fjPZbhM
X-Proofpoint-ORIG-GUID: QgVqeaaS8RqHKuNnlXsGVpD78fjPZbhM
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

This makes sure that we have a single place to initialize and
re-initialize BO.

Use this new API to cleanup release_dbc()

We will need this for next patch to detach slicing to a BO.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 6e44e00937af..2acb9dbac88b 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -635,6 +635,18 @@ static const struct drm_gem_object_funcs qaic_gem_funcs = {
 	.vm_ops = &drm_vm_ops,
 };
 
+static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
+{
+	if (reinit) {
+		bo->sliced = false;
+		reinit_completion(&bo->xfer_done);
+	} else {
+		init_completion(&bo->xfer_done);
+	}
+	complete_all(&bo->xfer_done);
+	INIT_LIST_HEAD(&bo->slices);
+}
+
 static struct qaic_bo *qaic_alloc_init_bo(void)
 {
 	struct qaic_bo *bo;
@@ -643,9 +655,7 @@ static struct qaic_bo *qaic_alloc_init_bo(void)
 	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_LIST_HEAD(&bo->slices);
-	init_completion(&bo->xfer_done);
-	complete_all(&bo->xfer_done);
+	qaic_init_bo(bo, false);
 
 	return bo;
 }
@@ -1880,9 +1890,7 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	list_for_each_entry_safe(bo, bo_temp, &dbc->bo_lists, bo_list) {
 		qaic_free_slices_bo(bo);
 		qaic_unprepare_bo(qdev, bo);
-		bo->sliced = false;
-		INIT_LIST_HEAD(&bo->slices);
-		init_completion(&bo->xfer_done);
+		qaic_init_bo(bo, true);
 		list_del(&bo->bo_list);
 	}
 
-- 
2.40.1

