Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50154D55A4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D138B10E148;
	Thu, 10 Mar 2022 23:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9DC10E148;
 Thu, 10 Mar 2022 23:45:43 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z16so6464293pfh.3;
 Thu, 10 Mar 2022 15:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sc+BLeBhOeunpwNV1naAxApoyho4RIVwZsup23KixGA=;
 b=i/kCIR2M9+f6iR0IxrdfD6uzdUTkXYHeSmmSe0xEfqNmiGuvFwvEa9Rhc7SjtoyDRm
 iSWmf2YUwJTqDGe5yr62zNAIiPpSnKRmbpMcjNLvMsY5+aM8+89n6AjSPTudJ35s0cJ/
 cDBM6keO22ne0gjnhQGSRsVh3eyxL68tm3z7MsqZgKk9hEN2wBW+GYS5nQ81KHZBpB0U
 C4Oq5c3OhQiC3wPgyLyYCR5OQ8I894o2dkYOtOIBXyh4UkGY+Ko+6mEPpwpaiHban9ou
 FuN7FOqQk45kn4IvAWIWVJ7ZQs1Nstlv+EjKVvMQ2F7RPEnvRR0zDpw9qgXZPs/dM8Cw
 Jx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sc+BLeBhOeunpwNV1naAxApoyho4RIVwZsup23KixGA=;
 b=s4vGnsq/JZ7ikcUjXLrVdr6j8rddbFVs/9/AOb/erAXRc51/ZrHy6zA8gERMXYDvdG
 H9LQ8oo4OZcluGOQ1dnfyG1pkENFqSrXMO6hfX4AoaCUDnVuL/8OtHFp31TvowhYCaxI
 aOBi8WPKbC2mVrI305bPbw/y2I1rKRisxKDi7HNORPP8GpbHAgno97gB33seHYouhHZX
 m7owO3Z3m9ZEOHtbGkGGSiP3kU3qP3NaUbAolM92D+ZGVG30KKGSf9qxtFr6ie+2jxXv
 jAPiXaPwrLrysqC8pIdWVtIbULah/yn+VRgv6mJx/wBWynWMvAU5dDCFdeGOcnX5S5Pq
 cqsQ==
X-Gm-Message-State: AOAM5300bPTPJwNK8/9cXnX+NKsEpt/dLFOf29n+Gfu/SPEDU5BCpfnG
 4Xjw7jbUHDGl8gInBnsTkThTpxq2k+g=
X-Google-Smtp-Source: ABdhPJyrhezjAT6CU0w7i5q6gN4DLMtI4haYY25Kw92sxxE/XVe1+QHeusf/BWUEj++yK+OMlHBWTw==
X-Received: by 2002:a63:89:0:b0:37c:54f9:25b6 with SMTP id
 131-20020a630089000000b0037c54f925b6mr6190197pga.494.1646955942569; 
 Thu, 10 Mar 2022 15:45:42 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm8767891pfu.86.2022.03.10.15.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:45:41 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/gpu: Remove mutex from wait_event condition
Date: Thu, 10 Mar 2022 15:46:06 -0800
Message-Id: <20220310234611.424743-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310234611.424743-1-robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The mutex wasn't really protecting anything before.  Before the previous
patch we could still be racing with the scheduler's kthread, as that is
not necessarily frozen yet.  Now that we've parked the sched threads,
the only race is with jobs retiring, and that is harmless, ie.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 0440a98988fc..661dfa7681fb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -607,15 +607,6 @@ static int adreno_runtime_resume(struct device *dev)
 	return gpu->funcs->pm_resume(gpu);
 }
 
-static int active_submits(struct msm_gpu *gpu)
-{
-	int active_submits;
-	mutex_lock(&gpu->active_lock);
-	active_submits = gpu->active_submits;
-	mutex_unlock(&gpu->active_lock);
-	return active_submits;
-}
-
 static int adreno_runtime_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
@@ -669,7 +660,7 @@ static int adreno_system_suspend(struct device *dev)
 	suspend_scheduler(gpu);
 
 	remaining = wait_event_timeout(gpu->retire_event,
-				       active_submits(gpu) == 0,
+				       gpu->active_submits == 0,
 				       msecs_to_jiffies(1000));
 	if (remaining == 0) {
 		dev_err(dev, "Timeout waiting for GPU to suspend\n");
-- 
2.35.1

