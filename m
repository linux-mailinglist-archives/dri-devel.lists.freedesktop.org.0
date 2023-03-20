Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9AA6C150C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348010E57B;
	Mon, 20 Mar 2023 14:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BE510E1CA;
 Mon, 20 Mar 2023 14:44:31 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id o11so12679698ple.1;
 Mon, 20 Mar 2023 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dMhzaRLYEghDDTaAukUOjdZ/Iik/E0y0uW4UbqJ2TqM=;
 b=GvrF+RNzmOBxQ+TqsOlzz04B7n9bV2JsKDO3Hw1WGk/9hFpeAK9/oUPYBYeyZwp1A7
 P7qgFFcG3rtmAU/CB/+CEBhNbJ8BvtmWkG4KDb8MKL02r2dVgp9qkNl+B3Jckp8alNa4
 naCbB7dsaLkwjhlxp5vfO4EygzOO9n9So/JPXF1e+xNRna5OiBZFge5FtMUcQcDeJvMg
 RoERbo3dnKPlpZYx39najggHt4DE+SCAEpkNbxGfsDRjC2DGMt3oQT9P/G8vhtTCl1Ih
 j/oKv2karvzTjIqcDZMQL02/OgaT8AtAYDloCRtsZ2c0xrNcT+5iylz+JmPUvm48SC5R
 Z0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dMhzaRLYEghDDTaAukUOjdZ/Iik/E0y0uW4UbqJ2TqM=;
 b=WZWymAJjuQWnoxYc6j6KaPpFBl52uVUuehNgxKJg2mHBUs8YI7jnXkyQJxiLqkXjN4
 SkBG1zycX4QW4joIf7eJwHyaDoZNVA62DI4vl971xgi3YpRw2LtgnquWRYXB5+zZzXv6
 atzgulEmwNt3kcLQMIRGPLbXvhq0fP+9yhB5NJzxKvc/uv2EUttKwDBPnyk6NJ8rOrbH
 ZnYqkG2lmvM1Rv3HallkvCVZj2bcWl4rKQwJkan2DaDZ9KXtuaVonNsCq+S+1OuKohJS
 Eor/vI4D+uzUH7N+FeRUPZbB1xDY6m+Jo2xxTunw/kzZjH6CSkTs/B4hLnejtQCmWdJp
 6OGw==
X-Gm-Message-State: AO0yUKXBEGWufRtNJM7elLBK0RJjnaRbfYlCKXS++ASnb6bBH70HutIe
 S0nhE8JFKx1zmnQaxElmYHY3RbSUrqw=
X-Google-Smtp-Source: AK7set9reBYzkV18C2W+fMnszNOS+kEcYoU78TDsvGmMYca/7z3m6tyw8LOHfjrSRkhQVTmz0g94Hw==
X-Received: by 2002:a17:902:e40d:b0:1a1:a996:feb3 with SMTP id
 m13-20020a170902e40d00b001a1a996feb3mr8424096ple.26.1679323470941; 
 Mon, 20 Mar 2023 07:44:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170902934700b0019d397b0f18sm6776907plp.214.2023.03.20.07.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/23] drm/msm+PM+icc: Make job_run() reclaim-safe
Date: Mon, 20 Mar 2023 07:43:22 -0700
Message-Id: <20230320144356.803762-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Inspired by https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
it seemed like a good idea to get rid of memory allocation in job_run()
fence signaling path, and use lockdep annotations to yell at us about
anything that could deadlock against shrinker/reclaim.  Anything that
can trigger reclaim, or block on any other thread that has triggered
reclaim, can block the GPU shrinker from releasing memory if it is
waiting the job to complete, causing deadlock.

The first patch pre-allocates the hw_fence, splitting allocation and
initialization, to avoid allocation in the job_run() path.  The next
eight decouple the obj lock from job_run(), as the obj lock is required
to pin/unpin backing pages (ie. holding an obj lock in job_run() could
deadlock the shrinker by blocking forward progress towards pinned buffers
becoming idle).  Followed by two so that we could idr_preload() in order
to avoid memory allocations under locks indirectly connected to the
shrinker path.

Next are three paths to decouple initialization (where allocations are
needed) from GPU runpm and devfreq, to avoid allocations in the fence
signaling path.  Followed by various PM devfreq/qos and interconnect
locking fixes to decouple initialization (allocation) from runtime.

And finally, the last patch is a modified version of danvet's patch to
add lockdep annotations to gpu scheduler, but does so conditionally so
that drivers can opt-in.

v2: Switch from embedding hw_fence in submit/job object to preallocating
    the hw_fence.  Rework "fenced unpin" locking to drop obj lock from
    fence signaling path (ie. the part that was still WIP in the first
    iteration of the patchset).  Adds the final patch to enable fence
    signaling annotations now that job_run() and job_free() are safe.
    The PM devfreq/QoS and interconnect patches are unchanged.

Rob Clark (23):
  drm/msm: Pre-allocate hw_fence
  drm/msm: Move submit bo flags update from obj lock
  drm/msm/gem: Tidy up VMA API
  drm/msm: Decouple vma tracking from obj lock
  drm/msm/gem: Simplify vmap vs LRU tracking
  drm/gem: Export drm_gem_lru_move_tail_locked()
  drm/msm/gem: Move update_lru()
  drm/msm/gem: Protect pin_count/madv by LRU lock
  drm/msm/gem: Avoid obj lock in job_run()
  drm/msm: Switch idr_lock to spinlock
  drm/msm: Use idr_preload()
  drm/msm/gpu: Move fw loading out of hw_init() path
  drm/msm/gpu: Move BO allocation out of hw_init
  drm/msm/a6xx: Move ioremap out of hw_init path
  PM / devfreq: Drop unneed locking to appease lockdep
  PM / devfreq: Teach lockdep about locking order
  PM / QoS: Fix constraints alloc vs reclaim locking
  PM / QoS: Decouple request alloc from dev_pm_qos_mtx
  PM / QoS: Teach lockdep about dev_pm_qos_mtx locking order
  soc: qcom: smd-rpm: Use GFP_ATOMIC in write path
  interconnect: Fix locking for runpm vs reclaim
  interconnect: Teach lockdep about icc_bw_lock order
  drm/sched: Add (optional) fence signaling annotation

 drivers/base/power/qos.c                   |  83 +++++++++---
 drivers/devfreq/devfreq.c                  |  52 ++++----
 drivers/gpu/drm/drm_gem.c                  |  11 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  48 ++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  18 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  46 ++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c |   6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   9 +-
 drivers/gpu/drm/msm/msm_drv.c              |   6 +-
 drivers/gpu/drm/msm/msm_fence.c            |  12 +-
 drivers/gpu/drm/msm/msm_fence.h            |   3 +-
 drivers/gpu/drm/msm/msm_gem.c              | 145 ++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem.h              |  29 +++--
 drivers/gpu/drm/msm/msm_gem_submit.c       |  27 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c          |  91 ++++++++++---
 drivers/gpu/drm/msm/msm_gpu.h              |   8 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |   9 +-
 drivers/gpu/drm/msm/msm_submitqueue.c      |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     |   9 ++
 drivers/interconnect/core.c                |  18 ++-
 drivers/soc/qcom/smd-rpm.c                 |   2 +-
 include/drm/drm_gem.h                      |   1 +
 include/drm/gpu_scheduler.h                |   2 +
 23 files changed, 416 insertions(+), 221 deletions(-)

-- 
2.39.2

