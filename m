Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9764E0F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8084810E43C;
	Thu, 15 Dec 2022 18:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93810E43C;
 Thu, 15 Dec 2022 18:33:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFG6g1Z029592; Thu, 15 Dec 2022 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UBw42BFFwwsjP2cIHKRT/iH0R3BYk+Jxv2SoyBAP7ZA=;
 b=IbwDsDWN1y6o8qZ4mxxxCbnfzn1G+z1kMvSWN9v9ROvixN49aAGBGzG/MU5bBOIwTE63
 0nE1SSetSjmhKalQpcu3KPQnHrrAt8mltZ/nm5+ZfirQpsxLeFz2CuZmj9BEtjgtsPyA
 YMOGuuZ1mfz0QBKdFVmRZ9NQQy+BKiK/Gar1JWQQmr2OWMissezvIgMxZSsagjw7YJz+
 zkdzn9mlFAXK4dmDAdmXPZHZAtQ2WTTl7vNC6NdBxThdKJvvwwlZDDJNndWlCwA24arx
 5w8Ts3Axxwg9MBGZoEJ1OQN97W2LVQDzHSoHuidEzgUlRR7ndPsinDxP/dufFuPjoIsl 0A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg6termtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:32:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFIWreH024332
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:32:53 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 15 Dec 2022 10:32:47 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is
 not for aux transfer
Date: Thu, 15 Dec 2022 10:32:39 -0800
Message-ID: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kmOTmDKSVUsfN_yfCtqQ9Sty45V5ZNES
X-Proofpoint-GUID: kmOTmDKSVUsfN_yfCtqQ9Sty45V5ZNES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=741 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150153
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 3 possible interrupt sources are handled by DP controller,
HPDstatus, Controller state changes and Aux read/write transaction.
At every irq, DP controller have to check isr status of every interrupt
sources and service the interrupt if its isr status bits shows interrupts
are pending. There is potential race condition may happen at current aux
isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
even irq is not for aux read or write transaction. This may cause aux read
transaction return premature if host aux data read is in the middle of
waiting for sink to complete transferring data to host while irq happen.
This will cause host's receiving buffer contains unexpected data. This
patch fixes this problem by checking aux isr and return immediately at
aux isr handler if there are no any isr status bits set.

Current there is a bug report regrading eDP edid corruption happen during
system booting up. After lengthy debugging to found that VIDEO_READY
interrupt was continuously firing during system booting up which cause
dp_aux_isr() to complete dp_aux_cmd_fifo_tx() prematurely to retrieve data
from aux hardware buffer which is not yet contains complete data transfer
from sink. This cause edid corruption.

Follows are the signature at kernel logs when problem happen,
EDID has corrupt header
panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback

Changes in v2:
-- do complete if (ret == IRQ_HANDLED) ay dp-aux_isr()
-- add more commit text

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 87 +++++++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d030a93..f31e5c1 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -162,45 +162,78 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	return i;
 }
 
-static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
 {
-	if (isr & DP_INTR_AUX_I2C_DONE)
+	irqreturn_t ret = IRQ_NONE;
+
+	if (isr & DP_INTR_AUX_I2C_DONE) {
 		aux->aux_error_num = DP_AUX_ERR_NONE;
-	else if (isr & DP_INTR_WRONG_ADDR)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_WRONG_ADDR) {
 		aux->aux_error_num = DP_AUX_ERR_ADDR;
-	else if (isr & DP_INTR_TIMEOUT)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
 		aux->aux_error_num = DP_AUX_ERR_TOUT;
-	if (isr & DP_INTR_NACK_DEFER)
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
+
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
 		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }
 
-static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
 {
+	irqreturn_t ret = IRQ_NONE;
+
 	if (isr & DP_INTR_AUX_I2C_DONE) {
 		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
 			aux->aux_error_num = DP_AUX_ERR_NACK;
 		else
 			aux->aux_error_num = DP_AUX_ERR_NONE;
-	} else {
-		if (isr & DP_INTR_WRONG_ADDR)
-			aux->aux_error_num = DP_AUX_ERR_ADDR;
-		else if (isr & DP_INTR_TIMEOUT)
-			aux->aux_error_num = DP_AUX_ERR_TOUT;
-		if (isr & DP_INTR_NACK_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
-		if (isr & DP_INTR_I2C_NACK)
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		if (isr & DP_INTR_I2C_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_DEFER;
-		if (isr & DP_INTR_AUX_ERROR) {
-			aux->aux_error_num = DP_AUX_ERR_PHY;
-			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-		}
+
+		return IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_WRONG_ADDR) {
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+		ret = IRQ_HANDLED;
 	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_I2C_NACK) {
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_I2C_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_DEFER;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
 }
 
 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
@@ -413,6 +446,7 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 {
 	u32 isr;
 	struct dp_aux_private *aux;
+	irqreturn_t ret = IRQ_NONE;
 
 	if (!dp_aux) {
 		DRM_ERROR("invalid input\n");
@@ -423,15 +457,20 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	isr = dp_catalog_aux_get_irq(aux->catalog);
 
+	/* no interrupts pending, return immediately */
+	if (!isr)
+		return;
+
 	if (!aux->cmd_busy)
 		return;
 
 	if (aux->native)
-		dp_aux_native_handler(aux, isr);
+		ret = dp_aux_native_handler(aux, isr);
 	else
-		dp_aux_i2c_handler(aux, isr);
+		ret = dp_aux_i2c_handler(aux, isr);
 
-	complete(&aux->comp);
+	if (ret == IRQ_HANDLED)
+		complete(&aux->comp);
 }
 
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

