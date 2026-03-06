Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLX0FgoDq2nbZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:38:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A746E2253D6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD61010E32C;
	Fri,  6 Mar 2026 16:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NoW/Sk8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED52410E32C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AFD343F5C;
 Fri,  6 Mar 2026 16:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46503C4CEF7;
 Fri,  6 Mar 2026 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772815109;
 bh=GAIl3tHlrkyV4e1Yz0jRNeYOKvK+ocTw726uxg6t0Io=;
 h=From:To:Cc:Subject:Date:From;
 b=NoW/Sk8Gzuvs91JNFK9bEt0EGJD+fX6QP5/f/4FEZKeYdS4wn89GBDewS9h30sBb6
 zSpn5dw/POcS/uNbbhQR8xD83VgXWpvhoYT7SIX69eDMA5wd+vP33Ib8QIjO5u1WYK
 rYNCwbF92Ulz7d4tr8YVXbjB3Hqst758B97dNE2yvBkV+uQ7FBf57e4Uglkw9t15sF
 /Bko256x7YyqHETUCpDaj/gxlxLHPLD5AObcflrpQ5hadIl1NB0nsZFj0hADlb45H7
 YkjTdxYxisVonjEvfieb/AzzdZekboBnYY6FxmkXkPGfkntWjHkYafvrPCaBI/JS3P
 shRS1Bg4kzxQw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: [PATCH] accel: ethosu: Add performance counter support
Date: Fri,  6 Mar 2026 10:36:55 -0600
Message-ID: <20260306163658.2741860-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: A746E2253D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kees@kernel.org,m:gustavoars@kernel.org,m:anders.roxell@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[tomeuvizoso.net,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Arm Ethos-U NPUs have a PMU with performance counters. The PMU h/w
supports up to 4 (U65) or 8 (U85) counters which can be programmed for
different events. There is also a dedicated cycle counter.

The ABI and implementation are copied from the V3D driver. The main
difference in the ABI is there is no query API for the the event list.
The events differ between the U65 and U85, so the events lists are
maintained in userspace along with other differences between the U65 and
U85.

The cycle counter is always enabled when the PMU is enabled. When the
user requests N events, reading the counters will return the N events
plus the cycle counter.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
MR for mesa with initial support is here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40269

 drivers/accel/ethosu/Makefile         |   2 +-
 drivers/accel/ethosu/ethosu_device.h  |  21 ++
 drivers/accel/ethosu/ethosu_drv.c     |  17 +-
 drivers/accel/ethosu/ethosu_drv.h     |  62 ++++++
 drivers/accel/ethosu/ethosu_job.c     |  35 +++-
 drivers/accel/ethosu/ethosu_job.h     |   2 +
 drivers/accel/ethosu/ethosu_perfmon.c | 282 ++++++++++++++++++++++++++
 include/uapi/drm/ethosu_accel.h       |  59 +++++-
 8 files changed, 469 insertions(+), 11 deletions(-)
 create mode 100644 drivers/accel/ethosu/ethosu_perfmon.c

diff --git a/drivers/accel/ethosu/Makefile b/drivers/accel/ethosu/Makefile
index 17db5a600416..598a388b7179 100644
--- a/drivers/accel/ethosu/Makefile
+++ b/drivers/accel/ethosu/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU) := ethosu.o
-ethosu-y += ethosu_drv.o ethosu_gem.o ethosu_job.o
+ethosu-y += ethosu_drv.o ethosu_gem.o ethosu_job.o ethosu_perfmon.o
diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index b189fa783d6a..c91ee50b79f9 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -43,6 +43,15 @@ struct gen_pool;
 #define NPU_REG_BASEP_HI(x)	(0x0084 + (x) * 8)
 #define NPU_BASEP_REGION_MAX	8
 
