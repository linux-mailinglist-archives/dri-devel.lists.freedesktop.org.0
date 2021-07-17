Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A933CC610
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8CB6EABF;
	Sat, 17 Jul 2021 20:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A96EABF;
 Sat, 17 Jul 2021 20:25:17 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p17so7359355plf.12;
 Sat, 17 Jul 2021 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uC3Kt3XtLnkno2+Qm5TSlObC0vd0oMsVm4usUcZZhE0=;
 b=kdjwuhk9YHdADF8pebGkgWK2xYLOLwAmyNlOhdwY2UzzbqpPv320mGwes4Cy3ZTWym
 yo+kAiJdXbh/6oczbYBiWg4gXbnAS7ua7v7SVBE2PCPnVQPL2mUl14p1pGL7yByo39Md
 NTxWAx/9e4uXk9/qRWkH6cFk3QlvHa/xi0Vmuy5ZtucfZJTNWWcyPg9JvdrBeKNeSHIu
 ol8qeZ0DGyf1NMwTTNq1aWLRuLCrWcrz+I2Cpm5GYLtM5vc9TQbVMEGzCsVxEc5xHByG
 jxCmoN3m4UH/R6mMPEZHfWloLt0M8bZPjO7+kY8jg1mRgi6vk9rv5rIM9rK/BQV8yLXx
 eX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uC3Kt3XtLnkno2+Qm5TSlObC0vd0oMsVm4usUcZZhE0=;
 b=KItrLjzT7/Y5BCve2PshCbssvr4Cy5tPQ4mcWN8H4QlyV46BcqiP4j+VG10c7tpyNu
 ETM6O805Kz0amXFx5bhMY0v+u/udh+1aiDAk4OIq4LIa1IzltZUoWuI2cLVRPwj0bhpH
 mOH046kcM6O67Pqpsb4COafPJids9jgPhLfGfewxLtPAHmT3GbSCIeY94jbS3ElEgSJZ
 440TmANc+3MaZgXXNVpv9fOf3tfWnrTqmg7pOdgeM80FEUI/LvhMmp8WjviAwkg0kncs
 nxhsbIvHegCuMzmL31IZm07U1LyWwTrQTM4hGiemGBB3PSG0WSpknm2Vd0tJkeNSo3lH
 uklQ==
X-Gm-Message-State: AOAM532XUVWhfdTbKd+nxLvBkD4YuYXzNHQu12m5RAitD6zkt2IlQLAH
 y/SnEi+NaPGNBr0ocsZVi0vVM+z+BLGRRg==
X-Google-Smtp-Source: ABdhPJyVmyK0XM4kAPFQungzUnAW5TQP0BSouG+anpFQuhH4Hl65L4sSzUHwZd2jk8FfBb/SIFVN4g==
X-Received: by 2002:a17:90a:a898:: with SMTP id
 h24mr22117356pjq.208.1626553516038; 
 Sat, 17 Jul 2021 13:25:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i1sm15533365pjs.31.2021.07.17.13.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] drm/msm: drm scheduler conversion and cleanups
Date: Sat, 17 Jul 2021 13:29:02 -0700
Message-Id: <20210717202924.987514-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Emma Anholt <emma@anholt.net>,
 Bernard Zhao <bernard@vivo.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Conversion to gpu_scheduler, and bonus removal of
drm_gem_object_put_locked()

Rob Clark (11):
  drm/msm: Docs and misc cleanup
  drm/msm: Small submitqueue creation cleanup
  drm/msm: drop drm_gem_object_put_locked()
  drm: Drop drm_gem_object_put_locked()
  drm/msm/submit: Simplify out-fence-fd handling
  drm/msm: Consolidate submit bo state
  drm/msm: Track "seqno" fences by idr
  drm/msm: Return ERR_PTR() from submit_create()
  drm/msm: Conversion to drm scheduler
  drm/msm: Drop struct_mutex in submit path
  drm/msm: Utilize gpu scheduler priorities

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
 drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
 drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
 drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  10 +-
 23 files changed, 440 insertions(+), 359 deletions(-)

-- 
2.31.1

