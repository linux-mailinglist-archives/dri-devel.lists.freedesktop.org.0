Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474E3D7B9C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6516E1A3;
	Tue, 27 Jul 2021 17:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF39D6E093;
 Tue, 27 Jul 2021 17:07:30 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id l19so250235pjz.0;
 Tue, 27 Jul 2021 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ye2Guv3cXyOW7ZfoRGmuIBwYadeC5LeAizWaptWnxQU=;
 b=Z1bSFDe3kgYH5p2nFBUDVWm77dAOEJGPWxkCUql96WLMiFEoYeBTKvFTbx/umcJQU5
 UbINaTymOqgZdwPpsTOurZuohAYKULs2ULtg9XWzObURUMHo1I0xrnuLDy3acuK9r0sg
 qD3rcO2in+sgej6DPxdZ8dSJerd4ChdqW/U2abBjqcFkhDPwiUWu9QUs9YXxoDea2BVK
 kNB21wWs7MkY2YMHQYPe/+hQO5+l3TNYqhzbaQWFoXcyOXKu4WmYQYJ+ksix/Rj6riTE
 ELskoNf+c3o/W4UZSDxE0kpixzXSE7nxse8OR5lyWg4p+JKqG5vHnDW01/Av7JappEZV
 xPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ye2Guv3cXyOW7ZfoRGmuIBwYadeC5LeAizWaptWnxQU=;
 b=gAZnCUfDqTkbw3MsjJKIoz6DN/dF66aJYOceumRrrVdvAVqAkIWfLXlk505SuklS0X
 gXEGOJ+giTb86DvAqgpK0i849H7k1rzS84TkhaNtDQk8MvlOTY+kl7OVlnjxEvmxxoCE
 8VUUiylJjws2I0DEVWCVKOy+vMPO3SOCW8Vn1vxNMBrZbJUSRbAmXHeWo9r42BUm97Da
 webyDDqDm2wqTazCQqxaX3kyso8cfo7/MkJ8Xlz3kc2n9K50+fvQVsW4QNy9PFfYTJtJ
 9tF5yk53NZjRBUFLUtHI2bT+UdasnFgTdd8s0RDnnQKWZ+B3O9+7UmwspLX8jccP1bzf
 +tqA==
X-Gm-Message-State: AOAM532AVA/XEheUZErfWqasVdENm6xD8SWckDwDknuO8HXe3VDtK81W
 TT5NcVdytt9p89SzKcB+hhrNFWbI3kZ112wZ
X-Google-Smtp-Source: ABdhPJxAcX4DxFLgF/ksbBt+WjNMVAoKTXfaxSyzS6VCyHl7EdFbMun2/NlE3Fjd2qIVHa8LYP+jsA==
X-Received: by 2002:a17:90b:1109:: with SMTP id
 gi9mr5141879pjb.61.1627405649496; 
 Tue, 27 Jul 2021 10:07:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id z6sm4677930pgs.4.2021.07.27.10.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/13] drm/msm: drm scheduler conversion and cleanups
Date: Tue, 27 Jul 2021 10:11:16 -0700
Message-Id: <20210727171143.2549475-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
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
 drivers/gpu/drm/msm/msm_fence.c             |  39 ---
 drivers/gpu/drm/msm/msm_fence.h             |   2 -
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
 24 files changed, 516 insertions(+), 387 deletions(-)

-- 
2.31.1

