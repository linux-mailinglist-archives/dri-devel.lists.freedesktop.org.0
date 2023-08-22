Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF439784892
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F310E3C3;
	Tue, 22 Aug 2023 17:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A5210E3BC;
 Tue, 22 Aug 2023 17:42:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37MDUxB6006060; Tue, 22 Aug 2023 17:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=CE/dOv6xOGZeXktNjhKej/MhIoU0T0WykZkNgHuAtRs=;
 b=o+VPrsKNDF2egnT9CCSACATdEPrACUo1LMpyK6KIMRPecaJk9efaV3ZYy+qYixQxIOPY
 ePzlOeU+lh0daV2caEX5x9xEGRqk07ZRob86SM5zWO00I9+qS1jl71w9u/g0IxLkgBbL
 s4h9qIXax6ptjqgtvQ4d4sefj2wvIULsydriLcPRX3Kfclk0di+WbJxiX/DZ5pHrgoOu
 zJLOKXn/EQR2qJVL34uLjqsYBiMtGR5WwOmf4qfUoudUMH67lymSyItTplyqE6jbAOmY
 YMR633Gewu91lL/PZOVtaQa8E80Yqw8H6naC6KxXSsNS2iALwjup6Rn5+Vs4QegwR8P3 0g== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smasmtsqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:47 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MHgkcY003046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:46 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 10:42:45 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 22 Aug 2023 10:42:06 -0700
Subject: [PATCH v4 3/4] drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230822-add-widebus-support-v4-3-9dc86083d6ea@quicinc.com>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
In-Reply-To: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692726164; l=984;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+DwozW2l7XALnMSsnJHlfg5qbfg6fBx2ZBG+vl+XY58=;
 b=a6N0zcw1OTiTmLIC7T5PtnWosIY34cIPrB9UcQ7+ugpEKd/sg6E6V1gVmQQP46hbennE3GcVo
 OpOzWXOqrfmC0x8ZUfaP+0SzblLOwo2gNTvmN8015HD8fnuYlkJI84y
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: B1K4gYdqzpwpgFy-99AUBiymYAwAaNsv
X-Proofpoint-GUID: B1K4gYdqzpwpgFy-99AUBiymYAwAaNsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_15,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=635
 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220140
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DATABUS_WIDEN bit to the MDP_CTRL2 register to allow DSI to enable
databus widen mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index a4a154601114..2a7d980e12c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
 	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
 }
 #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
+#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
 
 #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
 #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f

-- 
2.42.0

