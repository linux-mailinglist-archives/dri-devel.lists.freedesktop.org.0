Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E24664FBB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 00:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45BF10E695;
	Tue, 10 Jan 2023 23:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F6610E693;
 Tue, 10 Jan 2023 23:14:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9so14835186pll.9;
 Tue, 10 Jan 2023 15:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPPp4X1sBM/+EwXKJ1Udyn041rDe4dkPN+gbP+h2Yoc=;
 b=q63uw3mNNlQVh6Is3bP4jmBTtBzK7jO+hnToC3uKeWKGgwDm8mExfNScSDJARhkjr7
 FrGgbnqN4GOZPhYvVpKjig9VDS4kS/JL09ZRrq+1Y7/DeaLEx3LD3j1zMODLrpmFDyDX
 K/qSExlx+Pn3kbupCI8BEzmL7S6fkRpmiLOSPqZLB2SIC5BUsZTbchcpgBQ/6a7IacoE
 82Y4Y92sV3kTEjAKCt2hjgjuEASCkZ+7vq/ALtjcBxhFgvK3Lg+8m0cKvpEBZ+hsZyui
 z3M14v21V+ZYKkfkLpUjB/ZMhJlBcNPWpySuxouahKrcemeGfpgWmGrXT5EVmlb69XOX
 tX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPPp4X1sBM/+EwXKJ1Udyn041rDe4dkPN+gbP+h2Yoc=;
 b=ISxhEM1K7Y5yNuLcpOhwnZccaUUcf1Mf2N2kYi0jR2BrBKH/zqcQK5fEgUHTEhUFB5
 3Tnce7MKKvy9fS8LHtakWTMZT8tv75kpsOnS1XgcLsXr6Fuj9QRHfEafRDLkfls3AalG
 IHgmsVMpmbg8DG4n9cz2E/3zY+jWHi4/cRO0O69tnzuQf4iK7/gCH10MEt6YqPhdC/gy
 JbSPfF5fdV3S+avFAaWldzOviqx28fJ8Bp2YbtDbct2mx4CftmLgQG7AvYyES7pT9TnZ
 lF9xppDjP2Rovndz4jcmTDEkhL464do8wnTJn197C+CMOxOrNlbUgeEDMOHIzhua4yNz
 0Ifg==
X-Gm-Message-State: AFqh2koSjpQULKYTCfDTKe5pC6B5Uxg+oC/P3sa614FiO5xv7Cvi5VMi
 XF3HkQYlQr6o4GGJnAbfMimougidBWk=
X-Google-Smtp-Source: AMrXdXvCCByLHgBm0haGn8RFxyFWg/VpAsCup8jfefaHXVKuqOBYbiffTI0ZlkvCrwLLmKdjiXEAzg==
X-Received: by 2002:a17:902:aa82:b0:193:2f1a:65b1 with SMTP id
 d2-20020a170902aa8200b001932f1a65b1mr457696plr.59.1673392492186; 
 Tue, 10 Jan 2023 15:14:52 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a170903125200b00189adf6770fsm8654086plh.233.2023.01.10.15.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 15:14:51 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/gpu: Add default devfreq thresholds
Date: Tue, 10 Jan 2023 15:14:44 -0800
Message-Id: <20230110231447.1939101-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110231447.1939101-1-robdclark@gmail.com>
References: <20230110231447.1939101-1-robdclark@gmail.com>
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