+#define NPU_REG_PMCR		0x0180
+#define NPU_REG_PMCNTENSET	0x0184
+#define NPU_REG_PMCNTENCLR	0x0188
+#define NPU_REG_PMCCNTR_LO	0x01A0
+#define NPU_REG_PMCCNTR_HI	0x01A4
+#define NPU_REG_PMCCNTR_CFG	0x01A8
+#define NPU_REG_PMU_EVCNTR(x)	(0x0300 + (x) * 4)
+#define NPU_REG_PMU_EVTYPER(x)	(0x0380 + (x) * 4)
+
 #define ID_ARCH_MAJOR_MASK	GENMASK(31, 28)
 #define ID_ARCH_MINOR_MASK	GENMASK(27, 20)
 #define ID_ARCH_PATCH_MASK	GENMASK(19, 16)
@@ -67,6 +76,11 @@ struct gen_pool;
 
 #define PROT_ACTIVE_CSL		BIT(1)
 
+#define PMCR_NUM_EVENT_CNT_MASK	GENMASK(15, 11)
+#define PMCR_CYCLE_CNT_RST	BIT(2)
+#define PMCR_EVENT_CNT_RST	BIT(1)
+#define PMCR_CNT_EN		BIT(0)
+
 enum ethosu_cmds {
 	NPU_OP_CONV = 0x2,
 	NPU_OP_DEPTHWISE = 0x3,
@@ -152,6 +166,8 @@ enum ethosu_cmds {
 
 #define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
 
+struct ethosu_perfmon;
+
 /**
  * struct ethosu_device - Ethosu device
  */
@@ -161,6 +177,7 @@ struct ethosu_device {
 
 	/** @iomem: CPU mapping of the registers. */
 	void __iomem *regs;
+	void __iomem *pmu_regs;
 
 	void __iomem *sram;
 	struct gen_pool *srampool;
@@ -184,6 +201,10 @@ struct ethosu_device {
 	struct mutex sched_lock;
 	u64 fence_context;
 	u64 emit_seqno;
+
+	/* Used to track the active perfmon if any. */
+	struct ethosu_perfmon *active_perfmon;
+	struct ethosu_perfmon *global_perfmon;
 };
 
 #define to_ethosu_device(drm_dev) \
diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 9992193d7338..393256ecf52d 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -155,6 +155,7 @@ static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_put_mod;
 
+	ethosu_perfmon_open_file(priv);
 	file->driver_priv = no_free_ptr(priv);
 	return 0;
 
@@ -166,6 +167,7 @@ static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
 static void ethosu_postclose(struct drm_device *ddev, struct drm_file *file)
 {
 	ethosu_job_close(file->driver_priv);
+	ethosu_perfmon_close_file(file->driver_priv);
 	kfree(file->driver_priv);
 	module_put(THIS_MODULE);
 }
@@ -180,6 +182,10 @@ static const struct drm_ioctl_desc ethosu_drm_driver_ioctls[] = {
 	ETHOSU_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset, 0),
 	ETHOSU_IOCTL(CMDSTREAM_BO_CREATE, cmdstream_bo_create, 0),
 	ETHOSU_IOCTL(SUBMIT, submit, 0),
+	ETHOSU_IOCTL(PERFMON_CREATE, perfmon_create, 0),
+	ETHOSU_IOCTL(PERFMON_DESTROY, perfmon_destroy, 0),
+	ETHOSU_IOCTL(PERFMON_GET_VALUES, perfmon_get_values, 0),
+	ETHOSU_IOCTL(PERFMON_SET_GLOBAL, perfmon_set_global, 0),
 };
 
 DEFINE_DRM_ACCEL_FOPS(ethosu_drm_driver_fops);
@@ -312,11 +318,16 @@ static int ethosu_init(struct ethosu_device *ethosudev)
 
 	ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);
 	ethosudev->npu_info.config = config = readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
+	ethosudev->npu_info.pmu_counters = FIELD_GET(PMCR_NUM_EVENT_CNT_MASK,
+		readl_relaxed(ethosudev->pmu_regs + NPU_REG_PMCR));
 
 	ethosu_sram_init(ethosudev);
 
+	if (!ethosu_is_u65(ethosudev))
+		ethosudev->pmu_regs += 0x1000;
+
 	dev_info(ethosudev->base.dev,
-		 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
+		 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM, %d PMU cntrs\n",
 		 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
 		 FIELD_GET(ID_ARCH_MINOR_MASK, id),
 		 FIELD_GET(ID_ARCH_PATCH_MASK, id),
@@ -324,7 +335,8 @@ static int ethosu_init(struct ethosu_device *ethosudev)
 		 FIELD_GET(ID_VER_MINOR_MASK, id),
 		 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
 		 1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
-		 ethosudev->npu_info.sram_size / 1024);
+		 ethosudev->npu_info.sram_size / 1024,
+		 ethosudev->npu_info.pmu_counters);
 
 	return 0;
 }
