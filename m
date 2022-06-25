Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699355AD07
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAB510E14F;
	Sat, 25 Jun 2022 22:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C464510E14F;
 Sat, 25 Jun 2022 22:54:57 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so7631408pju.1; 
 Sat, 25 Jun 2022 15:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DqnDC8wXirP0ojIZwN5KsSwyORxgkbtiz7Q3mfrD8Kc=;
 b=MXBO+4eIan2PZ4lO1kplxnoROjf5VuTEVAqDQNsrbSTaKRCLhxZ865B6v19Agg+hCl
 ou3v5RKw6rmbkb7YwdygDEjXNVXT7Y6EvIBQzh8XzlimhV+awvDUGMOmswS287gvJLt7
 0Jl/Eer6JMDwnqTmGp+9yVfyQLYl1JBQZG+zrKodE2hmVVsN4Kpo3y5oW9wRMC9kY6AE
 7AoKzEjzK/mo4zyQDZ0Fo1BRvoFrBSN/ZvP0YyXX4KMrfViPmpcP0n80GdOJIMcC4RiV
 Jwd2gR/38ejUYjEJXXx8+vUskjVAO0BWFwfF/p+ya7QkbLCHmqUz0FULtR6gcFv07bmo
 +1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DqnDC8wXirP0ojIZwN5KsSwyORxgkbtiz7Q3mfrD8Kc=;
 b=Uf25CvlZJElNrIezYdb/inUg3E5dyyUazYOgbP2iiK8utxnF5fpwKT4LYpCYsEyHBP
 7nZxyVtRuC+Nl0m8sYAng3q1IhUB0echIbMer0kbSyiJgg4FlLkUCydg1LFjhAEWvFpz
 +U6Rd+R3boaK5ua9mOg3TnOAQvsyfHsgu+7NjtvgMuHs/ZRlAH//TEV6WCi0DONHttix
 fPW3exNjx/KXBKN2xrgWL+Sv1thLix30kEYgX14TjhTgYb904cXQyx/4ttxbMwvbuS+l
 6pEPQE7RFp0enCEC8RDVzlmZ2nYu7RNMgod2lYyz1xArpqGDMExO/c+iEZdwPQsPtDib
 OfYQ==
X-Gm-Message-State: AJIora8Lmoc7d/ahSYCAvYE5hl2CPrlvHZuJAtIFdr9VqfujEMoSfogj
 KfNn00Jv1rdkI9yRgsiWNxyQQvhp56s=
X-Google-Smtp-Source: AGRyM1vq7jldm84sPi1tL7Fyjtp/T4q7OPjF1+X6qv6C4ay0fP/kSd37XY3+58+AqGml9+7pDIGWWA==
X-Received: by 2002:a17:90a:df98:b0:1ec:96e5:b04d with SMTP id
 p24-20020a17090adf9800b001ec96e5b04dmr6818452pjv.185.1656197696684; 
 Sat, 25 Jun 2022 15:54:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a62b40d000000b00522d32a6a38sm4094507pfn.121.2022.06.25.15.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:54:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/15] drm+msm: Shrinker and LRU rework
Date: Sat, 25 Jun 2022 15:54:35 -0700
Message-Id: <20220625225454.81039-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is mostly motivated by getting drm/msm to pass an i-g-t shrinker
test that I've been working on.  In particular the test creates and
cycles between more GEM buffers than what will fit in RAM to force
eviction and re-pin.  (There are sub-tests that cover this case both
single threaded and with many child processes in parallel.)

Getting this test to pass necessitated a few improvements:

1. Re-ordering submit path to get rid of __GFP_NORETRY (in the common
   case, doing this for syncobjs is still TODO)
2. Decoupling locks needed in the retire path from locks that could
   be held while hitting reclaim in the submit path
3. If necessary, allow stalling on active BOs for reclaim.

The latter point is because we pin objects in the synchronous part of
the submit path (before queuing on the drm gpu-scheduler), which means
in the parallel variant of the i-g-t test, we need to be able to block
in the reclaim path until some queued work has completed/retired.

In the process of re-working how drm/msm tracks buffer state in it's
various LRU lists, I refactored out a drm_gem_lru helper which, in
theory, should be usable by other drivers and drm shmem helpers for
implementing LRU tracking and shrinker.

Rob Clark (15):
  drm/msm: Switch to pfn mappings
  drm/msm: Make enable_eviction flag static
  drm/msm: Reorder lock vs submit alloc
  drm/msm: Small submit cleanup
  drm/msm: Split out idr_lock
  drm/msm/gem: Check for active in shrinker path
  drm/msm/gem: Rename update_inactive
  drm/msm/gem: Rename to pin/unpin_pages
  drm/msm/gem: Consolidate pin/unpin paths
  drm/msm/gem: Remove active refcnt
  drm/gem: Add LRU/shrinker helper
  drm/msm/gem: Convert to using drm_gem_lru
  drm/msm/gem: Unpin buffers earlier
  drm/msm/gem: Consolidate shrinker trace
  drm/msm/gem: Evict active GEM objects when necessary

 drivers/gpu/drm/drm_gem.c              | 183 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c          |  18 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  70 +++++++---
 drivers/gpu/drm/msm/msm_gem.c          | 154 +++++++--------------
 drivers/gpu/drm/msm/msm_gem.h          | 112 +--------------
 drivers/gpu/drm/msm/msm_gem_prime.c    |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 164 ++++++++++------------
 drivers/gpu/drm/msm/msm_gem_submit.c   |  78 ++++-------
 drivers/gpu/drm/msm/msm_gpu.c          |   3 -
 drivers/gpu/drm/msm/msm_gpu.h          |  10 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  36 +++--
 drivers/gpu/drm/msm/msm_submitqueue.c  |   1 +
 include/drm/drm_gem.h                  |  56 ++++++++
 13 files changed, 485 insertions(+), 404 deletions(-)

-- 
2.36.1

