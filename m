Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C250E720ACA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3A10E118;
	Fri,  2 Jun 2023 21:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985D110E646
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:05:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352KXb37024509; Fri, 2 Jun 2023 21:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rudHhuOEFo80iwVEJ5/Pzd3vaSKEsnfQGFbEXor5irM=;
 b=lT5Jvb1dPzua3uCa/gwU8QVQGzXidJ8KmYCMnMuuyeyViz+f+ZoFLTsy9Ett87R9OGsA
 /BesMPhfKv0+iqmiipcN313Uyc9oYU+3xQ030+UCRwvQqp53yB/d7k4OKZ823R/uB/pj
 Zy5x+68GO6gGHjjdye1L+4kTeb8GjVCFmCiODjM9rU8qrxsCD3EexhTXYuEqAhdtzMEM
 rFh7VJb/8dm+Hj/490zwLGOW+sb+XICGsU9gDRvz/QY5B8U0CfNzppGtC5DtEVpfbt99
 XOyxxYAe6a1iPFQnmrBpnLiTnmO5YWhyskoCTMSk3NIsN1IayvP4rfk+7RFgIO2N9iCV Sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qy1bcjsn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 21:05:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352L50he005299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 21:05:00 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 14:04:59 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] accel/qaic: Fix NULL pointer deref in
 qaic_destroy_drm_device()
Date: Fri, 2 Jun 2023 15:04:40 -0600
Message-ID: <20230602210440.8411-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602210440.8411-1-quic_jhugo@quicinc.com>
References: <20230602210440.8411-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jO6v4cEQTPOyKJf9k_z6fjSnn-4RCVxz
X-Proofpoint-GUID: jO6v4cEQTPOyKJf9k_z6fjSnn-4RCVxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_16,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306020163
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, linux-kernel@vger.kernel.org, quic_ajitpals@quicinc.com,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If qaic_destroy_drm_device() is called before the device has fully
initialized it will cause a NULL pointer dereference as the drm device
has not yet been created. Fix this with a NULL check.

Fixes: c501ca23a6a3 ("accel/qaic: Add uapi and core driver file")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 961cd341b414..b5ba550a0c04 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -225,6 +225,9 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 	struct qaic_user *usr;
 
 	qddev = qdev->qddev;
+	qdev->qddev = NULL;
+	if (!qddev)
+		return;
 
 	/*
 	 * Existing users get unresolvable errors till they close FDs.
-- 
2.40.1