@@ -343,6 +355,7 @@ static int ethosu_probe(struct platform_device *pdev)
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 
 	ethosudev->regs = devm_platform_ioremap_resource(pdev, 0);
+	ethosudev->pmu_regs = ethosudev->regs;
 
 	ethosudev->num_clks = devm_clk_bulk_get_all(&pdev->dev, &ethosudev->clks);
 	if (ethosudev->num_clks < 0)
diff --git a/drivers/accel/ethosu/ethosu_drv.h b/drivers/accel/ethosu/ethosu_drv.h
index 9e21dfe94184..57eee79e4b83 100644
--- a/drivers/accel/ethosu/ethosu_drv.h
+++ b/drivers/accel/ethosu/ethosu_drv.h
@@ -3,13 +3,75 @@
 #ifndef __ETHOSU_DRV_H__
 #define __ETHOSU_DRV_H__
 
+#include <linux/idr.h>
+#include <linux/mutex.h>
 #include <drm/gpu_scheduler.h>
 
 struct ethosu_device;
+struct drm_device;
+struct drm_file;
 
 struct ethosu_file_priv {
 	struct ethosu_device *edev;
 	struct drm_sched_entity sched_entity;
+
+	struct {
+		struct idr idr;
+		struct mutex lock;
+	} perfmon;
+};
+
+/* Performance monitor object. The perform lifetime is controlled by userspace
+ * using perfmon related ioctls. A perfmon can be attached to a submit_cl
+ * request, and when this is the case, HW perf counters will be activated just
+ * before the submit_cl is submitted to the GPU and disabled when the job is
+ * done. This way, only events related to a specific job will be counted.
+ */
+struct ethosu_perfmon {
+	/* Tracks the number of users of the perfmon, when this counter reaches
+	 * zero the perfmon is destroyed.
+	 */
+	refcount_t refcnt;
+
+	/* Protects perfmon stop, as it can be invoked from multiple places. */
+	struct mutex lock;
+
+	/* Number of counters activated in this perfmon instance
+	 * (should be less than or equal to DRM_ETHOSU_MAX_PERF_COUNTERS).
+	 */
+	u8 ncounters;
+
+	/* Events counted by the HW perf counters. */
+	u16 counters[DRM_ETHOSU_MAX_PERF_EVENT_COUNTERS];
+
+	/* Storage for counter values. Counters are incremented by the
+	 * HW perf counter values every time the perfmon is attached
+	 * to a GPU job.  This way, perfmon users don't have to
+	 * retrieve the results after each job if they want to track
+	 * events covering several submissions.  Note that counter
+	 * values can't be reset, but you can fake a reset by
+	 * destroying the perfmon and creating a new one.
+	 */
+	u64 values[] __counted_by(ncounters);
 };
 
