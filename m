Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9025A75A3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 07:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A57610E1B6;
	Wed, 31 Aug 2022 05:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EBD10E191;
 Wed, 31 Aug 2022 05:19:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V2HRWn012337;
 Wed, 31 Aug 2022 05:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=NjAqZ3QhtI/ZqQcKoVQ+P6AxCSkVITmaI0m/xYMMmA0=;
 b=IuiAPXMN80RDgz+MdrWMTqC4DnF3E9Cw7KcnVQwRXb1sokrRUkLjEScUfalb4lFY5q9b
 CaUlAULfcqHWwUTwFrz83R+Y+tTIx93xWDbD+zWxIjZabAdAAJ7ACHh/DBVRsAFUCeFf
 8VoTTBBMXYHBZYWY9nnLEmccJiP5vnR+WS3hUVuGFwFWNGzHcv+4CLtpleou+a6sRCMf
 8bwV2wos4GBmzFLrI/Wj43JPiC9VB5eRoClwMo6SOGajF2Fwn7D9gqKb1Izv3cRJozJ4
 WNAqXB/MKpAX2IyxQ6iflpGJhYsuEimyR7VE1fFdekzWlyCDYvQ4wrNFwRYjbMgIR6yF Zw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9txbh834-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 05:19:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27V5J0TG015884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 05:19:00 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 30 Aug 2022 22:18:53 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 0/6] clk/qcom: Support gdsc collapse polling using 'reset'
 interface
Date: Wed, 31 Aug 2022 10:48:21 +0530
Message-ID: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wNq8ePCvrbpW_Btfp7sFjXeQVlAiZrdc
X-Proofpoint-ORIG-GUID: wNq8ePCvrbpW_Btfp7sFjXeQVlAiZrdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_03,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310025
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Konrad
 Dybcio <konrad.dybcio@somainline.org>, Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
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

Changes in v6:
- No code changes in this version. Just captured the Acked-by tags

Changes in v5:
- Nit: Remove a duplicate blank line (Krzysztof)

Changes in v4:
- Update gpu dt-binding schema
- Typo fix in commit text

Changes in v3:
- Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)

Changes in v2:
- Return error when a particular custom reset op is not implemented. (Dmitry)

Akhil P Oommen (6):
  dt-bindings: clk: qcom: Support gpu cx gdsc reset
  clk: qcom: Allow custom reset ops
  clk: qcom: gdsc: Add a reset op to poll gdsc collapse
  clk: qcom: gpucc-sc7280: Add cx collapse reset support
  dt-bindings: drm/msm/gpu: Add optional resets
  arm64: dts: qcom: sc7280: Add Reset support for gpu

 .../devicetree/bindings/display/msm/gpu.yaml       |  6 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +++
 drivers/clk/qcom/gdsc.c                            | 23 ++++++++++++++----
 drivers/clk/qcom/gdsc.h                            |  7 ++++++
 drivers/clk/qcom/gpucc-sc7280.c                    | 10 ++++++++
 drivers/clk/qcom/reset.c                           | 27 ++++++++++++++++++++++
 drivers/clk/qcom/reset.h                           |  8 +++++++
 include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
 8 files changed, 83 insertions(+), 4 deletions(-)

-- 
2.7.4

