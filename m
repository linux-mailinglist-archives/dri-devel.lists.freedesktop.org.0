Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90712545336
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 19:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8465E12B3E3;
	Thu,  9 Jun 2022 17:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25A512B3E3;
 Thu,  9 Jun 2022 17:42:07 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id z17so21669220pff.7;
 Thu, 09 Jun 2022 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZd09ykYVRcNjhrMCJ/3jwvugy+/D4U6Msu4+xfo1CY=;
 b=ZlOGehD2sI6jGTY3HSKXV1UkiQ39eupCdqnfvIYqaty7HHdVFHllymmRQNomVxh30d
 /+ulNrlIqu6ov19lCKcxRQHW+ymBajMD3kdd0aiNRwtOBNoYQ0eKh0W5/QzMCG3W10oO
 fIsMwLdLLNjQryClK1oQh84nTlIrkZApyIV+lTbMl8CM/9UEhFk+ov+UPnXuXVxVTyjK
 WUC/yTcWg+hc0GgQofMRthmxnMlq90JsmLKPXEN5KHPMHHxHIrP619g9PX8Fo/FW1lmu
 v+84tv8NWDusJn/Wh6KOoTxLppcNLQUCe+JuIJmFnHJXrpciBLkMG8+x1j+hV1MmNyro
 9OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZd09ykYVRcNjhrMCJ/3jwvugy+/D4U6Msu4+xfo1CY=;
 b=cS82cjj/EC6bd9C8vxUj1aKuROKRwQKJlBOMQRXYZc9JZMhJYqDfwHO/Vus2N3NQwA
 RO0w+tpxEuIpNFFpupEKXUg+rs28nGlPRWc5HGQzbBA+6sDDw6Q0asl4cle7gPG/FjDJ
 EqpIgTD4zU+Dr4/x7fVRkVqYdAl/7yTKQZRcsnOgQSAJQ0qZ/XGb9R0lAqX7zgZlgW9d
 3k7KZ6L/Jp25z4Zo77k6wFvh3TMS6izsk8oWrDVfvBHbYXi5pK/ndisurdduD9D7U2ql
 5V/X/qNKR6w19B/m5MgCR7m8466r3AigdyDYW09Vupiax5DacSHZMC96+zuHE4l+Miuo
 ofJQ==
X-Gm-Message-State: AOAM530Y/jslZNPgLQ5DSCUPVmQE9fQn5ejlN4sGEpKksB6UBDHENHHA
 auM+IFjUbi7B3DZtbvptSWuwCoitnv4=
X-Google-Smtp-Source: ABdhPJw8CNpFxaZid9LYLzBZ/s8cppO4ix1ow3/90M85glyK2emtweb5x7MxW4mVzlFAXz2y3OTEng==
X-Received: by 2002:a63:2cd8:0:b0:3fd:2121:aceb with SMTP id
 s207-20020a632cd8000000b003fd2121acebmr30561135pgs.173.1654796526865; 
 Thu, 09 Jun 2022 10:42:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 jd21-20020a170903261500b0015e8d4eb1dbsm3817038plb.37.2022.06.09.10.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 10:42:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm: Expose client engine utilization via fdinfo
Date: Thu,  9 Jun 2022 10:42:12 -0700
Message-Id: <20220609174213.2265938-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609174213.2265938-1-robdclark@gmail.com>
References: <20220609174213.2265938-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, Chris Healy <cphealy@gmail.com>
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

v2: Add dev-maxfreq-$engine and update drm-usage-stats.rst
v3: spelling and compiler warning

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
 4 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6c9f166a8d6f..92c5117368d7 100644
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
+drm-engine-<str> tag and shall contain the maximum frequency for the given
+engine.  Taken together with drm-cycles-<str>, this can be used to calculate
+percentage utilization of the engine, whereas drm-engine-<str> only reflects
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
index 244511f85044..f99292eaf529 100644
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
+	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
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

