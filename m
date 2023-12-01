Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC5801781
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ECF10E1AC;
	Fri,  1 Dec 2023 23:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8010E032;
 Fri,  1 Dec 2023 23:20:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1Le0T4012597; Fri, 1 Dec 2023 23:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=XAwr1uQw52vm2C3CTFKkO70A9KgfISCJ6ponUkdBLt8=;
 b=j+8CnLgGJK4xZDDWxKbaAN1J8WP89ieVuw/EYTPFuRUDt2/dGuvDZ//Yc9ztZWy3jpB8
 Qjma6UUe/rMkiKohJ85iMriaJSAtd65g7K7WMENlAk4vzqknTr6y5npikTk27IHTB/KB
 wdAFnaYuOnjTNYBVjfWiGzZSPZPib5Pbhx7g5RRNPcbkE4XUjh6Q5V5Loc6AsjriLv3o
 2XINHtjLZgqYWKq3ElZ7+Di6bmqvsNinQsaOo7Zxny3kfMllIXOk6Q2A9Y47Dg3ZKjNk
 mWryPDtdZSwGr+43SZPG4VO/oqifnMkPqnA/FTpHBq2o7NdFxD4lNzywg+3iZ/+pwC/U Sw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2k4d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 23:20:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1NK0Nb030715
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 23:20:00 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 15:19:59 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v9 0/7] incorporate pm runtime framework and eDP clean up
Date: Fri, 1 Dec 2023 15:19:42 -0800
Message-ID: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4J-C1Mr9S_H3n1z1D90APccBWf9_tAC_
X-Proofpoint-ORIG-GUID: 4J-C1Mr9S_H3n1z1D90APccBWf9_tAC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=786 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010143
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


The purpose of this patch series is to incorporate pm runtime framework
into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
driver during system probe time. During incorporating procedure, original
customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
provided by pm runtiem framework such as pm_runtime_force_suspend() and
pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
are bound at system probe time too.

Please be noted that v9 patches are rebased on top of latest msm-next branch


Kuogee Hsieh (7):
  drm/msm/dp: tie dp_display_irq_handler() with dp driver
  drm/msm/dp: rename is_connected with link_ready
  drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
  drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
  drm/msm/dp: incorporate pm_runtime framework into DP driver
  drm/msm/dp: delete EV_HPD_INIT_SETUP
  drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
 drivers/gpu/drm/msm/dp/dp_aux.c         |  39 +++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 337 ++++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
 drivers/gpu/drm/msm/dp/dp_power.c       |  32 +--
 drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
 drivers/gpu/drm/msm/msm_drv.h           |   5 -
 8 files changed, 166 insertions(+), 279 deletions(-)

-- 
2.7.4

