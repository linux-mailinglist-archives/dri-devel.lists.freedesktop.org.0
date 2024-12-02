Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5279E0D37
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 21:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87910E851;
	Mon,  2 Dec 2024 20:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ma9Ethht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C55C10E30B;
 Mon,  2 Dec 2024 20:42:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I7ORU025063;
 Mon, 2 Dec 2024 20:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=xMjbrLpqiHzo2gjywHAVJE
 b4mFrRLFpVJWVaBh8N47o=; b=Ma9Ethhtm7peN7b3/HoInHXRHnD3KT6JXzJE+z
 kz+7+xCCBR6D0o8KbfHYXf3+ulvZhB5L7MJrgPFcDcAdHb9R/4SF0vUp2lJ6e6YH
 Bc88sKdreH499hBrRMDX+WuLybM5WN190guuHY2UoMSl3inm/694+Ic9pAwIxWOF
 i0Ocvkyhkj54JXgZq3mPuWyuXG2fvOeAKA6d921xziA95EqgvI2K1slA+g+HQEDn
 8JSfj4LMuus8lcHJpzspt4E7/9o5G5263ii2QoWTT/RQiiGFbAG+OVmdR74ZJTQM
 nx9Hlnx6GcI5k4pO+Ffc+aLJJVKO+/vbbqHeHXuoor19+xkA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq65ypq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 20:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2KgZl8019538
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 20:42:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 12:42:34 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
Date: Mon, 2 Dec 2024 12:41:57 -0800
Message-ID: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUbTmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKFbUpCua5xmbmpinGxgbJaYrARUWVCUmpZZATYlOra2FgAcDRJtVQA
 AAA==
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733172154; l=1740;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=+zwkQ2xiEGesgq3ksOB6NlbLoLnhqA8QQLYFAakVol0=;
 b=TKzMLnDkUr6YRlX0lEd3aSBNgxptty1rvGIsue6pwNTv79OZrnUW8Y9ifADNVgOKsKxvxKfZA
 U3XUtgIu8r1A3ZK9lD58BwwspLgw9UC5vAtMGwyKopjCP5KF2cmVWAL
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -F_0jUNmRv_5nDoA0m4_DIHe5Ys7w-CC
X-Proofpoint-ORIG-GUID: -F_0jUNmRv_5nDoA0m4_DIHe5Ys7w-CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=720
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020174
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

DP Test Patten Generator is a very useful tool to debug issues such
as blank screen or corruption seen on the DP monitor by isolating it
to whether the corruption is coming from further upstream such as DPU
OR from the DP controller and below. It was noted in [1] that this API
is unused. Rather than dropping the API, it should be fixed and used.

Hence, this series fixes the DP Test Patten Generator API and also utilizes
it by adding a debugfs for it.

[1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1

To: Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav Kumar (3):
      drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
      drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
      drm/msm/dp: add a debugfs node for using tpg

 drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
 drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 3 files changed, 76 insertions(+), 2 deletions(-)
---
base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
change-id: 20241202-tpg-3f7543c036ac

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

