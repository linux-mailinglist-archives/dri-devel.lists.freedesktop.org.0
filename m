Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E023D809B48
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 06:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AF810E9D8;
	Fri,  8 Dec 2023 05:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC45510E9D8;
 Fri,  8 Dec 2023 05:07:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B84rY3w030356; Fri, 8 Dec 2023 05:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=WlKCC3O3gzfemEY03xFX4nrmIBBKRuJwsSR/+mvebUA=;
 b=EaZVM3cQpJTUMx+jA4Ow7ngr5TX75EnN1VjHEHLYXu0H0gxt68KLAJp2+KtdDt4f6NnK
 KYt9Ww95FTpOWHNtIK3VeuaciO6kSPA2zZ89Sm52CvcFcV9Xxpe3+6wmX2PDMeZfad6Y
 tTPBCX3BhKSR9DwKrcDaVbLBh+p6EXBxWf5ky0ZF1H1BDTJxqiHb+lAhcHAd7N333waM
 +BBDfQGRmsRpWGWU4kE+3MgQ1ozK6bj4YnZw6mdUmK5GtowA9CqkM7sdElMloLd1BMYM
 EBeAl1F4NtGwTsZFk4m/ZGJEBPKwvZ6sfqE7KP1fBsK859/bf9rAIRIEMhUKU1Ho2JGL mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uubd82k2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 05:07:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B856xkk006516
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 05:06:59 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 21:06:59 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v2 01/16] drm/msm/dpu: add formats check for writeback encoder
Date: Thu, 7 Dec 2023 21:06:26 -0800
Message-ID: <20231208050641.32582-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CPnwYZW7izGZUNZmoHC3Cd4Uh8FjwDx9
X-Proofpoint-ORIG-GUID: CPnwYZW7izGZUNZmoHC3Cd4Uh8FjwDx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=827 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080038
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding more formats to dpu writeback add
format validation to it to fail any unsupported formats.

changes in v2:
	- correct some grammar in the commit text

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index bb94909caa25..91b1967cf566 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 {
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
+	int ret;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
 			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
@@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
 		return -EINVAL;
 	}
 
+	ret = drm_atomic_helper_check_wb_encoder_state(phys_enc->parent, conn_state);
+	if (ret < 0) {
+		DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.40.1

