Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62B4D2069
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 19:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5CF10E547;
	Tue,  8 Mar 2022 18:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D1310E532;
 Tue,  8 Mar 2022 18:48:08 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id o26so17230405pgb.8;
 Tue, 08 Mar 2022 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kmwLyD/dNxW2RzhMW7TqKOPG19gcSG2VPjcZNJ8YJ7Y=;
 b=bBIeKK1bY+Eml8HcFIdHzNO9ls55ISByO+JR0/BKyKu7ETxiYU3wfkI+0nbsk12IeQ
 5LuDr9byAG4cZqgYdhaG6837t8v3xiTAufKyikjiVybPJ799E2pWHiXMbNTjTIp0a+iN
 KFveCYukqhXiBR9nlyEmoNxkT6j0F6SqRXU8QH01YNwaq5Cg5uyE09Ygt9XYV5SxD/oE
 kzzItxxjQDnQBV8jHhCjfIDR/l9j54XGRfFs1zqt9DEflfadd9Ahn1XN/u+RIJtucfHf
 hJhCIWNB4vAcRnI7W/ZPoDrp5yfwbZcdA04VWqt7CNq/bEjW1QpXLUqtRmfHqRFd3rPL
 JgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kmwLyD/dNxW2RzhMW7TqKOPG19gcSG2VPjcZNJ8YJ7Y=;
 b=f4SR8mTmMHXKZ9y4lcRYfH9bRKT+dpk7GVarKZgdGjp+x6xleNdYfVJJiDUOoROl4c
 /mwp4Vr979xPGNZmNb+M3uDVkVbcKZf7lAO3GOzvF9fdGCxqiB9Qk83bKG5fuJ5lwTrU
 JsZPSWTKfu7xOY0JzQArjikVPum2ETjZrlVG5LKy/tB9ZvZ9nezg1NImnbpD4KJsYWlQ
 s5iVJrM/BstJJy+5IT1pTU9LcpcY2mI9K4/hVBXgjb/UdsTJ1LDXgdJa8Tgw+Mfps7EZ
 BqUYZFV0/WgvVPSDtFq/m/bvApHzmHJc6HNt/VBeVImOlIaXKBZw/9yEeyYCRZgJbhV2
 0PDA==
X-Gm-Message-State: AOAM530cWjuhXVlqnduKlYSMifO7oOu8MXIrHt8zHHMNH1HiyqtlX3mO
 9UatTsoRAUOdhh2q9f74pudMKS/MIHo=
X-Google-Smtp-Source: ABdhPJy/k9PqwomI4wEWKZQhIW9f3ebpWevqKdxPWSDsy/ybougbJzb+jzvMb97y/bbV6CrPIntPgw==
X-Received: by 2002:a05:6a00:ad0:b0:4e1:2d96:2ab0 with SMTP id
 c16-20020a056a000ad000b004e12d962ab0mr19664621pfl.3.1646765287869; 
 Tue, 08 Mar 2022 10:48:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a056a00198f00b004f7109da1c4sm7129643pfl.205.2022.03.08.10.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:48:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support (v2)
Date: Tue,  8 Mar 2022 10:48:44 -0800
Message-Id: <20220308184844.1121029-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid going down devfreq paths on devices where devfreq is not
initialized.

v2: Change has_devfreq() logic [Dmitry]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 30 ++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 9bf319be11f6..12641616acd3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -83,6 +83,12 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 static void msm_devfreq_boost_work(struct kthread_work *work);
 static void msm_devfreq_idle_work(struct kthread_work *work);
 
+static bool has_devfreq(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	return !!df->devfreq;
+}
+
 void msm_devfreq_init(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
@@ -149,6 +155,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	devfreq_cooling_unregister(gpu->cooling);
 	dev_pm_qos_remove_request(&df->boost_freq);
 	dev_pm_qos_remove_request(&df->idle_freq);
@@ -156,16 +165,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
 
 void msm_devfreq_resume(struct msm_gpu *gpu)
 {
-	gpu->devfreq.busy_cycles = 0;
-	gpu->devfreq.time = ktime_get();
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
-	devfreq_resume_device(gpu->devfreq.devfreq);
+	if (!has_devfreq(gpu))
+		return;
+
+	df->busy_cycles = 0;
+	df->time = ktime_get();
+
+	devfreq_resume_device(df->devfreq);
 }
 
 void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	devfreq_suspend_device(df->devfreq);
 
 	cancel_idle_work(df);
@@ -185,6 +202,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	uint64_t freq;
 
+	if (!has_devfreq(gpu))
+		return;
+
 	freq = get_freq(gpu);
 	freq *= factor;
 
@@ -207,7 +227,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	struct devfreq_dev_status status;
 	unsigned int idle_time;
 
-	if (!df->devfreq)
+	if (!has_devfreq(gpu))
 		return;
 
 	/*
@@ -253,7 +273,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
-	if (!df->devfreq)
+	if (!has_devfreq(gpu))
 		return;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-- 
2.35.1

