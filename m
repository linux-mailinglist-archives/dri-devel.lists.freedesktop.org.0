Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBF7848F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA8310E3C7;
	Tue, 22 Aug 2023 18:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1BA10E3BF;
 Tue, 22 Aug 2023 18:02:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68a40d8557eso1809941b3a.1; 
 Tue, 22 Aug 2023 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727349; x=1693332149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cv12IOdait6ymjaYszXMAGuiT9Jd+UPhC/JiVaEEqfY=;
 b=fcG17FQQRsQANikmQNoBQ1b7CbblUulB4/6CIZfIMksNwrQGmSCfc0GXvHR7o8+9Dp
 p8jr0/i0v+5w05s6LQ0GWwaeda0mq5QxIikM+xfhTVKS8ai/dTUVUz8Rps0UBH2E7ufe
 EfFVcu+XqMNN97alHgi152v9eAWYG/GGMXe4N6VvZtxxFsbnWBFQb+DsZD+IwsoB+Ha9
 bYmbK1OTUSfbwpB6PsTHPWoeYEwPjA49parPWOAJI4BvKvNdz0Xk0fz+596EGPIcVcVO
 NplcmJdlB/CEzcPqlc/Vmg1/97IXuO1mWmJKpo0Zb5G/KDvcN5Q/1dJ7KW7N46IdQWih
 PmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727349; x=1693332149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cv12IOdait6ymjaYszXMAGuiT9Jd+UPhC/JiVaEEqfY=;
 b=ESzTimq7wyICCiBAOg8kt/RDffsAlj2XQ1o2asH7OL2VJu+MpvYHDAk7TZmloldFK2
 qbn3FcuDJK+u6tnxYDZXA0NyeCGOMwoowX64bjLvfryN1Hcop3RPAgh3u1pidPt3Kk2m
 qdHsNphDYEWgR4EjV+RIvvE5pk//hLbwuZ8ue+qPUaA6NAPQoOxgUx/YjLJH5X8HdNaR
 VWZBkIzG3N0aaAJPm5eDpbND54YTlj6NrIlT+nR/YgpshgJTjoNirG10njm42hCxn8E7
 KJ2MAqcP0mnvwsutyiRZd2o636BKPB9GtSLn8dlbPEghlEKC/x+FGBEASXHZ50xDoEZ/
 AGSw==
X-Gm-Message-State: AOJu0Yx2mJgvxSxCpXQLzaNtv3ntSY9obZKY1Qr0GMnU6rNaATU9IcOw
 7SQp52dpGYQINBACn5YMZAVuysbun4c=
X-Google-Smtp-Source: AGHT+IHivdlTA5i8F2mOxuTTgQNpG6QN0iSZpJjTDEPGyc+27OY/9g3vLdDskpUqLo68wCNoUTn3kg==
X-Received: by 2002:a05:6a00:17aa:b0:68b:a137:373d with SMTP id
 s42-20020a056a0017aa00b0068ba137373dmr2036907pfg.17.1692727349165; 
 Tue, 22 Aug 2023 11:02:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa785d9000000b0068783a2dfdasm3320769pfn.104.2023.08.22.11.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/11] drm/msm+PM+icc: Make job_run() reclaim-safe
Date: Tue, 22 Aug 2023 11:01:47 -0700
Message-ID: <20230822180208.95556-1-robdclark@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

v5: Add a couple more drm/msm patches for issues I found as making
    my way to the bottom of the rabbit hole.  In particular, I had
    to move power enable earlier, before enqueing to the scheduler,
    rather than after the scheduler waits for in-fences, which means
    we could be powering up slightly earlier than needed.  If runpm
    had a separate prepare + enable similar to the clk framework, we
    wouldn't need this.

Rob Clark (11):
  PM / devfreq: Drop unneed locking to appease lockdep
  PM / devfreq: Teach lockdep about locking order
  PM / QoS: Fix constraints alloc vs reclaim locking
  PM / QoS: Decouple request alloc from dev_pm_qos_mtx
  PM / QoS: Teach lockdep about dev_pm_qos_mtx locking order
  interconnect: Fix locking for runpm vs reclaim
  interconnect: Teach lockdep about icc_bw_lock order
  drm/msm/a6xx: Remove GMU lock from runpm paths
  drm/msm: Move runpm enable in submit path
  drm/sched: Add (optional) fence signaling annotation
  drm/msm: Enable fence signalling annotations

 drivers/base/power/qos.c               | 98 +++++++++++++++++++-------
 drivers/devfreq/devfreq.c              | 52 +++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c  | 15 +---
 drivers/gpu/drm/msm/msm_gem_submit.c   |  2 +
 drivers/gpu/drm/msm/msm_gpu.c          |  2 -
 drivers/gpu/drm/msm/msm_ringbuffer.c   |  1 +
 drivers/gpu/drm/scheduler/sched_main.c |  9 +++
 drivers/interconnect/core.c            | 18 ++++-
 include/drm/gpu_scheduler.h            |  2 +
 9 files changed, 130 insertions(+), 69 deletions(-)

-- 
2.41.0

