Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393924A612E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8D110E6D5;
	Tue,  1 Feb 2022 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2195310E6D5;
 Tue,  1 Feb 2022 16:16:19 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so3521896pju.2; 
 Tue, 01 Feb 2022 08:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soKMugPn64vQ/cfc9qI0s3Cw/G/MYetWeT20PxsquF4=;
 b=h3bPV0//plQxMZfuT+9RNiWxNYKrtEB83JukyF6bReF1l/KWFtaNff26CfLlGcSqce
 UO12LUvG5IKcYpA6gZyImS7dHlz97uDuPbonID3vUo9yKEnvATNCX8VKuxO5Whrm7no+
 r+Unjy0evx78N2PGYxUkJIWg6WQFtbLgVF5UqTGbh6ZoRVrbBAtbhJL6gJM7SVwBfBT5
 9fg6IkCw3xYyTAjTGGtOxZ7K0pkg2su87bDZTkpNRHiqcPOe5R4eUI+ONpLliHYaj6E9
 bHLL6ktgqGvCuZzomRPWFbEQc4qwJqPh02kxb58YRDlTD6VwaWaYr0LBGS812pwAL+pc
 Nj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soKMugPn64vQ/cfc9qI0s3Cw/G/MYetWeT20PxsquF4=;
 b=ZeitIu/QJvYJRVadwyFhIOYOC2HPCLsbLKdiGckLwe+V4NwARnheE9vUt1b/jE9I/W
 zLat9Wp/z0GGulYaX+oLC13EAkHMRV1hL8qCtIj9BnYABRNtGNcTRHy6UW36m6wC849c
 rOgJx7eGz/QgT0w0YBhwigDmHZNyAIlmVo4+T/8EMOytxn+FiL+PF4U7xjDcqYMkhXP+
 A21yqx3ezALailqhpXKW3kYR2Hdr02VrZ/EecjH6z6mUTNP+dPJA83qNLPMChEUFePXl
 jQ/a1VmELkoZcgMn3X6PxDefmnWijvfpTLUrhwvjU+eFGA3JwlXr2rdoApurOzbwcr4v
 0K/w==
X-Gm-Message-State: AOAM533gR3uc1xz12+hcAnEpTaYCuvHX0oddZtaU4bydzxowGqjBvhZX
 NnSfuwdTCxY+t2O083xEkbNhq6hA+1o=
X-Google-Smtp-Source: ABdhPJyxK0MpVj2a1YNiDWbtzm8rzXl8lp2pT9v7xwVfV932u5By8bLQxW4ej3tKDuokrBkV4OGciA==
X-Received: by 2002:a17:902:bf01:: with SMTP id
 bi1mr26784360plb.87.1643732177929; 
 Tue, 01 Feb 2022 08:16:17 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d22sm15617930pfl.71.2022.02.01.08.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:16:16 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/gpu: Track global faults per address-space
Date: Tue,  1 Feb 2022 08:16:12 -0800
Message-Id: <20220201161618.778455-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201161618.778455-1-robdclark@gmail.com>
References: <20220201161618.778455-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Yiwei Zhang <zzyiwei@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Other processes don't need to know about faults that they are isolated
from by virtue of address space isolation.  They are only interested in
whether some of their state might have been corrupted.

But to be safe, also track unattributed faults.  This case should really
never happen unless there is a kernel bug (and that would never happen,
right?)

v2: Instead of adding a new param, just change the behavior of the
    existing param to match what userspace actually wants [anholt]

Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/5934
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_gem.h           | 3 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 8 +++++++-
 drivers/gpu/drm/msm/msm_gpu.h           | 5 ++++-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index caa9076197de..58dfb23cf2af 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -269,7 +269,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		*value = gpu->global_faults;
+		*value = gpu->global_faults + ctx->aspace->faults;
 		return 0;
 	case MSM_PARAM_SUSPENDS:
 		*value = gpu->suspend_count;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 54ca0817d807..af612add5264 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -35,6 +35,9 @@ struct msm_gem_address_space {
 	 * will be non-NULL:
 	 */
 	struct pid *pid;
+
+	/* @faults: the number of GPU hangs associated with this address space */
+	int faults;
 };
 
 struct msm_gem_vma {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2c1049c0ea14..942bf41403ff 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -370,8 +370,8 @@ static void recover_worker(struct kthread_work *work)
 		struct task_struct *task;
 
 		/* Increment the fault counts */
-		gpu->global_faults++;
 		submit->queue->faults++;
+		submit->aspace->faults++;
 
 		task = get_pid_task(submit->pid, PIDTYPE_PID);
 		if (task) {
@@ -389,6 +389,12 @@ static void recover_worker(struct kthread_work *work)
 		} else {
 			msm_rd_dump_submit(priv->hangrd, submit, NULL);
 		}
+	} else {
+		/*
+		 * We couldn't attribute this fault to any particular context,
+		 * so increment the global fault count instead.
+		 */
+		gpu->global_faults++;
 	}
 
 	/* Record the crash state */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ba8407231340..c99627fc99dd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -200,7 +200,10 @@ struct msm_gpu {
 	/* does gpu need hw_init? */
 	bool needs_hw_init;
 
-	/* number of GPU hangs (for all contexts) */
+	/**
+	 * global_faults: number of GPU hangs not attributed to a particular
+	 * address space
+	 */
 	int global_faults;
 
 	void __iomem *mmio;
-- 
2.34.1

