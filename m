Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A72A216C7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 04:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE310E737;
	Wed, 29 Jan 2025 03:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="a65PK4Nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7203B10E73A;
 Wed, 29 Jan 2025 03:21:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2rjQt020269;
 Wed, 29 Jan 2025 03:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WxOYr4uKvh6+xszG6Lbm4+
 VbuRRBnC+hzUnO98ReB2Q=; b=a65PK4Nroo7iefJBt/EqGn0B7402Ff2U8OlbDs
 4r/Ccv69S522wTnRaF35NNjPslJhWAf14GyjCB5IReNbI4Dx2NgTWCplx9bYeGRd
 bs5uwVF4z5sDrYvIGVzUIW/MxU9E4EtnjArt2MqnajuITLUzs6pHPdu/BlemuAW5
 +aMVWmLiob1P6hy6eOnIoKwIxgPEiZc9sp4avkqEVk/8QDiEqnwMYe7Op4/hTXTJ
 z0jXrE7DpuXxkf1eq6d1KKPPg+6Xfa9LCkfhT10iGnyPvBEpG0DHKpaTB1VwbRho
 SI6S4h/b9RO+PCRWFUfA5RHGPYOzCHraem1k9wBxyas70AfA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fbxvg12r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L5Db012876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:05 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:05 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v5 00/14] drm/msm/dpu: Add Concurrent Writeback Support for
 DPU 10.x+
Date: Tue, 28 Jan 2025 19:20:32 -0800
Message-ID: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICemWcC/2WR3W6EIBBGX8VwXRr+FPCq79HsBeBQSaO24No2G
 9+9s2tSU738hpwT5psbKZATFNJWN5JhSSVNI4b6qSKhd+Mb0NRhJoIJxRpuaJjGcM0Zxpl+eWp
 11whpdLS1IMh8ZIjp++F7vWDuU5mn/PPQL/w+3UxG2INp4ZTRmgnPGwcCvH/5vKaQxvAcpoHcX
 YvYeSvUkRfIa6NstIyBaeSZl388Z7w58hJ5J2WI1ltpZH3m1c6LM6+QjyDw2WqnI/vPr1s5GXB
 a0rw1tFfcVpuWWep8n0a3vNNh6qDATLFQqpVpVOQdMNO1uAjavCuAfxiGNLcV7suls6HjeIfLu
 v4CFeA/VNgBAAA=
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=7565;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=XU4u2es1ezNJOo7+PB0gE5PqAiINjSX03uyQMjBN7rs=;
 b=UI15W8AUFERCSdROrFf9L4vkhzDCmviUho4UsxWBYJEUg5ovvHdcIjHjcltY37KyTxXGFny32
 /JtW14WUtdIA/Emh+kBs3o1v8EJFLKkfcTQpSjrgqmD/ky28j73++vl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eooI556Ph9gcLsUZPiE9vthqN4N0r-V1
X-Proofpoint-ORIG-GUID: eooI556Ph9gcLsUZPiE9vthqN4N0r-V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290026
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

1) Add the CWB mux to the hardware catalog and clarify the pingpong
   block index enum to specifiy which pingpong blocks are dedicated to
   CWB only and which ones are general use pingpong blocks
2) Add support for configuring the CWB mux via dpu_hw_cwb ops
3) Add pending flush support for CWB
4) Add support for validating clone mode in the DPU CRTC and setting up
   CWB within the encoder
5) Adjust the encoder trigger flush, trigger start, and kickoff order to
   accomodate clone mode
6) Adjust when the frame done timer is started for clone mode
7) Define the possible clones for DPU encoders so that WB encoders can
   be cloned by non-WB encoders

The feature was tested on SM8650 using IGT's kms_writeback test with the
following change [1] and dumping the writeback framebuffer when in clone
mode. I haven't gotten the chance to test it on DP yet, but I've
validated both single and dual LM on DSI.

To test CWB with IGT, you'll need to apply this series [1] and run the
following command to dump the writeback buffer:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \

You can also do CRC validation by running this command:

./build/tests/kms_writeback [--run-subtest dump-valid-clones]

NOTE: this series depends on Dmitry's modeset fixes [2]

[1] https://patchwork.freedesktop.org/series/137933/
[2] https://patchwork.freedesktop.org/series/142905/

---
Changes in v5:
- Rebased onto MSM modeset fixes series (Dmitry)
- Reordered RM refactor patches to prevent breaking CI and to avoid
  breaking when partially applied (Dmitry)
- Switch CWB resource reservation to reserve CWB mux first (Dmitry)
- Reworded commit messages to be clearer (Dmitry)
- Change CDM check to fail only if both DP and WB outputs are
  requesting the CDM block simultaneously (Dmitry)
- Use helper to grab dsc config in dpu_encoder_update_topology
- Link to v4: https://lore.kernel.org/r/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com

Changes in v4:
- Rebased onto latest msm-next
- Added kunit tests for framework changes
- Skip valid clone check for encoders that don't have any possible clones set
  (this is to avoid failing kunit tests, specifically the HDMI state helper tests)
- Link to v3: https://lore.kernel.org/r/20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com

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
Dmitry Baryshkov (3):
      drm/msm/dpu: fill CRTC resources in dpu_crtc.c
      drm/msm/dpu: move resource allocation to CRTC
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation

Jessica Zhang (11):
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Support CWB in dpu_hw_ctl
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 229 +++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 416 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 293 ++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
 13 files changed, 752 insertions(+), 329 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240618-concurrent-wb-97d62387f952
prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

