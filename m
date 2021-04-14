Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9E35FE3B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 01:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E216E0D5;
	Wed, 14 Apr 2021 23:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890946E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 23:11:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618441909; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fwodgzOCL8qGE9ma8LbsgVs6uWRw/97IInh7NLij6oI=;
 b=Rg7+i2MPCO3OXgVDk5JwXjCAbt/QhbCdiCoGptY9pJEDyX30I+ejurlrYL8CTzhmQnMTMnS8
 nOcsCpjJdVk2iEysIjLCQJ9NOd47L3l9plGHW19QnImEZbIp4QUeiA/pFEH/qRK/Tqsrvc+g
 77H99oVJbGB3HIdMAcIFPZLV1yU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607776b187ce1fbb5606c6a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 23:11:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4C964C43463; Wed, 14 Apr 2021 23:11:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DFDBC433C6;
 Wed, 14 Apr 2021 23:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DFDBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] Add devcoredump support for DPU
Date: Wed, 14 Apr 2021 16:11:34 -0700
Message-Id: <1618441897-17123-1-git-send-email-abhinavk@codeaurora.org>
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
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
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

changes in v4:
 - rename dpu_dbg to msm_disp_snapshot and move it to msm/disp
 - start using a list of blocks to store the hardware block information
 - cleanup block allocation and freeing logic to simplify it

Abhinav Kumar (3):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm: add support to take dpu snapshot
  drm/msm: add disp snapshot points across dpu driver

 drivers/gpu/drm/drm_atomic.c                       |  28 +++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  61 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       | 161 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       | 167 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 181 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  12 ++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  29 ++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   4 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  19 +++
 drivers/gpu/drm/msm/msm_drv.c                      |  29 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
 23 files changed, 743 insertions(+), 18 deletions(-)
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
