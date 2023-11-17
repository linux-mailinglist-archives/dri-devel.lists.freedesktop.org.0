Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD27EF536
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F310E1A6;
	Fri, 17 Nov 2023 15:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B39010E1A6;
 Fri, 17 Nov 2023 15:24:33 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ce627400f6so4005235ad.2; 
 Fri, 17 Nov 2023 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700234672; x=1700839472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uBvEQIGbC4HURF/ntUyUlcav9b00XtnohKM7H7UZq1s=;
 b=YAZa8skI7E6+gDp1rKZAko7sUR0CeFZEKxgOSZFEHTMFNPyKYD9xDE9wXdICVd8TS0
 OgIAe5+LJ9lKneqbmB14xA8sSMecmyIqNFqFfQUD+MEU8rnsF0bh9HgYbZA15a8T+BJv
 cJrZQTh7vepN5mAValN8G/kpN8uGRWijIPF+hubYsCCZeKb/oHozF2EyoepfebWYKr/9
 e4kU/oy0IuVmQkhMDFwST3iljnP2U5P/FJnAK0uaIr5IygmrVFUAAHvwqhSyQEltfHeK
 NiYN/MHZy4l2VWlnujGh+SLtq3xpw9TDWc9MOMCemX1CY5hBeyJOc4kUiK5gm6BoZpb0
 kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700234672; x=1700839472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBvEQIGbC4HURF/ntUyUlcav9b00XtnohKM7H7UZq1s=;
 b=n3u7eCQsyd1r1X+6hwJzI6Dyg8+z4PHMVFjL7e5x8rBU5DjDTJUwgIEakldRYNxXfD
 Sy6JovRM7X4xUqBUzpU7jZLuQJkdEerGiSGY6DIN0C55RxPHwnwVS9KtgJOKYKsRHVo+
 0Z7hwfbJZ/UhoT2rWE0JaTLZFL0j8oKR4lCuQ2qEOYE8pF9U57w5bQlaRecRns2Pv1Y4
 wb2b5XC/emHa4oqPAbaLzIcQPxKefJrM9H9MfJJGXqJCvNSTMrd/RPA+2T4NomDdIZXE
 QD4CDevTQBHDNK1xDqomCOtUO3LfbUwJhnVXZjCRpu64xdPrGZvkFQQqIIVXiuPjSpB+
 he0w==
X-Gm-Message-State: AOJu0YwH1ZzeGn/Pj/feuQvv8NPpVCEG8M95n4Z0NM7HavAzUoD8s4RJ
 jA9gGrYAbx3qVzWacKb7FHv8JiNOy+E=
X-Google-Smtp-Source: AGHT+IGTPCDBXhcUUjrXC4Dbd4cFWutY1Bl9KA7ZGsMeXgRJUlzNmkIzq5Rli0oYI5LYgJOwaYw/Zw==
X-Received: by 2002:a17:902:e5c3:b0:1ce:5b6d:e6b1 with SMTP id
 u3-20020a170902e5c300b001ce5b6de6b1mr3482012plf.17.1700234671579; 
 Fri, 17 Nov 2023 07:24:31 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b001c73f3a9b88sm1504162plg.110.2023.11.17.07.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 07:24:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Skip retired submits in recover worker
Date: Fri, 17 Nov 2023 07:24:28 -0800
Message-ID: <20231117152428.367592-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we somehow raced with submit retiring, either while waiting for
worker to have a chance to run or acquiring the gpu lock, then the
recover worker should just bail.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 41 +++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3fad5d58262f..fd3dceed86f8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -365,29 +365,31 @@ static void recover_worker(struct kthread_work *work)
 	DRM_DEV_ERROR(dev->dev, "%s: hangcheck recover!\n", gpu->name);
 
 	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
-	if (submit) {
-		/* Increment the fault counts */
-		submit->queue->faults++;
-		if (submit->aspace)
-			submit->aspace->faults++;
 
-		get_comm_cmdline(submit, &comm, &cmd);
+	/*
+	 * If the submit retired while we were waiting for the worker to run,
+	 * or waiting to acquire the gpu lock, then nothing more to do.
+	 */
+	if (!submit)
+		goto out_unlock;
 
-		if (comm && cmd) {
-			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
-				gpu->name, comm, cmd);
+	/* Increment the fault counts */
+	submit->queue->faults++;
+	if (submit->aspace)
+		submit->aspace->faults++;
 
-			msm_rd_dump_submit(priv->hangrd, submit,
-				"offending task: %s (%s)", comm, cmd);
-		} else {
-			msm_rd_dump_submit(priv->hangrd, submit, NULL);
-		}
+	get_comm_cmdline(submit, &comm, &cmd);
+
+	if (comm && cmd) {
+		DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
+			      gpu->name, comm, cmd);
+
+		msm_rd_dump_submit(priv->hangrd, submit,
+				   "offending task: %s (%s)", comm, cmd);
 	} else {
-		/*
-		 * We couldn't attribute this fault to any particular context,
-		 * so increment the global fault count instead.
-		 */
-		gpu->global_faults++;
+		DRM_DEV_ERROR(dev->dev, "%s: offending task: unknown\n", gpu->name);
+
+		msm_rd_dump_submit(priv->hangrd, submit, NULL);
 	}
 
 	/* Record the crash state */
@@ -440,6 +442,7 @@ static void recover_worker(struct kthread_work *work)
 
 	pm_runtime_put(&gpu->pdev->dev);
 
+out_unlock:
 	mutex_unlock(&gpu->lock);
 
 	msm_gpu_retire(gpu);
-- 
2.41.0

