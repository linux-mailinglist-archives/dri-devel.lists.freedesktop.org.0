Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097525F515A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 11:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6D10E1C1;
	Wed,  5 Oct 2022 09:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0A810E1C1;
 Wed,  5 Oct 2022 09:07:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2958c0Io013174;
 Wed, 5 Oct 2022 09:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=WKK193DeUkzacHgCqgZn1fZGpo8hFFg5A/8xRrv1rG4=;
 b=cgOcvuAM35g3fzQEcx/OGnUqh4fHQ/taoqkWOP91puxa6UGZrW/lU9XN5otqo7ExBkOz
 ge2ovWlrQSGyZJloZ3FBnjcsJGleEpV0PYO+Nu5Cl8apknkyznSpXS7NMpndAhA0sbKk
 H8AAluc6BQXmKOn+2NHJI3MOY6TaRnIbvo1EroKyYRUXNLK74tlGwq4RBws4qvWm4Z/c
 Ot5jGxRlp59+kzpgN/ukoVwkS7mzyhEH6hutG7ihGYUgO4K3stFd+PVmfWSqiqIAyIIP
 SOSiTk3tbqmt62HoUQHEB99XkCKLXvjFVzbhYXveBfs32LjyFCllnhxHOQkqjBe0eRdo 4A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0sq5s8vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 09:07:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29597SZj009299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Oct 2022 09:07:28 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 5 Oct 2022 02:07:21 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using 'reset'
 interface
Date: Wed, 5 Oct 2022 14:36:58 +0530
Message-ID: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: M1iZJKbT-CIlpy9m8o03DwIVJZRFH-FI
X-Proofpoint-GUID: M1iZJKbT-CIlpy9m8o03DwIVJZRFH-FI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210050057
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

This series is rebased on top of qcom/linux:for-next branch.

Related discussion: https://patchwork.freedesktop.org/patch/493144/

Changes in v7:
- Update commit message (Bjorn)
- Rebased on top of qcom/linux:for-next branch.

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
 drivers/clk/qcom/reset.c                           | 27 +++++++++++++++++++++-
 drivers/clk/qcom/reset.h                           |  8 +++++++
 include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
 8 files changed, 82 insertions(+), 5 deletions(-)

-- 
2.7.4

