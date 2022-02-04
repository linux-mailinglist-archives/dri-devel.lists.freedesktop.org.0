Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDC4AA1F8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 22:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FE610E173;
	Fri,  4 Feb 2022 21:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77C010E173;
 Fri,  4 Feb 2022 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644009458; x=1675545458;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ed9N6J3V6XeJJPyBPWjY/qNKW6qKVATvTS8vjkdmgU4=;
 b=sZbIOXIWASLyIXpI7lYOaQENOAsj1Ms7Srb6BVWGRnsuZheRayQvi7a4
 tixxc72QSXWKhYZ0aKqyyqJ6qo2bWAIAzvp4Om1U5UXg+I8BhRyQZwSTJ
 BIbnMJVCkiZiCVu+IZ6AOIvSeWHPWbkevsVBmbdbIYveCamuElX4/OfxM w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 13:17:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 13:17:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:36 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:35 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/12] Add writeback block support for DPU
Date: Fri, 4 Feb 2022 13:17:13 -0800
Message-ID: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org,
 markyacoub@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for writeback block on DPU. Writeback
block is extremely useful to validate boards having no physical displays
in addition to many other use-cases where we want to get the output
of the display pipeline to examine whether issue is with the display
pipeline or with the panel.

These changes have been validated on SM8250 RB5 boards with IGT KMS
writeback test-suite thereby further increasing the IGT test coverage
for DPU. I am sharing the test results below.

root@linaro-developer:~/igt_repo/igt-gpu-tools/build/tests# ./kms_writeback
[   35.066157] Console: switching to colour dummy device 80x25
[   35.071964] [IGT] kms_writeback: executing
IGT-Version: 1.26-gae2eb9e1 (aarch64) (Linux: 5.16.0-rc2-62171-g132577e2697b aarch64)
[   35.611418] [IGT] kms_writeback: starting subtest writeback-pixel-formats
Starting subtest: writeback-pixel-formats
[   35.618528] [IGT] kms_writeback: starting subtest writeback-invalid-parameters
Subtest writeback-pixel-formats: SUCCESS (0.000s)
Starting subtest: writeback-invalid-parameters
Subtest writeback-invalid-parameters: SUCCESS (0.028s)   35.657437] [IGT] kms_writeback: starting subtest writeback-fb-id
Starting subtest: writeback-fb-id
Subtest writeback-fb-id: SUCCESS (0.030s)
[   35.698957] [IGT] kms_writeback: starting subtest writeback-check-output
Starting subtest: writeback-check-output
[   35.852834] [IGT] kms_writeback: exiting, ret=0
Subtest writeback-check-output: SUCCESS (0.142s)
[   35.861291] Console: switching to colour frame buffer device 240x67
root@linaro-developer:~/igt_repo/igt-gpu-tools/build/tests# 

The changes can easily be extended to support any other chipset using
the DPU driver by adding the support in the catalog.

Writeback block supports various formats and features. The support
for all of them can be incrementally added on top of this framework when
validation is improved and the test frameworks are extended to validate
them.

Abhinav Kumar (12):
  drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
  drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
  drm/msm/dpu: add writeback blocks to DPU RM
  drm/msm/dpu: add changes to support writeback in hw_ctl
  drm/msm/dpu: add an API to reset the encoder related hw blocks
  drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
  drm/msm/dpu: add encoder operations to prepare/cleanup wb job
  drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
  drm/msm/dpu: add the writeback connector layer
  drm/msm/dpu: initialize dpu encoder and connector for writeback
  drm/msm/dpu: gracefully handle null fb commits for writeback
  drm/msm/dpu: add writeback blocks to the display snapshot

 drivers/gpu/drm/msm/Makefile                       |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 241 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  50 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 825 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  73 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  66 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  65 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          | 267 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          | 145 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  67 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  71 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  71 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  27 +
 20 files changed, 2007 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h

-- 
2.7.4

