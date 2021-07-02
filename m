Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC573BA51D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 23:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE096E1F4;
	Fri,  2 Jul 2021 21:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8996E1F4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 21:38:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a13so14023215wrf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 14:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgoqE+Symp/YHmmHlrC67CwbGa1+JdIqIQjMOYlZm3k=;
 b=SRU0822AohfUFEVNIX+9YgxrDMX0eSCf4IUXtW8L7s4bg2PK2KUPg/AtURBIXKC/0a
 AUvsPLAyHu0uggufh10padlLu/hC+R9YFCIvRsiniVV5uwMlE7Xy/np7bIRJr4cAlqSs
 X+MEpPNeTMbBBuwrOnMtcF5Su1+2QuoNl4d7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgoqE+Symp/YHmmHlrC67CwbGa1+JdIqIQjMOYlZm3k=;
 b=qcxuT3T4wFAF0BBY0Iq50A0jsHMrgq2oRbldf37WVcwpaCBU1vjxOfCH1V+96b+7CI
 LzcOtKQBHp9gd9vGqDUCXeR3YBZB5KEMxQ0rU97oAxIXoWp3+89IUbt8GwGiIHiBjhN0
 GRGRkeMZRo+etmLmC90nfvmP1fuUYD/NP/8jybPOCNkRtIOBgL+XY7XhedXhmquNSlAM
 I5fSTuWI1ec/h48eMrRSQ65yiauqPHm935mVqcv3mUaMrmf6RQXPWI2qMWgspxHuv4/H
 yCqWbsSVBRRUBrRj8xpCl8iOQd4IH51WezI4yyf1HJI25TAUNTYplZzQtMLr3fF9Nn8l
 si0g==
X-Gm-Message-State: AOAM530QJhi/SHGfl3b4VmmDD3dy3uj8Gr/LNEUJUj4AByuGMOCKzowx
 0mDbpzpEgDZy1vjZ0/rwOnsEPXLcCuex1g==
X-Google-Smtp-Source: ABdhPJy6jaQFzdHoUDklYMnxEYn/XpgdTXXa5Vqu6/Jo27Z90tXSoN1WFPZJxI1sPgKLg7iFcUzcHg==
X-Received: by 2002:a5d:410b:: with SMTP id l11mr1808678wrp.173.1625261900788; 
 Fri, 02 Jul 2021 14:38:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:38:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 00/11] drm/scheduler dependency tracking
Date: Fri,  2 Jul 2021 23:38:04 +0200
Message-Id: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

2nd major round of my scheduler dependency handling patches.

Emma noticed a big fumble in that I just didn't bother cleaning up between
drm_sched_job_init() and drm_sched_job_arm(). This here should fix it now.

Review and testing very much welcome.

Cheers, Daniel

Daniel Vetter (11):
  drm/sched: Split drm_sched_job_init
  drm/sched: Add dependency tracking
  drm/sched: drop entity parameter from drm_sched_push_job
  drm/panfrost: use scheduler dependency tracking
  drm/lima: use scheduler dependency tracking
  drm/v3d: Move drm_sched_job_init to v3d_job_init
  drm/v3d: Use scheduler dependency handling
  drm/etnaviv: Use scheduler dependency handling
  drm/gem: Delete gem array fencing helpers
  drm/sched: Don't store self-dependencies
  drm/sched: Check locking in drm_sched_job_await_implicit

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |   4 +-
 drivers/gpu/drm/drm_gem.c                    |  96 -----------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  32 ++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  63 +-------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |   3 +-
 drivers/gpu/drm/lima/lima_gem.c              |   7 +-
 drivers/gpu/drm/lima/lima_sched.c            |  28 +---
 drivers/gpu/drm/lima/lima_sched.h            |   6 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c      |  16 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |  39 +----
 drivers/gpu/drm/panfrost/panfrost_job.h      |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |  30 ++--
 drivers/gpu/drm/scheduler/sched_fence.c      |  17 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 158 ++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h                |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                | 115 ++++++--------
 drivers/gpu/drm/v3d/v3d_sched.c              |  44 +-----
 include/drm/drm_gem.h                        |   5 -
 include/drm/gpu_scheduler.h                  |  41 ++++-
 21 files changed, 330 insertions(+), 394 deletions(-)

-- 
2.32.0.rc2

