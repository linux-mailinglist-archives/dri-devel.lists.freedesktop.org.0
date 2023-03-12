Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2796B6B2A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971E110E142;
	Sun, 12 Mar 2023 20:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A267110E153;
 Sun, 12 Mar 2023 20:42:23 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id d13so1311pjh.0;
 Sun, 12 Mar 2023 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eS81Bbeb7DUO+iRkvmtrK0oB4SfcOjiUFR0rKW60MA0=;
 b=G2a3X2goAyICa7qoVr4TjJ4/OOQ1EmoCBXmcNPEVfAKqhAEIho/AfxQDCMbOYQNb6/
 VsK86lLGHo82G880+GfCwnB7NZj1LH0T7klN9abmbKa3C8/6ysyzwU7sxSjjzz/XL6oO
 vAuH1AamSgl6MUBggR0tNxojaYXKDM1IjIEcV5GY0MN5QC8uZEjZMKvOttvLv58I+FHt
 xQm7dqeB+g/b7H6pg95qji23VUNrDetgUorQn2HxhlXGTz3ne2burkaHbyZqOA/jKSNX
 WdnpofFPER2tIU2FTgT2WccI6i5Vl7jnW7WFD3EdyaZysEXME+eXg3NnWksiH0E54H0O
 oM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eS81Bbeb7DUO+iRkvmtrK0oB4SfcOjiUFR0rKW60MA0=;
 b=O+IqHoxwOKmTkc2Vyxy+kckQoA/nXACUKGjQlHQ+0DDKEBQ/Nv76tYo3WXpteyy9qe
 BwdGepE1NWiqeKzDNhvyvnIBc4lrsFLuXzkAqcdyWkLmjkcUPs/tARndgVgzvFTm1BjZ
 iFz5Xij1pOkzIoBMnPMLQ9XEvKmk6bXBhcVMxPOjSykwK+7qNr/Nb2/KBdLn9FLlQsmI
 ISUlBzjUdVxfYIHsFeCzoiQfv/H9Qoxi3kp7db3zMUQnwijjC1IQBy8nxL/jsznJEsiv
 y38zBh8+Ew/Ab6tC8ddBRCUCqXKd29xxEa7qahRmo2qmWZzafUhmUfHNrHzP+t3YtSEp
 fOHg==
X-Gm-Message-State: AO0yUKW7wczvjRvTnEaKBw9FORdlGRy3gtZLSESTCOJLGsF4avwMNY5d
 RbEpcL3WSZSkB1MlZ6wZnl3BiDajud0=
X-Google-Smtp-Source: AK7set+UpZ1DihZTdG/FUvyuXyzqzkkjcn3UiFdPutNdqCaUQZDans3Wexm2twEh9BfXyHomUFqSlQ==
X-Received: by 2002:a17:902:a9cb:b0:19a:df76:ddd2 with SMTP id
 b11-20020a170902a9cb00b0019adf76ddd2mr27656409plr.36.1678653742882; 
 Sun, 12 Mar 2023 13:42:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170902e5c600b001a049441fc8sm472317plf.193.2023.03.12.13.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/13] drm/msm+PM+icc: Make job_run() reclaim-safe
Date: Sun, 12 Mar 2023 13:41:28 -0700
Message-Id: <20230312204150.1353517-1-robdclark@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Rob Clark <robdclark@chromium.org>, Luca Weiss <luca@z3ntu.xyz>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Nathan Chancellor <nathan@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maximilian Luz <luzmaximilian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Inspired by https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
it seemed like a good idea to get rid of memory allocation in job_run()
and use lockdep annotations to yell at us about anything that could
deadlock against shrinker/reclaim.  Anything that can trigger reclaim,
or block on any other thread that has triggered reclaim, can block the
GPU shrinker from releasing memory if it is waiting the job to complete,
causing deadlock.

The first two patches avoid memory allocation for the hw_fence by
embedding it in the already allocated submit object.  The next three
decouple various allocations that were done in the hw_init path, but
only the first time, to let lockdep see that they won't happen in the
job_run() path.  (The hw_init() path re-initializes the GPU after runpm
resume, etc, which can happen in the job_run() path.)

The remaining patches clean up locking issues in various corners of PM
and interconnect which happen in the runpm path.  These fixes can be
picked up independently by the various maintainers.  In all cases I've
added lockdep annotations to help keep the runpm resume path deadlock-
free vs reclaim, but I've broken those out into their own patches.. it
is possible that these might find issues in other code-paths not hit on
the hw I have.  (It is a bit tricky because of locks held across call-
backs, such as devfreq->lock held across devfreq_dev_profile callbacks.
I've audited these and other callbacks in icc, etc, to look for problems
and fixed one I found in smd-rpm.  But that took me through a number of
drivers and subsystems that I am not familiar with so it is entirely
possible that I overlooked some problematic allocations.)

There is one remaining issue to resolve before we can enable the job_run
annotations, but it is entirely self contained in drm/msm/gem.  So it
should not block review of these patches.  So I figured it best to send
out what I have so far.

Rob Clark (13):
  dma-buf/dma-fence: Add dma_fence_init_noref()
  drm/msm: Embed the hw_fence in msm_gem_submit
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

 drivers/base/power/qos.c                   | 83 ++++++++++++++++------
 drivers/devfreq/devfreq.c                  | 52 +++++++-------
 drivers/dma-buf/dma-fence.c                | 43 ++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 48 ++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 18 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 46 ++++++------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  6 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  9 +--
 drivers/gpu/drm/msm/msm_fence.c            | 43 +++++------
 drivers/gpu/drm/msm/msm_fence.h            |  2 +-
 drivers/gpu/drm/msm/msm_gem.h              | 10 +--
 drivers/gpu/drm/msm/msm_gem_submit.c       |  8 +--
 drivers/gpu/drm/msm/msm_gpu.c              |  4 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  6 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  4 +-
 drivers/interconnect/core.c                | 18 ++++-
 drivers/soc/qcom/smd-rpm.c                 |  2 +-
 include/linux/dma-fence.h                  |  2 +
 18 files changed, 237 insertions(+), 167 deletions(-)

-- 
2.39.2

