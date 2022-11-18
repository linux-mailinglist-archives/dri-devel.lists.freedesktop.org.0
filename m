Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230162FA61
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5156D10E775;
	Fri, 18 Nov 2022 16:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EBC10E76F;
 Fri, 18 Nov 2022 16:36:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIFvG58010273; Fri, 18 Nov 2022 16:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=mpogp5vCRgOwp1WQwdYOuCzU/UBrZghEL1GxZdyqrV8=;
 b=QxKd2kVGQwzR8jlINF784WMDfODnUuV9Df0ex4fXlHn8Cbufu0bAB5XIbA3dN3gTBYPp
 bY2Ga2P/ghvEUbG7ECMdQIgPweCykS4rMspGkVHOESG0mq55zNfPDI5g4EeoLEF61iXq
 gOtZFu3BII2evSw2ZVO1D3G2tsknw1NVs6ETATCJFUdzAhp6/TbL56rSflsuVURtZx66
 NY2ERdOqb85fqtWtX9LzrUDrZxJIbE3CTTY/ELrGc5kyNUZ1YFJ1U1yPFoJeoXIMzsO7
 nkwvfWKn4VCRvF+A3zFPb9jtwGIAO+Gb4691Wu2wqgYlbLgmJxzpJkHJid7sYpgqqoUQ QQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0n1j61r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 16:36:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIGac8C019001
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 16:36:38 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 18 Nov 2022 08:36:38 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v4 0/2] Add data-lanes and link-frequencies to dp_out endpoint
Date: Fri, 18 Nov 2022 08:36:27 -0800
Message-ID: <1668789389-14617-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eieNp9a2o0jYlWfpvAUsaNzZ8D-fdAxJ
X-Proofpoint-GUID: eieNp9a2o0jYlWfpvAUsaNzZ8D-fdAxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=798 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180096
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

Kuogee Hsieh (2):
  arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
    endpoint
  drm/msm/dp: add support of max dp link rate

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   |  9 +++++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi           |  5 ----
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 +++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi           |  6 +----
 drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c              |  7 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h              |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c             | 32 +++++++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_parser.h             |  2 ++
 9 files changed, 53 insertions(+), 23 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

