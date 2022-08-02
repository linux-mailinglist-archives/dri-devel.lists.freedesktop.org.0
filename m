Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CB587F4A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BED90430;
	Tue,  2 Aug 2022 15:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A61A90481;
 Tue,  2 Aug 2022 15:51:19 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id z19so13853657plb.1;
 Tue, 02 Aug 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NWeX+YprTRWHBBG/4VEXO7GVujWct+9awIElnHMdcqs=;
 b=Sl67Q6DIolX+ANbJwp7ZfqBmK2T/Gv6vLDxeRNAJuoIXYeav7o8lG8BRi2oALk11qo
 GC/CFjQxL62+E3GIhflVixdPQqivPpPeq9yw6xh1O9L46TFPROeSSnqapmrbc3/szFvo
 U2nnF2PUGdyfU87fQHNX0DbnWOIJyLkNQIRNGaVBeQ9GUpV11CBnZO5r47WVxV+fKLqT
 0l7eMn/k9+Jt/+Lcf7e++LliKllsZFK/fv2Tz8+v2x3fysQNfnq/tZK6FFkKiagBMU/M
 pVtd3EF3P4rVy1lQRphRAFaw8g/VyEV7CnMdOuMDamoJhZdywpYmpwFMlyZ06h/rBc82
 654g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NWeX+YprTRWHBBG/4VEXO7GVujWct+9awIElnHMdcqs=;
 b=RBY1HwucIFc4dKbdlccvqqAAiH3CKHI76VABm4HvIuAYndxc/U4r/JUm3S+15pF6ZD
 86dlRglYzMDkHR9lPIrnQopInA4sGAskgh53k7zJflurziLW46PCG1QJIoEYxlMjRCtx
 eiZDjtubG1ttFOaLauWzrtPyiRXSHKp0xa8b4tRzUw0BDtVp3mAaFgcak2YukJSROnSZ
 pOgqE1j2s3HkFLTlTa3BbXzBOzTZW+9ypFTTz/ynh/NtCDpAFbf0x0rVeHVgxgxcg2c9
 VJCr/HNVeiHDnRVqf461dJ1FaKml+ub/7M75ZCCecxpGaQaKg/Zb7PWe1smvfgxlJ4FY
 lH7w==
X-Gm-Message-State: ACgBeo2fETqd71EzsX9g/KLu7rhfNwRrUXqAt64umIXZzUzcwYSJw4/H
 OZmE+xEm6TekRuOdgie0yWeFI4Gc5cI=
X-Google-Smtp-Source: AA6agR56jjzgY+aeqcZzexrc3Ci5QhZmdPqkiD4sQeLXuekKbS8BO8rNt2bK1Syu0RSEISDeum/5Dw==
X-Received: by 2002:a17:90b:4d05:b0:1e0:b53:f4a3 with SMTP id
 mw5-20020a17090b4d0500b001e00b53f4a3mr115390pjb.3.1659455478641; 
 Tue, 02 Aug 2022 08:51:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b0052d27ccea39sm7347118pfb.19.2022.08.02.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/15] drm+msm: Shrinker and LRU rework
Date: Tue,  2 Aug 2022 08:51:33 -0700
Message-Id: <20220802155152.1727594-1-robdclark@gmail.com>
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

Unchanged other than small update in 09/15

original description below:

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


v2: rebase + small fix in 13/13
v3: use lockdep_assert_held in GEM LRU helper, and add a couple patches
    at the end to convert MSM from WARN_ON(!is_locked()) to lockdep
    asserts
v4: keep drm_gem_move_tail_locked() static until there is a user

Rob Clark (15):
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
  drm/msm/gem: Add msm_gem_assert_locked()
  drm/msm/gem: Convert to lockdep assert

 drivers/gpu/drm/drm_gem.c              | 170 +++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c          |  18 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  70 +++++++---
 drivers/gpu/drm/msm/msm_gem.c          | 179 +++++++++----------------
 drivers/gpu/drm/msm/msm_gem.h          | 123 ++---------------
 drivers/gpu/drm/msm/msm_gem_prime.c    |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 164 +++++++++++-----------
 drivers/gpu/drm/msm/msm_gem_submit.c   |  78 ++++-------
 drivers/gpu/drm/msm/msm_gpu.c          |   3 -
 drivers/gpu/drm/msm/msm_gpu.h          |  10 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  36 +++--
 drivers/gpu/drm/msm/msm_submitqueue.c  |   1 +
 include/drm/drm_gem.h                  |  55 ++++++++
 13 files changed, 491 insertions(+), 420 deletions(-)

-- 
2.36.1

