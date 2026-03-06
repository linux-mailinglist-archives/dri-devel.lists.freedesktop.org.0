Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK7LA3bWqmnfXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD122198E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED5610ED3E;
	Fri,  6 Mar 2026 13:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC99A10ED39
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:28:12 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 94C791A010F;
 Fri,  6 Mar 2026 14:28:11 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E55F1A0120;
 Fri,  6 Mar 2026 14:28:11 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FD6820270;
 Fri,  6 Mar 2026 14:28:10 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:24 +0200
Subject: [PATCH v2 7/9] accel/neutron: Add job submission IOCTL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=20523;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=omyYjZPFYgN44qhNwxGgDNZ86B6AEyz4SRpjLy6YLxQ=;
 b=1oU+Uf8dAjaQZRPy+VXOPRmX1Wby6cUlFtRRHfuM3KkySUoZtpaseUWKUYEhNXlr8O8SWw6Wa
 U4mzLFEr8NrBg337A2Ch58B9GDnkeHF7bhAB7gk431Rmhu2qTjZ/764
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Queue-Id: 95DD122198E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:daniel.baluta@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.934];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:mid,nxp.com:email,cmd.id:url]
X-Rspamd-Action: no action

Neutron can execute a single job at a time. For now, only inference
jobs are supported. Each job has exactly one BO associated with it.

When submitting a job, user also provides a syncobj handle on which it
will wait for job completion.

We use the DRM GPU scheduler for job management. Large part of the job
submission code is based on the example of the ethosu driver.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2:
- drop fence_lock
- remove unnecessary fields from struct neutron_job
---
 drivers/accel/neutron/Makefile         |   1 +
 drivers/accel/neutron/neutron_device.c |   8 +-
 drivers/accel/neutron/neutron_device.h |  18 ++
 drivers/accel/neutron/neutron_driver.c |  28 ++-
 drivers/accel/neutron/neutron_driver.h |   3 +
 drivers/accel/neutron/neutron_job.c    | 372 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_job.h    |  43 ++++
 include/uapi/drm/neutron_accel.h       |  51 +++++
 8 files changed, 519 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index 192ed896a9f9..ac6dd576521c 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -6,4 +6,5 @@ neutron-y := \
 	neutron_driver.o \
 	neutron_device.o \
 	neutron_gem.o \
+	neutron_job.o \
 	neutron_mailbox.o
diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
index e5c09105be99..571ec906ad72 100644
--- a/drivers/accel/neutron/neutron_device.c
+++ b/drivers/accel/neutron/neutron_device.c
@@ -7,6 +7,7 @@
 #include <linux/iopoll.h>
 
 #include "neutron_device.h"
+#include "neutron_job.h"
 #include "neutron_mailbox.h"
 
 void neutron_enable_irq(struct neutron_device *ndev)
@@ -32,9 +33,14 @@ void neutron_handle_irq(struct neutron_device *ndev)
 	/* Write 1 to clear */
 	writel_relaxed(appstatus & APPSTATUS_CLEAR_MASK, NEUTRON_REG(ndev, APPSTATUS));
 
-	if (appstatus & APPSTATUS_FAULTCAUSE_MASK)
+	if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
 		dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
 			FIELD_GET(APPSTATUS_FAULTCAUSE_MASK, appstatus));
+		return neutron_job_err_handler(ndev);
+	}
+
+	if (appstatus & APPSTATUS_INFDONE)
+		neutron_job_done_handler(ndev);
 }
 
 #define neutron_boot_done(appctrl) \
diff --git a/drivers/accel/neutron/neutron_device.h b/drivers/accel/neutron/neutron_device.h
index 8e4df7462d82..1953cdf19bfd 100644
--- a/drivers/accel/neutron/neutron_device.h
+++ b/drivers/accel/neutron/neutron_device.h
@@ -9,8 +9,10 @@
 #include <linux/spinlock.h>
 #include <linux/bits.h>
 #include <drm/drm_device.h>
+#include <drm/gpu_scheduler.h>
 
 struct clk_bulk_data;
+struct neutron_job;
 
 #define NEUTRON_FIRMWARE_NAME		"NeutronFirmware.elf"
 
