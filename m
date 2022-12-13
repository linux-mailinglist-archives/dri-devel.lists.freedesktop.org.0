Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4564BEB1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 22:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DDB10E36A;
	Tue, 13 Dec 2022 21:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6310E367;
 Tue, 13 Dec 2022 21:44:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDLaWSS024870; Tue, 13 Dec 2022 21:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=8twQYJAb5+mqxxvMQkkCgJPj+wzMneLRu45hZ2uEb9Q=;
 b=MEaOXPsF272pMcfxBfmmux+C/CKt/NRrgMa4MDwqhaLwcz/EHO+RY8XEJOfGT5OZ8rzp
 HbxcpczNxeaNiS31HGJII+VirorD6WJYsFVr2m+PjIZmwloyZ+HKn9pDxFSj1QD5PXgk
 o6K0qCMYnghtR2/HKR48LjsOALU6rbbPVOMNSPu0QExU4s0amw/MbaUaoCLcXJDd+jgO
 Jy5xGxAStiCiTydHI+916W9BiMDxbb6GwR9dm4j3BIAYfEy+AFn9e7zn8oNjqbbJrstd
 6vNmAHpOpG4JtV2j0DldhjVwDe3UxODziQS/kYoiVrKH42MewZnGiHFvLqB1NIbrH/cj Eg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3meyfkgd68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 21:44:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BDLiHan020720
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 21:44:17 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 13 Dec 2022 13:44:17 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
 <airlied@gmail.com>
Subject: [PATCH v12 0/5] Add data-lanes and link-frequencies to dp_out endpoint
Date: Tue, 13 Dec 2022 13:44:03 -0800
Message-ID: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4i4RHZEWREzKBGykYKsNXsZ8pb5Zbs13
X-Proofpoint-ORIG-GUID: 4i4RHZEWREzKBGykYKsNXsZ8pb5Zbs13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=853 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212130188
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
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

 .../bindings/display/msm/dp-controller.yaml        | 30 ++++++++++++-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  6 ++-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 ++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  4 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  7 +--
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 52 ++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  2 +
 8 files changed, 93 insertions(+), 15 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

