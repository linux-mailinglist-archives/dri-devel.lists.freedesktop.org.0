Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A37772C2F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD5E10E322;
	Mon,  7 Aug 2023 17:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10510E326;
 Mon,  7 Aug 2023 17:11:58 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so3133936b3a.1; 
 Mon, 07 Aug 2023 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428317; x=1692033117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/xmThBOQghVhbetZ+RuMUQ7mhOuoC9ntSXPMFZlv36o=;
 b=YXNOMssECeLOpfbis1zESYawo1JLA+e0U3sScxNp+ibyECWC3IPwBtaCBGBxXbvHE3
 ysSaHVMvqBr6NS9HixnXNqL1/+6D13TjMXIFpjAVqeABHJ6N4VsRMNr6yTTWGJmy1ziU
 IhgIESrbpwDxSMnm/TuIgYr2RP9vIdjzZcszLUXP921lD6Hy3s4ZTyqlTj0TUWX6QKyB
 3YS/c6ERPGjznXNXDOHGMp4zC1H/njGrRGBb7AdgMifpkg7fPowQ/FugqtuVJov5QA8q
 tqgF6VRKHufaAEAPqylWASRIHz9/D/w+yKQ3vEUR0xe57rd7xm5HGuX6Em1yE/d14The
 6l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428317; x=1692033117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xmThBOQghVhbetZ+RuMUQ7mhOuoC9ntSXPMFZlv36o=;
 b=es1ZamqJBxqzokW9kgSUY8Itv4PjrA8uK5A6xkUbqBnc87iawLClWhbTYBndNRmRNe
 7xO38H9WxdXq5GOBhpbMNBX6kVpdj4JnLekmIKp9AGGBxw5K3IugS9QBB6O5fHoqchev
 CMFR/jHxsdY5LylF5hFya2bOBid24v9mE/pTar0d+YD3MQWsISgiTrEbeHgNYrfG3BbN
 tx423Qn2TioTJiDGdXl6X0o2ZsAyCtqdRLpQzbzmy2ySEGb/cueE8w/dObG24+oncoXK
 PG/Dz2XmonqIbXzqoMfdaH5Cz5B5zTFySvI54AMOMcZPlZ0y6rEICOBoxuT/DtxoxF8y
 dAYg==
X-Gm-Message-State: AOJu0YwF5KozTDs98iAQ6UjY4OmUojDRr6Yc3Js5aPJL4ZnvJ2ZzuGqe
 iumQAnWiSdjux70KsJ11mZ0LnRVdu/Q=
X-Google-Smtp-Source: AGHT+IFJtMhLWzhwOady0DEB0SqERx+ZPYfUS6iAtpx+6SkUjY1IV+Co7VFZBM04Ki/+KvQrmTzukA==
X-Received: by 2002:a05:6a20:7fa3:b0:12f:d350:8a12 with SMTP id
 d35-20020a056a207fa300b0012fd3508a12mr9927817pzj.21.1691428316891; 
 Mon, 07 Aug 2023 10:11:56 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 t7-20020aa79387000000b00687087d3647sm6618797pfe.142.2023.08.07.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:11:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/9] drm/msm+PM+icc: Make job_run() reclaim-safe
Date: Mon,  7 Aug 2023 10:11:34 -0700
Message-ID: <20230807171148.210181-1-robdclark@gmail.com>
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

v4: Re-work PM / QoS patch based on Rafael's suggestion

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

 drivers/base/power/qos.c               | 98 +++++++++++++++++++-------
 drivers/devfreq/devfreq.c              | 52 +++++++-------
 drivers/gpu/drm/msm/msm_ringbuffer.c   |  1 +
 drivers/gpu/drm/scheduler/sched_main.c |  9 +++
 drivers/interconnect/core.c            | 18 ++++-
 include/drm/gpu_scheduler.h            |  2 +
 6 files changed, 127 insertions(+), 53 deletions(-)

-- 
2.41.0

