Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C16887387
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 20:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2A11271A;
	Fri, 22 Mar 2024 19:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HbYkShYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A195A11271A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 19:02:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42MIoidf021858; Fri, 22 Mar 2024 19:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=JBAD2+PkSNtu6ddDao1RAB65A266tmn6BXyw/WjgYlo=; b=Hb
 YkShYiVhnhon/1SoVQgy0rJMqqy6qQaPRU43copYY/4NJkT2bYb2s+Vi8GgEB2EE
 KI7ry7YTC9jaeJ2DLFpa+/ZihK8y4Rvhk4551bK+TMVjo+wuRsXZbIh1nfAGJD4X
 ds5i7b5ca3v1TWB0/hlvfL4A6KbnHq/ZNMh8YkNCpRRXv9RAEdC9ibKvdZ+/VW18
 y88tbC+Wtrw0P7F8hG5EGR7LjBNHqMPINDK+Ii7P7u1JrdghgAGw6pHv/BVicwtf
 rPgAqqzagUyVde8jhpxrUrp0lWLCVrApOE3u+sVwPFinw/LJaChzgEctobSFgnNi
 t4TUV+orgEoqO0KvUb6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1eeeg6va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 19:01:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MJ1pK1016345
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 19:01:52 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 12:01:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>,
 <jacek.lawrynowicz@linux.intel.com>, <daniel@ffwll.ch>,
 <jiasheng@iscas.ac.cn>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 2/2] accel/qaic: Use drmm_alloc_workqueue()
Date: Fri, 22 Mar 2024 13:01:21 -0600
Message-ID: <20240322190121.3881425-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322190121.3881425-1-quic_jhugo@quicinc.com>
References: <20240322190121.3881425-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tA849XoH6GbqC5VKPSV3xQQi3uGHNKyo
X-Proofpoint-ORIG-GUID: tA849XoH6GbqC5VKPSV3xQQi3uGHNKyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_11,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220137
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
index d1a632dbaec6..82c0c3ad57bf 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -44,28 +44,6 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
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
@@ -383,11 +361,11 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
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

