Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940474449F8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 21:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C967A329;
	Wed,  3 Nov 2021 20:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AAD7A326;
 Wed,  3 Nov 2021 20:59:10 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id s24so3693695plp.0;
 Wed, 03 Nov 2021 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAvM+g0nOw8dXBaO8IEKfuu1DVB6ImeRwrNAg5nlgY0=;
 b=RwKDVJBJa9n/8X2oxiLeLyEYiId1ALn/wUwn2oHj4oVxJqTuQTFDcBVTDHFHNQSQ7s
 a70j/DZC96WaL5djXcWVstbJrdtmEoG9L78mQSp5cg8gWVlBYLUfCTz2AU1efCh5gS+j
 hRi04I4MD7umGlwsOB/l1WR5WMzxdzdYQ7Pmab9/rsFz7yxOuTiQcNQ6bQSzm8GfhtHV
 QWSzV07pET8XFqtzEUxh6DBz7demRWGkzjI5nUUNrUDVHjHNCvPO/r84gh2ed4zXuEXs
 bjenaUr1GijlAmfhhtckDfjrwxn0uiC76guULHgKtrFZMRpXnh4hXEY/ARsQDyUTVzXw
 dAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAvM+g0nOw8dXBaO8IEKfuu1DVB6ImeRwrNAg5nlgY0=;
 b=c80MCQEUr16YvYMb3FKdlG/JxwbLbE8gsBmuPE1yCnDIY4opwZqZVC9nrQ2NOFag25
 lARVh62+gGbxmw5oO74xMCE7kWhNzC+TfXM2YL3Xz4JQ0W2UxK3rb7bIv2iX+kdDakeh
 XCnd7kmPXfyt71LTufzpYkT42ycr1AQtsKq+AJIMm3xEmt1pYx4uTdxXSx5uAk/F1NKF
 NiW1GWGi9qT3mIjgNuSgU5ujeph5BunM60IMxRBVJZFc7ts3e2KZvPStQpN72PvEy7NF
 kCa6I02zR6ebypT/fJjumrBX3XMoiDFX8vyq06RKIgOl8p/C430TeQUvmMN7I0h3njru
 +Akg==
X-Gm-Message-State: AOAM5327jhoXxbCrDfy2vD6+etIRv42CB3x/obb/zrZdkvlFEBNs50zB
 6j7psGkpIkmeQCCuwIyh3OH4touDjGA=
X-Google-Smtp-Source: ABdhPJzYneDeDjxADsHGJ8PHo5oX/urAKBo2bkfKMAOS6FV439NXqyc7lZkpu6FNyfnmDP+KPTS/eA==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id
 z10mr17675513pjn.20.1635973149661; 
 Wed, 03 Nov 2021 13:59:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d10sm3131569pfd.21.2021.11.03.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:59:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
Date: Wed,  3 Nov 2021 14:04:02 -0700
Message-Id: <20211103210402.623099-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103210402.623099-1-robdclark@gmail.com>
References: <20211103210402.623099-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index b24e5475cafb..427c55002f4d 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -158,6 +158,33 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
 
+static void set_target(struct msm_gpu *gpu, unsigned long freq)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long min_freq, max_freq;
+	u32 flags = 0;
+
+	/*
+	 * When setting the target freq internally, we need to apply PM QoS
+	 * constraints (such as cooling):
+	 */
+	min_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
+					 DEV_PM_QOS_MIN_FREQUENCY);
+	max_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
+					 DEV_PM_QOS_MAX_FREQUENCY);
+
+	if (freq < min_freq) {
+		freq = min_freq;
+		flags &= ~DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use GLB */
+	}
+	if (freq > max_freq) {
+		freq = max_freq;
+		flags |= DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use LUB */
+	}
+
+	msm_devfreq_target(&gpu->pdev->dev, &freq, flags);
+}
+
 void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
@@ -173,7 +200,7 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 
 	freq *= factor;
 
-	msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
+	set_target(gpu, freq);
 
 	mutex_unlock(&df->devfreq->lock);
 }
@@ -212,7 +239,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 
 	df->idle_freq = 0;
 
-	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+	set_target(gpu, target_freq);
 
 	/*
 	 * Reset the polling interval so we aren't inconsistent
-- 
2.31.1

