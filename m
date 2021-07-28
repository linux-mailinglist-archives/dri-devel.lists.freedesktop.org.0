Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4E3D84F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392606EB7D;
	Wed, 28 Jul 2021 01:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D006EB7D;
 Wed, 28 Jul 2021 01:02:23 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id e5so659734pld.6;
 Tue, 27 Jul 2021 18:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JnNg+LtmUtuMVbhwKpc+TsfLTbQ0CCjgGn2ha7kyTe4=;
 b=jAEhX2vgfmLiBn/ABCM8HM+m6KEW9HsmuvIFt5Nb8Ze0p6OBtUT9v9SWOobzrxOPAJ
 OPVve9cPQNN4lNlgltzg3wrLueqe9WyMCOkCtZ3LTyrMRPrT4mPxqrTFpjB4BrZGFTZz
 W0WTXH2ZtlfGjZnEGUXMjgX3j3c/hvnwS/Cc/uwgWLoSkwM5R0iU1OT9ZxcYgTQJ3ZVw
 gX1jdASZZs5Aza9+J13g7ZbHaqoL7/TARhxbAxwvFzB5mmt9d54oToIZukcX+rTg1k1O
 25WAQ8Gg+3/bggl9+wYGch3j98a1XDMWOs2lvt+wszlrhRXtPoomRki1StVlkV6I6oqG
 nGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JnNg+LtmUtuMVbhwKpc+TsfLTbQ0CCjgGn2ha7kyTe4=;
 b=k7cyHrSYODgxou0VW7ztv+U+viR2n/3vBXmBTaEyzLz2va+aY24cMmYykGx+qvU29n
 2RrthU4goNFJLui9bI8xG9SYpg5H/5aNgCsmzXuC7NOAUBlwtBnriq25W67o8CflOREx
 KtoV3EjwYwu+6NG7+HDqgGoSK3fgn293h8lWG5ZBPT2VIr8LnlUctyx8j9MpeCWXYZy6
 LxavPcQgjB7XdQXqL9YU6JspM2zGO4iNhRSqnuYUa7x2lOFN5AQX1CHjH+7GdKhHn1DE
 8B0U90mEhF6BaSIPcZovwhr+YrwT1NB3zbH1H9CGF5gUFlnTt5h5HEOvcAiZoEnP3glA
 L/Yg==
X-Gm-Message-State: AOAM530ehUEFO+5zB0s5osJcKuTkIrVegAumCjBMiONjiiP0FZ/uxra4
 85AhC5/HMuNN+jNQqZsFYMFJU5u0IVwXJM/E
X-Google-Smtp-Source: ABdhPJwE8048m0W7kGr6PrR8geRv+/5g1CPr5++AujkltYbWKD/aIwJ8tcj6XPlLbxcvsdGz2drG9A==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr7933192pgr.2.1627434142666;
 Tue, 27 Jul 2021 18:02:22 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n17sm5405596pgj.93.2021.07.27.18.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/13] drm/msm: drm scheduler conversion and cleanups
Date: Tue, 27 Jul 2021 18:06:05 -0700
Message-Id: <20210728010632.2633470-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Emma Anholt <emma@anholt.net>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Conversion to gpu_scheduler, and bonus removal of
drm_gem_object_put_locked()

v2: Fix priority mixup (msm UAPI has lower numeric priority value as
    higher priority, inverse of drm/scheduler) and add some comments
    in the UAPI header to clarify.

    Now that we move active refcnt get into msm_gem_submit, add a
    patch to mark all bos busy before pinning, to avoid evicting bos
    used in same batch.

    Fix bo locking for cmdstream dumping ($debugfs/n/{rd,hangrd})

v3: Add a patch to drop submit bo_list and instead use -EALREADY
    to detect errors with same obj appearing multiple times in the
    submit ioctl bos table.  Otherwise, with struct_mutex locking
    dropped, we'd need to move insertion into and removal from
    bo_list under the obj lock.

v4: One last small tweak, drop unused wait_queue_head_t in
    msm_fence_context

Rob Clark (13):
  drm/msm: Docs and misc cleanup
  drm/msm: Small submitqueue creation cleanup
  drm/msm: drop drm_gem_object_put_locked()
  drm: Drop drm_gem_object_put_locked()
  drm/msm/submit: Simplify out-fence-fd handling
  drm/msm: Consolidate submit bo state
  drm/msm: Track "seqno" fences by idr
  drm/msm: Return ERR_PTR() from submit_create()
  drm/msm: Conversion to drm scheduler
  drm/msm: Drop submit bo_list
  drm/msm: Drop struct_mutex in submit path
  drm/msm: Utilize gpu scheduler priorities
  drm/msm/gem: Mark active before pinning

 drivers/gpu/drm/drm_gem.c                   |  22 --
 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/msm_drv.c               |  30 +-
 drivers/gpu/drm/msm/msm_fence.c             |  42 ---
 drivers/gpu/drm/msm/msm_fence.h             |   3 -
 drivers/gpu/drm/msm/msm_gem.c               |  94 +-----
 drivers/gpu/drm/msm/msm_gem.h               |  47 +--
 drivers/gpu/drm/msm/msm_gem_submit.c        | 344 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.c               |  46 +--
 drivers/gpu/drm/msm/msm_gpu.h               |  78 ++++-
 drivers/gpu/drm/msm/msm_rd.c                |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 +++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  53 ++-
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  14 +-
 24 files changed, 516 insertions(+), 391 deletions(-)

-- 
2.31.1

