Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A2764E40C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 23:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822D10E126;
	Thu, 15 Dec 2022 22:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5F10E126;
 Thu, 15 Dec 2022 22:53:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFMl13F026771; Thu, 15 Dec 2022 22:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MaOASe7pVNp2FceirVH7cpeN8+bwXdxlw5lpFbg2ZCw=;
 b=ZuEnuDof4Q59QS1K6WO4ySycPKIjUGsvwkxQ7Gxkk3cgsF+DB0ljUuHTTdzm6EErVpD0
 gxmltfyXzyFF/eKXYG+3GMaB5hHKnJzbEc5zjicdWTeaEjseAuD5dax+RPi6vNYor/hH
 L0Y2/izQQ09RJryv1JfFMIZvo/J1B+w8f5/LQ2bImS1AAy7iGdT8nu5QcSzocj2gJmwb
 xjmTocRdHXXquZGh1Qj8xvCJhfias+B2SxtwghabNzBzNhLXWLvG+itkEV2PO3Jg7tIW
 pR16jiuy9iAWtJmUaM8puOOLKHDrZD1MlbRZALrkykuHuXEl2V58UCPex2yBhFIXup2H fw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6ree84g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 22:53:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFMr7Xr008318
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 22:53:07 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 15 Dec 2022 14:53:06 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v4 1/2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if
 irq is not for aux transfer
Date: Thu, 15 Dec 2022 14:52:54 -0800
Message-ID: <1671144775-19077-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671144775-19077-1-git-send-email-quic_khsieh@quicinc.com>
References: <1671144775-19077-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2D59cVTdjymv6_LFh9M8YPLOgvq68YCI
X-Proofpoint-ORIG-GUID: 2D59cVTdjymv6_LFh9M8YPLOgvq68YCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=861 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150189
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
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
system booting up. After lengthy debugging to found that that VIDEO_READY
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

Changes in v3:
-- add Stephen suggested
-- dp_aux_isr() return IRQ_XXX back to caller
-- dp_ctrl_isr() return IRQ_XXX back to caller

Changes in v4:
-- split into two patches

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d030a93..cc3efed 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -423,6 +423,10 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	isr = dp_catalog_aux_get_irq(aux->catalog);
 
+	/* no interrupts pending, return immediately */
+	if (!isr)
+		return;
+
 	if (!aux->cmd_busy)
 		return;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

