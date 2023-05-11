Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A96FF8C0
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 19:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C7A10E599;
	Thu, 11 May 2023 17:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182010E599;
 Thu, 11 May 2023 17:53:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BHpLF5006130; Thu, 11 May 2023 17:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=le5ToKLxupbqJmk5/FASHJl1PZz352N6NqBKuXBxFmw=;
 b=SwR+PVRIxsi/RGBKUKIscj4E+QGo1bOix8Thzl/yOKUyOS8oHWgPnNGUYwzoLOyMG/I7
 cBE6ZZFKQsEKd2eSjs1MYel6qobeY2l7k6NJEEigumOfVnJq6veYnhjP2QCVGld2ojE2
 N09jBC8FO6gza+fJdUWSIDJSkd83DXJA57PpIdkyWaZrYrGHpSZaOuKY6UwvzDd0b5y9
 2/emuST3HWZFxDg7awwiS5zDmacGgO6tOkXjwv9jAacChTZ6ytNdjY82Dy3yq1LDCt38
 YYqLkFlyhcb09htdMkw9jjK/TRHpFRTUPFFKtvRAwCwrwETg4Or0Mo1gCmRomHt36X42 pA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgfsatv9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 17:53:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BHrar6024372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 17:53:36 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 11 May 2023 10:53:36 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v7 0/8] add DSC 1.2 dpu supports
Date: Thu, 11 May 2023 10:53:19 -0700
Message-ID: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: r3CAt-FG5vuha5EOa5ymTMhCHBIV0W7O
X-Proofpoint-GUID: r3CAt-FG5vuha5EOa5ymTMhCHBIV0W7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305110154
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

This series adds the DPU side changes to support DSC 1.2 encoder. This
was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
The DSI and DP parts will be pushed later on top of this change.
This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].

[1]: https://patchwork.freedesktop.org/series/116851/
[2]: https://patchwork.freedesktop.org/series/116615/
[3]: https://patchwork.freedesktop.org/series/112332/

Abhinav Kumar (2):
  drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
  drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets

Kuogee Hsieh (6):
  drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
  drm/msm/dpu: test DPU_PINGPONG_DSC bit before assign DSC ops to
    PINGPONG
  drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
  drm/msm/dpu: add support for DSC encoder v1.2 engine
  drm/msm/dpu: separate DSC flush update out of interface
  drm/msm/dpu: tear down DSC data path when DSC disabled

 drivers/gpu/drm/msm/Makefile                       |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   7 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  11 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  60 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  31 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 383 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
 19 files changed, 652 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

-- 
2.7.4

