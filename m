Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E25818E1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF99496386;
	Tue, 26 Jul 2022 17:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739896386;
 Tue, 26 Jul 2022 17:50:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id y1so5975458pja.4;
 Tue, 26 Jul 2022 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c6iLmN27rlZLm/jw4V3YqvoT+/IQjLY4dY+8uO1e+u8=;
 b=ALJD/PV6Rp0F7MvYb6Se3xjuI4Z7oMRY2YyMeVLHM2dCv/dmIoDWNBNWu6+xxoroT5
 j0H67TR5S31Mdo6rnWJjqV4e9CgeyARFhA0NhelVT/ZXWaPNgqurGuepDJSwmAc0IrHy
 1m+vtLie8b5PHNnIWAWy46RlXj+pHmVbLjOGY2KzAd4d5UYbubuq1gVihU97YtpLLDOt
 jt6uTsW+ofJDquPFd/Z09+ufHcIxrrerNaqEFXyCftzb1itsUYhG6jWkK/EI/tDUy29W
 Gnnd4Q4AdTmfufV6Lm+g56yJkKGxT24sETT1xsuSv5gimqmNC55OwdMX/5KIye1ASbxo
 n9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c6iLmN27rlZLm/jw4V3YqvoT+/IQjLY4dY+8uO1e+u8=;
 b=SvnDtobza6bf7pcEBjecfNRdHqIiiVZA0lLgYcd5F7zsF1H8eI5Ot1QC2ZPv813eip
 LS6IsCVMIaVF3mV/6Yvwl/SVyffr4wrmxbXoOAZWJmbUS88wCSAO/XXhODRYPw9wjdZ6
 zFLwcHPKgBnV2i2FSdJjwxa8ZevSTAPnlgRcXwXcFSAxoicm8GZHcsDiHbhiw4lWzjhp
 9yXwEp2lgIr8YWeEfRRcK2vm5Pl0TooN+8G/xeNihrZxNELa3Mx8ctlpvk6NzagO3QoG
 HZHfF5E8eGak7TqKfxQRK2bmhR3uxjtajLJhpVb/ThRrLqfqHu97wo1ZtFcZQiyNh9hA
 vUsw==
X-Gm-Message-State: AJIora9flyqiwxJNUft6MDHb1yobnIjf5zetdYJpC/YFCNbPgfJKP7wj
 18huEHjuCmxUqiwFNYVfxsZXXfJpBKU=
X-Google-Smtp-Source: AGRyM1vlwf0yvNeQMR8hx2qbVQ9TcWZl4Y6mby4fic7OQ8qtSSXl9N5S+tygiRaFoBbAUGhHduAGdg==
X-Received: by 2002:a17:90b:1d8a:b0:1f2:9d6b:7457 with SMTP id
 pf10-20020a17090b1d8a00b001f29d6b7457mr370242pjb.32.1658857814138; 
 Tue, 26 Jul 2022 10:50:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 c28-20020aa7953c000000b0052896629f66sm11934892pfp.208.2022.07.26.10.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/15] drm+msm: Shrinker and LRU rework
Date: Tue, 26 Jul 2022 10:50:24 -0700
Message-Id: <20220726175043.1027731-1-robdclark@gmail.com>
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

Mostly a resend with switch to lockdep asserts for the GEM LRU helper
and conversion of msm locking checks to lockdep asserts, since that
seemed like a good idea.

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

 drivers/gpu/drm/drm_gem.c              | 183 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c          |  18 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  70 +++++++---
 drivers/gpu/drm/msm/msm_gem.c          | 179 +++++++++---------------
 drivers/gpu/drm/msm/msm_gem.h          | 123 ++---------------
 drivers/gpu/drm/msm/msm_gem_prime.c    |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 164 ++++++++++------------
 drivers/gpu/drm/msm/msm_gem_submit.c   |  78 ++++-------
 drivers/gpu/drm/msm/msm_gpu.c          |   3 -
 drivers/gpu/drm/msm/msm_gpu.h          |  10 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  36 +++--
 drivers/gpu/drm/msm/msm_submitqueue.c  |   1 +
 include/drm/drm_gem.h                  |  56 ++++++++
 13 files changed, 505 insertions(+), 420 deletions(-)

-- 
2.36.1

