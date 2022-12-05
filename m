Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D17643921
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 00:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD19010E2BC;
	Mon,  5 Dec 2022 23:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648010E2B8;
 Mon,  5 Dec 2022 23:08:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5Jt45Y014767; Mon, 5 Dec 2022 23:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=vP8xGY/IW/Bki49O1U4sDr/86eogimWHgYgopygBEGc=;
 b=piJI1vIhShv1OfLJ/Nm9BqVBeJAiF/EZcp37FpZv2M6MSFd6iAo3IOCCo7fMdvVo9sP1
 oNJHc1dvCYPN62W1dRD8HBkr4DDq6ajVMM6Qcu6vsEBbDUa/3yYsrgs1tcZFvXQjLW4f
 syFhvT/yZsiZ8hIZspsoPb6KGVlTsfYw1WPVRkKjV8UCEcMgevCSMIWosN8K9EmEI/FW
 TaVZEr5A464ZhHDMHj+wkXGwIirzv2k+NSpJmgJDDoSUDgftl7hVx55QnhPZqAXGXeq1
 oRlDvt9D393V4OYlLsw9qdmVglDCyFW8Ghiwxrngxkm05ex1fKncNmtOK60kDxLshZQ1 IA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7v5mds66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 23:08:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5N8N0V031996
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 23:08:23 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 15:08:23 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <andersson@kernel.org>, <konrad.dybcio@somainline.org>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <devicetree@vger.kernel.org>, <airlied@gmail.com>
Subject: [PATCH v9 0/5] Add data-lanes and link-frequencies to dp_out endpoint
Date: Mon, 5 Dec 2022 15:08:09 -0800
Message-ID: <1670281694-13281-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mqzz_iDMUWIZxy4cdM8zL9bXkhXgwM43
X-Proofpoint-GUID: mqzz_iDMUWIZxy4cdM8zL9bXkhXgwM43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=861 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050191
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

 .../bindings/display/msm/dp-controller.yaml        |  9 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  6 +++-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 +++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  4 +++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  7 ++--
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 39 ++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  2 ++
 8 files changed, 62 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

