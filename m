Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94688984E67
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9910E8F9;
	Tue, 24 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NmmQCJKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6A10E8E0;
 Tue, 24 Sep 2024 23:00:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHmVOf022699;
 Tue, 24 Sep 2024 22:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=sBhOycLNmOf186mOMDJz/T
 O0kvvqWbmf6ulElKXHL1A=; b=NmmQCJKTUi8PheT16XRxfrDhkScLEwegFYJn1w
 1NdZ+UHbVCEjkbEy3xr7BRIMDHioKTEeZWrOAMegwZc+b6kK7zXngadf/n/XSxae
 a3M7d/ruF6YlkYSZQqRGDRLccCXab8Tr3cjekPaufpW8pqPxyhNVXfmOOodYL7W7
 R6rL8x2MDnsElBoxQy92MUaRhq50agJwEi4JchIpUV7M+fqr/T7FZTqfoJXpCCRA
 KCluZd3N0jCrtxym77Jkakaf58H0SbjwJ8GophFiyyTyjgiLs33v2K/YUb+cjArP
 SdztgQrY62KQqKUQ0dzV1ppjUDA74hsTU25T4wJACT9Ur5fg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyj9dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxsnX024722
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:53 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 00/22] drm/msm/dpu: Add Concurrent Writeback Support for
 DPU 10.x+
Date: Tue, 24 Sep 2024 15:59:16 -0700
Message-ID: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERE82YC/13MQQ6CMBCF4auQWVvTjlKKK+9hWNAyyCxstQXUE
 O5uxZ3L/yXvWyBRZEpwKhaINHPi4HPgrgA3tP5KgrvcgBKPUisjXPBuipH8KJ5W1FWn8WCqvi4
 R8uceqefX5l2a3AOnMcT3xs/qu/4kg/WfNCshRSnRKt0SkrXnx8SOvdu7cINmXdcPLy9C+awAA
 AA=
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=6436;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=HTLj2m2NzQ7FPoK0qDgura/vnrfsEq/jkfeH11LgTKM=;
 b=qKVH+Hr6FEdJWe+JYlSMWQ8mgMCUrUP0Qz7blITOVmfbONPJJReya4RgavICAuw6uu3nSduez
 pctfFwhnb8yCQ0wHrMbPnbJLkHupy5e+IxI554cHa/2iTTH8TxCWwe/
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 14ywqJksRsx8wuBg_oFtBpRrZQwbkTEy
X-Proofpoint-ORIG-GUID: 14ywqJksRsx8wuBg_oFtBpRrZQwbkTEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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
hardware catalog.

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

To test CWB with IGT, you'll need to apply this series [1] and run
the following command:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \

[1] https://patchwork.freedesktop.org/series/137933/

---
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

Jessica Zhang (15):
      drm: add clone mode check for CRTC
      drm: Add valid clones check
      drm/msm/dpu: Specify dedicated CWB pingpong blocks
      drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
      drm/msm/dpu: Add RM support for allocating CWB
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Support CWB in dpu_hw_ctl
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders

 drivers/gpu/drm/drm_atomic_helper.c                |  23 ++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  29 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 200 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 434 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  16 +-
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 354 ++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  16 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 include/drm/drm_crtc.h                             |   7 +
 24 files changed, 1025 insertions(+), 355 deletions(-)
---
base-commit: 40227086b02f4b36742db313ba98bb51ca325571
change-id: 20240618-concurrent-wb-97d62387f952

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

