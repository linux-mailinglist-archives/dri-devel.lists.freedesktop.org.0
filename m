Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54653C1845
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD686E947;
	Thu,  8 Jul 2021 17:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9566E920
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r11so3268306wro.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWlDoXlQmHtBxs4oHwjRSIvVGsFtUrJ9E/m8KTpgPLs=;
 b=Vj2yac8Ah/quRr9kx/L6x4AmrqFKCm+rtbhd3uAQHgNIdQWI2crzlkTZ4j1tQAYK6O
 DDlK3BE2g9AECYy1IR50x0iF0ohWRgk+E4wwTxARgtNvCGMzDTrg6guAzFO97kKQp8gO
 UZ2/GmAk+nvVO68DF9U2heKd0MSUWpgHblago=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWlDoXlQmHtBxs4oHwjRSIvVGsFtUrJ9E/m8KTpgPLs=;
 b=GodRrX2p/fIgEMAmGXbKAcXOjK1d6YxVa57b/k29evc1IzVpBzjzFfYy6Ur+f2DSd0
 mf1RH1LF6FPKZ9DECigc16rpd1VPtVRFphwkn0Htd0h02EO4hioFfsD21K2Roy4J0LSd
 kVQpT9WvU71VJ6iHU0AJWskKV+KBSAJZCwE1wt7eSnpITn3aU63m53qoT7R6Upj3N2vy
 pqVWpAHTo9JVQlrkZwPpmUwMZ5/4neBlLZjesFsI5m/0j46sP8mvM/U6iiLHc6J+Z6db
 qTghnE9JepimgDk7Qd5Bl/R7zaynQRCBFLLMSwlqcAuZgrbgpuZyx8AR0fWRxRPYwnAO
 KNIg==
X-Gm-Message-State: AOAM530UkD1iBTuP1kvhxfrS0/hsTPJpr4MQuQWXYZfpbn3drkPU25pV
 eUYEHFTwWMuYdlAer5vn9bLTR0l+ckbrGA==
X-Google-Smtp-Source: ABdhPJzuVAVg0Ft2T67fRkxQ/GnwCVAtiJflqfwwxlwcG8Ij8TU6prPpUaQTa8yvuswIXt+W3ke60A==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr35813132wru.350.1625765886009; 
 Thu, 08 Jul 2021 10:38:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 00/20] drm/sched dependency tracking and dma-resv fixes
Date: Thu,  8 Jul 2021 19:37:34 +0200
Message-Id: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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

Hil all,

I figured I'll combine the two series, they build on top of each another
anyway. Changes:

- drop broken i915 patch (Matt)
- typos and improvements in the dma-resv patch
- bunch of fixes to the drm_sched_job_init/arm split (Melissa, Christian)
- threw a drm_sched_entity doc patch on top

Testing & review very much welcome.

Cheers, Daniel

Christian König (1):
  drm/msm: always wait for the exclusive fence

Daniel Vetter (19):
  drm/sched: entity->rq selection cannot fail
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
 drivers/gpu/drm/msm/msm_gem.c                 |  16 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  16 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  39 +---
 drivers/gpu/drm/panfrost/panfrost_job.h       |   5 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 140 +++++++------
 drivers/gpu/drm/scheduler/sched_fence.c       |  19 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 177 +++++++++++++++--
 drivers/gpu/drm/v3d/v3d_drv.h                 |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 | 115 +++++------
 drivers/gpu/drm/v3d/v3d_sched.c               |  44 +----
 include/drm/drm_gem.h                         |   5 -
 include/drm/gpu_scheduler.h                   | 186 ++++++++++++++----
 include/linux/dma-buf.h                       |   7 +
 include/linux/dma-resv.h                      | 104 +++++++++-
 32 files changed, 674 insertions(+), 538 deletions(-)

-- 
2.32.0

