Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC670C7B9
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579EA10E36F;
	Mon, 22 May 2023 19:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C6810E260;
 Mon, 22 May 2023 19:31:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MJU3NK013959; Mon, 22 May 2023 19:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=HqhHEhC9wNU6U8cuukJtfgxeAlQj/MAYeYbA2abpjDI=;
 b=ErLCbBQ1lG0V5r4kHhR/14zHVvr/ao3dgNqsrOFCQEp8+LxGHfRv06i4k4PLXBn37tmW
 ECrXYl5moa3a7M0ZPTur+I8ogB0AY3FjW5bEJ9MBj9wheVXZ+zsQniBh3smkTvPbpp8G
 aUYzniw4tsyfEqfqOu2nY8gY/VWHNc2eyT3wAb2OtfwE8anaHySs2aYXsl9ikNJxYfzT
 fF3IlTYkrJmqP57J0oBRTUuiNv8CbVmxVkWKL4KRwQGDkqSOal2EcBCQgIZXdQ9+jaJk
 B5olohZvuTCGQT3uTybNGPzC7bIEuxUPkU75Fg2PiYHoTYnnEmhsn4uazNOgeGRpRbJD eg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qra128p85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 19:31:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MJVs0v025939
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 19:31:54 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 12:31:53 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v12 07/10] drm/msm/dpu: always clear every individual pending
 flush mask
Date: Mon, 22 May 2023 12:30:50 -0700
Message-ID: <1684783853-22193-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mJct4VufrWgXvd7sz6cld2YRaUHTxL0h
X-Proofpoint-ORIG-GUID: mJct4VufrWgXvd7sz6cld2YRaUHTxL0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_14,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=994 mlxscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305220165
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two tiers of pending flush control, main controller and
individual hardware block. Currently only the main controller of
flush mask is reset to 0 but leave out some individual pending flush
mask of particular hardware block keep previous value at
clear_pending_flush(). Reset all individual hardware blocks flush
mask to 0 to avoid individual hardware block be triggered accidentally.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 69d0ea2..069c6e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -100,7 +100,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
 				     dpu_hw_ctl_get_flush_register(ctx));
 	ctx->pending_flush_mask = 0x0;
-
+	ctx->pending_intf_flush_mask = 0;
+	ctx->pending_wb_flush_mask = 0;
+	ctx->pending_merge_3d_flush_mask = 0;
 	memset(ctx->pending_dspp_flush_mask, 0,
 		sizeof(ctx->pending_dspp_flush_mask));
 }
-- 
2.7.4

