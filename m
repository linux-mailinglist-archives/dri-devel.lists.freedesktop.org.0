Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE706B5F0B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8137010E2AC;
	Sat, 11 Mar 2023 17:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2A10E29B;
 Sat, 11 Mar 2023 17:35:20 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id p6so4829095pga.0;
 Sat, 11 Mar 2023 09:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678556119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bX0H6uhIC4ov1xkv+p6jNtndq/gYH/2wBvMKwtDIDLQ=;
 b=FhW19A9pZrBAeUUapuy9VvgFIHwhTCFZ02o8yP87iXiSXPh3wNHgO1vb9Bk5wXZAu7
 C78hPaGsIngWsB5srbxsWdblnkORDK1rJbdPEBw9AKN9VIbb7c6IOTdley0OW3uq5BKj
 kcrkYr/EuWmUHax09MwonxJ8spjrJoeaFQYAlJY3oRqXLyp5Srkh411Lnpo0bCZpNVat
 h1XXVcil+w5q4bnCUO0+uEf4DpQ/S9LG9Fz9xMwa42vk2H+pBxLJaiceHwzN/LiJ1Csf
 rBR3hY4pvJeUcT3YE2S3J9rlR40szai0DtD9VfVlWfq7E/WnPinbKBgSiZoreqDkKFXu
 pBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bX0H6uhIC4ov1xkv+p6jNtndq/gYH/2wBvMKwtDIDLQ=;
 b=Yu+iqLHec1qrD4M9nNFeRntjk/NkC66nqMHxyMDaPeM6R7PIeIe7WzA4frvBnWMHft
 aKHmguRmH4XJV1qI+U7CtsWnUQwM5KNfFFl5aQVHSxkdWyotSFEZlgSjWAY5BhXdjb5+
 SNZ2H3gNGtf2XlfDxgE3wN7jZv7uhQKwuYrmoxiieshJ52WQW+xYj5Ke6ryq89WVsrhl
 iOWBfKeEutzMPlPAQAwxqgbIk27+tZGRnX6+DO5o9GLR4d2sUPFtLLcz6+yxl0796c0v
 JS92GfbgDR6npYyaqHKuFYjuNReI2m/sV3AHmwshW5iSsVaSIPCbSDC0P6oWJP+pbCj1
 Ds7g==
X-Gm-Message-State: AO0yUKWa5EsdQygk0i/u/BzQtKOguC6pjTjkmj63wfMsnFpRMRIbC6kk
 /J8afWuSG54bpcPyOAUiOwY2LJAdqPU=
X-Google-Smtp-Source: AK7set9lHGl60nFxzCoe2K1Dt4CQazs+Af39jhU2HvhFfxq2bii3Z5qax1ogs64ixQu+sQqi8O8byw==
X-Received: by 2002:aa7:9984:0:b0:5a9:d5c7:199e with SMTP id
 k4-20020aa79984000000b005a9d5c7199emr25298760pfh.9.1678556119404; 
 Sat, 11 Mar 2023 09:35:19 -0800 (PST)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 i3-20020aa787c3000000b00580e3917af7sm1721677pfo.117.2023.03.11.09.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:35:18 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Get rid of fence allocation in job_run()
Date: Sat, 11 Mar 2023 09:35:10 -0800
Message-Id: <20230311173513.1080397-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Gustavo Padovan <gustavo@padovan.org>,
 freedreno@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Inspired by https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
it seemed like a good idea to get rid of memory allocation in job_run()
by embedding the hw dma_fence in the job/submit struct.

Applies on top of https://patchwork.freedesktop.org/series/93035/ but I
can re-work it to swap the order.  I think the first patch would be
useful to amdgpu and perhaps anyone else embedding the hw_fence in the
struct containing drm_sched_job.

Rob Clark (2):
  dma-buf/dma-fence: Add dma_fence_init_noref()
  drm/msm: Embed the hw_fence in msm_gem_submit

 drivers/dma-buf/dma-fence.c          | 43 +++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_fence.c      | 45 +++++++++++-----------------
 drivers/gpu/drm/msm/msm_fence.h      |  2 +-
 drivers/gpu/drm/msm/msm_gem.h        | 10 +++----
 drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++---
 drivers/gpu/drm/msm/msm_gpu.c        |  4 +--
 drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
 include/linux/dma-fence.h            |  2 ++
 8 files changed, 66 insertions(+), 52 deletions(-)

-- 
2.39.2

