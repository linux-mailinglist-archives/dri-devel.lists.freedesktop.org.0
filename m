Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE9B282CF5
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47189E65;
	Sun,  4 Oct 2020 19:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13E89E65;
 Sun,  4 Oct 2020 19:21:07 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id t7so4189158pjd.3;
 Sun, 04 Oct 2020 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaCk20iXyuPTfKj7M2JUxIMfw5amxERCJiUzQ3nZIzw=;
 b=qLZ7yrwgSd/akc7eV6/QqOdy2cpN4vxD1+cGMw+6nQlnrAM2UZycdrJBDVwy2ZkQRb
 xC4WpSFYCCyY0OUWODWft0c/35uhpBNx8dH4AFJ/IyfTmm7Vn7Pl2zSZFVn+RSln8rpa
 CFPtjh+xNXqodhAnEfHy97iDZ3EiCslpM/nfHjXqsetR2TG+y9yTQqkZYgOg7Y4Rs4Ae
 VRLsNKzNkpUbNebvSNydUkerVDETuPn0O6nx6PcpMn2nDpzQ0FRiuwzW7BFimvVdFzFq
 3iKLJqkXQOoctnge+U5GN8rfPo1F92zdzWxDRlIk+1Mkias13Y3zxntZVoW6y7bcV82M
 EUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaCk20iXyuPTfKj7M2JUxIMfw5amxERCJiUzQ3nZIzw=;
 b=C8z9zczc5sWe3hw08C+jTZAT1qD4NFG5bHuHKv/nIEqZ2IBuIM2UcZYGxLMYQgJyP+
 VhSQt3EAHo1sTk0MsCGcYnOjEZhn1aUazOJEa2nLZ/nB0jwbKVy6hu2fSulQaVyFgyss
 KaQ0Ntg6DPmoc2uOnPuJpqhKucybH9nunK5pc0Q8vt3Y29i4W+82ZVzaOTGXtaFU0baK
 JmmKqPYr9hslGdlXnm3z0BnngZbelUkJ6EQ92jh8ey9hTSIhMfraInyn5QhYw3+acwim
 FcLhlQwP23ZJR0XVqutjxSxlyL8cpmJcGTnJEMQA81Vm1JHlQgFdxpaaCWBzYw/L2g/f
 IbXg==
X-Gm-Message-State: AOAM531Z/tycbSOTlWtCUvUQzhT7cC5yO7+ewJ+D8xLU6Lq6z5AgqE/3
 a+3+GLrTZ6CdEbZrL1tYq8CrmPGbf0HKtqI8
X-Google-Smtp-Source: ABdhPJw6EeahDTBukuHlSW+cuZeQsk0WyBpaFt45uII85OHJoQALlKnmpO8sL4EXjaYoZMnUsCbVdg==
X-Received: by 2002:a17:90a:71c7:: with SMTP id
 m7mr13818070pjs.190.1601839266264; 
 Sun, 04 Oct 2020 12:21:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m188sm9772226pfd.56.2020.10.04.12.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/14] drm/msm: de-struct_mutex-ification
Date: Sun,  4 Oct 2020 12:21:32 -0700
Message-Id: <20201004192152.3298573-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This doesn't remove *all* the struct_mutex, but it covers the worst
of it, ie. shrinker/madvise/free/retire.  The submit path still uses
struct_mutex, but it still needs *something* serialize a portion of
the submit path, and lock_stat mostly just shows the lock contention
there being with other submits.  And there are a few other bits of
struct_mutex usage in less critical paths (debugfs, etc).  But this
seems like a reasonable step in the right direction.

Rob Clark (14):
  drm/msm: Use correct drm_gem_object_put() in fail case
  drm/msm: Drop chatty trace
  drm/msm: Move update_fences()
  drm/msm: Add priv->mm_lock to protect active/inactive lists
  drm/msm: Document and rename preempt_lock
  drm/msm: Protect ring->submits with it's own lock
  drm/msm: Refcount submits
  drm/msm: Remove obj->gpu
  drm/msm: Drop struct_mutex from the retire path
  drm/msm: Drop struct_mutex in free_object() path
  drm/msm: remove msm_gem_free_work
  drm/msm: drop struct_mutex in madvise path
  drm/msm: Drop struct_mutex in shrinker path
  drm/msm: Don't implicit-sync if only a single ring

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
 drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
 drivers/gpu/drm/msm/msm_drv.c             | 15 +---
 drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
 drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
 drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
 drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
 drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
 drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
 14 files changed, 188 insertions(+), 194 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
