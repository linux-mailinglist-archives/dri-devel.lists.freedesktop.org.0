Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D2727F403
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 23:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22DE6E829;
	Wed, 30 Sep 2020 21:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0436E829
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 21:16:12 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b124so2143883pfg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o3lDSN5uV/shoTTYh+75euIHZMsefv5Gthxgu7JPwE=;
 b=caTBU4niMhHm5SdxvlDQTOhj2VarLxDNHJbZbv9fmrYarhZo2WvtxnzIx5keqEl32Z
 SqWbQr8oxaMtLeYMba82SB4Jfq6IgiloKNaGO74jvnkQB5vaIbv738+LykAkMkVtffjb
 7owNN+xga5QeG00+QGWK4LnmRsQaGhi1L1PabdADPs/swyOhKu1JajRlTvZo+rI8K3cC
 hFpAqzptQU2W75U0DKKct3v/72wj/Q6Ma6eiohXLw15zEdMo5bXcVORp8S4H8Zte8NPi
 LiZ5wmdHaMDCKiHOIBnUps4BrHGSkGk6qXEY8aOPtpeVIeWu+WqNVFLtn8FE1Wwt34zG
 SO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o3lDSN5uV/shoTTYh+75euIHZMsefv5Gthxgu7JPwE=;
 b=pOJUM0wmOSDM4BHx4AjVZFeaf+DPVJP5BlzPD1dMuPrBOyBFZZrnVPy2l0DTl+gojH
 F6d6es0P5YFDeEoShXVK5smDJv9MU/kr1gyV2sgyboo+PSW+ooakT75LGup8Xp1U5Ngn
 KLnzthLhaMpas5aT3mpZ7nfxufnUz377sywaVVNt0OPTwbwaZ+DDpXczO7Yfp4qkm3vy
 LYdGTDmPb+3jakjsADVBdqH9tyGF0/minwLKqB2ENaRsouNMHgnkwVKidM9BbUXrJwk7
 G3Owvm0GGDpp7VwzBiBpGL+uXHu/KR/g60yemAWPAF/XvKwOl+eX85L39hXs6fw+6A3e
 JDcg==
X-Gm-Message-State: AOAM532V8c3ww6HcxIU2bMIaEnrIjp37HGfK8fcLH40XWlSTtf8qu/6H
 h/D2IzvTd7krBaXSbhDwaHLMU6OV5v4=
X-Google-Smtp-Source: ABdhPJxzC4J7DZzesa6EYV5iuWtAvg7BXOstE7gtkBTPyQKLex1MQPuPSNEa+NwAyPkW4yM13IV6rg==
X-Received: by 2002:a17:902:6803:b029:d2:42a6:312 with SMTP id
 h3-20020a1709026803b02900d242a60312mr4046233plk.24.1601500570997; 
 Wed, 30 Sep 2020 14:16:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id ih11sm3073170pjb.51.2020.09.30.14.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 14:16:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm: commit_work scheduling
Date: Wed, 30 Sep 2020 14:17:19 -0700
Message-Id: <20200930211723.3028059-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
 Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
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
update loop.  And the last patch exposes the task id to userspace as
a CRTC property, so that userspace can adjust the priority and sched
policy to fit it's needs.


v2: Drop client cap and in-kernel setting of priority/policy in
    favor of exposing the kworker tid to userspace so that user-
    space can set priority/policy.

Rob Clark (3):
  drm/crtc: Introduce per-crtc kworker
  drm/atomic: Use kthread worker for nonblocking commits
  drm: Expose CRTC's kworker task id

 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
 drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
 drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
 drivers/gpu/drm/drm_mode_object.c   |  4 ++++
 include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
 include/drm/drm_crtc.h              |  8 ++++++++
 include/drm/drm_mode_config.h       |  9 +++++++++
 include/drm/drm_property.h          |  9 +++++++++
 8 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
