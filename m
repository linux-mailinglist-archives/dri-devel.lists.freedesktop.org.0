Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A45569D49F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AC010E78A;
	Mon, 20 Feb 2023 20:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821E10E78A;
 Mon, 20 Feb 2023 20:19:20 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so2483318pjb.0; 
 Mon, 20 Feb 2023 12:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c3iZVIEmRSqrThUkMgFnNzdxbCW0+gwLuKMdSEBTZdk=;
 b=XudzNzCm0FKe2lIo1qRVr5sLuN77pLHRaJAkpk5nN+kAMt5yxOrww7exfQ1KGHBxvw
 Qfq44H7k2ZhIY4RKNIWr1Ig2n9JnpB/KLPeADSuGGggoSD99Kp/QDnvcqkJPleFaVd3t
 V5GQuD1elokWuQM+NpoVHXi17Jc5JatN7pvdSJmtv2906bbPCITMy01jb/RVSAhrH1s2
 WYEGJpXDRWTfffqIQb7PFW5bDjSIhaozxo5JpWKIJfrha99mGl0ggB4dyMk8L3V1Lt2n
 csH0zYdlwff/KHZIEDaTvd0GdzhjJRBcfCQ8rbqF0wRmYRf0o3kXSpsmxnUkZqkJo9iR
 5PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3iZVIEmRSqrThUkMgFnNzdxbCW0+gwLuKMdSEBTZdk=;
 b=QItr/6pCseGStBESenytFlQ7uX66M24Ydq7y+O1c9bfC1V71faKYmgx0+vZRrnAfsi
 UI6akgWAf1W49+P7ty0a0uSC21iMVbeqNSxCgTbM9vf1qX6z3L6umBZ+UXJ1Pr2Xae0B
 67m6wEMKOpZyGBsivdLxkFPD9THB+tw48FoZTKpIyaNn4EdT28CQshQpuw2IgCV9eE6k
 5WBgvjMXwkV5ECXykAxeG9/gAb+uPBjy8qkkio3GCvTJlV1Ez6E1oI3e00RyHiRiIMGk
 XcOTaoFGHx6E4EKLLy98NHUubsRvMZ7lzS4Arssr93KbcYDw4PNkj/GZg4jO5lULW/Sz
 +WjA==
X-Gm-Message-State: AO0yUKX38tRsXRHwtUeccisGH/wCjis6um8V8s3WtMXXfGTmfSAFk5L5
 65j71ag1o6J1+AH0sD6gH8sGf/1VPTA=
X-Google-Smtp-Source: AK7set98IO8l+gABanedVbXmDYUvdtim10BgWM5gyRskazHJbLVCeykOeOFx9FaeUCzP6cQ+Vn5YOQ==
X-Received: by 2002:a17:90b:4a43:b0:234:10c:a0d0 with SMTP id
 lb3-20020a17090b4a4300b00234010ca0d0mr2998947pjb.6.1676924359710; 
 Mon, 20 Feb 2023 12:19:19 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a17090ad24e00b0023087e8adf8sm1839664pjw.21.2023.02.20.12.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/14] dma-fence: Deadline awareness
Date: Mon, 20 Feb 2023 12:18:47 -0800
Message-Id: <20230220201916.1822214-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This series adds a deadline hint to fences, so realtime deadlines
such as vblank can be communicated to the fence signaller for power/
frequency management decisions.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

This iteration adds a dma-fence ioctl to set a deadline (both to
support igt-tests, and compositors which delay decisions about which
client buffer to display), and a sw_sync ioctl to read back the
deadline.  IGT tests utilizing these can be found at:

  https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline


v1: https://patchwork.freedesktop.org/series/93035/
v2: Move filtering out of later deadlines to fence implementation
    to avoid increasing the size of dma_fence
v3: Add support in fence-array and fence-chain; Add some uabi to
    support igt tests and userspace compositors.
v4: Rebase, address various comments, and add syncobj deadline
    support, and sync_file EPOLLPRI based on experience with perf/
    freq issues with clvk compute workloads on i915 (anv)
v5: Clarify that this is a hint as opposed to a more hard deadline
    guarantee, switch to using u64 ns values in UABI (still absolute
    CLOCK_MONOTONIC values), drop syncobj related cap and driver
    feature flag in favor of allowing count_handles==0 for probing
    kernel support.

Rob Clark (14):
  dma-buf/dma-fence: Add deadline awareness
  dma-buf/fence-array: Add fence deadline support
  dma-buf/fence-chain: Add fence deadline support
  dma-buf/dma-resv: Add a way to set fence deadline
  dma-buf/sync_file: Add SET_DEADLINE ioctl
  dma-buf/sync_file: Support (E)POLLPRI
  dma-buf/sw_sync: Add fence deadline support
  drm/scheduler: Add fence deadline support
  drm/syncobj: Add deadline support for syncobj waits
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/msm: Add deadline based boost support
  drm/msm: Add wait-boost support
  drm/i915: Add deadline based boost support

 drivers/dma-buf/dma-fence-array.c       | 11 ++++
 drivers/dma-buf/dma-fence-chain.c       | 13 +++++
 drivers/dma-buf/dma-fence.c             | 21 +++++++
 drivers/dma-buf/dma-resv.c              | 22 ++++++++
 drivers/dma-buf/sw_sync.c               | 58 +++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 27 +++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_syncobj.c           | 59 +++++++++++++++-----
 drivers/gpu/drm/drm_vblank.c            | 32 +++++++++++
 drivers/gpu/drm/i915/i915_request.c     | 20 +++++++
 drivers/gpu/drm/msm/msm_drv.c           | 12 ++--
 drivers/gpu/drm/msm/msm_fence.c         | 74 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gem.c           |  5 ++
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             |  8 +++
 include/linux/dma-fence.h               | 20 +++++++
 include/linux/dma-resv.h                |  2 +
 include/uapi/drm/drm.h                  |  5 ++
 include/uapi/drm/msm_drm.h              | 14 ++++-
 include/uapi/linux/sync_file.h          | 23 ++++++++
 24 files changed, 513 insertions(+), 20 deletions(-)

-- 
2.39.1

