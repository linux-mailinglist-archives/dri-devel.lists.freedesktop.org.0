Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B78503211
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 02:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FF10E271;
	Sat, 16 Apr 2022 00:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A31B10E2AB;
 Sat, 16 Apr 2022 00:33:33 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t4so9108285pgc.1;
 Fri, 15 Apr 2022 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62yWhdqDcGQqwQFXLx7ZyfJs+0RwvpLYM51ky+Lwtno=;
 b=MYk0LGeWdBsnl+D7rBQvFkUSmrkSmj/P503zGTppTzwkXtyuDin21d7LDjrP5YlaRN
 bbPvv5wg8bXTRC5HLhpQMeHBhcG5cH3qDwf6HKr3B8iff7Ej83Uh/5MTwgvX7xNUGzrZ
 SfIrykGV5xkxvD9YSNyI9tQEuEViZzqgjRFTW1qHfrM9r5zdtzg/+w3sc8I5skkj4XJD
 EM1ghPvGZqyYbqu9k33ScrZVht2U+I9yFzcif4DDtCem0Leng+zoSEm74NRrLFXxHC3F
 mdvLpusn+rPvERqJ4Xrn+IzUV6PvEEMMv/AQLo+iTtlzBaA9WdQSm0AJE9IYfH1KnCUj
 GQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62yWhdqDcGQqwQFXLx7ZyfJs+0RwvpLYM51ky+Lwtno=;
 b=e+py+qId7DltDge8WR6hnMyNETdEN6tDzKxeuZ9d/azkK750UG1aPtyAYgXh/Zrw5Q
 vCLzDAz340iqcVz9M0klGjN1MYhpMzURhZJBVtwmA3LC/6SyhhlWHWgqyemwN9yoViau
 XFhCts2uZUmK0/IsPhbrDTA1fAkS1sxP7bBW0ZwXFJo9mLkjfZTFEsiY1MoujmOcyyXX
 GEoEGIITODUcEA2JPlyEa3bI44mt5eayNprOn8jQ+JJBkoYAfr9yWiLjOjcYkFLDu5xe
 FvhOAqCtbKi+m3aLrtRFjWcSmfMAKLWRWr2O+F/xHJfCdh+0Ct05mdMOr3ySF61cNlyY
 /SSA==
X-Gm-Message-State: AOAM532j0IY6h9+u0cnZiKUdYH9YB47wahC0ybMvKdIv/FGlCZd0I1/P
 RSCkIaoTgbsRbWUXKAOYF0keLj9+qp0=
X-Google-Smtp-Source: ABdhPJzgApnUed8O5wOTqeVYK6JiEofE0cSI7YzYgO5JykxaBiC4ik5MAU3sS30H73HQTWLT3y0Paw==
X-Received: by 2002:a65:538f:0:b0:382:b4d:bdd8 with SMTP id
 x15-20020a65538f000000b003820b4dbdd8mr1177197pgq.262.1650069212791; 
 Fri, 15 Apr 2022 17:33:32 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:4301:d32e:a8ad:adbf])
 by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm9900249pjb.16.2022.04.15.17.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:33:32 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm: return the average load over the polling period
Date: Fri, 15 Apr 2022 17:33:14 -0700
Message-Id: <20220416003314.59211-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416003314.59211-1-olvaffe@gmail.com>
References: <20220416003314.59211-1-olvaffe@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

simple_ondemand interacts poorly with clamp_to_idle.  It only looks at
the load since the last get_dev_status call, while it should really look
at the load over polling_ms.  When clamp_to_idle true, it almost always
picks the lowest frequency on active because the gpu is idle between
msm_devfreq_idle/msm_devfreq_active.

This logic could potentially be moved into devfreq core.

Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  3 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 60 ++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 389c6dab751b..143c56f5185b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -9,6 +9,7 @@
 
 #include <linux/adreno-smmu-priv.h>
 #include <linux/clk.h>
+#include <linux/devfreq.h>
 #include <linux/interconnect.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
@@ -117,6 +118,8 @@ struct msm_gpu_devfreq {
 	/** idle_time: Time of last transition to idle: */
 	ktime_t idle_time;
 
+	struct devfreq_dev_status average_status;
+
 	/**
 	 * idle_work:
 	 *
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index f531015107c3..d2539ca78c29 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -9,6 +9,7 @@
 
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/math64.h>
 #include <linux/units.h>
 
 /*
@@ -75,12 +76,69 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
 	status->busy_time = busy_time;
 }
 
+static void update_average_dev_status(struct msm_gpu *gpu,
+		const struct devfreq_dev_status *raw)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	const u32 polling_ms = df->devfreq->profile->polling_ms;
+	const u32 max_history_ms = polling_ms * 11 / 10;
+	struct devfreq_dev_status *avg = &df->average_status;
+	u64 avg_freq;
+
+	/* simple_ondemand governor interacts poorly with gpu->clamp_to_idle.
+	 * When we enforce the constraint on idle, it calls get_dev_status
+	 * which would normally reset the stats.  When we remove the
+	 * constraint on active, it calls get_dev_status again where busy_time
+	 * would be 0.
+	 *
+	 * To remedy this, we always return the average load over the past
+	 * polling_ms.
+	 */
+
+	/* raw is longer than polling_ms or avg has no history */
+	if (div_u64(raw->total_time, USEC_PER_MSEC) >= polling_ms ||
+	    !avg->total_time) {
+		*avg = *raw;
+		return;
+	}
+
+	/* Truncate the oldest history first.
+	 *
+	 * Because we keep the history with a single devfreq_dev_status,
+	 * rather than a list of devfreq_dev_status, we have to assume freq
+	 * and load are the same over avg->total_time.  We can scale down
+	 * avg->busy_time and avg->total_time by the same factor to drop
+	 * history.
+	 */
+	if (div_u64(avg->total_time + raw->total_time, USEC_PER_MSEC) >=
+			max_history_ms) {
+		const u32 new_total_time = polling_ms * USEC_PER_MSEC -
+			raw->total_time;
+		avg->busy_time = div_u64(
+				mul_u32_u32(avg->busy_time, new_total_time),
+				avg->total_time);
+		avg->total_time = new_total_time;
+	}
+
+	/* compute the average freq over avg->total_time + raw->total_time */
+	avg_freq = mul_u32_u32(avg->current_frequency, avg->total_time);
+	avg_freq += mul_u32_u32(raw->current_frequency, raw->total_time);
+	do_div(avg_freq, avg->total_time + raw->total_time);
+
+	avg->current_frequency = avg_freq;
+	avg->busy_time += raw->busy_time;
+	avg->total_time += raw->total_time;
+}
+
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct devfreq_dev_status raw;
 
-	get_raw_dev_status(gpu, status);
+	get_raw_dev_status(gpu, &raw);
+	update_average_dev_status(gpu, &raw);
+	*status = gpu->devfreq.average_status;
 
 	return 0;
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog

