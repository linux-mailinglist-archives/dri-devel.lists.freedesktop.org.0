Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F963FA69
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36BB10E68C;
	Thu,  1 Dec 2022 22:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B794610E67A;
 Thu,  1 Dec 2022 22:17:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1KvGFj011191; Thu, 1 Dec 2022 22:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=BsIhV61f48a1exBvKZpEkb+RMgLqTQbvrtEGK9lnO6E=;
 b=Z5aY9eltsy2loUrzGQpYB5MR9GxpflTxTGY2wUIWDX0s5zuQs3lGDseaL49XUpU+tFfN
 s+G1JXaU+5gB+E3uY6lmcDpDH3+Mgjeqgof53D4EgSWfX/4ZyhMmYUyjgmQd1wG6wZZO
 IlVVjEEvEg2t0i12dWCKxQS8e0TuWWXlRm3wJ4mj2okTjEOUgEWIs4Lh0s4VTrtQcplB
 Tv9/1DfFSbQNtr8IXWg7Wsu7rjZwdPvYCL/6McwTmQE7Yh47pVHTYQm5tUXKJwvkH/Qi
 36ceVT3GZr8uRifsFJy09SumP7qgjHPh00bx+2uDc1U/FrRQl73X6Jr92RgwftejyqOT Qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6k83b2r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 22:17:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B1MHdGH009964
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Dec 2022 22:17:39 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 1 Dec 2022 14:17:39 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v7 0/5] Add data-lanes and link-frequencies to dp_out endpoint
Date: Thu, 1 Dec 2022 14:17:29 -0800
Message-ID: <1669933049-13106-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: H733NCmQIkZSeZjNRvNBUUWoKOd61LG1
X-Proofpoint-ORIG-GUID: H733NCmQIkZSeZjNRvNBUUWoKOd61LG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_14,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015 mlxlogscore=862
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010171
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
functions to DP driver.

Kuogee Hsieh (5):
  arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
    endpoint
  dt-bindings: msm/dp: add data-lanes and link-frequencies property
  drm/msm/dp: parser data-lanes as property of dp_out endpoint
  drm/msm/dp: parser link-frequencies as property of dp_out endpoint
  drm/msm/dp: add support of max dp link rate

 .../bindings/display/msm/dp-controller.yaml        | 22 +++++++++----
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  6 +++-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 +++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  4 +++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  7 ++--
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 38 ++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  2 ++
 8 files changed, 68 insertions(+), 18 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

