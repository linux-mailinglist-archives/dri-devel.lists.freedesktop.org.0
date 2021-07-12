Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747643C646D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8942589DAB;
	Mon, 12 Jul 2021 20:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB3489DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:01:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l7so26343382wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQ/9B9gp7BfGv+I7EqOLo+1pdU+MHrWq3XnBCjgYxfk=;
 b=L5UHG+Kw93Duna2ZzLKxXclr1qe2L7eKrxZVfnALrgN3ZvRUXbvGDBsAn2G9U5GC8r
 y8icd8rtiA2tBHfdM8R17XgM6GQxNpC7zOWNQo1VDPs9q3u2xG2hxHI1U4pRL0lU1ryo
 /oU3iSEV1RilOpA+RVhi5NAX8nNscXiumHtGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQ/9B9gp7BfGv+I7EqOLo+1pdU+MHrWq3XnBCjgYxfk=;
 b=eH9IDJumOp2NE+e/BNP/A0PYE4c9PcgtBzyYUophVWyj17alZPJmae2AiWgnARoNC/
 1Uss1TOpGBLp7k2xuzqdD9nM0GXHPxJYHQF9IX/0ofNhauVckinPSn8mhufrKcKk2dBA
 MOeDRr+NIfV5TqD/PE5EtKGWE8QjzBSMbL2Q+D440/x1PQZCfPo0P/lyTN94zJFL+tds
 oHiOr85F56sTWNI68d/Zu/e+xOd0SKuMA6WHDNhvxf5RjE5ZA+jXtDA9cnBfhso28lbk
 NJ7ZgFjIepLjK6J6GBPRyOPZTk/pNeMfKvB90RIGayo1VVu7uqKpWpW0zQtJSt06OHpk
 Ejbg==
X-Gm-Message-State: AOAM533h5rG8ZC+0M/sbqBJPdmpp6rx+IpIBwnXkmuPBQByyZsqBHRUY
 MyURDFA7iS7TDB1uNbCgXc502xSXzXMsrw==
X-Google-Smtp-Source: ABdhPJzOI24tnXrMeIteuBh5hI+52aMMqGVPI4see49LW0OfBDMJaxaqIYU4yTWmDbOOrG1PEqEybg==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr818971wri.199.1626120116991; 
 Mon, 12 Jul 2021 13:01:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:01:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 00/18] drm/sched dependency tracking and dma-resv fixes
Date: Mon, 12 Jul 2021 19:53:34 +0200
Message-Id: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Quick new version since the previous one was a bit too broken:
- dropped the bug-on patch to avoid breaking amdgpu's gpu reset failure
  games
- another attempt at splitting job_init/arm, hopefully we're getting
  there.

Note that Christian has brought up a bikeshed on the new functions to add
dependencies to drm_sched_jobs. I'm happy to repaint, if there's some kind
of consensus on what it should be.

Testing and review very much welcome, as usual.

Cheers, Daniel

Daniel Vetter (18):
  drm/sched: Split drm_sched_job_init
  drm/sched: Barriers are needed for entity->last_scheduled
  drm/sched: Add dependency tracking
  drm/sched: drop entity parameter from drm_sched_push_job
  drm/sched: improve docs around drm_sched_entity
  drm/panfrost: use scheduler dependency tracking
  drm/lima: use scheduler dependency tracking
  drm/v3d: Move drm_sched_job_init to v3d_job_init
  drm/v3d: Use scheduler dependency handling
  drm/etnaviv: Use scheduler dependency handling
  drm/gem: Delete gem array fencing helpers
  drm/sched: Don't store self-dependencies
  drm/sched: Check locking in drm_sched_job_await_implicit
  drm/msm: Don't break exclusive fence ordering
  drm/etnaviv: Don't break exclusive fence ordering
  drm/i915: delete exclude argument from i915_sw_fence_await_reservation
  drm/i915: Don't break exclusive fence ordering
  dma-resv: Give the docs a do-over

 Documentation/gpu/drm-mm.rst                  |   3 +
 drivers/dma-buf/dma-resv.c                    |  24 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   4 +-
 drivers/gpu/drm/drm_gem.c                     |  96 ---------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h         |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  64 +++---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  65 +-----
 drivers/gpu/drm/etnaviv/etnaviv_sched.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   8 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |   6 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |   1 -
 drivers/gpu/drm/lima/lima_gem.c               |   7 +-
 drivers/gpu/drm/lima/lima_sched.c             |  28 +--
 drivers/gpu/drm/lima/lima_sched.h             |   6 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  16 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  39 +---
 drivers/gpu/drm/panfrost/panfrost_job.h       |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 140 +++++++------
 drivers/gpu/drm/scheduler/sched_fence.c       |  19 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 181 +++++++++++++++--
 drivers/gpu/drm/v3d/v3d_drv.h                 |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 | 115 +++++------
 drivers/gpu/drm/v3d/v3d_sched.c               |  44 +----
 include/drm/drm_gem.h                         |   5 -
 include/drm/gpu_scheduler.h                   | 186 ++++++++++++++----
 include/linux/dma-buf.h                       |   7 +
 include/linux/dma-resv.h                      | 104 +++++++++-
 31 files changed, 672 insertions(+), 528 deletions(-)

-- 
2.32.0

