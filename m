Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12485020A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506F01120F0;
	Sat, 10 Feb 2024 01:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eBro8RpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904C41120ED;
 Sat, 10 Feb 2024 01:53:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A10ACa001788; Sat, 10 Feb 2024 01:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=FblSf5Y
 O0/0wXgBNEdWRgMScMAcWR1OwY/ownMn3mG4=; b=eBro8RpYTE3ptfmVaxX1syu
 lt4O1Fj8QJ/CFjBHM0006GO7BpBmOYw3o3xDAskDCl/BNAZSilmimTu0MxO6pNdg
 ptjvElbOxWTI8QOqOqD47fCE7AhB8OCCnS98+8SQ9hkt1uykHGjRvnnP4tAH9ptc
 KULhf2utDLjH9Fv59K0hrBN8jZwmBsU4KROC0DN/XdpD/i4WusP8pPTwyFHbaK+o
 UIwgRNZEDWpdLckaGEdwprf85OATB6h7mw1bP+fq73qv6pI0pF/YrKBqZAydUMn8
 0zi+g41QwcvjpVj+zSPpmOW4MGy/iG/qq6MG8CGbO9/tBMrSrdINipxrizKDuYA=
 =
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5u2k8ey0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:53:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qYEZ002477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:34 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:34 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 00/19] Add support for CDM over DP
Date: Fri, 9 Feb 2024 17:51:51 -0800
Message-ID: <20240210015223.24670-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9r_6PKx-EAWssknvkenF337J7u6Q0cbv
X-Proofpoint-GUID: 9r_6PKx-EAWssknvkenF337J7u6Q0cbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_02,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100013
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

This series is dependent on [1] and [2]:
[1] https://patchwork.freedesktop.org/series/118831/
[2] https://patchwork.freedesktop.org/series/129395/

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
  drm/msm/dp: add an API to indicate if sink supports VSC SDP
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

 drivers/gpu/drm/display/drm_dp_helper.c       |  21 +++
 drivers/gpu/drm/msm/Makefile                  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  26 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  35 +++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 100 +----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  10 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             | 101 ++---------
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 127 +++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  82 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c               |   8 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c             |  60 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   5 +
 drivers/gpu/drm/msm/dp/dp_utils.c             | 151 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h             |  25 +++
 drivers/gpu/drm/msm/msm_drv.h                 |  22 ++-
 include/drm/display/drm_dp_helper.h           |   1 +
 25 files changed, 757 insertions(+), 242 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

-- 
2.39.2

