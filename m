Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC272507E4D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70510E6C7;
	Wed, 20 Apr 2022 01:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F04610E6B3;
 Wed, 20 Apr 2022 01:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650419188; x=1681955188;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0lvTYSJfDSogc9HBQFcrtFNrPsEU+QatqI4txPX4ZZc=;
 b=KL7RcAbwStJw64YmFKQtltZ1WgrBYY4quyhJt7lYJ/vevPvp1zvnQ9rn
 M3b7OHNrXFu9rW24/USyNjh51cOV6cBJclBOXO+ema14d1EgJqvrPwDur
 mcHpc2BWemsgaowfnqFFPSFlPxIWRuLBIL1uPw22ohFbApDXixI27ixWl w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Apr 2022 18:46:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:46:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:25 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:25 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 00/17] Add writeback block support for DPU
Date: Tue, 19 Apr 2022 18:45:52 -0700
Message-ID: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
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

changes in v2:
	- rebase on tip of msm-next and address related dependencies
	- fix review comments from Dmitry
	- absorb the DRM writeback core changes which have been acked in
	  this series so that it can be landed together
	
Abhinav Kumar (17):
  drm: allow passing possible_crtcs to drm_writeback_connector_init()
  drm: introduce drm_writeback_connector_init_with_encoder() API
  drm: allow real encoder to be passed for drm_writeback_connector
  drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
  drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
  drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
  drm/msm/dpu: add writeback blocks to DPU RM
  drm/msm/dpu: add changes to support writeback in hw_ctl
  drm/msm/dpu: add an API to reset the encoder related hw blocks
  drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
  drm/msm/dpu: add encoder operations to prepare/cleanup wb job
  drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
  drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
  drm/msm/dpu: add the writeback connector layer
  drm/msm/dpu: initialize dpu encoder and connector for writeback
  drm/msm/dpu: gracefully handle null fb commits for writeback
  drm/msm/dpu: add writeback blocks to the display snapshot

 .../drm/arm/display/komeda/komeda_wb_connector.c   |   4 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   4 +-
 drivers/gpu/drm/drm_writeback.c                    |  79 ++-
 drivers/gpu/drm/msm/Makefile                       |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 217 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  46 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 763 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  66 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  73 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          | 273 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          | 131 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  63 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  68 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  25 +
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   4 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   7 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   4 +-
 include/drm/drm_writeback.h                        |  31 +-
 27 files changed, 2003 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h

-- 
2.7.4

