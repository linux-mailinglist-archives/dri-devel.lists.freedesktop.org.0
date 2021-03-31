Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5743509FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 00:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AE089FA9;
	Wed, 31 Mar 2021 22:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851789F19;
 Wed, 31 Mar 2021 22:13:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3689180pjb.1; 
 Wed, 31 Mar 2021 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0/dYIgnSX89Wncbzzni0dKPijuXuQy3ZNHTM+WWX+o=;
 b=i/o6hDwUTHXj7cRi3sw12njdfpFH/fTCTnwowNa8u0wWBiNhPtCwIZC/aNohKv5bQb
 SYMDgArhz4vXJRqZxxx/naDXxFULtBnWSY2kb6OBwcM93HAOPnL1GvEL3ycxh4+9rh9c
 u7GC9htWspdKR7ZpEGB9pgbVpB/3xf8DEDgprZtSbHK7tekQA7rjU6JzZTJyJNuGUI2I
 EAVfi/19pY3FOKxn3zV6LpiicfVJev/QJTVP7ZgM3Mw8IGp9zjKVhVIV6DbkYTern+K+
 d/tGFfaIHPtQuuHIZI0W5hl5MNnmgR6MN0rRZKMb7nnwV4WwQa8xyLjbVJdU7VBGK4SO
 dVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0/dYIgnSX89Wncbzzni0dKPijuXuQy3ZNHTM+WWX+o=;
 b=ss8o0i8AWg1lh5RIMwpepiVrzUg8gqQyo24Y20uCLUGGCeG54UO9kgPKhOMC4AAxSS
 lZOZYu031fgmPsZ77CVJn1nu7K+ylSWEj6Z8sJhjgnWcOB7Qkbzdgnzwc84VS21W5W4G
 IZJq8QS2XWhxZ2E9AAR4Q4qYwgXVALxrMfhtgJPlGGI/sFBXR/qKwZ7mtQNc4QxZAZFw
 LHLLLGUTG9G+gG43/Elp9Vg5dDJpXgQhwqEtjvFsqzfubvkPd4DF6WMZCvWDTfpHKWY8
 8rfGiadxmXzbx9H1htTbHZ0/oj4Y+mJF7X9BCVa9XtSItnwacWKZlcdXPXa3ey68Huk1
 E2wA==
X-Gm-Message-State: AOAM5331bK4OwXmSqS6aPduE2yfYWPI1jIuTSAUlfjDMCa3kQIzt9Gwm
 6X60hQu5L7xDo/XNqKQq4Tn50uzB0Dw2hg==
X-Google-Smtp-Source: ABdhPJxwe+oiVp7tvWPLGP/ZA7PBzUUo1nBjagFv5vUKkmNvUEx8VjN8e9JniAVvPkE2IeMxJG16Lg==
X-Received: by 2002:a17:902:d30c:b029:e3:f95:6da5 with SMTP id
 b12-20020a170902d30cb02900e30f956da5mr5021786plc.6.1617228787350; 
 Wed, 31 Mar 2021 15:13:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j3sm3231107pfi.74.2021.03.31.15.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 15:13:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: Shrinker (and related) fixes
Date: Wed, 31 Mar 2021 15:16:25 -0700
Message-Id: <20210331221630.488498-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I've been spending some time looking into how things behave under high
memory pressure.  The first patch is a random cleanup I noticed along
the way.  The second improves the situation significantly when we are
getting shrinker called from many threads in parallel.  And the last
two are $debugfs/gem fixes I needed so I could monitor the state of GEM
objects (ie. how many are active/purgable/purged) while triggering high
memory pressure.

We could probably go a bit further with dropping the mm_lock in the
shrinker->scan() loop, but this is already a pretty big improvement.
The next step is probably actually to add support to unpin/evict
inactive objects.  (We are part way there since we have already de-
coupled the iova lifetime from the pages lifetime, but there are a
few sharp corners to work through.)

Rob Clark (4):
  drm/msm: Remove unused freed llist node
  drm/msm: Avoid mutex in shrinker_count()
  drm/msm: Fix debugfs deadlock
  drm/msm: Improved debugfs gem stats

 drivers/gpu/drm/msm/msm_debugfs.c      | 14 ++----
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++
 drivers/gpu/drm/msm/msm_drv.h          | 10 ++++-
 drivers/gpu/drm/msm/msm_fb.c           |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          | 61 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h          | 58 +++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 17 +------
 7 files changed, 122 insertions(+), 45 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
