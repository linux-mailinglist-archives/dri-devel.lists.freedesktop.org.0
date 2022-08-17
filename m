Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C573597D0E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 06:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC4B5BCC;
	Thu, 18 Aug 2022 04:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B328BB5B32;
 Thu, 18 Aug 2022 04:17:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I4C0hD003644;
 Thu, 18 Aug 2022 04:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=H31UzLEojwM3wgQfVzmfwrfB8cyUdcUtpJwyaBqUfKs=;
 b=gtEmTYGpGlLJI5tlY91wfouuqeSIX+bYqu/PtmpZLn6mylhzYgVFmhxxn8u9/7N0GyU8
 TqJ+cP71Av+KI2+F4pi+0VhoKDtbTj28slALS/EEeIHOsb6ATPhlElTBFYehaKSiEhGM
 sq5G3M+rigMfkg05NapCu7e3lckUJ86PD647S/xci+P1oACxUYDrjK8WNwK0Byh8LcVC
 YcX2rkpLTCgE8vgHq//dYtv3UxR/PnM0/kB40yTI7YQK7uzLkiOIT2zOG7IcJcYXvWx9
 svvF+udhW8twtggIodFPocpnmqtgNtBRvOXoZ6vH/X2Bn3SndN+7+y/VhOoSPZVkDZsf wg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j13v1j9tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4HI1S018163
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:21 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 17 Aug 2022 07:58:14 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Date: Wed, 17 Aug 2022 20:27:49 +0530
Message-ID: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3P1GUtWu8JPrHUcEyEHZk5UsUB0eEMhe
X-Proofpoint-ORIG-GUID: 3P1GUtWu8JPrHUcEyEHZk5UsUB0eEMhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=674 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180014
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Some clients like adreno gpu driver would like to ensure that its gdsc
is collapsed at hardware during a gpu reset sequence. This is because it
has a votable gdsc which could be ON due to a vote from another subsystem
like tz, hyp etc or due to an internal hardware signal. To allow
this, gpucc driver can expose an interface to the client driver using
reset framework. Using this the client driver can trigger a polling within
the gdsc driver.

This series is rebased on top of linus's master branch.

Related discussion: https://patchwork.freedesktop.org/patch/493144/

Changes in v2:
- Return error when a particular custom reset op is not implemented. (Dmitry)

Akhil P Oommen (5):
  dt-bindings: clk: qcom: Support gpu cx gdsc reset
  clk: qcom: Allow custom reset ops
  clk: qcom: gdsc: Add a reset op to poll gdsc collapse
  clk: qcom: gpucc-sc7280: Add cx collapse reset support
  arm64: dts: qcom: sc7280: Add Reset support for gpu

 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
 drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
 drivers/clk/qcom/gdsc.h                       |  7 +++++++
 drivers/clk/qcom/gpucc-sc7280.c               | 10 ++++++++++
 drivers/clk/qcom/reset.c                      | 27 +++++++++++++++++++++++++++
 drivers/clk/qcom/reset.h                      |  8 ++++++++
 include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
 7 files changed, 77 insertions(+), 4 deletions(-)

-- 
2.7.4

