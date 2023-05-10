Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243956FE6E1
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4647C10E55C;
	Wed, 10 May 2023 22:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0505110E559;
 Wed, 10 May 2023 22:07:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKnqqB003907; Wed, 10 May 2023 22:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=QuR3D8s6nt8Lrymk6Z83K6vlkMTxFtemnydVD6Ji4sI=;
 b=pokNI3Q1M6UgAXqXlrZMlQhIk9rE7IoiBFvkfHSbvLHM03N8W51ZNnraoI+jvBCYTjEU
 nmHrw10AQ6mremb19GElvHVG0z7CadVuMe5BMIvgf+R0LH5QTWOEixxFqm1Jr5TUOyDF
 sYLFSVwzdIawOTlwFZOZM74Dq8VwEBnlZNhhKcW9jpzFzc5kzzMzpo2AWjInOszQg/zf
 VKDsL8rujmnSdeO0fNARyfDsehkn/FGmBw1n/j9dG2qJjc/775kGVDIySN6lYWjni+bC
 GrDBhgWJo+FdVhb0osdZTjOjE/ThxOzz4Ft75ictfilscdSo7MIE2Vi3om/v7b9SWIcR NQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg79csmpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:07:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AM7kxY008273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:07:46 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:07:45 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v6 0/8] add DSC 1.2 dpu supports
Date: Wed, 10 May 2023 15:07:25 -0700
Message-ID: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eCwSIm_5wSv_qaF9ZQc_Lo2g6clkW38E
X-Proofpoint-ORIG-GUID: eCwSIm_5wSv_qaF9ZQc_Lo2g6clkW38E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100182
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 385 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
 19 files changed, 654 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

