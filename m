Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A13B30A1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4386EB07;
	Thu, 24 Jun 2021 14:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B846EB07
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:00:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so3709318wma.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYm6P+2K6Llz6IZ2pmIQu8tBkJFhCV2GoXGMzNWome4=;
 b=OHAOGJy64D1hZF+Up60zEhBg/X+6LkMFlwBCeOYyDULOVrF6s7DBeCGEGCOn0JvC5C
 sBF3SYDwJtKu5yU2Fc3Dcl4ej2cgUYwute/CR9vFQGxG+tHQodEbTB1OpbT9HIiJYn27
 ELzdUgoPreD0afRmtAvs22snZOYKdNtBbk7sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYm6P+2K6Llz6IZ2pmIQu8tBkJFhCV2GoXGMzNWome4=;
 b=JOaOKmCky8wKr4z63jVwu21iW/wG0UfsrFM1/SeyIOyAqSYZ/lzYNUFzNvM6MPasa/
 frQ7cfr93C9TnV0Xl7OCkCD2Sy39qpdWYaEmXhAqFnO1OpHrCSYd5f1wt5uUvtM6In50
 D78pOISa4YXznDW6uLt14enEptyvsgu97FGuRXnR+2+L13hEL4nHc41c6xGI1w3Qeck4
 Zy9a2GVFA7vMnOS1MLWnmfIoauhT55Sfy7MOvCo/7D/wvYxWZEdX2I/dw/QozXH+1b7/
 HZKkeB2br0Z/BEWKos6RHlLm2WXO2C94cq72YOINVyvwPQV2GUQkRV7gUjgHywF875eI
 2DSA==
X-Gm-Message-State: AOAM532SYrBPdg+hLRMUGb/aXj/96Fh+p1jrprFM9zDG7iK9XmqbGkyw
 dSCk+9v/iB/qkH3hGLCBf5ybcTT+i0nT5A==
X-Google-Smtp-Source: ABdhPJxyIOQO0wv8wG3h5lFcNAJO3dWjjTq7rsq+hPEdt6jEMigus3xizDDNqD6wu78sLhFPr+2d1g==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr4611025wmq.4.1624543230827; 
 Thu, 24 Jun 2021 07:00:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm3600167wrd.25.2021.06.24.07.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:00:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/11] drm/scheduler dependency tracking
Date: Thu, 24 Jun 2021 16:00:14 +0200
Message-Id: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
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

Hi all,

While trying to carefully auditing how all the various drivers handler the
implicit dependencies in the dma-resv object I got a bit too annoyed about
all the hand-rolling. Here's some patches to unify this at least for
drivers using the drm/scheduler.

4 out of 5 are converted over (but only compile-tested), I think amdgpu
would also work:

- handle the job->sync dependencies using drm_sched_job_await*

- build up the job->sched_sync fences needed for deciding whether we need
  a full flush or not before we push the job into the scheduler, instead
  of in the ->dependency callback. This also has the benefit of removing
  a bunch of allocations from scheduler callbacks, where they're not ok
  (due to recursuion into mmu notifier/shrinker on direct reclaim)

- keep the vmid_grab stuff in the ->dependency callback, for special
  things like that I've kept that as a fallback.

There's a few complications though:

- amdgpu_sync is both used for amdgpu_job and for other things, mostly
  amdkfd, but also some bo wait functions

- amdgpu_job is both used for pushing jobs into the scheduler, but also
  for directly pushing a job into the hw through an ib

All not insurmountable, but a bit too much when the main goal here was
just to establish the drm_sched_job_await api.

Wrt the datastructure I picked: Since 3 out of 5 drivers used the xarray,
and that should at least be fairly storage efficient and easy to grow, I
went with that. We can bikeshed/tune the backing implementation later on.

Similarly the await_implicit implementation is as inefficient as the one
the drivers currently use, relying on dma_resv_get_fences(). This means we
copy all the fences to some temporary array first, which is entirely
unecessary because we're holding the dma_resv lock.

All that can be tuned later on easily.

Review, comments and especially testing very much welcome.

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
  drm/scheduler: Don't store self-dependencies
  drm/sched: Check locking in drm_sched_job_await_implicit

 .gitignore                                   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |   4 +-
 drivers/gpu/drm/drm_gem.c                    |  96 -------------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  32 ++---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  63 +--------
 drivers/gpu/drm/etnaviv/etnaviv_sched.h      |   3 +-
 drivers/gpu/drm/lima/lima_gem.c              |   7 +-
 drivers/gpu/drm/lima/lima_sched.c            |  28 +---
 drivers/gpu/drm/lima/lima_sched.h            |   6 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c      |  14 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |  39 +-----
 drivers/gpu/drm/panfrost/panfrost_job.h      |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |  30 +++--
 drivers/gpu/drm/scheduler/sched_fence.c      |  15 ++-
 drivers/gpu/drm/scheduler/sched_main.c       | 135 ++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h                |   5 -
 drivers/gpu/drm/v3d/v3d_gem.c                |  91 ++++---------
 drivers/gpu/drm/v3d/v3d_sched.c              |  29 +---
 include/drm/drm_gem.h                        |   5 -
 include/drm/gpu_scheduler.h                  |  40 +++++-
 22 files changed, 282 insertions(+), 375 deletions(-)

-- 
2.32.0.rc2