+/* ethosu_perfmon.c */
+void ethosu_perfmon_init(struct ethosu_device *ethosu);
+void ethosu_perfmon_get(struct ethosu_perfmon *perfmon);
+void ethosu_perfmon_put(struct ethosu_perfmon *perfmon);
+void ethosu_perfmon_start(struct ethosu_device *ethosu, struct ethosu_perfmon *perfmon);
+void ethosu_perfmon_stop(struct ethosu_device *ethosu, struct ethosu_perfmon *perfmon,
+		      bool capture);
+struct ethosu_perfmon *ethosu_perfmon_find(struct ethosu_file_priv *ethosu_priv, int id);
+void ethosu_perfmon_open_file(struct ethosu_file_priv *ethosu_priv);
+void ethosu_perfmon_close_file(struct ethosu_file_priv *ethosu_priv);
+int ethosu_ioctl_perfmon_create(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv);
+int ethosu_ioctl_perfmon_destroy(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv);
+int ethosu_ioctl_perfmon_get_values(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
+int ethosu_ioctl_perfmon_set_global(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
+
 #endif
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index ec85f4156744..8bf5a3aa8420 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -147,6 +147,8 @@ static void ethosu_job_err_cleanup(struct ethosu_job *job)
 {
 	unsigned int i;
 
+	ethosu_perfmon_put(job->perfmon);
+
 	for (i = 0; i < job->region_cnt; i++)
 		drm_gem_object_put(job->region_bo[i]);
 
@@ -181,6 +183,24 @@ static void ethosu_job_free(struct drm_sched_job *sched_job)
 	ethosu_job_put(job);
 }
 
+static void
+ethosu_switch_perfmon(struct ethosu_device *ethosu, struct ethosu_job *job)
+{
+	struct ethosu_perfmon *perfmon = ethosu->global_perfmon;
+
+	if (!perfmon)
+		perfmon = job->perfmon;
+
+	if (perfmon == ethosu->active_perfmon)
+		return;
+
+	if (perfmon != ethosu->active_perfmon)
+		ethosu_perfmon_stop(ethosu, ethosu->active_perfmon, true);
+
+	if (perfmon && ethosu->active_perfmon != perfmon)
+		ethosu_perfmon_start(ethosu, perfmon);
+}
+
 static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
 {
 	struct ethosu_job *job = to_ethosu_job(sched_job);
@@ -194,6 +214,8 @@ static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
 		       dev->fence_context, ++dev->emit_seqno);
 	dma_fence_get(fence);
 
+	ethosu_switch_perfmon(dev, job);
+
 	scoped_guard(mutex, &dev->job_lock) {
 		dev->in_flight_job = job;
 		ethosu_job_hw_submit(dev, job);
@@ -366,7 +388,8 @@ void ethosu_job_close(struct ethosu_file_priv *ethosu_priv)
 }
 
 static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
-				   struct drm_ethosu_job *job)
+				   struct drm_ethosu_job *job,
+				   int perfmon_id)
 {
 	struct ethosu_device *edev = to_ethosu_device(dev);
 	struct ethosu_file_priv *file_priv = file->driver_priv;
@@ -390,6 +413,9 @@ static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 	ejob->dev = edev;
 	ejob->sram_size = job->sram_size;
 
+	if (perfmon_id)
+		ejob->perfmon = ethosu_perfmon_find(file_priv, perfmon_id);
+
 	ejob->done_fence = kzalloc_obj(*ejob->done_fence);
 	if (!ejob->done_fence) {
 		ret = -ENOMEM;
@@ -480,11 +506,6 @@ int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
 	int ret = 0;
 	unsigned int i = 0;
 
-	if (args->pad) {
-		drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
-		return -EINVAL;
-	}
-
 	struct drm_ethosu_job __free(kvfree) *jobs =
 		kvmalloc_objs(*jobs, args->job_count);
 	if (!jobs)
@@ -498,7 +519,7 @@ int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 	for (i = 0; i < args->job_count; i++) {
-		ret = ethosu_ioctl_submit_job(dev, file, &jobs[i]);
+		ret = ethosu_ioctl_submit_job(dev, file, &jobs[i], args->perfmon_id);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/accel/ethosu/ethosu_job.h b/drivers/accel/ethosu/ethosu_job.h
index ff1cf448d094..8988edd00eed 100644
--- a/drivers/accel/ethosu/ethosu_job.h
+++ b/drivers/accel/ethosu/ethosu_job.h
@@ -21,6 +21,8 @@ struct ethosu_job {
 	u8 region_cnt;
 	u32 sram_size;
 
+	struct ethosu_perfmon *perfmon;
+
 	/* Fence to be signaled by drm-sched once its done with the job */
 	struct dma_fence *inference_done_fence;
 
diff --git a/drivers/accel/ethosu/ethosu_perfmon.c b/drivers/accel/ethosu/ethosu_perfmon.c
new file mode 100644
index 000000000000..92fa534efe34
--- /dev/null
+++ b/drivers/accel/ethosu/ethosu_perfmon.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/* Copyright 2026 Arm, Ltd. */
+/* Based on v3d_perfmon.c, Copyright (C) 2021 Raspberry Pi */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
+
+#include <uapi/drm/ethosu_accel.h>
+
+#include "ethosu_drv.h"
+#include "ethosu_device.h"
+
+void ethosu_perfmon_get(struct ethosu_perfmon *perfmon)
+{
+	if (perfmon)
+		refcount_inc(&perfmon->refcnt);
+}
+
+void ethosu_perfmon_put(struct ethosu_perfmon *perfmon)
+{
+	if (perfmon && refcount_dec_and_test(&perfmon->refcnt)) {
+		mutex_destroy(&perfmon->lock);
+		kfree(perfmon);
+	}
+}
+
+void ethosu_perfmon_start(struct ethosu_device *ethosu, struct ethosu_perfmon *perfmon)
+{
+	unsigned int i;
+	u8 ncounters;
+	u32 mask;
+
+	if (WARN_ON_ONCE(!perfmon || ethosu->active_perfmon))
+		return;
+
+	writel_relaxed(PMCR_CNT_EN, ethosu->pmu_regs + NPU_REG_PMCR);
+	writel_relaxed(0x000011, ethosu->pmu_regs + NPU_REG_PMCCNTR_CFG);
+
+	mask = 0x80000000;
+	ncounters = perfmon->ncounters - 1;
+	if (ncounters)
+		mask |= GENMASK(ncounters - 1, 0);
+
+	for (i = 0; i < ncounters; i++)
+		writel_relaxed(perfmon->counters[i], ethosu->pmu_regs + NPU_REG_PMU_EVTYPER(i));
+
+	writel_relaxed(mask, ethosu->pmu_regs + NPU_REG_PMCNTENSET);
+	writel_relaxed(PMCR_CNT_EN | PMCR_EVENT_CNT_RST | PMCR_CYCLE_CNT_RST,
+		ethosu->pmu_regs + NPU_REG_PMCR);
+	ethosu->active_perfmon = perfmon;
+}
+
+void ethosu_perfmon_stop(struct ethosu_device *ethosu, struct ethosu_perfmon *perfmon,
+		      bool capture)
+{
+	unsigned int i;
+	u8 ncounters;
+	u32 mask;
+
+	if (!perfmon || !ethosu->active_perfmon)
+		return;
+
+	mutex_lock(&perfmon->lock);
+	if (perfmon != ethosu->active_perfmon) {
+		mutex_unlock(&perfmon->lock);
+		return;
+	}
+
+	ncounters = perfmon->ncounters - 1;
+
+	if (capture) {
+		for (i = 0; i < ncounters; i++)
+			perfmon->values[i] += readl_relaxed(ethosu->pmu_regs + NPU_REG_PMU_EVCNTR(i));
+		perfmon->values[ncounters] +=
+			readl_relaxed(ethosu->pmu_regs + NPU_REG_PMCCNTR_LO) |
+			(u64)readl_relaxed(ethosu->pmu_regs + NPU_REG_PMCCNTR_HI) << 32;
+	}
+
+	mask = 0x80000000;
+	if (ncounters)
+		mask |= GENMASK(ncounters - 1, 0);
+	writel_relaxed(mask, ethosu->pmu_regs + NPU_REG_PMCNTENCLR);
+
+	writel_relaxed(0, ethosu->pmu_regs + NPU_REG_PMCR);
+	ethosu->active_perfmon = NULL;
+	mutex_unlock(&perfmon->lock);
+}
+
+struct ethosu_perfmon *ethosu_perfmon_find(struct ethosu_file_priv *ethosu_priv, int id)
+{
+	struct ethosu_perfmon *perfmon;
+
+	mutex_lock(&ethosu_priv->perfmon.lock);
+	perfmon = idr_find(&ethosu_priv->perfmon.idr, id);
+	ethosu_perfmon_get(perfmon);
+	mutex_unlock(&ethosu_priv->perfmon.lock);
+
+	return perfmon;
+}
+
+void ethosu_perfmon_open_file(struct ethosu_file_priv *ethosu_priv)
+{
+	mutex_init(&ethosu_priv->perfmon.lock);
+	idr_init_base(&ethosu_priv->perfmon.idr, 1);
+}
+
+static int ethosu_perfmon_idr_del(int id, void *elem, void *data)
+{
+	struct ethosu_perfmon *perfmon = elem;
+	struct ethosu_device *ethosu = (struct ethosu_device *)data;
+
+	/* If the active perfmon is being destroyed, stop it first */
+	if (perfmon == ethosu->active_perfmon)
+		ethosu_perfmon_stop(ethosu, perfmon, false);
+
+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&ethosu->global_perfmon, perfmon, NULL);
+
+	ethosu_perfmon_put(perfmon);
+
+	return 0;
+}
+
+void ethosu_perfmon_close_file(struct ethosu_file_priv *ethosu_priv)
+{
+	struct ethosu_device *ethosu = ethosu_priv->edev;
+
+	mutex_lock(&ethosu_priv->perfmon.lock);
+	idr_for_each(&ethosu_priv->perfmon.idr, ethosu_perfmon_idr_del, ethosu);
+	idr_destroy(&ethosu_priv->perfmon.idr);
+	mutex_unlock(&ethosu_priv->perfmon.lock);
+	mutex_destroy(&ethosu_priv->perfmon.lock);
+}
+
+int ethosu_ioctl_perfmon_create(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv)
+{
+	struct ethosu_file_priv *ethosu_priv = file_priv->driver_priv;
+	struct drm_ethosu_perfmon_create *req = data;
+	struct ethosu_device *ethosu = to_ethosu_device(dev);
+	struct ethosu_perfmon *perfmon;
+	unsigned int i, event_max;
+	int ret;
+
+	/* Number of monitored counters cannot exceed HW limits. */
+	if (req->ncounters > ethosu->npu_info.pmu_counters)
+		return -EINVAL;
+
+	/* Make sure all counters are valid. */
+	event_max = ethosu_is_u65(ethosu) ? 433 : 671;
+	for (i = 0; i < req->ncounters; i++) {
+		if (req->counters[i] > event_max)
+			return -EINVAL;
+	}
+
+	/* Add 1 more counter for cycle counter  */
+	req->ncounters++;
+
+	perfmon = kzalloc_flex(*perfmon, values, req->ncounters);
+	if (!perfmon)
+		return -ENOMEM;
+
+	for (i = 0; i < req->ncounters - 1; i++)
+		perfmon->counters[i] = req->counters[i];
+
+	perfmon->ncounters = req->ncounters;
+
+	refcount_set(&perfmon->refcnt, 1);
+	mutex_init(&perfmon->lock);
+
+	mutex_lock(&ethosu_priv->perfmon.lock);
+	ret = idr_alloc(&ethosu_priv->perfmon.idr, perfmon, 1, -1, GFP_KERNEL);
+	mutex_unlock(&ethosu_priv->perfmon.lock);
+
+	if (ret < 0) {
+		mutex_destroy(&perfmon->lock);
+		kfree(perfmon);
+		return ret;
+	}
+
+	req->id = ret;
+
+	return 0;
+}
+
+int ethosu_ioctl_perfmon_destroy(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
+{
+	struct ethosu_file_priv *ethosu_priv = file_priv->driver_priv;
+	struct drm_ethosu_perfmon_destroy *req = data;
+	struct ethosu_device *ethosu = to_ethosu_device(dev);
+	struct ethosu_perfmon *perfmon;
+
+	mutex_lock(&ethosu_priv->perfmon.lock);
+	perfmon = idr_remove(&ethosu_priv->perfmon.idr, req->id);
+	mutex_unlock(&ethosu_priv->perfmon.lock);
+
+	if (!perfmon)
+		return -EINVAL;
+
+	/* If the active perfmon is being destroyed, stop it first */
+	if (perfmon == ethosu->active_perfmon)
+		ethosu_perfmon_stop(ethosu, perfmon, false);
+
+	/* If the global perfmon is being destroyed, set it to NULL */
+	cmpxchg(&ethosu->global_perfmon, perfmon, NULL);
+
+	ethosu_perfmon_put(perfmon);
+
+	return 0;
+}
+
+int ethosu_ioctl_perfmon_get_values(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
+{
+	struct ethosu_device *ethosu = to_ethosu_device(dev);
+	struct ethosu_file_priv *ethosu_priv = file_priv->driver_priv;
+	struct drm_ethosu_perfmon_get_values *req = data;
+	struct ethosu_perfmon *perfmon;
+	int ret = 0;
+
+	if (req->pad != 0)
+		return -EINVAL;
+
+	perfmon = ethosu_perfmon_find(ethosu_priv, req->id);
+	if (!perfmon)
+		return -EINVAL;
+
+	ret = pm_runtime_resume_and_get(dev->dev);
+	if (ret)
+		return ret;
+
+	ethosu_perfmon_stop(ethosu, perfmon, true);
+
+	pm_runtime_put_autosuspend(dev->dev);
+
+	if (copy_to_user(u64_to_user_ptr(req->values_ptr), perfmon->values,
+			 perfmon->ncounters * sizeof(u64)))
+		ret = -EFAULT;
+
+	ethosu_perfmon_put(perfmon);
+
+	return ret;
+}
+
+int ethosu_ioctl_perfmon_set_global(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
+{
+	struct ethosu_file_priv *ethosu_priv = file_priv->driver_priv;
+	struct drm_ethosu_perfmon_set_global *req = data;
+	struct ethosu_device *ethosu = to_ethosu_device(dev);
+	struct ethosu_perfmon *perfmon;
+
+	if (req->flags & ~DRM_ETHOSU_PERFMON_CLEAR_GLOBAL)
+		return -EINVAL;
+
+	perfmon = ethosu_perfmon_find(ethosu_priv, req->id);
+	if (!perfmon)
+		return -EINVAL;
+
+	/* If the request is to clear the global performance monitor */
+	if (req->flags & DRM_ETHOSU_PERFMON_CLEAR_GLOBAL) {
+		if (!ethosu->global_perfmon)
+			return -EINVAL;
+
+		xchg(&ethosu->global_perfmon, NULL);
+
+		return 0;
+	}
+
+	if (cmpxchg(&ethosu->global_perfmon, NULL, perfmon))
+		return -EBUSY;
+
+	return 0;
+}
diff --git a/include/uapi/drm/ethosu_accel.h b/include/uapi/drm/ethosu_accel.h
index af78bb4686d7..dde6756642ea 100644
--- a/include/uapi/drm/ethosu_accel.h
+++ b/include/uapi/drm/ethosu_accel.h
@@ -43,6 +43,11 @@ enum drm_ethosu_ioctl_id {
 
 	/** @DRM_ETHOSU_SUBMIT: Submit a job and BOs to run. */
 	DRM_ETHOSU_SUBMIT,
+
+	DRM_ETHOSU_PERFMON_CREATE,
+	DRM_ETHOSU_PERFMON_DESTROY,
+	DRM_ETHOSU_PERFMON_GET_VALUES,
+	DRM_ETHOSU_PERFMON_SET_GLOBAL,
 };
 
 /**
@@ -79,6 +84,7 @@ struct drm_ethosu_npu_info {
 	__u32 config;
 
 	__u32 sram_size;
+	__u32 pmu_counters;
 };
 
 /**
@@ -220,8 +226,51 @@ struct drm_ethosu_submit {
 	/** Input: Number of jobs passed in. */
 	__u32 job_count;
 
-	/** Reserved, must be zero. */
+	/** Input: Id returned by DRM_ETHOSU_PERFMON_CREATE */
+	__u32 perfmon_id;
+};
+
+#define DRM_ETHOSU_MAX_PERF_EVENT_COUNTERS	8
+#define DRM_ETHOSU_MAX_PERF_COUNTERS \
+	(DRM_ETHOSU_MAX_PERF_EVENT_COUNTERS + 1)
+
+struct drm_ethosu_perfmon_create {
+	__u32 id;
+	__u32 ncounters;
+	__u16 counters[DRM_ETHOSU_MAX_PERF_EVENT_COUNTERS];
+};
+
+struct drm_ethosu_perfmon_destroy {
+	__u32 id;
+};
+
+/*
+ * Returns the values of the performance counters tracked by this
+ * perfmon (as an array of (ncounters + 1) u64 values).
+ *
+ * No implicit synchronization is performed, so the user has to
+ * guarantee that any jobs using this perfmon have already been
+ * completed.
+ */
+struct drm_ethosu_perfmon_get_values {
+	__u32 id;
 	__u32 pad;
+	__u64 values_ptr;
+};
+
+#define DRM_ETHOSU_PERFMON_CLEAR_GLOBAL    0x0001
+
+/**
+ * struct drm_ethosu_perfmon_set_global - ioctl to define a global performance
+ * monitor
+ *
+ * The global performance monitor will be used for all jobs. If a global
+ * performance monitor is defined, jobs with a self-defined performance
+ * monitor won't be allowed.
+ */
+struct drm_ethosu_perfmon_set_global {
+	__u32 flags;
+	__u32 id;
 };
 
 /**
@@ -252,6 +301,14 @@ enum {
 		DRM_IOCTL_ETHOSU(WR, CMDSTREAM_BO_CREATE, cmdstream_bo_create),
 	DRM_IOCTL_ETHOSU_SUBMIT =
 		DRM_IOCTL_ETHOSU(WR, SUBMIT, submit),
+	DRM_IOCTL_ETHOSU_PERFMON_CREATE =
+		DRM_IOCTL_ETHOSU(WR, PERFMON_CREATE, perfmon_create),
+	DRM_IOCTL_ETHOSU_PERFMON_DESTROY =
+		DRM_IOCTL_ETHOSU(WR, PERFMON_DESTROY, perfmon_destroy),
+	DRM_IOCTL_ETHOSU_PERFMON_GET_VALUES =
+		DRM_IOCTL_ETHOSU(WR, PERFMON_GET_VALUES, perfmon_get_values),
+	DRM_IOCTL_ETHOSU_PERFMON_SET_GLOBAL =
+		DRM_IOCTL_ETHOSU(WR, PERFMON_SET_GLOBAL, perfmon_set_global),
 };
 
 #if defined(__cplusplus)
-- 
2.51.0

