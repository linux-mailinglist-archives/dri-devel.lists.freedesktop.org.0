Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF279650F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8902D10E709;
	Thu, 29 Aug 2024 20:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eazZdALR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E8910E706;
 Thu, 29 Aug 2024 20:49:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THZYUs013576;
 Thu, 29 Aug 2024 20:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TYC4TzRd+KuX9AOfuqWSug
 xiUtqlBhucAyGClbXpUEg=; b=eazZdALR0tfzG5khNnK+rHG/T3UmQbN/KteYOk
 MfDC41O/Jlw+nfDO54UUM8ZKVwkwlttQANsFgP8T37WjFoNrkFQSwPFkLJRCnE2e
 Nrvc7VqGLGhPFpCiTeROTsuWZQU/MVaSL/a9FN2qIEWI36bKC6XixVmY0dhE7og4
 CwfRHuUo4C0Op0mmIF2DMDApwosbjSqT9U8itG+wfMmKN04/07l1ZcLyqU6KzYVW
 saevLa/RH25Vbef3k2/+zaj9b9CMNQc6BFoU0z6KcVWugSdtA5u5SuNU+j5jpRXS
 LV1g4FwrZ5mBZbrIMtuEBqFonpncK2BI8E8qE8z05Uywr3GA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5pgw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKmxK8020558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:48:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:48:59 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 00/21] drm/msm/dpu: Add Concurrent Writeback Support for
 DPU 10.x+
Date: Thu, 29 Aug 2024 13:48:21 -0700
Message-ID: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXe0GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0ML3eT8vOTSoqLUvBLd8iRdS/MUMyNjC/M0S1MjJaCegqLUtMwKsHn
 RsbW1AMkBZs9fAAAA
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=5099;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=li2FK37xH5VcoxQBl82OOClVE0swUPx/KS02ws4/GLc=;
 b=bRtpb/AhdA68uX10EF0UV+7Uyfsb79gzMyXZhhf/+zOcoVWQJe0QnUQp71b6zMZhrVi8fE/DL
 Jj4I4HzHvUUBawL9q7qRInasI+52WZF4tJrNJWUkA/wjgVGKhAgKnvF
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uzw6JP2Kku02lsaug26DAF5r76jOjL5K
X-Proofpoint-GUID: uzw6JP2Kku02lsaug26DAF5r76jOjL5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290147
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
4) Add support for configuring the CWB mux via dpu_hw_wb ops
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
./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
-dc <primary display mode>

[1] https://patchwork.freedesktop.org/series/137933/

---
Dmitry Baryshkov (4):
      drm/msm/dpu: get rid of struct dpu_rm_requirements
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: move resource allocation to CRTC
      drm/msm/dpu: fill CRTC resources in dpu_crtc.c

Esha Bharadwaj (3):
      drm/msm/dpu: add CWB entry to catalog for SM8650
      drm/msm/dpu: add devcoredumps for cwb registers
      drm/msm/dpu: add CWB support to dpu_hw_wb

Jessica Zhang (14):
      drm: add clone mode check for CRTC
      drm: print clone mode status in atomic state
      drm/msm/dpu: Check CRTC encoders are valid clones
      drm/msm/dpu: Add RM support for allocating CWB
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Program hw_ctl to support CWB
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders

 drivers/gpu/drm/drm_atomic.c                       |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  29 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 253 ++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 358 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  36 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  67 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  69 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  34 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 351 ++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 include/drm/drm_crtc.h                             |   7 +
 22 files changed, 994 insertions(+), 352 deletions(-)
---
base-commit: dd482072df04d3c2bb180fc860b0ed0d3c99bdd4
change-id: 20240618-concurrent-wb-97d62387f952

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

