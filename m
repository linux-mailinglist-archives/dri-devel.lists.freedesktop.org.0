Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C884587CF74
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 15:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A5D1122D5;
	Fri, 15 Mar 2024 14:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="buT4itVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171181122D5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:51:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42FE0CiG022627; Fri, 15 Mar 2024 14:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=c7JBbv0lhNoz7QFrjoa1u9Mih8m48RIaYcKKPv4NqKo=; b=bu
 T4itVcWhiFXUX9k4bhe5Ux2SHCsrhQpUI6d/pBwysMbfBlqKE3czHlvejpEB7i/a
 0rvXnVtf81Mu5+A6sQrzLWoXSZlkX6haUI4aZNuQvHlPNWJ2YXPSlOOyDtbsqJdG
 FPppXXzzJQLXmdxLb+JfAPYIZut2R8FdJX9xPVgTNKDIFZn3a8UKskjanfvEG2he
 NmVZicR5Zv9sqG9ofRaJkCQGfJKxBfqQXILVgc0SRQjrWt/roQqlQu4z+D99j6rB
 fuIxTYQ53UoJrIMgms+FfP6WWzmht7iyHaOfVWi8xwHQc3jI0VYLVTgSLyaReia0
 dE3m5VNZ+gYpQFjWoknQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv9yq9cyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 14:50:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FEosHL009742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 14:50:54 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 07:50:53 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <daniel@ffwll.ch>, <jiasheng@iscas.ac.cn>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/2] accel/qaic: Use drmm_alloc_workqueue()
Date: Fri, 15 Mar 2024 08:50:34 -0600
Message-ID: <20240315145034.3972749-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
References: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: T-vZmW_o0seczoc7mFNkIEEqWpWxpDCu
X-Proofpoint-GUID: T-vZmW_o0seczoc7mFNkIEEqWpWxpDCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_02,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150120
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

Now that drmm_alloc_workqueue() exists, we can stop open coding our own
implementation.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index f072edb74f22..9bc09b87a7e1 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -45,28 +45,6 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
 static bool link_up;
 static DEFINE_IDA(qaic_usrs);
 
-static void qaicm_wq_release(struct drm_device *dev, void *res)
-{
-	struct workqueue_struct *wq = res;
-
-	destroy_workqueue(wq);
-}
-
-static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *fmt)
-{
-	struct workqueue_struct *wq;
-	int ret;
-
-	wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
-	if (!wq)
-		return ERR_PTR(-ENOMEM);
-	ret = drmm_add_action_or_reset(dev, qaicm_wq_release, wq);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return wq;
-}
-
 static void qaicm_srcu_release(struct drm_device *dev, void *res)
 {
 	struct srcu_struct *lock = res;
@@ -391,11 +369,11 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 	if (ret)
 		return NULL;
 
-	qdev->cntl_wq = qaicm_wq_init(drm, "qaic_cntl");
-	if (IS_ERR(qdev->cntl_wq))
+	qdev->cntl_wq = drmm_alloc_workqueue(drm, "qaic_cntl", WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!qdev->cntl_wq)
 		return NULL;
-	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
-	if (IS_ERR(qdev->qts_wq))
+	qdev->qts_wq = drmm_alloc_workqueue(drm, "qaic_ts", WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!qdev->qts_wq)
 		return NULL;
 
 	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
-- 
2.34.1

