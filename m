Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DAA69BC1B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EA710E009;
	Sat, 18 Feb 2023 21:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF8D10E009;
 Sat, 18 Feb 2023 21:15:48 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m8so430251plg.3;
 Sat, 18 Feb 2023 13:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ly4gQbq9/GnWUeWA60KPz/G+dzGxkcXgw5HCdzXbiDM=;
 b=TqzurTwkIi7vl6x42AjsrYN5etY5UrhYSRhuhRA0DcAed3BQ7kd+EShu6ZYUuzSWS6
 f2ShdvpTlDiEddzw1Pngzl0gliC9vI89r49p462MNjyf7n2fk9K5rG40sbyi9YeAuXKx
 2IlQ6wVLZDk4ujSNogI1BVXRPnZyG9XodQul+Gt/IjgeqRh2hZMfbddpy2FwGlj/orZk
 nSpYnyQj/uh7kMZhl+cXvFJ9VgfGaRbtRluybITkUr1SLZHCZANTXG1WLO5m6DiwYoul
 TaCi+7mlADXeBpnG/jw9xXwtKwm9Focdx2Pr+MJUZva3Y7KD/ZaKPJ7prjd0RN12Eg1h
 3+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ly4gQbq9/GnWUeWA60KPz/G+dzGxkcXgw5HCdzXbiDM=;
 b=4iYZeNiSCEf6HuaKN4UImbVDNTd4hszfMgfG5mxnsWs/zy7w6OM2K+8bHqz/3aFOa4
 Wt31kYQMrG1fIc9W17iPKr1dGo7b2z19fOLWh+OvfQDkhysLdJuRSKMoDEd7YxRILxK9
 djnFq2rSQ3xL1pjBUtMNjRQaZc6Tn68xHPfyg1j8cFEYFIwYN0JsmOY80d0yB0woVEBJ
 NZ0sRptjiTH5FUMZ4l0Imo0C9TbLh+nPY5NH0cv86i+jCfJ0+HSDYJo6Z/eOcjEaO+Dx
 Uio/f2gB7VbfPW2Cpx2oKIvbFMHcgLbVcG1kg3HDDRLQ1Fv4/2oREw6gwK+eBB3u71lZ
 tAog==
X-Gm-Message-State: AO0yUKXHClaYWM5Epus+SZQc3XQApIIAG1HltMtPEsLTZNxWyNCFWpDJ
 Lzt+utprJiP+n4lnScPYqg6Sq+vzjtQ=
X-Google-Smtp-Source: AK7set8ereILC0V3ZBU5NrGgoh8oJHY1jqZ0fuA0KAdXBnGUn7hGdkEc1QzSShEe+BIohVgIIE6grw==
X-Received: by 2002:a17:90a:31c:b0:234:2627:d9b0 with SMTP id
 28-20020a17090a031c00b002342627d9b0mr1042232pje.32.1676754948302; 
 Sat, 18 Feb 2023 13:15:48 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 gl19-20020a17090b121300b00230da56ddecsm1292126pjb.27.2023.02.18.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/14] dma-fence: Deadline awareness
Date: Sat, 18 Feb 2023 13:15:43 -0800
Message-Id: <20230218211608.1630586-1-robdclark@gmail.com>
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

This series adds deadline awareness to fences, so realtime deadlines
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
 drivers/dma-buf/dma-fence.c             | 20 +++++++
 drivers/dma-buf/dma-resv.c              | 19 +++++++
 drivers/dma-buf/sw_sync.c               | 58 +++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 27 +++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_ioctl.c             |  3 +
 drivers/gpu/drm/drm_syncobj.c           | 59 ++++++++++++++++----
 drivers/gpu/drm/drm_vblank.c            | 32 +++++++++++
 drivers/gpu/drm/i915/i915_driver.c      |  2 +-
 drivers/gpu/drm/i915/i915_request.c     | 20 +++++++
 drivers/gpu/drm/msm/msm_drv.c           | 16 ++++--
 drivers/gpu/drm/msm/msm_fence.c         | 74 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gem.c           |  5 ++
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_drv.h                   |  6 ++
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             |  8 +++
 include/linux/dma-fence.h               | 20 +++++++
 include/linux/dma-resv.h                |  2 +
 include/uapi/drm/drm.h                  | 16 +++++-
 include/uapi/drm/msm_drm.h              | 14 ++++-
 include/uapi/linux/sync_file.h          | 22 ++++++++
 27 files changed, 532 insertions(+), 22 deletions(-)

-- 
2.39.1

