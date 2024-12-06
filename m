Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2959E6580
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78110E5E4;
	Fri,  6 Dec 2024 04:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O4cG5wUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FDB10E3CB;
 Fri,  6 Dec 2024 04:33:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaF4X003703;
 Fri, 6 Dec 2024 04:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=6T5H/9atI2YkDyttOMAADP
 l9KFjLb1dn0gViohSs2uE=; b=O4cG5wUEuTNNNuSGnFMY0mJJlHlwl3oI4sRzfF
 EHFFWDqF5PqnHqs1yjEYF3UJHvPNJdXG47yq/uPgsYnUmUQ69NeST4TuuxbbrQIF
 PP+chmnjadYJre0MGKzJBEke0hRzo/lMsSuwTTlpvGrOsFryJqpf24T6HbFrwl5c
 PSXlxCzJCYNRDiIdSKL1qc6w5vdeTLj55LbhJOhSqelQgpKUljec5CYvPN8+ZHhT
 TeMC32Kgit3eLdAVtyQJhyOW7oeqQXgvyviLwOHS65SeWKqCbuLCBAxdB8FEEk3u
 eaOLzvXIlu5ir+ge+GiGYQ4u9YyQyQizx6Do2iZ0+eyaU2KA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kjkjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WOOw017137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:24 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:23 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 00/45] drm/msm/dp: Add MST support for MSM chipsets
Date: Thu, 5 Dec 2024 20:31:31 -0800
Message-ID: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACN+UmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNT3ZSC+NziEt0UM6O0RAszI1Pz1BQloOKCotS0zAqwQdGxtbUAZIA
 D8VgAAAA=
X-Change-ID: 20241205-dp_mst-d62fa86257ed
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=7610;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=EU2JtcZpBp+VFZjJhYqk9PEb6U34sJyO5sCF3jKMsCE=;
 b=DTK2GXtju7LXou7I+UiHk6ph7/L8VhooCQA9gH3YB2ir3j3mhCXy/E7/QEyF0acEZMtQC+Y3a
 nAkvSRUlWSYAiLBPQkeoEOX5gJ0reEJVK6cyPcSla61qRcItLLE3kLN
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2dfXIJpBgntRwP2pEh58DM8tmZglvK6O
X-Proofpoint-GUID: 2dfXIJpBgntRwP2pEh58DM8tmZglvK6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Multi-stream transport for MSM chipsets that allow
a single instance of DP controller to send multiple streams. 

This series has been validated on sa8775p ride platform using multiple
MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

With 4x4K monitors, due to lack of layer mixers that combination will not
work but this can be supported as well after some rework on the DPU side.

In addition, SST was re-validated with all these changes to ensure there
were no regressions.

This patch series was made on top of:

[1] : https://patchwork.freedesktop.org/patch/622243/ (to avoid a log spam)
[2] : https://patchwork.freedesktop.org/series/142010/ (to fix up HPD)
[3] : https://patchwork.freedesktop.org/patch/612740/ (to avoid blank screens)
[4] : https://patchwork.freedesktop.org/series/140216/ (MDSS DT for sa8775p)
[5] : https://patchwork.kernel.org/project/linux-arm-msm/list/?series=912200
      (Display Port DT changes for sa8775p)

Bindings for the pixel clock for additional stream is available at :

[6] : https://patchwork.freedesktop.org/series/142016/

Overall, the patch series has been organized in the following way:

1) First set are a couple of fixes made while debugging MST but applicable
to SST as well so go ahead of everything else
2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
of the work as current DP driver design had to be adjusted to make this happen.
3) Finally, new files to handle MST related operations

Validation was done on the latest linux-next on top of above changes and
both FB console and weston compositors were validated with these changes.

To: Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
To: Guenter Roeck <groeck@chromium.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Vara Reddy <quic_varar@quicinc.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav Kumar (43):
      drm/msm/dp: dont call dp_catalog_ctrl_mainlink_ctrl in dp_ctrl_configure_source_params()
      drm/msm/dp: disable the opp table request even for dp_ctrl_off_link()
      drm/msm/dp: fix the intf_type of MST interfaces
      drm/msm/dp: split msm_dp_panel_read_sink_caps() into two parts
      drm/msm/dp: add a helper to read mst caps for dp_panel
      drm/msm/dp: remove dp_display's dp_mode and use dp_panel's instead
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use
      drm/msm/dp: separate dp_display_prepare() into its own API
      drm/msm/dp: introduce stream_id for each DP panel
      drm/msm/dp: convert dp_display_set_mode() to use dp_panel argument
      drm/msm/dp: add support for programming p1 register block
      drm/msm/dp: use stream_id to change offsets in dp_catalog
      drm/msm/dp: add support to send ACT packets for MST
      drm/msm/dp: add support to program mst support in mainlink
      drm/msm/dp: no need to update tu calculation for mst
      drm/msm/dp: add support for mst channel slot allocation
      drm/msm/dp: add support to send vcpf packets in dp controller
      drm/msm/dp: always program MST_FIFO_CONSTANT_FILL for MST
      drm/msm/dp: abstract out the dp_display stream helpers to accept a panel
      drm/msm/dp: move link related operations to dp_display_unprepare()
      drm/msm/dp: replace power_on with active_stream_cnt for dp_display
      drm/msm/dp: make the SST bridge disconnected when mst is active
      drm/msm/dp: add an API to initialize MST on sink side
      drm/msm/dp: skip reading the EDID for MST cases
      drm/msm/dp: add dp_display_get_panel() to initialize DP panel
      drm/msm/dp: add dp_mst_drm to manage DP MST bridge operations
      drm/msm/dp: add connector abstraction for DP MST
      drm/msm/dp: add irq hpd callback for dp mst
      drm/msm/dp: add support to re-use and clear the panel edid
      drm/msm/dp: add a mst session mutex to protect bridge ops
      drm/msm: add support for non-blocking commits
      drm/msm: initialize DRM MST encoders for DP controllers
      drm/msm/dp: initialize dp_mst module for each DP MST controller
      drm/msm: add a stream to intf map for DP controller
      drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
      drm/msm/dp: mark ST_DISCONNECTED only if all streams are disabled
      drm/msm/dp: populate the max_streams for sa8775 mst controller
      arm64: dts: qcom: add mst support for pixel 1 stream clk for DP1

Yongxing Mou (2):
      drm/msm/dp: propagate hpd state changes to dp mst module
      arm64: dts: qcom: add mst support for pixel stream clk for DP0

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   23 +-
 drivers/gpu/drm/msm/Makefile                       |    3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   29 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |    1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  292 ++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   27 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  454 ++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   21 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  559 +++++++---
 drivers/gpu/drm/msm/dp/dp_display.h                |   33 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   53 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   12 -
 drivers/gpu/drm/msm/dp/dp_mst_drm.c                | 1118 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h                |  110 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   41 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   15 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   25 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |    2 +
 drivers/gpu/drm/msm/msm_drv.h                      |   29 +
 drivers/gpu/drm/msm/msm_kms.c                      |    1 +
 24 files changed, 2589 insertions(+), 296 deletions(-)
---
base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8
change-id: 20241205-dp_mst-d62fa86257ed

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

