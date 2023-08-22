Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47389784929
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF910E3D6;
	Tue, 22 Aug 2023 18:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14A510E3CF;
 Tue, 22 Aug 2023 18:02:51 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a3e943762so2499631b3a.1; 
 Tue, 22 Aug 2023 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727370; x=1693332170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27p7IUrBUbclutUTfVSGUQESAA2avJiwqyRR2x+l1m0=;
 b=qJl84xabqxGctlufYYzZ0tK+WdNRFigoyJ87qxZpQtgmA+acOyhabn8gTemh9n05ni
 PrFKzld/dpUV6jdQXKKsGoyh37PRNJhie8iLPhyiFPcWEq46TDJEfqp8lPkrajyI02vb
 HcjSrnk3+Sb78LFi913m990ox8rpRBjj6EvC3aT626z9mBc48paFjfRvBtT+Vyx5+6Ta
 syzF8lGdPeM36rMkVtwdG+qTDIk31NAbDyzMyPKkxCiumGT0nkwDVWSkZBRo4T2DM98g
 akQz/jtPABwezTKc+bkP7VpNcSkPW93u7DkZpycYu07E5Tfgd2Zzu7KG0IOkMPvpnrfd
 Uw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727370; x=1693332170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27p7IUrBUbclutUTfVSGUQESAA2avJiwqyRR2x+l1m0=;
 b=bA/3uoocSxpdU7CSJ5RDo9wBFSP+7GDfD60FB4+LFIERfI+2fmZKgf2i66oPKuRte1
 anGI7FkVxzTqm1t9CctNDqibwcESzm6HuIXw4GangWd0Dilf1N/SynNIB7rppVNXp41w
 m/HsiHWJLzQZGDc5BMVOuR6GWEUuDHRy7KnQ2G2MncUzNNVJWWQZRVV8cSHHGyGx4kwZ
 +fndIm6ezpby3n11ApQ7sSkvAeUsvvgm0pEQ/ZxRFNSypxtHc9ir1ArW2G4/Z35Ct/4x
 FgSQAikbac4A53c4FxiIHKGC4gmmz/xHaM2L0uTxkNOS4WBjZbhrl6C4wwA8xCW9zU0A
 MBjg==
X-Gm-Message-State: AOJu0YwSNs7vKxC6lWrlKDKC5+b6uF1E/HRqppitrGzcC3Icsl8Xlvx8
 MqK81ZY3jSanPDSWy9hrW0mYXAkoAlg=
X-Google-Smtp-Source: AGHT+IFbzkBQEmwWFyVgVJJbK2lNicqTu/4XV7Sr++rA7JFjJhZHCsZjniDhF+EF9SEPv+aSjlrV1w==
X-Received: by 2002:a05:6a20:7da9:b0:134:1011:8582 with SMTP id
 v41-20020a056a207da900b0013410118582mr12765394pzj.47.1692727370533; 
 Tue, 22 Aug 2023 11:02:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a638f45000000b00528db73ed70sm8145026pgn.3.2023.08.22.11.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/11] drm/msm: Move runpm enable in submit path
Date: Tue, 22 Aug 2023 11:01:56 -0700
Message-ID: <20230822180208.95556-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move runpm enable to just before we enqueue the job to the scheduler,
rather than job_run().  This has the disadvantage of potentially
powering up the GPU before waiting for fences, but it is the only
feasible way to move things like clk_prepare() out of the fence
signalling path.  Ideally runpm would have separate prepare and enable
steps so we could just move the prepare step.  But attempting to
separate these without support in runpm doesn't play nicely with
autosuspend.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 ++
 drivers/gpu/drm/msm/msm_gpu.c        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 99744de6c05a..a908373cf34b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -981,6 +981,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
+	pm_runtime_get_sync(&gpu->pdev->dev);
+
 	drm_sched_entity_push_job(&submit->base);
 
 	args->fence = submit->fence_id;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 243f988c65b7..819140d85205 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -751,8 +751,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	WARN_ON(!mutex_is_locked(&gpu->lock));
 
-	pm_runtime_get_sync(&gpu->pdev->dev);
-
 	msm_gpu_hw_init(gpu);
 
 	submit->seqno = submit->hw_fence->seqno;
-- 
2.41.0

