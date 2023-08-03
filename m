Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4B76F546
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3219710E67C;
	Thu,  3 Aug 2023 22:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400210E67C;
 Thu,  3 Aug 2023 22:02:18 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bbff6b2679so10548315ad.1; 
 Thu, 03 Aug 2023 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100137; x=1691704937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9L3CAUgX8xoREWyS4XpqkTOq+oVZcLc0334i8yJeTs=;
 b=H7Yu9XuDksd8OQBNa/Sbu6P8PCU9gJhpbMea5lU8c+ZiEj6n0il23zAvdKZgrrpBF/
 zOmsEKSES8Ku2Ib6zde4MGqZZ+r40QubW4BiKOiQ+sxsbe3KJAQ4AxQ2rXMP226IjeMG
 g2/TPMbt4OEG3YjrClRh+YtsTlBzokrA7ILcMR+W58709Z0cU4HZpvQSrn3K8AAKQf0z
 /gYZWMYVbd8aaP1lh1NFqO594mUFcqxxeZODj3iPARh+i/U7rNBldXn5DojKsiTv6Wx4
 8UN2kKU71OLIqECgWIfSBM0/QS3DD5JuMQFns+JXFFSeDeDDDQagEZ5CkHXBAcB6jYg/
 TB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100137; x=1691704937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9L3CAUgX8xoREWyS4XpqkTOq+oVZcLc0334i8yJeTs=;
 b=dzNWImLyfZHJaNu5/Oem9MYiZIcHN0+ZxKWsAqA4IZ7fPXXyQG8QXDbkJxjSIL5Z25
 KE2Hf7kQhFwKBHbfJ0WE6QvIm0fV9QMFtSpfLbdaUZKoo7oTCDRzTXwY/pijrH9/T83n
 9YJmpUYv3AcuWVfBaLLaA7Q/ZErCOJ0xoGyv2sUO7ci5VlbmnCP8WEkyNJ3b0LVH2z9o
 yb1npLL/GjzgeB+vl9aQfYMPqXJeYUAgZA/L9vy0XA3Rm17wD5uP4iKeZ1yXhMibRmeV
 kPfOL/lDwXRCpMsrcRIae1V5dDm8o/JINDc8UjjKAJkDbpYk2wMYSUWonYZjXkYqWmYC
 Ty2Q==
X-Gm-Message-State: ABy/qLY9RNkUxiI9NoeZbmkKz4N/5U/++d+KrXl1U/DCnEj4oEMHgz1V
 /Hb1nmAEuINddp/jzFKzz8/FtvbabrQ=
X-Google-Smtp-Source: APBJJlFEQKn2XMSoqzQ99mCMLPzk+vd4gytbLof3zPPnG5x/KZWigRaL3pPRSUDEs13kqmH0RuVThA==
X-Received: by 2002:a17:902:c94e:b0:1bb:32de:95c5 with SMTP id
 i14-20020a170902c94e00b001bb32de95c5mr19207883pla.65.1691100137269; 
 Thu, 03 Aug 2023 15:02:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a1709028a9500b001bb0b1a93dfsm317799plo.126.2023.08.03.15.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm/msm+PM+icc: Make job_run() reclaim-safe
Date: Thu,  3 Aug 2023 15:01:48 -0700
Message-ID: <20230803220202.78036-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Inspired by https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
it seemed like a good idea to get rid of memory allocation in job_run()
fence signaling path, and use lockdep annotations to yell at us about
anything that could deadlock against shrinker/reclaim.  Anything that
can trigger reclaim, or block on any other thread that has triggered
reclaim, can block the GPU shrinker from releasing memory if it is
waiting the job to complete, causing deadlock.

The first two patches decouple allocation from devfreq->lock, and teach
lockdep that devfreq->lock can be acquired in paths that the shrinker
indirectly depends on.

The next three patches do the same for PM QoS.  And the next two do a
similar thing for interconnect.

And then finally the last two patches enable the lockdep fence-
signalling annotations.


v2: Switch from embedding hw_fence in submit/job object to preallocating
    the hw_fence.  Rework "fenced unpin" locking to drop obj lock from
    fence signaling path (ie. the part that was still WIP in the first
    iteration of the patchset).  Adds the final patch to enable fence
    signaling annotations now that job_run() and job_free() are safe.
    The PM devfreq/QoS and interconnect patches are unchanged.

v3: Mostly unchanged, but series is much smaller now that drm changes
    have landed, mostly consisting of the remaining devfreq/qos/
    interconnect fixes.

Rob Clark (9):
  PM / devfreq: Drop unneed locking to appease lockdep
  PM / devfreq: Teach lockdep about locking order
  PM / QoS: Fix constraints alloc vs reclaim locking
  PM / QoS: Decouple request alloc from dev_pm_qos_mtx
  PM / QoS: Teach lockdep about dev_pm_qos_mtx locking order
  interconnect: Fix locking for runpm vs reclaim
  interconnect: Teach lockdep about icc_bw_lock order
  drm/sched: Add (optional) fence signaling annotation
  drm/msm: Enable fence signalling annotations

 drivers/base/power/qos.c               | 85 +++++++++++++++++++-------
 drivers/devfreq/devfreq.c              | 52 ++++++++--------
 drivers/gpu/drm/msm/msm_ringbuffer.c   |  1 +
 drivers/gpu/drm/scheduler/sched_main.c |  9 +++
 drivers/interconnect/core.c            | 18 +++++-
 include/drm/gpu_scheduler.h            |  2 +
 6 files changed, 117 insertions(+), 50 deletions(-)

-- 
2.41.0

