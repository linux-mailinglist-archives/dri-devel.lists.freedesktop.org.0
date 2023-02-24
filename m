Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA906A22B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5B10E267;
	Fri, 24 Feb 2023 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61A010E267;
 Fri, 24 Feb 2023 20:02:00 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so4010596pjb.1; 
 Fri, 24 Feb 2023 12:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mk1VF7nfT+6id+DUlBftm181VOn00OpXZ9aoQ8/9Ri4=;
 b=lyvITwMHa5/MbF1J88r6mzMkAUSoXLwCAGhy6wsMTOayyUihm+WpWPPkxpvWAdS7vi
 NXhNb8mywFTPtQ83mEPdA5LWmVb5FdU7PBfd/io2R9mg+tm2sRs+7Tc7WSb9kCYdCnnm
 h3PvF0uwo/nt5wu53SbYYoOjkz2DDck2XcH9yzzK4GjjlgXLsL64hVw+y3akAQd/BH5h
 mip4ouSJlaJt/Vjv9FwgJgl6hpMNrtfehzmr+LjVOLeC7g2RKPLxs+huy11MC2XYtvwJ
 JGK2egmAG9YZn1hGsA7YUaRyl/fSgPa35jU0zjEIuB+tDD2AfuBCQrHiNue8hYzFZgqJ
 gBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mk1VF7nfT+6id+DUlBftm181VOn00OpXZ9aoQ8/9Ri4=;
 b=U+AoIhMsqPuGmLhd76fZdvPCbnU9dfMKm9ni9fDp07zQBi4FLCqYWtSvxm29TgvyKw
 w8l8nXB+9Ux9X/LcYzgV2hcWS57Obh//Q48bXemXCiHbfRboTsmo33CallJGF/aaJc+z
 gziMW0bkVJm77e4U0kTwTbOIJXc7m4dF0NnEOxMeymKEY/LigL5lu/jez8hlQk21rzTD
 WAhaACR1ZmyyjDACcLh4rpk67+QKwerqyHbeuq8rvBe+W6mZzOcKV5L4vOgq/MqB+Gsa
 h1d5/LnUkIK0VZvxcJaerr14q0fPRARFP+r2/b70eU80s/DCd4UZybL6K57Ac1PDeoat
 365Q==
X-Gm-Message-State: AO0yUKUcZp+llYLt1GLXf51BcC/DnWPdYV604yKJDQNYP0N3QzFf6Rw3
 Cyc2IubMnwVlGqZ77i8EBr1NQI/VcUg=
X-Google-Smtp-Source: AK7set/MCGgw4sWMEQil+Zu1uL8C35OoLNVcgddzAVBaEcb5RsD58//mSqRogHKbudTmp5Q9jYP+Pw==
X-Received: by 2002:a17:90a:19c5:b0:237:1f17:68ad with SMTP id
 5-20020a17090a19c500b002371f1768admr15713350pjj.18.1677268919978; 
 Fri, 24 Feb 2023 12:01:59 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a17090ae50c00b002376d85844dsm31654pjy.51.2023.02.24.12.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 12:01:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/15] dma-fence: Deadline awareness
Date: Fri, 24 Feb 2023 12:01:28 -0800
Message-Id: <20230224200155.2510320-1-robdclark@gmail.com>
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
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
v6: Re-work vblank helper to calculate time of _start_ of vblank,
    and work correctly if the last vblank event was more than a
    frame ago.  Add (mostly unrelated) drm/msm patch which also
    uses the vblank helper.  Use dma_fence_chain_contained().  More
    verbose syncobj UABI comments.  Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.

Rob Clark (15):
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
  drm/msm/atomic: Switch to vblank_start helper
  drm/i915: Add deadline based boost support

 drivers/dma-buf/dma-fence-array.c       | 11 ++++
 drivers/dma-buf/dma-fence-chain.c       | 12 ++++
 drivers/dma-buf/dma-fence.c             | 20 +++++++
 drivers/dma-buf/dma-resv.c              | 22 ++++++++
 drivers/dma-buf/sw_sync.c               | 58 +++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 27 +++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++-----
 drivers/gpu/drm/drm_vblank.c            | 52 ++++++++++++++---
 drivers/gpu/drm/i915/i915_request.c     | 20 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 -----
 drivers/gpu/drm/msm/msm_atomic.c        |  8 ++-
 drivers/gpu/drm/msm/msm_drv.c           | 12 ++--
 drivers/gpu/drm/msm/msm_fence.c         | 74 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gem.c           |  5 ++
 drivers/gpu/drm/msm/msm_kms.h           |  8 ---
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             | 17 ++++++
 include/linux/dma-fence.h               | 19 +++++++
 include/linux/dma-resv.h                |  2 +
 include/uapi/drm/drm.h                  | 17 ++++++
 include/uapi/drm/msm_drm.h              | 14 ++++-
 include/uapi/linux/sync_file.h          | 26 +++++++++
 27 files changed, 555 insertions(+), 55 deletions(-)

-- 
2.39.1

