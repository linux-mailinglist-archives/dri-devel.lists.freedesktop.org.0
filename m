Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1D85514D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F24910E8A8;
	Wed, 14 Feb 2024 18:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lv4Zf9Yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABE910E815;
 Wed, 14 Feb 2024 18:04:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41ECj9kI023312; Wed, 14 Feb 2024 18:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=MlwUdWq
 2xcVfINmjaa4JvheiJqdVeHPJ3zhI6K2Rtes=; b=lv4Zf9YuyhD6oqLrfVFvwl2
 8gWoo2zCP8fmj3dVSryq8B7dOI5NnNLDw0QV7PE0Hp6leWgdwYHv2v7Olh1rIV05
 yNcqEaJNvfv6aepb8ge7AfsM8bqj0cmtYQv1chCx9dzqdGBL/qD5uXdaYW0hx9i5
 hGtVu52T/y8dVB5VYa7lmflKE/Om1Zbdci4u2Tnn5lvYZtSTHmnp/lkzaXHQjPti
 G33ZfjSCyT50PuXJiYVcKmqbGWPjdW646TXznyIipfWrKwoJyojr1ueHmtObnyfP
 b/2nMalSKjNkXX28e+O7Hlu4qCIJ9B5bjzfvYwfwvm+7Qd/3Ga0rwWBP/kwo8tw=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8kkrhw2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI42fN009168
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:02 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:01 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 00/19] Add support for CDM over DP
Date: Wed, 14 Feb 2024 10:03:22 -0800
Message-ID: <20240214180347.1399-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: E8F3v4xJgtXvR4510sJgErJSqwUfxv7S
X-Proofpoint-ORIG-GUID: E8F3v4xJgtXvR4510sJgErJSqwUfxv7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140141
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

The Chroma Down Sampling (CDM) block is a hardware component in the DPU
pipeline that includes a CSC block capable of converting RGB input from
the DPU to YUV data.

This block can be used with either HDMI, DP, or writeback interfaces.
This series adds support for the CDM block to be used with DP in
YUV420 mode format.

This series allows selection of the YUV420 format for monitors which support
certain resolutions only in YUV420 thus unblocking the validation of many
other resolutions which were previously filtered out if the connector did
not support YUV420.

This was validated using a DP connected monitor requiring the use of
YUV420 format.

This series is dependent on [1], [2], and [3]:
[1] https://patchwork.freedesktop.org/series/118831/
[2] https://patchwork.freedesktop.org/series/129395/
[3] https://patchwork.freedesktop.org/series/129864/

Changes in v3:
	- Change ordering of the header byte macros in dp_utils.h
	- Create a new struct, msm_dp_sdp_with_parity
 	- Utilize drm_dp_vsc_sdp_pack() from a new added dependency of
	  series [3] to pack the VSC SDP data into the new
	  msm_dp_sdp_with_parity struct instead of packing only for
	  YUV420
	- Modify dp_catalog_panel_send_vsc_sdp() so that it sends the VSC SDP data
	  using the new msm_dp_sdp_with_parity struct
	- Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE macro is setting
	  multiple bits and not just one
	- Move the connector's ycbcr_420_allowed parameter so it is no longer
	  dependent on if the dp_display is not eDP

Changes in v2:
	- Minor formatting changes throughout
	- Move 'fixes' patch to the top
	- Move VSC SDP support check API from dp_panel.c to drm_dp_helper.c
	- Create a separate patch for modifying the dimensions for CDM setup to be
	  non-WB specific
	- Remove a patch that modified the INTF_CONFIG2 register in favor of having
	  this series be dependent on [2]
	- Separate configuration ctrl programming from clock related programming into
	  two patches
	- Add a VSC SDP check in dp_bridge_mode_valid()
	- Move parity calculation functions to new files dp_utils.c and dp_utils.h
	- Remove dp_catalog_hw_revision() changes and utilize the original version of
	  the function when checking the DP hardware version
	- Create separate packing and programming functions for the VSC SDP
	- Make the packing header bytes function generic so it can be used with
	  dp_audio.c
	- Create two separate enable/disable VSC SDP functions instead of having one
	  with the ability to do both
	- Move timing engine programming to a separate patch from original encoder
	  programming patch
	- Move update_pending_flush_periph() code to be in the same patch as the
	  encoder programming
	- Create new API's to check if the dpu encoder needs a peripheral flush
	- Allow YUV420 modes for the DP connector when there's a CDM block available
	  instead of checking if VSC SDP is supported

Kuogee Hsieh (1):
  drm/msm/dpu: add support of new peripheral flush mechanism

Paloma Arellano (18):
  drm/msm/dpu: allow certain formats for CDM for DP
  drm/msm/dpu: add division of drm_display_mode's hskew parameter
  drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
  drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
  drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
  drm/msm/dp: rename wide_bus_en to wide_bus_supported
  drm/msm/dp: store mode YUV420 information to be used by rest of DP
  drm/msm/dp: check if VSC SDP is supported in DP programming
  drm/msm/dpu: move widebus logic to its own API
  drm/msm/dp: program config ctrl for YUV420 over DP
  drm/msm/dp: change clock related programming for YUV420 over DP
  drm/msm/dp: move parity calculation to dp_utils
  drm/msm/dp: add VSC SDP support for YUV420 over DP
  drm/msm/dp: enable SDP and SDE periph flush update
  drm/msm/dpu: modify encoder programming for CDM over DP
  drm/msm/dpu: modify timing engine programming for YUV420 over DP
  drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
  drm/msm/dp: allow YUV420 mode for DP connector when CDM available

 drivers/gpu/drm/msm/Makefile                  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  26 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  33 +++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 100 +----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  10 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             | 101 ++---------
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 135 +++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  10 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  82 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c               |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c             |  56 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   8 +
 drivers/gpu/drm/msm/dp/dp_utils.c             | 121 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h             |  40 +++++
 drivers/gpu/drm/msm/msm_drv.h                 |  22 ++-
 23 files changed, 725 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

-- 
2.39.2

