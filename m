Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC753EEEA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BAB10E5DF;
	Mon,  6 Jun 2022 19:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4707010E5DF;
 Mon,  6 Jun 2022 19:54:31 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id t2so12961442pld.4;
 Mon, 06 Jun 2022 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q1bn4DIkVdPYocO3zbCpHORpBrE1kGq1oYmf6HtOsQ=;
 b=mINn9lreCSDSLRjzYdkyakH7yu1xAu+JVxl4M3NKQNUO8NWCIji+Rg6dcg9XN92Dfe
 jYN5iYbjFfYMGkY/13NHhv/udazkkmpBC32NPAWcl0LB5fcVJTJZk9LwRGvouoPPp23c
 QlHN+iGVcMZApXMDDqIkmJOp/SGQRVFDADNQizTZBlXk4q9lA+8z2AJRLRRvxawOCGze
 umg1tBSEOLEmfGquqdxyyWBaeq2I7g8bSvE9ril7aKuycWeLKJGIzkUkT+cwwluaKDIv
 UILQs03kROqlIbJzsDKz1M1UbmmY1eIosuYzQX2WiWCUMqfYSJXx8vz0Me5X5OCdLddi
 Q7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q1bn4DIkVdPYocO3zbCpHORpBrE1kGq1oYmf6HtOsQ=;
 b=8JN+5HtcbHZychbWNrFDvrectjuJo+CgTtbH+uCOdcjxh1raCgJRWjvBoTPgKU3hnA
 wj+sFq5U3VT0l+LdHtU3Xi7TO1xyRijcRJB/m2kTgzH3ir0Jy/4Wdcuyvpg2MNvnrsJR
 C44UTekELDcsLgZNkIj5rHCILMGFIoaBmvbhbIxbZpIDooYVxpxgmQOiS7Ef50108ZON
 g1mRW8MhGqrRpNaAosn2treWdN5WVruhKNHogpV/5RhIf/CwZPNN52EcIo30CbduxuUI
 0gxEp54BIyV9Xcc5veEv9L4z4tcJhp90x7e/rw1z9zTVqCvFBUCe+Ca7P/Nu0ij/8HPQ
 wlLQ==
X-Gm-Message-State: AOAM5307JvEWZIAnZCf3CC6qn8K1axBv9K6Nyz2t6a12o6pV/yxIbXrV
 7x0BHZXxz7oYWqDg7PBPcwFcdLAJHII=
X-Google-Smtp-Source: ABdhPJwcps+5XEULqwqwbglOyf5515hyF9v/tsYQo6POITCwxg+LpNt/xyw1wZhJkQLbzY4ali+PGA==
X-Received: by 2002:a17:90a:e2c6:b0:1e2:fad9:40f7 with SMTP id
 fr6-20020a17090ae2c600b001e2fad940f7mr45813125pjb.198.1654545270086; 
 Mon, 06 Jun 2022 12:54:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a63f341000000b003fc4cc19414sm11011928pgj.45.2022.06.06.12.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 12:54:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: Expose client engine utilization via fdinfo
Date: Mon,  6 Jun 2022 12:54:32 -0700
Message-Id: <20220606195432.1888346-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606195432.1888346-1-robdclark@gmail.com>
References: <20220606195432.1888346-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar to AMD commit
874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
infrastructure added in previous patches, we add basic client info
and GPU engine utilisation for msm.

Example output:

	# cat /proc/`pgrep glmark2`/fdinfo/6
	pos:	0
	flags:	02400002
	mnt_id:	21
	ino:	162
	drm-driver:	msm
	drm-client-id:	7
	drm-engine-gpu:	1734371319 ns
	drm-cycles-gpu:	1153645024
	drm-maxfreq-gpu:	800000000 Hz

See also: https://patchwork.freedesktop.org/patch/468505/

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
 4 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6c9f166a8d6f..60e5cc9c13ad 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
+- drm-cycles-<str> <uint>
+
+Engine identifier string must be the same as the one specified in the
+drm-engine-<str> tag and shall contain the number of busy cycles for the given
+engine.
+
+Values are not required to be constantly monotonic if it makes the driver
+implementation easier, but are required to catch up with the previously reported
+larger value within a reasonable period. Upon observing a value lower than what
+was previously read, userspace is expected to stay with that larger previous
+value until a monotonic update is seen.
+
+- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
+
+Engine identifier string must be the same as the one specified in the
+drm-engine-<str> tag and shall contain the maxium frequence for the given
+engine.  Taken together with drm-cycles-<str>, this can be used to calculate
+percentage utilization of the engine, whereas drm-engine-<str> only refects
+time active without considering what frequency the engine is operating as a
+percentage of it's maximum frequency.
+
 ===============================
 Driver specific implementations
 ===============================
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 14ab9a627d8b..57a66093e671 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -948,7 +948,24 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	if (!priv->gpu)
+		return;
+
+	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
+}
+
+static const struct file_operations fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = msm_fop_show_fdinfo,
+};
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index eb8a6663f309..333a9a299b41 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include "drm/drm_drv.h"
+
 #include "msm_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
@@ -146,6 +148,16 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+			 struct drm_printer *p)
+{
+	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
+	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
+	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
+	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
+	drm_printf(p, "drm-maxfreq-gpu:\t%lu Hz\n", gpu->fast_rate);
+}
+
 int msm_gpu_hw_init(struct msm_gpu *gpu)
 {
 	int ret;
@@ -652,7 +664,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 {
 	int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	volatile struct msm_gpu_submit_stats *stats;
-	u64 elapsed, clock = 0;
+	u64 elapsed, clock = 0, cycles;
 	unsigned long flags;
 
 	stats = &ring->memptrs->stats[index];
@@ -660,12 +672,17 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	elapsed = (stats->alwayson_end - stats->alwayson_start) * 10000;
 	do_div(elapsed, 192);
 
+	cycles = stats->cpcycles_end - stats->cpcycles_start;
+
 	/* Calculate the clock frequency from the number of CP cycles */
 	if (elapsed) {
-		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
+		clock = cycles * 1000;
 		do_div(clock, elapsed);
 	}
 
+	submit->queue->ctx->elapsed_ns += elapsed;
+	submit->queue->ctx->cycles     += cycles;
+
 	trace_msm_gpu_submit_retired(submit, elapsed, clock,
 		stats->alwayson_start, stats->alwayson_end);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6def00883046..4911943ba53b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -361,6 +361,22 @@ struct msm_file_private {
 	/** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
 	char *cmdline;
 
+	/**
+	 * elapsed:
+	 *
+	 * The total (cumulative) elapsed time GPU was busy with rendering
+	 * from this context in ns.
+	 */
+	uint64_t elapsed_ns;
+
+	/**
+	 * cycles:
+	 *
+	 * The total (cumulative) GPU cycles elapsed attributed to this
+	 * context.
+	 */
+	uint64_t cycles;
+
 	/**
 	 * entities:
 	 *
@@ -544,6 +560,9 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+			 struct drm_printer *p);
+
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 		u32 id);
-- 
2.36.1

