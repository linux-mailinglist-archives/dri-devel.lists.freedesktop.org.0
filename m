Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D46543D2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 16:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7410E554;
	Thu, 22 Dec 2022 15:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3011910E04D;
 Thu, 22 Dec 2022 15:06:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BME0o7G026355; Thu, 22 Dec 2022 15:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=6cGylqvNlT58TRB2vjYmHAWx6QqDNsBk9aO//XZP6GE=;
 b=GguQA/faUV50+kFXZG4oy7NqEzGmuUfQAFyAiT9sMNQs4FiqB39qkp5v+/bKNkem0lGk
 XKiGwjWdDMzFOrrtulbT74lfzR/a3BObSJHXCl7T3Xc3147GZmlXZNuQh9+Q6jQ32ywl
 Q58FCcTtRv+m8wXBJe762yeeMHB9T+KgWHAFq/N2q1nXDD2QqpaRzKn6OUes++uNQci8
 GlnjMjC4S5puF5PUzES947Lb0DGSjCtq+wzIDPKv5C5vFKiK6uRgx2BGPV4uEk7O2FpJ
 TwcXaEebWGuibjj976N3aNZUBKkD3DbAbYzTriW6PaFFy+/jSyDcNfBIG9JRNcxKzFH4 Kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm5r2jh83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:06:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMF6ZgV018557
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:06:36 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 07:06:31 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v10 14/15] drm/msm/disp/dpu: reset the datapath after timing
 engine disable
Date: Thu, 22 Dec 2022 20:35:01 +0530
Message-ID: <1671721502-16587-15-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671721502-16587-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1671721502-16587-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ez44gmX_rNeqU6KQ-Vk2wSwLB8chMubM
X-Proofpoint-ORIG-GUID: ez44gmX_rNeqU6KQ-Vk2wSwLB8chMubM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_08,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220131
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reset the datapath after disabling the timing gen, such that
it can start on a clean slate when the intf is enabled back.
This was a recommended sequence from the DPU HW programming guide.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 685cb44..a597cca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -591,6 +591,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		}
 	}
 
+	dpu_encoder_helper_phys_cleanup(phys_enc);
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-- 
2.7.4

