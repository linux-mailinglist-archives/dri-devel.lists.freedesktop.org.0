Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0AA664985
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2C110E251;
	Tue, 10 Jan 2023 18:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EA210E168;
 Tue, 10 Jan 2023 18:22:12 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id d10so8800016pgm.13;
 Tue, 10 Jan 2023 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPPp4X1sBM/+EwXKJ1Udyn041rDe4dkPN+gbP+h2Yoc=;
 b=qJBXBpPJHtuENt0GARPRQKp2a2d2bG2sppM+WZAucEidaZyC+7Wdq7LI5CBoTGxNA3
 jTM3LIlOEtS2/aAitqxnZlBmwxljOP+vIOV58uLlCtvqQEQ9Hp5OhT51wWZruY2i1MvY
 6kNX/u3a2zanqEN+w3E8Fi5z7VxFwMtMlmKNz3DvJhEiBlnsPXKcLQGyP4QrZjvdFQov
 NpmA3F4p1EDwLG67Omt8qx9Z7OS9T/RSlw79BOSqJ9MZQA+/GvD7cezqN0I8G58X9fhL
 aKulhMPWw2ZlC2+GEWtLpHyTGBlhi2bX0OSfOQGJWyDhjoNo0z4KMuNgubZ3g4QCFu+8
 RGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPPp4X1sBM/+EwXKJ1Udyn041rDe4dkPN+gbP+h2Yoc=;
 b=rcea5R7GlUOwmf5V82vltU/VzzZQEf7f00nqeY5wQ0jtCOU4ukQ21buKLkeBojIcf0
 oMl8sjISDCEQRvXZAS4mz91zb+F0BWj4GvT3uwW+SSIAdE18/P+xXsB1DKkNVOSTQFR4
 vW9dI4A4TzRQ4MgcSGvbT4YlhTszaDDDnNpKpkeT6wOXI4mLWPyCq3La/JrrjykVCI2v
 yHYmXAJxOZSH1aZ2ctgpXsvF0iFgsH47fd8CVhYMCuVIOsXvBCFEO/VQdJTICPXnqnBQ
 93q6+cQ6axwppb9P7clsBrlRVPxgTU5fcVAiVml6VikPPxHvuWjCxsy0cKWGR1UiiHVy
 y6rA==
X-Gm-Message-State: AFqh2koo4usRuKfgJ3R+1vC/Q50LQh7wX4v9pB3fZhm49ADy8//cTxws
 VuySvX+tiHPzv6FyPFEzPHE3T+/D5OI=
X-Google-Smtp-Source: AMrXdXvvQvGvIzUPW5Fb9EE9F+jKZ5hTovkXNS514pYVo6mWEmFnuLDdCDGGVysVJxNzwsiPHXCUBw==
X-Received: by 2002:a05:6a00:4c0a:b0:589:85ed:4119 with SMTP id
 ea10-20020a056a004c0a00b0058985ed4119mr6884681pfb.32.1673374931439; 
 Tue, 10 Jan 2023 10:22:11 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a622986000000b00581172f7456sm8410169pfp.56.2023.01.10.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 10:22:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/gpu: Add default devfreq thresholds
Date: Tue, 10 Jan 2023 10:21:47 -0800
Message-Id: <20230110182150.1911031-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110182150.1911031-1-robdclark@gmail.com>
References: <20230110182150.1911031-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index e578d74d402f..1f31e72ca0cf 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -145,6 +145,15 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	if (!gpu->funcs->gpu_busy)
 		return;
 
+	/*
+	 * Setup default values for simple_ondemand governor tuning.  We
+	 * want to throttle up at 50% load for the double-buffer case,
+	 * where due to stalling waiting for vblank we could get stuck
+	 * at (for ex) 30fps at 50% utilization.
+	 */
+	priv->gpu_devfreq_config.upthreshold = 50;
+	priv->gpu_devfreq_config.downdifferential = 10;
+
 	mutex_init(&df->lock);
 
 	dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
-- 
2.38.1

