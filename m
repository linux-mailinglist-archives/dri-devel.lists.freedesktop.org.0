Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C39A178E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADB510E2EB;
	Thu, 17 Oct 2024 01:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="X1bEM9ON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DCC10E2E1;
 Thu, 17 Oct 2024 01:21:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGQhVl007437;
 Thu, 17 Oct 2024 01:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=CyD0iLBZqT8tzrUbH0vywa
 4HA4hnIZnrW7QUtvfUf3Q=; b=X1bEM9ON93O8HZmDWgVzbBTNcu5zf4Esik+bNk
 VAmYLg+wgipdj7ZXFAMFO3jdJDUkOZp8QDeTg7OquO+JZgOvhvEd+85nCa5wnDCE
 XoAMw/lsAqM7oYZAPrGLi97RHhBZvXjy5N/s7AGPLi0oDuG+XgoQgLcKoJ7jD33z
 bAIxFp8yS+GZ9U4JUbX0sBAnzwgGkwSXemzXn7/8Xpgrlcup0RzgpswRHZyBulUf
 Sipg1J7tU4V+hkDrWd/X16OSZ0d8iT8h2eAvADfhQkVw2mYoJQTOK8OQe6+gVBRT
 v6yDzLKq+QuYowUFdyUw2uHUYz3zHC2uiLt9FFbLgh5AkAHg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy6fy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LG6i006312
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:16 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:16 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 00/23] drm/msm/dpu: Add Concurrent Writeback Support for
 DPU 10.x+
Date: Wed, 16 Oct 2024 18:21:06 -0700
Message-ID: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJmEGcC/13MwRKCIBSF4VdpWEcDV0Vo1Xs0LQSvySIoUKpxf
 PfQFk0uz5n5v4lEDBYjOe4mEjDZaL3Lo9jviOkbd0Vq27wJMCiZ4JIa78wYArqBPjVVdSugkHW
 nKiC5uQfs7Gv1zpe8exsHH94rn/jyfiUJaiMlThmtGGguGgTU+vQYrbHOHIy/kcVK8OsVlNsec
 l/LUnWKMZSi+O/nef4A9MmIZ+wAAAA=
X-Change-ID: 20240618-concurrent-wb-97d62387f952
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=7856;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=53M13DXel/2dnH3acmQOwMvPx5E8LygsMWmgtnK7zEQ=;
 b=MxcV5uCQdkAdJcV6nK2XffaMjJ5yerhY9GejNrUw0QxFCWIhxFSAL1q2zquDqWLlx0SH508ph
 7RUs1PShH0mDbbiA75e/LL7SwCo8kv039Ew7may2wXrZsMTZaSpkZ0x
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: I8-QJShG3lFd1Ph6ehRC5Tz6vWtAOvF2
X-Proofpoint-ORIG-GUID: I8-QJShG3lFd1Ph6ehRC5Tz6vWtAOvF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008
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

DPU supports a single writeback session running concurrently with primary
display when the CWB mux is configured properly. This series enables
clone mode for DPU driver and adds support for programming the CWB mux
in cases where the hardware has dedicated CWB pingpong blocks. Currently,
the CWB hardware blocks have only been added to the SM8650
hardware catalog and only DSI has been exposed as a possible_clone of WB.

This changes are split into two parts:

The first part of the series will pull in Dmitry's patches to refactor
the DPU resource manager to be based off of CRTC instead of encoder.
This includes some changes (noted in the relevant commits) by me and
Abhinav to fix some issues with getting the global state and refactoring
the CDM allocation to work with Dmitry's changes.

The second part of the series will add support for CWB by doing the
following:

1) Add a DRM helper to detect if the current CRTC state is in clone mode
   and add an "in_clone_mode" entry to the atomic state print
2) Add the CWB mux to the hardware catalog and clarify the pingpong
   block index enum to specifiy which pingpong blocks are dedicated to
   CWB only and which ones are general use pingpong blocks
3) Add CWB as part of the devcoredump
4) Add support for configuring the CWB mux via dpu_hw_cwb ops
5) Add pending flush support for CWB
6) Add support for validating clone mode in the DPU CRTC and setting up
   CWB within the encoder
7) Adjust the encoder trigger flush, trigger start, and kickoff order to
   accomodate clone mode
