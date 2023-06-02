Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFC720AC7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E990610E114;
	Fri,  2 Jun 2023 21:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE7510E066
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:05:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352J64Zk017098; Fri, 2 Jun 2023 21:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2t5Q8jvXuR0HuNXjcwpUz4E1BgD0D0RZFqnR78v/kig=;
 b=P6MmjXClbQURaSRy0DOb53/uEdUMoU5z6HbGbQaXTyf2HWO2aP8Zk+v5DBA74CF43xw8
 STDcMTFwh4Z4muPU0x1wdBSSx77rxrRvi9InOFk4+0uu4imRDtBHXIMyxvXDjxegG4x8
 PjhJAA2dTtTrs9YDaWST+h+no6tejNtVY0JStN9ZkLqb6HCw+W+c6t/Gr2RQlAhr0AhJ
 6EXVNQrpX9PiP6nUR46jIMZq7e4E3vaU6dh7lDy2I3HsdKziBL4aBeKpDJxEQySXDJfK
 DGPQgeGbrwOUzmR4NfUDjk1Fz7nsB3JGTt6rZ8d+XtFyHoOB+Ete8VE+YnmATQ5RnlkR SQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qydr5hg98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 21:04:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352L4w4O031397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 21:04:58 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 14:04:57 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] accel/qaic: Free user handle on interrupted mutex
Date: Fri, 2 Jun 2023 15:04:39 -0600
Message-ID: <20230602210440.8411-2-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lPDFZuZdp3vIIgEoLI4N_rFVa-vkrqF9
X-Proofpoint-GUID: lPDFZuZdp3vIIgEoLI4N_rFVa-vkrqF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_16,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=893 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020163
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

From: Carl Vanderlip <quic_carlv@quicinc.com>

After user handle is allocated, if mutex is interrupted, we do not free
the user handle and return an error. Kref had been initialized, but not
added to users list, so device teardown would also not call free_usr.

Fixes: c501ca23a6a3 ("accel/qaic: Add uapi and core driver file")
Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 2d0828db28d8..961cd341b414 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -97,6 +97,7 @@ static int qaic_open(struct drm_device *dev, struct drm_file *file)
 
 cleanup_usr:
 	cleanup_srcu_struct(&usr->qddev_lock);
+	ida_free(&qaic_usrs, usr->handle);
 free_usr:
 	kfree(usr);
 dev_unlock:
-- 
2.40.1

