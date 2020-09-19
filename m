Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FEE27104B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 21:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8B89CC1;
	Sat, 19 Sep 2020 19:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6535489CC1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 19:36:36 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id f18so5670031pfa.10
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hbQvW/WwycKpSevUDMADl+bOt9pZZjBbbmr6AnIEaI=;
 b=LV6oI91d2+vZgOpBsE3f5tmaEmuLfA7Q10jGKazhq2CUGtcu8o0tldMSpggbrL5u7m
 sO5twsUD4PMa9te7nppTnFJHrV2oD/h0QfLir3MaGmWZ+OEx/ViSJsie0+YbKww6hPts
 A55PE8p4pOWQq/zHNIvzaRBXJ3OJL0jLKqQr9Z6WlEeEGa54bzoxNrk0au9GK8T0e4Al
 fvkRM0ECxrsqQ5f/aGK9ZUTPAwPKSrAcNKN7SNl1oRXr0DRcGg9kizSn6fbBQLZ68Z61
 iZkJ5p/0sgZZryPhSTJRgJzXioKskcTnmyJY7QY+yr4WGH2U9FxZ0v6AKNvXKVewCdQN
 iySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hbQvW/WwycKpSevUDMADl+bOt9pZZjBbbmr6AnIEaI=;
 b=EPFLesW6vSDFeBWqs3FEUlbUCCJ1wj/LYDzmoD8TTQmYwB5fXW7PtmnRQhtaZt8RF+
 LDPUwVC2ppczJte+K+2ONzq164D9+9E5RNx1ag0Jhlutb8NEj6e7/oTqG2ohQssxYRyu
 IZPbmKTHle9pf88Um5Zlh/3OzkYA5VhE6MOFoK+PwvUWbozE/vOvNW9eC+v4cDXF7kBc
 lIat2QulPvpiBFDQsw6+F+XDfYKp2lybjbTaZ4Cpocsu+ChxKZFXNPsaSOx/gNqfM6Fq
 D26rJAOuPJHbowsUd7+PzYahD9twpPdbkEqQeM4Qy54i2/reVd1xS7gNpGYQ4wApGIyX
 Pi5w==
X-Gm-Message-State: AOAM531cFCIIY4hxveteB0EWu77T6k1Ccxqdzxlsfy6n+Us2mqxsOPSN
 yznPh/m9AWp+zIogHUe1G5/JKbkv57Y=
X-Google-Smtp-Source: ABdhPJx9BimOCWqRHWSyLRsQP7obbHYEpFxvnWsXd3DpadbJxUFwl1Fa6tKEJ5FKQ1joMc6DMSSa4A==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr11008521pgp.61.1600544195287; 
 Sat, 19 Sep 2020 12:36:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id g24sm7553133pfk.65.2020.09.19.12.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 12:36:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: commit_work scheduling
Date: Sat, 19 Sep 2020 12:37:23 -0700
Message-Id: <20200919193727.2093945-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 timmurray@google.com, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The android userspace treats the display pipeline as a realtime problem.
And arguably, if your goal is to not miss frame deadlines (ie. vblank),
it is.  (See https://lwn.net/Articles/809545/ for the best explaination
that I found.)

But this presents a problem with using workqueues for non-blocking
atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
preempt the worker.  Which is not really the outcome you want.. once
the required fences are scheduled, you want to push the atomic commit
down to hw ASAP.

But the decision of whether commit_work should be RT or not really
depends on what userspace is doing.  For a pure CFS userspace display
pipeline, commit_work() should remain SCHED_NORMAL.

To handle this, convert non-blocking commit_work() to use per-CRTC
kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
used to avoid serializing commits when userspace is using a per-CRTC
update loop.

A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
priority commit work.

A potential issue is that since 616d91b68cd ("sched: Remove
sched_setscheduler*() EXPORTs") we have limited RT priority levels,
meaning that commit_work() ends up running at the same priority level
as vblank-work.  This shouldn't be a big problem *yet*, due to limited
use of vblank-work at this point.  And if it could be arranged that
vblank-work is scheduled before signaling out-fences and/or sending
pageflip events, it could probably work ok to use a single priority
level for both commit-work and vblank-work.

Rob Clark (3):
  drm/crtc: Introduce per-crtc kworker
  drm/atomic: Use kthread worker for nonblocking commits
  drm: Add a client-cap to set scheduling mode

 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
 drivers/gpu/drm/drm_auth.c          |  4 ++++
 drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
 include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
 include/drm/drm_crtc.h              | 10 ++++++++
 include/uapi/drm/drm.h              | 13 ++++++++++
 7 files changed, 117 insertions(+), 4 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
