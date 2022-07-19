Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A957A4CF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426590F69;
	Tue, 19 Jul 2022 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF94590F59;
 Tue, 19 Jul 2022 17:18:39 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id s21so15349285pjq.4;
 Tue, 19 Jul 2022 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wgjlxY2vwEbbQYsymCaoGbyx7Qj5nQdz14BXeMbJhaU=;
 b=p4ebQ4x0Es+yVhm5HbrlBJIuofxFuJNJ5oU8LI9n1tczXrvXmtO3qAKCKDxkGi0W/i
 o3gLj5uG6j884yw/HhZktPPXikTr1ONquivno9qlPTYgbIf9QqUKQxx/+x9BmEM6OIya
 myPyER21Y0uFH44HARRLyb0MfU3qw2VD+RBpZ+zthxaOraRhsoo+YeQx47nG2Y8bxqaP
 b153dVsRW78UAua4re115PJ++Gd3al/roKZZBVd/n5JoMIgIsQYcFvMZgjnhQaX/sIQP
 xS11hKrxHDUnGm+ctazTNAUV94CypiPZ7cofGKf/4h88Dks88wWu8BTKDKL5IjfI0MGV
 2LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wgjlxY2vwEbbQYsymCaoGbyx7Qj5nQdz14BXeMbJhaU=;
 b=m993wQzrA7EQx4rYb3VdPfB4ql2wQdPwtTQ2HIVQy+41kjKLcLQLOG75IjQfo3+mxq
 DDnWb07Q4cVDJ75iNgZ6pRYOhum7oJeEnzBLBLq8akPtH/2n44PpZIPkF1kji0EZTm9d
 Ft10XDKned7DO+hxGJ2ZgMfbOE23HCWPxssPkAxLgeXXhaKW58X42FrCV/SCtRn9K6TZ
 uvqskZlvICdz6Meptmin45GJ0bayz+BKhMoYYml7t5Xrtsh35CgUusbCHJ6Fpioizpbd
 vAbj5vfP/zsu2udC4oK9mYPWTplMPLZCmttS7M+KoZvMvLpvwcvm3Borz2o7uuWebvhZ
 uJ/w==
X-Gm-Message-State: AJIora+JYe9OhUy0BP/6Lu3Pll+Ano5b/bFaxW5gTH0tvC9HvbkHCJ3n
 giIEfb+STMQRA1kKmI6N60n17irEI1A=
X-Google-Smtp-Source: AGRyM1tiIGFdkSIYREuKSjwYhFDnYD5jN1rCGiePbxyhzgQNo3Q1PYnMml4qKU9sYeo6X8ydRXwkpQ==
X-Received: by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with SMTP id
 p11-20020a170902ebcb00b00168e3ba4b5amr34258744plg.11.1658251118481; 
 Tue, 19 Jul 2022 10:18:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ij19-20020a170902ab5300b0016b865ea2ddsm11892850plb.85.2022.07.19.10.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/13] drm+msm: Shrinker and LRU rework
Date: Tue, 19 Jul 2022 10:18:44 -0700
Message-Id: <20220719171900.289265-1-robdclark@gmail.com>
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

Mostly a resend with a small fix in the last patch (and a couple early
patches drop out when rebasing).

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

Rob Clark (13):
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
 drivers/gpu/drm/msm/msm_gem.c          | 149 +++++++-------------
 drivers/gpu/drm/msm/msm_gem.h          | 112 +--------------
 drivers/gpu/drm/msm/msm_gem_prime.c    |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 164 ++++++++++------------
 drivers/gpu/drm/msm/msm_gem_submit.c   |  78 ++++-------
 drivers/gpu/drm/msm/msm_gpu.c          |   3 -
 drivers/gpu/drm/msm/msm_gpu.h          |  10 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  36 +++--
 drivers/gpu/drm/msm/msm_submitqueue.c  |   1 +
 include/drm/drm_gem.h                  |  56 ++++++++
 13 files changed, 483 insertions(+), 401 deletions(-)

-- 
2.36.1

