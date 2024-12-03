Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73719E103F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 01:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CF810E434;
	Tue,  3 Dec 2024 00:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TG1TnVmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5129B10E883;
 Tue,  3 Dec 2024 00:39:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2J2ulS006231;
 Tue, 3 Dec 2024 00:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=vxmw/CO1BQxaIjGu44qwPF
 uu7Oa97o0ESKT5pL21vi8=; b=TG1TnVmLVoHCj4ASfFHHzWVcvAnAr4BKYJsmFd
 /ZQNHZJBjqTg3Dh/qNW7CZocmBRTCsDXUoBynqiO02SiaDG9WZZGBrA5pNhE2X9U
 bGYzzL8k7/Z+E7Y0gAImHjK9KaotfnlL9oV6VLIQjt9XtKGrh00gU8a/G8+0rUln
 4WaCYkl4yN0CXeNBaWYO7dxLHsLOT1vh26Q6dVfXNoHbPRAqPaIClbwlobCy1NBK
 JxPjYCAl/MJ6eFoR9SidOZNNQ710A8tyBhhgT/F+PiJ2DfXDg3DDaNCnYHovXCU6
 ImEsUtt3CSqtalaP/xO3MIHJi0uj/9x1kOO+Yh95J/ViHSJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gedyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 00:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B30dKhm026308
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 00:39:20 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 16:39:20 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Date: Mon, 2 Dec 2024 16:38:59 -0800
Message-ID: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNTTmcC/x2MQQqAIBAAvyJ7TlDLDn0lQiTXXAgVhSikvyddB
 uYw06BiIaywsAYFL6qUYhc5MNiDjQdyct1BCTXJDh6yM45qPu1jkvd8Flpaq6XwaoRe5YKe7v+
 4bu/7AT/3Ta9hAAAA
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Stephen Boyd <swboyd@chromium.org>,
 "Doug Anderson" <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733186360; l=2614;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=WIi7wO2cVdzqmUTNwV5+FU/SgGmC+LzJRHIrfjwNimg=;
 b=VbFCB19KWqeS6m8zyOdcXBacMY4Y0uIyTg8+C20lp7UkLe37+5l7nnozzLvYMH/OaXrRp5J1e
 GAbFcfg8p0UDSbGQPmEhv1yE7wk5xl/zW6vuBjjFEl2JJ4O9O0p0ouV
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vayrE2jQezlXrIBWA7nDBTvIDT52y4Fo
X-Proofpoint-ORIG-GUID: vayrE2jQezlXrIBWA7nDBTvIDT52y4Fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030002
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

HPD state machine in msm dp display driver manages the state transitions
between various HPD events and the expected state of driver to make sure
both match up.

Although originally done with the intent of managing userspace interactions
and interactions with compliance equipment, over period of time,
changes to this piece of code has become quite difficult to manage.

Although, unwinding this logic will take some time and will be spread over
various changes, to start things, this series tries to get rid of the
ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
of the display overall. Coupled with this, there are quite a few checks
in the current code, the origins of which need to be re-visited OR are unclear
which seem unlikely or redundant. With DP controller on newer chipsets supporting
multiple streams, this has become increasingly difficult to work with.

This series removes the redundant state checks and simplifies the logic as an
attempt to get rid of this ST_DISPLAY_OFF state.

Note: This series has been tested with sa8775p and sc7180 devices with multiple
monitors and also multiple dongles with no noticeable regressions.
Both of these devices use native DP PHY though. Hence, if this series can
be verified on some devices with USBC-DP combo PHY with the help of the other
developers, that will be great.

To: Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in msm_dp_bridge_atomic_enable()
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

 drivers/gpu/drm/msm/dp/dp_display.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)
---
base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
change-id: 20241202-hpd_display_off-6051aa510f23

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

