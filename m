Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D303D2FB9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED586F3F9;
	Thu, 22 Jul 2021 22:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2736F3F9;
 Thu, 22 Jul 2021 22:17:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso4632856pjn.1; 
 Thu, 22 Jul 2021 15:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
 b=SNpsbNBiLKHHFRQTP5JWRERPIA10ErY3XlI+V8RrayabzM9kXncvCEVClGWSAFG/rw
 0H0ZMkV/xtYjWs1ylY6DkKGZBYFRGrF8JHkcLLL7RGBZTShJPxS7VAAkWKwLcrFEMd5E
 jfScfcf1jJHeCwad258NJOmFklVGTv8zpuSAib1gnfM7NuQfuABFMyh3chceJdSfHbr9
 lu062tTXh9ntjt16QzfH7WKmcd/N906vaLnr/TyjsxMWzX2/QTkbHAxVa4fG4MYpYy6C
 nliAMGxLyWWlQ14OZegS32EZGdYvtv7wbinETTtYvupbfTaAE8zWqSkcmUcM4gsSRCvk
 cbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
 b=J7zfNALneM8s4H42gDojQVypCN4T0nfSRQDZl7L/6HsjtU4n8pqo4RjqNdOfsX5Z+G
 xVPTfieCvMbQeD5Dtih7oXKW/C8Oxpw8dlzpqmerP4wo+v47KDJZl4o2kg2PXFuMXR63
 mI83LD2Jm9v5QROnK63vYSckqRfJLViF2ydFfJyA75GrhUuAePYcSdrcPTDOTSEmzX6I
 mAwKtXrKBmD+m1JMPXKXmygmaGQDtndIGjYFMSzCDYgkNGKxEzkqP5U/8KrNclrd6QMB
 bIssfJWsaynnLRlfc27E4sDt80UHtnciJXVnGMPpplE0NjbFQWnP2W8IhnaFhhiDyImM
 UMlA==
X-Gm-Message-State: AOAM532Ys8ezLuyjssYGDGggzfWZ6oDCR06PWp5nIwa73//Z2JChIvY8
 RneWMJ9JJinXNlv4x8Yjz3fn8vjphmdbcw==
X-Google-Smtp-Source: ABdhPJzDw2jN1R+e7X9KNvqHxtRZDBRDujIR0CDelIocfLSDYbR3ug0aI+S90A9NQH5xZzCaLv1hyg==
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr1806135pjk.159.1626992264754; 
 Thu, 22 Jul 2021 15:17:44 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m34sm35739282pgb.85.2021.07.22.15.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 15:17:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm: Split out get_freq() helper
Date: Thu, 22 Jul 2021 15:21:40 -0700
Message-Id: <20210722222145.1759900-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722222145.1759900-1-robdclark@gmail.com>
References: <20210722222145.1759900-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the next patch, it grows a bit more, so lets not duplicate the logic
in multiple places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 3bcea0baddab..2e24a97be624 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -37,17 +37,21 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	return 0;
 }
 
+static unsigned long get_freq(struct msm_gpu *gpu)
+{
+	if (gpu->funcs->gpu_get_freq)
+		return gpu->funcs->gpu_get_freq(gpu);
+
+	return clk_get_rate(gpu->core_clk);
+}
+
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
-	if (gpu->funcs->gpu_get_freq)
-		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
-	else
-		status->current_frequency = clk_get_rate(gpu->core_clk);
-
+	status->current_frequency = get_freq(gpu);
 	status->busy_time = gpu->funcs->gpu_busy(gpu);
 
 	time = ktime_get();
@@ -59,12 +63,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	struct msm_gpu *gpu = dev_to_gpu(dev);
-
-	if (gpu->funcs->gpu_get_freq)
-		*freq = gpu->funcs->gpu_get_freq(gpu);
-	else
-		*freq = clk_get_rate(gpu->core_clk);
+	*freq = get_freq(dev_to_gpu(dev));
 
 	return 0;
 }
-- 
2.31.1