@@ -92,6 +94,12 @@ enum neutron_mem_id {
  * @clks: Neutron clocks
  * @num_clks: Number of clocks
  * @flags: Software flags used by driver
+ * @sched: GPU scheduler
+ * @sched_lock: Scheduler lock, for neutron_push_job
+ * @fence_context: Fence context
+ * @job_seqno: Job sequence number
+ * @job_lock: Job lock, for active_job handling
+ * @active_job: Currently active job
  */
 struct neutron_device {
 	struct drm_device base;
@@ -103,6 +111,16 @@ struct neutron_device {
 	struct clk_bulk_data *clks;
 	int num_clks;
 	u32 flags;
+
+	struct drm_gpu_scheduler sched;
+	/* For neutron_push_job */
+	struct mutex sched_lock;
+	u64 fence_context;
+	u64 job_seqno;
+
+	/* For active_job handling */
+	struct mutex job_lock;
+	struct neutron_job *active_job;
 };
 
 #define to_neutron_device(drm) \
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
index c9a18bf52037..ceae1f7e8359 100644
--- a/drivers/accel/neutron/neutron_driver.c
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -19,40 +19,53 @@
 #include "neutron_device.h"
 #include "neutron_driver.h"
 #include "neutron_gem.h"
+#include "neutron_job.h"
 
 #define NEUTRON_SUSPEND_DELAY_MS 1000
 
 static const struct drm_ioctl_desc neutron_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NEUTRON_CREATE_BO, neutron_ioctl_create_bo, 0),
 	DRM_IOCTL_DEF_DRV(NEUTRON_SYNC_BO, neutron_ioctl_sync_bo, 0),
+	DRM_IOCTL_DEF_DRV(NEUTRON_SUBMIT_JOB, neutron_ioctl_submit_job, 0),
 };
 
 static int neutron_open(struct drm_device *drm, struct drm_file *file)
 {
 	struct neutron_device *ndev = to_neutron_device(drm);
 	struct neutron_file_priv *npriv;
+	int ret;
 
 	npriv = kzalloc_obj(*npriv);
 	if (!npriv)
 		return -ENOMEM;
 
 	npriv->ndev = ndev;
-	file->driver_priv = npriv;
 
+	ret = neutron_job_open(npriv);
+	if (ret)
+		goto err_free;
+
+	file->driver_priv = npriv;
 	return 0;
+
+err_free:
+	kfree(npriv);
+	return ret;
 }
 
 static void neutron_postclose(struct drm_device *drm, struct drm_file *file)
 {
 	struct neutron_file_priv *npriv = file->driver_priv;
 
+	neutron_job_close(npriv);
 	kfree(npriv);
 }
 
 DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
 
 static const struct drm_driver neutron_drm_driver = {
-	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
+	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM |
+				  DRIVER_SYNCOBJ,
 	.name			= "neutron",
 	.desc			= "NXP Neutron driver",
 	.major			= 1,
@@ -151,19 +164,25 @@ static int neutron_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_pm_runtime_enable(dev);
+	ret = neutron_job_init(ndev);
 	if (ret)
 		goto free_reserved;
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto free_job;
+
 	pm_runtime_set_autosuspend_delay(dev, NEUTRON_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
 
 	ret = drm_dev_register(&ndev->base, 0);
 	if (ret)
-		goto free_reserved;
+		goto free_job;
 
 	return 0;
 
+free_job:
+	neutron_job_fini(ndev);
 free_reserved:
 	of_reserved_mem_device_release(&pdev->dev);
 
@@ -175,6 +194,7 @@ static void neutron_remove(struct platform_device *pdev)
 	struct neutron_device *ndev = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(&ndev->base);
+	neutron_job_fini(ndev);
 	of_reserved_mem_device_release(&pdev->dev);
 }
 
diff --git a/drivers/accel/neutron/neutron_driver.h b/drivers/accel/neutron/neutron_driver.h
index cd52b5eb2d27..b709de74105a 100644
--- a/drivers/accel/neutron/neutron_driver.h
+++ b/drivers/accel/neutron/neutron_driver.h
@@ -4,10 +4,13 @@
 #ifndef __NEUTRON_DRIVER_H__
 #define __NEUTRON_DRIVER_H__
 
+#include <drm/gpu_scheduler.h>
+
 struct neutron_device;
 
 struct neutron_file_priv {
 	struct neutron_device *ndev;
+	struct drm_sched_entity sched_entity;
 };
 
 #endif /* __NEUTRON_DRIVER_H__ */
diff --git a/drivers/accel/neutron/neutron_job.c b/drivers/accel/neutron/neutron_job.c
new file mode 100644
index 000000000000..e2993235fdab
--- /dev/null
+++ b/drivers/accel/neutron/neutron_job.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025-2026 NXP */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/neutron_accel.h>
+
+#include "neutron_driver.h"
+#include "neutron_device.h"
+#include "neutron_gem.h"
+#include "neutron_mailbox.h"
+#include "neutron_job.h"
+
+#define NEUTRON_JOB_TIMEOUT_MS 5000
+
+static const char *neutron_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "neutron";
+}
+
+static const char *neutron_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "neutron-npu";
+}
+
+static const struct dma_fence_ops neutron_fence_ops = {
+	.get_driver_name = neutron_fence_get_driver_name,
+	.get_timeline_name = neutron_fence_get_timeline_name,
+};
+
+static void neutron_hw_submit(struct neutron_job *job)
+{
+	struct neutron_device *ndev = job->ndev;
+	struct neutron_mbox_cmd cmd = {0};
+	u32 base_l, base_h;
+	u64 base_addr;
+	int ret;
+
+	switch (job->type) {
+	case DRM_NEUTRON_JOB_INFERENCE:
+		cmd.id = NEUTRON_CMD_INFERENCE;
+		cmd.args[0] = job->inference.tensor_offset;
+		cmd.args[1] = job->inference.microcode_offset;
+		cmd.args[2] = job->inference.tensor_count;
+		break;
+	default:
+		dev_WARN(ndev->dev, "Unknown job type: %d\n", job->type);
+		return;
+	}
+
+	base_addr = to_drm_gem_dma_obj(job->bo)->dma_addr;
+	base_l = lower_32_bits(base_addr);
+	base_h = upper_32_bits(base_addr);
+
+	writel_relaxed(base_l, NEUTRON_REG(ndev, BASEDDRL));
+	writel_relaxed(base_l, NEUTRON_REG(ndev, BASEINOUTL));
+	writel_relaxed(base_l, NEUTRON_REG(ndev, BASESPILLL));
+	writel_relaxed(base_h, NEUTRON_REG(ndev, BASEDDRH));
+	writel_relaxed(base_h, NEUTRON_REG(ndev, BASEINOUTH));
+	writel_relaxed(base_h, NEUTRON_REG(ndev, BASESPILLH));
+
+	ret = neutron_mbox_send_cmd(ndev, &cmd);
+	if (ret) {
+		/* Nothing we can do here, we'll reset the device on timeout */
+		dev_err(ndev->dev, "Failed to submit job, device is busy\n");
+	}
+}
+
+void neutron_job_err_handler(struct neutron_device *ndev)
+{
+	guard(mutex)(&ndev->job_lock);
+
+	if (ndev->active_job)
+		drm_sched_fault(&ndev->sched);
+}
+
+void neutron_job_done_handler(struct neutron_device *ndev)
+{
+	struct neutron_mbox_state state;
+	struct dma_fence *fence;
+
+	neutron_mbox_read_state(ndev, &state);
+	if (state.status != NEUTRON_FW_STATUS_DONE) {
+		dev_err(ndev->dev, "Inconsistent firmware state: status 0x%x, err 0x%x\n",
+			state.status, state.err_code);
+		return neutron_job_err_handler(ndev);
+	}
+
+	/* Reset Neutron internal state to prepare for next inference */
+	neutron_mbox_reset_state(ndev);
+
+	scoped_guard(mutex, &ndev->job_lock) {
+		if (ndev->active_job) {
+			fence = ndev->active_job->neutron_fence;
+			if (state.err_code != 0) {
+				dev_warn(ndev->dev, "Job finished with error: 0x%x\n",
+					 state.err_code);
+				dma_fence_set_error(fence, state.err_code);
+			}
+			dma_fence_signal(fence);
+			ndev->active_job = NULL;
+		}
+	}
+}
+
+static void neutron_cleanup_job(struct kref *ref)
+{
+	struct neutron_job *job = container_of(ref, struct neutron_job, refcnt);
+
+	pm_runtime_put_autosuspend(job->ndev->base.dev);
+
+	dma_fence_put(job->neutron_fence);
+	drm_gem_object_put(job->bo);
+
+	kfree(job);
+}
+
+static void neutron_put_job(struct neutron_job *job)
+{
+	kref_put(&job->refcnt, neutron_cleanup_job);
+}
+
+static void neutron_free_job(struct drm_sched_job *sched_job)
+{
+	struct neutron_job *job = to_neutron_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+	neutron_put_job(job);
+}
+
+static struct dma_fence *neutron_run_job(struct drm_sched_job *sched_job)
+{
+	struct neutron_job *job = to_neutron_job(sched_job);
+	struct dma_fence *fence = job->neutron_fence;
+	struct neutron_device *ndev = job->ndev;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	dma_fence_init(fence, &neutron_fence_ops, NULL,
+		       ndev->fence_context, ++ndev->job_seqno);
+	dma_fence_get(fence);
+
+	scoped_guard(mutex, &ndev->job_lock) {
+		ndev->active_job = job;
+		neutron_hw_submit(job);
+	}
+
+	return fence;
+}
+
+static enum drm_gpu_sched_stat neutron_timedout_job(struct drm_sched_job *sched_job)
+{
+	struct neutron_job *job = to_neutron_job(sched_job);
+	struct neutron_device *ndev = job->ndev;
+	struct neutron_mbox_state state;
+
+	/* We assume Neutron is stuck, retrieve current state and reset */
+	neutron_mbox_read_state(ndev, &state);
+	dev_err(ndev->dev, "Neutron timedout, status: 0x%x, err: 0x%x\n",
+		state.status, state.err_code);
+
+	drm_sched_stop(&ndev->sched, sched_job);
+
+	scoped_guard(mutex, &ndev->job_lock)
+		ndev->active_job = NULL;
+
+	pm_runtime_force_suspend(ndev->dev);
+	pm_runtime_force_resume(ndev->dev);
+
+	drm_sched_start(&ndev->sched, 0);
+
+	return DRM_GPU_SCHED_STAT_RESET;
+}
+
+static void neutron_cancel_job(struct drm_sched_job *sched_job)
+{
+	struct neutron_job *job = to_neutron_job(sched_job);
+	struct neutron_device *ndev = job->ndev;
+
+	guard(mutex)(&ndev->job_lock);
+
+	if (!dma_fence_is_signaled(job->neutron_fence)) {
+		dma_fence_set_error(job->neutron_fence, -ECANCELED);
+		dma_fence_signal(job->neutron_fence);
+	}
+}
+
+static const struct drm_sched_backend_ops neutron_sched_ops = {
+	.run_job = neutron_run_job,
+	.free_job = neutron_free_job,
+	.timedout_job = neutron_timedout_job,
+	.cancel_job = neutron_cancel_job,
+};
+
+int neutron_job_init(struct neutron_device *ndev)
+{
+	const struct drm_sched_init_args args = {
+		.ops = &neutron_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(NEUTRON_JOB_TIMEOUT_MS),
+		.name = dev_name(ndev->dev),
+		.dev = ndev->dev,
+	};
+	int ret;
+
+	ret = devm_mutex_init(ndev->dev, &ndev->sched_lock);
+	if (ret)
+		return ret;
+	ret = devm_mutex_init(ndev->dev, &ndev->job_lock);
+	if (ret)
+		return ret;
+
+	ndev->fence_context = dma_fence_context_alloc(1);
+
+	ret = drm_sched_init(&ndev->sched, &args);
+	if (ret)
+		dev_err(ndev->dev, "Error creating DRM scheduler\n");
+
+	return ret;
+}
+
+void neutron_job_fini(struct neutron_device *ndev)
+{
+	drm_sched_fini(&ndev->sched);
+}
+
+int neutron_job_open(struct neutron_file_priv *npriv)
+{
+	struct neutron_device *ndev = npriv->ndev;
+	struct drm_gpu_scheduler *sched = &ndev->sched;
+	int ret;
+
+	ret = drm_sched_entity_init(&npriv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+	if (ret)
+		dev_err(ndev->dev, "Error creating scheduler entity\n");
+
+	return ret;
+}
+
+void neutron_job_close(struct neutron_file_priv *npriv)
+{
+	drm_sched_entity_destroy(&npriv->sched_entity);
+}
+
+static int neutron_push_job(struct neutron_job *job, struct drm_syncobj *sync)
+{
+	struct neutron_device *ndev = job->ndev;
+	struct ww_acquire_ctx acquire_ctx;
+	struct dma_fence *sched_fence;
+	int ret;
+
+	ret = drm_gem_lock_reservations(&job->bo, 1, &acquire_ctx);
+	if (ret)
+		return ret;
+
+	ret = dma_resv_reserve_fences(job->bo->resv, 1);
+	if (ret)
+		goto out_unlock_res;
+
+	ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bo, true);
+	if (ret)
+		goto out_unlock_res;
+
+	ret = pm_runtime_resume_and_get(ndev->base.dev);
+	if (ret)
+		goto out_unlock_res;
+
+	scoped_guard(mutex, &ndev->sched_lock) {
+		drm_sched_job_arm(&job->base);
+
+		sched_fence = dma_fence_get(&job->base.s_fence->finished);
+		drm_syncobj_replace_fence(sync, sched_fence);
+
+		kref_get(&job->refcnt);
+		drm_sched_entity_push_job(&job->base);
+
+		dma_resv_add_fence(job->bo->resv, sched_fence,
+				   DMA_RESV_USAGE_WRITE);
+
+		dma_fence_put(sched_fence);
+	}
+
+out_unlock_res:
+	drm_gem_unlock_reservations(&job->bo, 1, &acquire_ctx);
+
+	return ret;
+}
+
+int neutron_ioctl_submit_job(struct drm_device *drm, void *data, struct drm_file *filp)
+{
+	struct neutron_device *ndev = to_neutron_device(drm);
+	struct neutron_file_priv *npriv = filp->driver_priv;
+	struct drm_neutron_submit_job *args = data;
+	struct drm_syncobj *syncobj;
+	struct neutron_job *job;
+	int ret;
+
+	if (args->pad)
+		return -EINVAL;
+
+	job = kzalloc_obj(*job);
+	if (!job)
+		return -ENOMEM;
+
+	job->ndev = ndev;
+	kref_init(&job->refcnt);
+
+	job->neutron_fence = kzalloc_obj(*job->neutron_fence);
+	if (!job->neutron_fence) {
+		ret = -ENOMEM;
+		goto out_free_job;
+	}
+
+	switch (args->type) {
+	case DRM_NEUTRON_JOB_INFERENCE:
+		memcpy(&job->inference, &args->inference,
+		       sizeof(args->inference));
+		break;
+	default:
+		dev_dbg(ndev->dev, "Invalid job type %d\n", args->type);
+		ret = -EINVAL;
+		goto out_free_fence;
+	}
+
+	job->bo = drm_gem_object_lookup(filp, args->bo_handle);
+	if (!job->bo) {
+		dev_dbg(ndev->dev, "Invalid BO handle\n");
+		ret = -ENOENT;
+		goto out_free_fence;
+	}
+
+	syncobj = drm_syncobj_find(filp, args->syncobj_handle);
+	if (!syncobj) {
+		dev_dbg(ndev->dev, "Invalid syncobj handle\n");
+		ret = -ENOENT;
+		goto out_put_gem;
+	}
+
+	ret = drm_sched_job_init(&job->base, &npriv->sched_entity, 1, NULL,
+				 filp->client_id);
+	if (ret)
+		goto out_put_syncobj;
+
+	ret = neutron_push_job(job, syncobj);
+	if (ret)
+		goto out_sched_cleanup;
+
+	neutron_put_job(job);
+	drm_syncobj_put(syncobj);
+
+	return 0;
+
+out_sched_cleanup:
+	drm_sched_job_cleanup(&job->base);
+out_put_syncobj:
+	drm_syncobj_put(syncobj);
+out_put_gem:
+	drm_gem_object_put(job->bo);
+out_free_fence:
+	kfree(job->neutron_fence);
+out_free_job:
+	kfree(job);
+
+	return ret;
+}
diff --git a/drivers/accel/neutron/neutron_job.h b/drivers/accel/neutron/neutron_job.h
new file mode 100644
index 000000000000..df97266a0fb6
--- /dev/null
+++ b/drivers/accel/neutron/neutron_job.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_JOB_H__
+#define __NEUTRON_JOB_H__
+
+#include <linux/kref.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_syncobj.h>
+#include <drm/gpu_scheduler.h>
+#include <drm/neutron_accel.h>
+
+#include "neutron_driver.h"
+
+struct neutron_device;
+struct neutron_file_priv;
+
+struct neutron_job {
+	struct drm_sched_job base;
+	struct neutron_device *ndev;
+	struct dma_fence *neutron_fence;
+	struct drm_gem_object *bo;
+	enum drm_neutron_job_type type;
+	union {
+		struct drm_neutron_inference_job inference;
+	};
+	struct kref refcnt;
+};
+
+#define to_neutron_job(job) \
+	container_of(job, struct neutron_job, base)
+
+int neutron_job_init(struct neutron_device *dev);
+void neutron_job_fini(struct neutron_device *dev);
+int neutron_job_open(struct neutron_file_priv *npriv);
+void neutron_job_close(struct neutron_file_priv *npriv);
+
+void neutron_job_done_handler(struct neutron_device *dev);
+void neutron_job_err_handler(struct neutron_device *dev);
+
+int neutron_ioctl_submit_job(struct drm_device *dev, void *data, struct drm_file *filp);
+
+#endif /* __NEUTRON_JOB_H__ */
diff --git a/include/uapi/drm/neutron_accel.h b/include/uapi/drm/neutron_accel.h
index 2f5639f2e0e8..a9e5682709d2 100644
--- a/include/uapi/drm/neutron_accel.h
+++ b/include/uapi/drm/neutron_accel.h
@@ -15,10 +15,12 @@ extern "C" {
  *
  * @DRM_NEUTRON_CREATE_BO: Create a buffer object
  * @DRM_NEUTRON_SYNC_BO: Sync (parts of) the buffer object memory
+ * @DRM_NEUTRON_SUBMIT_JOB: Submit a job to the device
  */
 enum drm_neutron_ioctl {
 	DRM_NEUTRON_CREATE_BO = 0,
 	DRM_NEUTRON_SYNC_BO,
+	DRM_NEUTRON_SUBMIT_JOB,
 };
 
 /**
@@ -64,6 +66,51 @@ struct drm_neutron_sync_bo {
 	__u64 offset;
 };
 
+/**
+ * enum drm_neutron_job_type - Type of job to submit to Neutron device
+ *
+ * @DRM_NEUTRON_JOB_INFERENCE: Inference job
+ */
+enum drm_neutron_job_type {
+	DRM_NEUTRON_JOB_INFERENCE = 0,
+};
+
+/**
+ * struct drm_neutron_inference_job - Inference job descriptor
+ *
+ * @tensor_offset: Offset of tensor array inside job BO
+ * @microcode_offset: Microcode offset inside BO
+ * @tensor_count: Number of valid tensors
+ * @pad: MBZ
+ */
+struct drm_neutron_inference_job {
+	__u32 tensor_offset;
+	__u32 microcode_offset;
+	__u32 tensor_count;
+	__u32 pad[5];
+};
+
+/**
+ * struct drm_neutron_submit_job - Submit a job to Neutron device
+ *
+ * @type: Job type, one of enum drm_neutron_job_type
+ * @bo_handle: BO handle for this job
+ * @inference: Inference job descriptor (when type is DRM_NEUTRON_JOB_INFERENCE)
+ * @reserved: Reserved for future job types
+ * @syncobj_handle: Handle of syncobj on which user waits for job completion
+ * @pad: MBZ
+ */
+struct drm_neutron_submit_job {
+	__u32 type;
+	__u32 bo_handle;
+	union {
+		struct drm_neutron_inference_job inference;
+		__u32 reserved[8];
+	};
+	__u32 syncobj_handle;
+	__u32 pad;
+};
+
 #define DRM_IOCTL_NEUTRON_CREATE_BO \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_CREATE_BO, \
 		 struct drm_neutron_create_bo)
@@ -72,6 +119,10 @@ struct drm_neutron_sync_bo {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SYNC_BO, \
 		 struct drm_neutron_sync_bo)
 
+#define DRM_IOCTL_NEUTRON_SUBMIT_JOB \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SUBMIT_JOB, \
+		 struct drm_neutron_submit_job)
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

