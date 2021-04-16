Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0A3629B5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 22:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E926ECEA;
	Fri, 16 Apr 2021 20:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E66ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 20:57:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618606664; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GCfFzX1kUe6vn7VTgr+YdeFG/no1qsZaCVnZ9Z2+7jA=;
 b=F7yfQKjZdb6yYyUXUnONX+UCkNkW4KS0j1M0I4CqvsJqn8W8ZWxPKFSTYZZNr04GefW5gubD
 bPfEWVPMcEj/6IqYNGwKKOmCu0+UgGhwyO1b5XVsP/1AUoZY5e6plhm7YJCgTWNlZ0D9QAKx
 qComXlXvpbdEbAaxX1GMomMpLgE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6079fa3bc39407c3274d80cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2F613C43465; Fri, 16 Apr 2021 20:57:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DC823C433CA;
 Fri, 16 Apr 2021 20:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC823C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/7] Add devcoredump support for DPU
Date: Fri, 16 Apr 2021 13:57:18 -0700
Message-Id: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support to use devcoredump for DPU driver. It introduces
the msm_disp_snapshot module which assists in the capturing of register dumps during
error scenarios. When a display related error happens, the msm_disp_snapshot module
captures all the relevant register dumps along with the snapshot of the drm
atomic state and triggers a devcoredump.

changes in v5:
 - move the storage of disp_state from dpu_kms to msm_kms
 - absorb snprintf into the snapshot core by accepting var args
 - initialize disp snapshot module even for non-DPU targets
 - split up the patches into dpu, dsi and dp pieces for easier review
 - get rid of MSM_DISP_SNAPSHOT_IN_* macros by simplifying function


Abhinav Kumar (7):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm: add support to take dpu snapshot
  drm/msm/dsi: add API to take DSI register snapshot
  drm/msm/dp: add API to take DP register snapshot
  drm/msm/disp/dpu1: add API to take DPU register snapshot
  drm/msm: add support to take dsi, dp and dpu snapshot
  drm/msm: add disp snapshot points across dpu driver

 drivers/gpu/drm/drm_atomic.c                       |  28 ++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  50 ++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       | 161 +++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       | 154 ++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 195 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   9 +
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  29 +++
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  16 ++
 drivers/gpu/drm/msm/msm_drv.c                      |  27 ++-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/msm/msm_kms.h                      |   7 +
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
 23 files changed, 725 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
