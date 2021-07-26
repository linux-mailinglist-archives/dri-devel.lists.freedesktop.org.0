Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD13D5BFF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF906EE6C;
	Mon, 26 Jul 2021 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EC76F98F;
 Mon, 26 Jul 2021 14:42:48 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso302931pjs.2; 
 Mon, 26 Jul 2021 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
 b=ChcDtB/kxIXXTedMqyBkWFdJKgGXHSEEl8e4hMFgzXaG8W/+JMBOe1VRI4uF1NqLTj
 KJcBuItjYQpAyJJEfLrbcpvWnGGS5fi/VGaJxZmoHep0+sRvdoJ/vkTjKguE3XVrSahx
 Xo0Fqk7oPC0SrD1NhWtr84MByOX4i0IVEr7g2R7QtV1eEmlCAETKkniiAZovTp6NAW0R
 s2+dwCwAKu4Ie+QMCTgEb6hIPgU6BiQPeOhZGzWRb4l4lHqm8XEimQ8alzJVLs4SASJj
 E0GFAr3LSFtc5axCNmsm5mWUx1ViBi1C5/6oFsd6X+UWeAlv0nwppbUc+bMnINZ0TUnf
 7Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PbuIDLJSwDZoHRmQDtVVH8v7wrAjGN8POl6WAu5zOM=;
 b=dF9tA80Jvkdw0sVZh21UpqJMWRFItqkr0N+pj47dFAtGZI8dsRH/k9xOUlvlWwnCZ+
 9hCExs5y1VGt6KK9y3bqWp0xleFphgWGx+wCc3drXRGoYk6XGEPUYgWkW7CHDTgChwP/
 xSnfKbTdb8xyqJw8Bxi3fLMt60OdsjQGxBhI6Po/617mMRtfrCHGgcQxVlOvg+aO9VfI
 AwCgrPUpq9e6lGOgBQE0v3MYDBjZ39orshxkunDSfEAXDhdoRiVJnxPkmzPG1YiDx0ge
 OGRPoI9bTw0YjWeYsugzi6Wa90w877wcGvO3E89PMMUepLJgWco6g1J7+gMRfue+10zL
 IIaw==
X-Gm-Message-State: AOAM533BQM47Jgi03RC1jrXM9W5tG+RKuCIrc7O0HaCf/c4NX9SPKU+P
 iekqWfPG5+hjjxrH2HjVJ4yQ2tmYA44m6g==
X-Google-Smtp-Source: ABdhPJz3zGdCxKIjdfgjhyaQKwvGv8VTrN2JA1XMA101kxTKicOrL4ZtEl4oonTOj8Kw7kbTic+20g==
X-Received: by 2002:a65:684d:: with SMTP id q13mr18358200pgt.24.1627310567478; 
 Mon, 26 Jul 2021 07:42:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id r13sm3626970pgi.78.2021.07.26.07.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:42:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm: Split out get_freq() helper
Date: Mon, 26 Jul 2021 07:46:49 -0700
Message-Id: <20210726144653.2180096-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144653.2180096-1-robdclark@gmail.com>
References: <20210726144653.2180096-1-robdclark@gmail.com>
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