8) Adjust when the frame done timer is started for clone mode
9) Define the possible clones for DPU encoders so that 

The feature was tested on SM8650 using IGT's kms_writeback test with the
following change [1] and dumping the writeback framebuffer when in clone
mode. I haven't gotten the chance to test it on DP yet, but I've
validated both single and dual LM on DSI.

To test CWB with IGT, you'll need to apply this series [1] and this
driver patch [2]. Run the following command to dump the writeback buffer:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \

You can also do CRC validation by running this command:

./build/tests/kms_writeback [--run-subtest dump-valid-clones]

NOTE: We are planning to post KUnit tests for the DRM framework changes
as a separate series

[1] https://patchwork.freedesktop.org/series/137933/
[2] https://patchwork.freedesktop.org/series/138284/

---
Changes in v3:
- Dropped support for CWB on DP connectors for now
- Dropped unnecessary PINGPONG array in *_setup_cwb()
- Add a check to make sure CWB and CDM aren't supported simultaneously
  (Dmitry)
- Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
- Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
- Dropped duplicate error message for reserving CWB resources (Dmitry)
- Added notes in framework changes about posting a separate series to
  add proper KUnit tests (Maxime)
- Added commit message note addressing Sima's comment on handling
  mode_changed (Dmitry)
- Formatting fixes (Dmitry)
- Added proper kerneldocs (Dmitry)
- Renamed dpu_encoder_helper_get_cwb() -> *_get_cwb_mask() (Dmitry)
- Capitalize all instances of "pingpong" in comments (Dmitry)
- Link to v2: https://lore.kernel.org/r/20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com

Changes in v2:
- Moved CWB hardware programming to its own dpu_hw_cwb abstraction
  (Dmitry)
- Reserve and get assigned CWB muxes using RM API and KMS global state
  (Dmitry)
- Dropped requirement to have only one CWB session at a time
- Moved valid clone mode check to DRM framework (Dmitry and Ville)
- Switch to default CWB tap point to LM as the DSPP
- Dropped printing clone mode status in atomic state (Dmitry)
- Call dpu_vbif_clear_errors() before dpu_encoder_kickoff() (Dmitry)
- Squashed setup_input_ctrl() and setup_input_mode() into a single
  dpu_hw_cwb op (Dmitry)
- Moved function comment docs to correct place and fixed wording of
  comments/commit messages (Dmitry)
- Grabbed old CRTC state using proper drm_atomic_state API in
  dpu_crtc_atomic_check() (Dmitry)
- Split HW catalog changes of adding the CWB mux block and changing the
  dedicated CWB pingpong indices into 2 separate commits (Dmitry)
- Moved clearing the dpu_crtc_state.num_mixers to "drm/msm/dpu: fill
  CRTC resources in dpu_crtc.c" (Dmitry)
- Fixed alignment and other formatting issues (Dmitry)
- Link to v1: https://lore.kernel.org/r/20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com

---
Dmitry Baryshkov (4):
      drm/msm/dpu: get rid of struct dpu_rm_requirements
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: move resource allocation to CRTC
      drm/msm/dpu: fill CRTC resources in dpu_crtc.c

Esha Bharadwaj (3):
      drm/msm/dpu: Add CWB entry to catalog for SM8650
      drm/msm/dpu: add devcoredumps for cwb registers
      drm/msm/dpu: add CWB support to dpu_hw_wb

Jessica Zhang (16):
      drm: add clone mode check for CRTC
      drm: Add valid clones check
      drm/msm/dpu: Specify dedicated CWB pingpong blocks
      drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
      drm/msm/dpu: Add RM support for allocating CWB
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Fail atomic_check if CWB and CDM are enabled
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Support CWB in dpu_hw_ctl
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders

 drivers/gpu/drm/drm_atomic_helper.c                |  23 ++
 drivers/gpu/drm/drm_crtc.c                         |  20 +
 drivers/gpu/drm/msm/Makefile                       |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  29 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 211 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 426 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c         |  73 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |  70 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 353 ++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  16 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 include/drm/drm_crtc.h                             |   2 +-
 25 files changed, 1037 insertions(+), 356 deletions(-)
---
base-commit: 2023aaa11289cab27f69cf7e8111fd233cdf3170
change-id: 20240618-concurrent-wb-97d62387f952

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

