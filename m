Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DB13D5D6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B056EC27;
	Thu, 16 Jan 2020 08:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x961.google.com (mail-ua1-x961.google.com
 [IPv6:2607:f8b0:4864:20::961])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091956EA9D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 20:57:35 +0000 (UTC)
Received: by mail-ua1-x961.google.com with SMTP id z24so6822842uam.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=JYjuVTSotuEa5LKchq1QwLvMiC0miS12YXda9sHdZclwC92lt8XOByu06EK7yqK9r4
 WCBYRHBwJdaS94EIh7jMaUWTVZZYvUhWL9XBklNDK6A8QC9DqQEpnz8v45Z9wC3EflW+
 gwoDaiKJbd4DfyNMo7Bq7JUudOlO+KZVDKdDCjnvAPhSHqmKfD/+2NvMg6rYunAXunQq
 iVwQl8EuDAxN9kmFZjdQhkRqyLfeN8m5DEHs2R9Y8iQmkfWay48vJc1Oa5KrF3tTeDLc
 dhDkGUXfDcG5x4C9tviRSMV0IbElyaH1E/d9I0UdlhbH1f9wRnYLlwq2fZylhxEr/IsU
 Fgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=Rkk2c+Xqf19dH31Z6YNBkfjTJMNf/xx7TqXuCJnBj0DO3OZEqDpN9SUgOrmQHWEXll
 CzbbjUiVpAI/cQkTfnU1MegZ9EssyfoJTJadtIuNtc7yI4WvtgYjccyhOf/MJbgywMJc
 8kV/4S3pyM8DVGZoNu2p6zOVcO86IRVz78GAlWNRhE/0x5ZlWW7rZOnvqE0+cpwkzS++
 /b8z6PZeX8+XDySkWVmbG6FVpMEUVtpRBrxL1Zh/K6z58ZpBBbUMUFd79BZg/iSrT3sk
 T9lAosD4SEcCOT1vygeUbdZhL1ixseZ2tC731CEkHvLgj3aD+YSO0slR4vPiiaN5L6ik
 +R+Q==
X-Gm-Message-State: APjAAAUfdA2B+D/kfFSGPIGjJOzZhEe6E9Aj6n2olu2MsChve5CIGkUp
 ULI+eNdIsZKifPJOxlHX232Zk7PT3u5YJXtfHWE2+UDYCHs1pA==
X-Google-Smtp-Source: APXvYqxjXDMjnFKkSryidbYnjPMiySJ2xbqbi1okq9jcW8s3Bi6lp++0JgkqqYp9Bkjvkqtrqnlfvge183NV
X-Received: by 2002:ab0:422:: with SMTP id 31mr17816176uav.98.1579121855091;
 Wed, 15 Jan 2020 12:57:35 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:57:35 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Add a GPU-wide wait queue
Date: Wed, 15 Jan 2020 15:56:48 -0500
Message-Id: <20200115205649.12971-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
References: <20200115205649.12971-1-brian@brkho.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, hoegsberg@chromium.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This wait queue is signaled on all IRQs for a given GPU and will be
used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
until the value at a given iova reaches a certain condition.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a052364a5d74..d7310c1336e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 static irqreturn_t irq_handler(int irq, void *data)
 {
 	struct msm_gpu *gpu = data;
+	wake_up_all(&gpu->event);
+
 	return gpu->funcs->irq(gpu);
 }
 
@@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	spin_lock_init(&gpu->perf_lock);
 
+	init_waitqueue_head(&gpu->event);
+
 
 	/* Map registers: */
 	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c9dc8..60562f065dbc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -104,6 +104,9 @@ struct msm_gpu {
 
 	struct msm_gem_address_space *aspace;
 
+	/* GPU-wide wait queue that is signaled on all IRQs */
+	wait_queue_head_t event;
+
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
 	struct clk_bulk_data *grp_clks;
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
