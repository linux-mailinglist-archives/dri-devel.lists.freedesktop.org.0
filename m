Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFRJIkUMhWmj7gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE5F7B15
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D317D10E0D9;
	Thu,  5 Feb 2026 21:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YgeIVydZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400FA10E0D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpasrE/5LQhuvMfHOyz5wDZtfTXD+nXCPx5/ob8mDA4=; b=YgeIVydZT56TJkYNvtVneIvNap
 ZwJjK5D/hVkOMHGmAUN8K16f2UWtQ9ujAnXMbl1y3ko+UNVgFXJQKTQWPzkTP0JJgZSHKoTsrQpI9
 EMKOgHhmNjll7e9coCKcYmPCzvYx+XgYNdS9LVlqaNOiZ2axL8tUTM6D8/OvAh5xqzRNCHAhJLtlL
 FjZX4SRUuuD2+Wood6wAKLRm93LO7dBhbGv/FtwXo4NqKFSTs0Uwwmibhcd9y2ePEjQMCZghJ5nvj
 6EDq77Erwhi8v277CS+liyLrNTt+TIAu6i0icuDfkZjy8NO8q20bqPDOoJT51TilB5YgRl4QqB+0a
 lYtKAO1g==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vo6wq-00EZx4-EO; Thu, 05 Feb 2026 22:31:36 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 05 Feb 2026 18:31:07 -0300
Subject: [PATCH 08/11] drm/vc4: Switch to DRM GPU scheduler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-vc4-drm-scheduler-v1-8-c6174fd7bbc1@igalia.com>
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=50673; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=EgVmKH1hOEYwcuE37vd+e+nC+2wyEL3MWeBMrg4R5PQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBphQwdihLO4Y517SxuPrryYrS20a6fRaYHRiE83
 xQekBy6OySJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaYUMHQAKCRA/8w6Kdoj6
 qlorB/0eWtHZ+ba1qF6O41nOURKYEbM95HhSTSPwtLuFLjyAx+cy+XYRGOcg+axNvJ7eQM6AQgU
 Juvo6zyaTImPC3vX7lHmyN5yPGGbOsu3p69Foq0DJLPVB2dXQadnUXpIFMyKvhWay4ENWYewkO2
 vn3K4xQ7AoYadmOgwgd9sgUiS6wvVW9tUGHHn2xBc+3ASwG/65chqbMk5iFo0xYzVsbxnI1PSIh
 IknS/LnY79K8byJy0yE9T5ReQxrdheX3TC/1CasRoTIV/o5h2mvn0LbOH4Tf1tBKuVoCe2bXNKI
 5ImbwRriD+9zPa1EfsX0Z4LK96sSCb4Lx/rXfA1DvbuYMmeD
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9BE5F7B15
X-Rspamd-Action: no action

Wire up the DRM GPU scheduler to the VC4 submission path, replacing the
legacy hand-rolled job queue implementation. The scheduler now handles
job ordering, dependency tracking, and timeout detection, so the legacy
job queues, hangcheck timer, and the custom fence signaling logic can be
removed.

With this change, the `struct vc4_exec_info` is reduced to a container
used only during ioctl validation. Fields that moved to vc4_bin_job and
vc4_render_job (BOs, command list addresses, bin slots, etc.) are
removed from it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/Makefile        |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h       | 132 +-----
 drivers/gpu/drm/vc4/vc4_fence.c     |   9 -
 drivers/gpu/drm/vc4/vc4_gem.c       | 913 +-----------------------------------
 drivers/gpu/drm/vc4/vc4_irq.c       | 132 +-----
 drivers/gpu/drm/vc4/vc4_render_cl.c |  17 +-
 drivers/gpu/drm/vc4/vc4_v3d.c       |  24 +-
 drivers/gpu/drm/vc4/vc4_validate.c  |  21 +-
 8 files changed, 87 insertions(+), 1162 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
index 8b8562000cf03413898dbeac6ebf3ec6a4f47e52..259bbb76c4af250436aa4d30b86f406ee840bcbc 100644
--- a/drivers/gpu/drm/vc4/Makefile
+++ b/drivers/gpu/drm/vc4/Makefile
@@ -20,6 +20,7 @@ vc4-y := \
 	vc4_plane.o \
 	vc4_render_cl.o \
 	vc4_sched.o \
+	vc4_submit.o \
 	vc4_trace_points.o \
 	vc4_txp.o \
 	vc4_v3d.o \
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ff6dc9aea52105359b72700ba367d390ddf84262..ca5edf8778df740ec8d24e9ef19c077db4be2b50 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -162,42 +162,12 @@ struct vc4_dev {
 		struct mutex lock;
 	} purgeable;
 
-	uint64_t dma_fence_context;
-
-	/* Sequence number for the last job queued in bin_job_list.
-	 * Starts at 0 (no jobs emitted).
-	 */
-	uint64_t emit_seqno;
-
 	struct vc4_queue_state queue[VC4_MAX_QUEUES];
 
 	struct vc4_bin_job *bin_job;
 
 	struct vc4_render_job *render_job;
 
-	/* Sequence number for the last completed job on the GPU.
-	 * Starts at 0 (no jobs completed).
-	 */
-	uint64_t finished_seqno;
-
-	/* List of all struct vc4_exec_info for jobs to be executed in
-	 * the binner.  The first job in the list is the one currently
-	 * programmed into ct0ca for execution.
-	 */
-	struct list_head bin_job_list;
-
-	/* List of all struct vc4_exec_info for jobs that have
-	 * completed binning and are ready for rendering.  The first
-	 * job in the list is the one currently programmed into ct1ca
-	 * for execution.
-	 */
-	struct list_head render_job_list;
-
-	/* List of the finished vc4_exec_infos waiting to be freed by
-	 * job_done_work.
-	 */
-	struct list_head job_done_list;
-
 	/* Lock taken when resetting the GPU, to keep multiple
 	 * processes from trying to park the scheduler threads and
 	 * reset at once.
@@ -213,8 +183,6 @@ struct vc4_dev {
 	 * accesses between the IRQ handler and GEM ioctls.
 	 */
 	spinlock_t job_lock;
-	wait_queue_head_t job_wait_queue;
-	struct work_struct job_done_work;
 
 	/* Used to track the active perfmon if any. Access to this field is
 	 * protected by job_lock.
@@ -255,11 +223,6 @@ struct vc4_dev {
 	/* Mutex controlling the power refcount. */
 	struct mutex power_lock;
 
-	struct {
-		struct timer_list timer;
-		struct work_struct reset_work;
-	} hangcheck;
-
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
 	struct drm_private_obj hvs_channels;
@@ -785,50 +748,14 @@ struct vc4_exec_info {
 	struct vc4_bin_job *bin;
 	struct vc4_render_job *render;
 
-	/* Sequence number for this bin/render job. */
-	uint64_t seqno;
-
-	struct dma_fence *fence;
-
-	/* Last current addresses the hardware was processing when the
-	 * hangcheck timer checked on us.
-	 */
-	uint32_t last_ct0ca, last_ct1ca;
-
 	/* Kernel-space copy of the ioctl arguments */
 	struct drm_vc4_submit_cl *args;
 
-	/* This is the array of BOs that were looked up at the start of exec.
-	 * Command validation will use indices into this array.
-	 */
-	struct drm_gem_object **bo;
-	uint32_t bo_count;
-
-	/* List of BOs that are being written by the RCL.  Other than
-	 * the binner temporary storage, this is all the BOs written
-	 * by the job.
-	 */
-	struct drm_gem_dma_object *rcl_write_bo[4];
-	uint32_t rcl_write_bo_count;
-
-	/* Pointers for our position in vc4->job_list */
-	struct list_head head;
-
-	/* List of other BOs used in the job that need to be released
-	 * once the job is complete.
-	 */
-	struct list_head unref_list;
-
 	/* Current unvalidated indices into @bo loaded by the non-hardware
 	 * VC4_PACKET_GEM_HANDLES.
 	 */
 	uint32_t bo_index[2];
 
-	/* This is the BO where we store the validated command lists, shader
-	 * records, and uniforms.
-	 */
-	struct drm_gem_dma_object *exec_bo;
-
 	/**
 	 * This tracks the per-shader-record state (packet 64) that
 	 * determines the length of the shader record and the offset
@@ -857,15 +784,6 @@ struct vc4_exec_info {
 	 * (where each tile's binned CL will start)
 	 */
 	uint32_t tile_alloc_offset;
-	/* Bitmask of which binner slots are freed when this job completes. */
-	uint32_t bin_slots;
-
-	/**
-	 * Computed addresses pointing into exec_bo where we start the
-	 * bin thread (ct0) and render thread (ct1).
-	 */
-	uint32_t ct0ca, ct0ea;
-	uint32_t ct1ca, ct1ea;
 
 	/* Pointer to the unvalidated bin CL (if present). */
 	void *bin_u;
@@ -887,16 +805,6 @@ struct vc4_exec_info {
 	void *uniforms_v;
 	uint32_t uniforms_p;
 	uint32_t uniforms_size;
-
-	/* Pointer to a performance monitor object if the user requested it,
-	 * NULL otherwise.
-	 */
-	struct vc4_perfmon *perfmon;
-
-	/* Whether the exec has taken a reference to the binner BO, which should
-	 * happen with a VC4_PACKET_TILE_BINNING_MODE_CONFIG packet.
-	 */
-	bool bin_bo_used;
 };
 
 /* Per-open file private data. Any driver-specific resource that has to be
@@ -918,29 +826,6 @@ struct vc4_file {
 	bool bin_bo_used;
 };
 
-static inline struct vc4_exec_info *
-vc4_first_bin_job(struct vc4_dev *vc4)
-{
-	return list_first_entry_or_null(&vc4->bin_job_list,
-					struct vc4_exec_info, head);
-}
-
-static inline struct vc4_exec_info *
-vc4_first_render_job(struct vc4_dev *vc4)
-{
-	return list_first_entry_or_null(&vc4->render_job_list,
-					struct vc4_exec_info, head);
-}
-
-static inline struct vc4_exec_info *
-vc4_last_render_job(struct vc4_dev *vc4)
-{
-	if (list_empty(&vc4->render_job_list))
-		return NULL;
-	return list_last_entry(&vc4->render_job_list,
-			       struct vc4_exec_info, head);
-}
-
 /**
  * struct vc4_texture_sample_info - saves the offsets into the UBO for texture
  * setup parameters.
@@ -1111,20 +996,17 @@ struct dma_fence *vc4_fence_create(struct vc4_dev *vc4, enum vc4_queue queue);
 
 /* vc4_gem.c */
 int vc4_gem_init(struct drm_device *dev);
-int vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file_priv);
-int vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv);
-void vc4_submit_next_bin_job(struct drm_device *dev);
-void vc4_submit_next_render_job(struct drm_device *dev);
-void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
-int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
-		       uint64_t timeout_ns, bool interruptible);
-void vc4_job_handle_completed(struct vc4_dev *vc4);
 int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv);
 void vc4_save_hang_state(struct drm_device *dev);
 
+/* vc4_submit.c */
+void vc4_job_cleanup(struct vc4_job *job);
+int vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+int vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+
 /* vc4_hdmi.c */
 extern struct platform_driver vc4_hdmi_driver;
 
diff --git a/drivers/gpu/drm/vc4/vc4_fence.c b/drivers/gpu/drm/vc4/vc4_fence.c
index a6c24eaf2594ade3dcd635452288c9dc20af14d5..72aa6b8ba4b6b6bd8affe2c73827bd127b18225e 100644
--- a/drivers/gpu/drm/vc4/vc4_fence.c
+++ b/drivers/gpu/drm/vc4/vc4_fence.c
@@ -50,16 +50,7 @@ static const char *vc4_fence_get_timeline_name(struct dma_fence *fence)
 	return "vc4-v3d";
 }
 
-static bool vc4_fence_signaled(struct dma_fence *fence)
-{
-	struct vc4_fence *f = to_vc4_fence(fence);
-	struct vc4_dev *vc4 = to_vc4_dev(f->dev);
-
-	return vc4->finished_seqno >= f->seqno;
-}
-
 const struct dma_fence_ops vc4_fence_ops = {
 	.get_driver_name = vc4_fence_get_driver_name,
 	.get_timeline_name = vc4_fence_get_timeline_name,
-	.signaled = vc4_fence_signaled,
 };
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 030fa23a53e8c48dac7208453b00af3f59c16657..1aa54c49b033ac0c85e49988d7fbe9cbaa37b000 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -21,32 +21,13 @@
  * IN THE SOFTWARE.
  */
 
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/sched/signal.h>
-#include <linux/dma-fence-array.h>
-
-#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
-#include <drm/drm_syncobj.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 #include "vc4_trace.h"
 
-static void
-vc4_queue_hangcheck(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	mod_timer(&vc4->hangcheck.timer,
-		  round_jiffies_up(jiffies + msecs_to_jiffies(100)));
-}
-
 struct vc4_hang_state {
 	struct drm_vc4_get_hang_state user_state;
 
@@ -156,10 +137,11 @@ vc4_save_hang_state(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_vc4_get_hang_state *state;
 	struct vc4_hang_state *kernel_state;
-	struct vc4_exec_info *exec[2];
+	struct vc4_bin_job *bin_job;
+	struct vc4_render_job *render_job;
 	struct vc4_bo *bo;
 	unsigned long irqflags;
-	unsigned int i, j, k, unref_list_count;
+	unsigned int i, k, unref_list_count;
 
 	kernel_state = kcalloc(1, sizeof(*kernel_state), GFP_KERNEL);
 	if (!kernel_state)
@@ -168,24 +150,19 @@ vc4_save_hang_state(struct drm_device *dev)
 	state = &kernel_state->user_state;
 
 	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	exec[0] = vc4_first_bin_job(vc4);
-	exec[1] = vc4_first_render_job(vc4);
-	if (!exec[0] && !exec[1]) {
+	bin_job = vc4->bin_job;
+	render_job = vc4->render_job;
+	if (!bin_job && !render_job) {
 		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 		kfree(kernel_state);
 		return;
 	}
 
-	/* Get the bos from both binner and renderer into hang state. */
+	/* Get the BOs from the render job into hang state. */
 	state->bo_count = 0;
-	for (i = 0; i < 2; i++) {
-		if (!exec[i])
-			continue;
-
-		unref_list_count = 0;
-		list_for_each_entry(bo, &exec[i]->unref_list, unref_head)
-			unref_list_count++;
-		state->bo_count += exec[i]->bo_count + unref_list_count;
+	if (render_job) {
+		unref_list_count = list_count_nodes(&render_job->unref_list);
+		state->bo_count += render_job->bo_count + unref_list_count;
 	}
 
 	kernel_state->bo = kcalloc(state->bo_count,
@@ -198,12 +175,9 @@ vc4_save_hang_state(struct drm_device *dev)
 	}
 
 	k = 0;
-	for (i = 0; i < 2; i++) {
-		if (!exec[i])
-			continue;
-
-		for (j = 0; j < exec[i]->bo_count; j++) {
-			bo = to_vc4_bo(exec[i]->bo[j]);
+	if (render_job) {
+		for (i = 0; i < render_job->bo_count; i++) {
+			bo = to_vc4_bo(render_job->bo[i]);
 
 			/* Retain BOs just in case they were marked purgeable.
 			 * This prevents the BO from being purged before
@@ -211,11 +185,11 @@ vc4_save_hang_state(struct drm_device *dev)
 			 */
 			WARN_ON(!refcount_read(&bo->usecnt));
 			refcount_inc(&bo->usecnt);
-			drm_gem_object_get(exec[i]->bo[j]);
-			kernel_state->bo[k++] = exec[i]->bo[j];
+			drm_gem_object_get(render_job->bo[i]);
+			kernel_state->bo[k++] = render_job->bo[i];
 		}
 
-		list_for_each_entry(bo, &exec[i]->unref_list, unref_head) {
+		list_for_each_entry(bo, &render_job->unref_list, unref_head) {
 			/* No need to retain BOs coming from the ->unref_list
 			 * because they are naturally unpurgeable.
 			 */
@@ -226,10 +200,10 @@ vc4_save_hang_state(struct drm_device *dev)
 
 	WARN_ON_ONCE(k != state->bo_count);
 
-	if (exec[0])
-		state->start_bin = exec[0]->ct0ca;
-	if (exec[1])
-		state->start_render = exec[1]->ct1ca;
+	if (bin_job)
+		state->start_bin = bin_job->ct0ca;
+	if (render_job)
+		state->start_render = render_job->ct1ca;
 
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 
@@ -289,840 +263,6 @@ vc4_save_hang_state(struct drm_device *dev)
 	}
 }
 
-static void
-vc4_reset(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	DRM_INFO("Resetting GPU.\n");
-
-	mutex_lock(&vc4->power_lock);
-	if (vc4->power_refcount) {
-		/* Power the device off and back on the by dropping the
-		 * reference on runtime PM.
-		 */
-		pm_runtime_put_sync_suspend(&vc4->v3d->pdev->dev);
-		pm_runtime_get_sync(&vc4->v3d->pdev->dev);
-	}
-	mutex_unlock(&vc4->power_lock);
-
-	vc4_irq_reset(dev);
-
-	/* Rearm the hangcheck -- another job might have been waiting
-	 * for our hung one to get kicked off, and vc4_irq_reset()
-	 * would have started it.
-	 */
-	vc4_queue_hangcheck(dev);
-}
-
-static void
-vc4_reset_work(struct work_struct *work)
-{
-	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, hangcheck.reset_work);
-
-	vc4_save_hang_state(&vc4->base);
-
-	vc4_reset(&vc4->base);
-}
-
-static void
-vc4_hangcheck_elapsed(struct timer_list *t)
-{
-	struct vc4_dev *vc4 = timer_container_of(vc4, t, hangcheck.timer);
-	struct drm_device *dev = &vc4->base;
-	uint32_t ct0ca, ct1ca;
-	unsigned long irqflags;
-	struct vc4_exec_info *bin_exec, *render_exec;
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-
-	bin_exec = vc4_first_bin_job(vc4);
-	render_exec = vc4_first_render_job(vc4);
-
-	/* If idle, we can stop watching for hangs. */
-	if (!bin_exec && !render_exec) {
-		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-		return;
-	}
-
-	ct0ca = V3D_READ(V3D_CTNCA(0));
-	ct1ca = V3D_READ(V3D_CTNCA(1));
-
-	/* If we've made any progress in execution, rearm the timer
-	 * and wait.
-	 */
-	if ((bin_exec && ct0ca != bin_exec->last_ct0ca) ||
-	    (render_exec && ct1ca != render_exec->last_ct1ca)) {
-		if (bin_exec)
-			bin_exec->last_ct0ca = ct0ca;
-		if (render_exec)
-			render_exec->last_ct1ca = ct1ca;
-		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-		vc4_queue_hangcheck(dev);
-		return;
-	}
-
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	/* We've gone too long with no progress, reset.  This has to
-	 * be done from a work struct, since resetting can sleep and
-	 * this timer hook isn't allowed to.
-	 */
-	schedule_work(&vc4->hangcheck.reset_work);
-}
-
-static void
-submit_cl(struct drm_device *dev, uint32_t thread, uint32_t start, uint32_t end)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	/* Set the current and end address of the control list.
-	 * Writing the end register is what starts the job.
-	 */
-	V3D_WRITE(V3D_CTNCA(thread), start);
-	V3D_WRITE(V3D_CTNEA(thread), end);
-}
-
-int
-vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno, uint64_t timeout_ns,
-		   bool interruptible)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	int ret = 0;
-	unsigned long timeout_expire;
-	DEFINE_WAIT(wait);
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return -ENODEV;
-
-	if (vc4->finished_seqno >= seqno)
-		return 0;
-
-	if (timeout_ns == 0)
-		return -ETIME;
-
-	timeout_expire = jiffies + nsecs_to_jiffies(timeout_ns);
-
-	trace_vc4_wait_for_seqno_begin(dev, seqno, timeout_ns);
-	for (;;) {
-		prepare_to_wait(&vc4->job_wait_queue, &wait,
-				interruptible ? TASK_INTERRUPTIBLE :
-				TASK_UNINTERRUPTIBLE);
-
-		if (interruptible && signal_pending(current)) {
-			ret = -ERESTARTSYS;
-			break;
-		}
-
-		if (vc4->finished_seqno >= seqno)
-			break;
-
-		if (timeout_ns != ~0ull) {
-			if (time_after_eq(jiffies, timeout_expire)) {
-				ret = -ETIME;
-				break;
-			}
-			schedule_timeout(timeout_expire - jiffies);
-		} else {
-			schedule();
-		}
-	}
-
-	finish_wait(&vc4->job_wait_queue, &wait);
-	trace_vc4_wait_for_seqno_end(dev, seqno);
-
-	return ret;
-}
-
-static void
-vc4_flush_caches(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	/* Flush the GPU L2 caches.  These caches sit on top of system
-	 * L3 (the 128kb or so shared with the CPU), and are
-	 * non-allocating in the L3.
-	 */
-	V3D_WRITE(V3D_L2CACTL,
-		  V3D_L2CACTL_L2CCLR);
-
-	V3D_WRITE(V3D_SLCACTL,
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T1CC) |
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T0CC) |
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_UCC) |
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_ICC));
-}
-
-static void
-vc4_flush_texture_caches(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	V3D_WRITE(V3D_L2CACTL,
-		  V3D_L2CACTL_L2CCLR);
-
-	V3D_WRITE(V3D_SLCACTL,
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T1CC) |
-		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T0CC));
-}
-
-/* Sets the registers for the next job to be actually be executed in
- * the hardware.
- *
- * The job_lock should be held during this.
- */
-void
-vc4_submit_next_bin_job(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *exec;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return;
-
-again:
-	exec = vc4_first_bin_job(vc4);
-	if (!exec)
-		return;
-
-	vc4_flush_caches(dev);
-
-	/* Only start the perfmon if it was not already started by a previous
-	 * job.
-	 */
-	if (exec->perfmon && vc4->active_perfmon != exec->perfmon)
-		vc4_perfmon_start(vc4, exec->perfmon);
-
-	/* Either put the job in the binner if it uses the binner, or
-	 * immediately move it to the to-be-rendered queue.
-	 */
-	if (exec->ct0ca != exec->ct0ea) {
-		trace_vc4_submit_cl(dev, false, exec->seqno, exec->ct0ca,
-				    exec->ct0ea);
-		submit_cl(dev, 0, exec->ct0ca, exec->ct0ea);
-	} else {
-		struct vc4_exec_info *next;
-
-		vc4_move_job_to_render(dev, exec);
-		next = vc4_first_bin_job(vc4);
-
-		/* We can't start the next bin job if the previous job had a
-		 * different perfmon instance attached to it. The same goes
-		 * if one of them had a perfmon attached to it and the other
-		 * one doesn't.
-		 */
-		if (next && next->perfmon == exec->perfmon)
-			goto again;
-	}
-}
-
-void
-vc4_submit_next_render_job(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *exec = vc4_first_render_job(vc4);
-
-	if (!exec)
-		return;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return;
-
-	/* A previous RCL may have written to one of our textures, and
-	 * our full cache flush at bin time may have occurred before
-	 * that RCL completed.  Flush the texture cache now, but not
-	 * the instructions or uniforms (since we don't write those
-	 * from an RCL).
-	 */
-	vc4_flush_texture_caches(dev);
-
-	trace_vc4_submit_cl(dev, true, exec->seqno, exec->ct1ca, exec->ct1ea);
-	submit_cl(dev, 1, exec->ct1ca, exec->ct1ea);
-}
-
-void
-vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	bool was_empty = list_empty(&vc4->render_job_list);
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return;
-
-	list_move_tail(&exec->head, &vc4->render_job_list);
-	if (was_empty)
-		vc4_submit_next_render_job(dev);
-}
-
-static void
-vc4_attach_fences(struct vc4_exec_info *exec)
-{
-	struct vc4_bo *bo;
-	unsigned i;
-
-	for (i = 0; i < exec->bo_count; i++) {
-		bo = to_vc4_bo(exec->bo[i]);
-		dma_resv_add_fence(bo->base.base.resv, exec->fence,
-				   DMA_RESV_USAGE_READ);
-	}
-
-	for (i = 0; i < exec->rcl_write_bo_count; i++) {
-		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
-		dma_resv_add_fence(bo->base.base.resv, exec->fence,
-				   DMA_RESV_USAGE_WRITE);
-	}
-}
-
-/* Takes the reservation lock on all the BOs being referenced, so that
- * at queue submit time we can update the reservations.
- *
- * We don't lock the RCL the tile alloc/state BOs, or overflow memory
- * (all of which are on exec->unref_list).  They're entirely private
- * to vc4, so we don't attach dma-buf fences to them.
- */
-static int
-vc4_lock_bo_reservations(struct vc4_exec_info *exec,
-			 struct drm_exec *exec_ctx)
-{
-	int ret;
-
-	/* Reserve space for our shared (read-only) fence references,
-	 * before we commit the CL to the hardware.
-	 */
-	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
-	drm_exec_until_all_locked(exec_ctx) {
-		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
-					     exec->bo_count, 1);
-	}
-
-	if (ret) {
-		drm_exec_fini(exec_ctx);
-		return ret;
-	}
-
-	return 0;
-}
-
-/* Queues a struct vc4_exec_info for execution.  If no job is
- * currently executing, then submits it.
- *
- * Unlike most GPUs, our hardware only handles one command list at a
- * time.  To queue multiple jobs at once, we'd need to edit the
- * previous command list to have a jump to the new one at the end, and
- * then bump the end address.  That's a change for a later date,
- * though.
- */
-static int
-vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
-		 struct drm_exec *exec_ctx,
-		 struct drm_syncobj *out_sync)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *renderjob;
-	uint64_t seqno;
-	unsigned long irqflags;
-	struct vc4_fence *fence;
-
-	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
-	if (!fence)
-		return -ENOMEM;
-	fence->dev = dev;
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-
-	seqno = ++vc4->emit_seqno;
-	exec->seqno = seqno;
-
-	dma_fence_init(&fence->base, &vc4_fence_ops, &vc4->job_lock,
-		       vc4->dma_fence_context, exec->seqno);
-	fence->seqno = exec->seqno;
-	exec->fence = &fence->base;
-
-	if (out_sync)
-		drm_syncobj_replace_fence(out_sync, exec->fence);
-
-	vc4_attach_fences(exec);
-
-	drm_exec_fini(exec_ctx);
-
-	list_add_tail(&exec->head, &vc4->bin_job_list);
-
-	/* If no bin job was executing and if the render job (if any) has the
-	 * same perfmon as our job attached to it (or if both jobs don't have
-	 * perfmon activated), then kick ours off.  Otherwise, it'll get
-	 * started when the previous job's flush/render done interrupt occurs.
-	 */
-	renderjob = vc4_first_render_job(vc4);
-	if (vc4_first_bin_job(vc4) == exec &&
-	    (!renderjob || renderjob->perfmon == exec->perfmon)) {
-		vc4_submit_next_bin_job(dev);
-		vc4_queue_hangcheck(dev);
-	}
-
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	return 0;
-}
-
-/**
- * vc4_cl_lookup_bos() - Sets up exec->bo[] with the GEM objects
- * referenced by the job.
- * @dev: DRM device
- * @file_priv: DRM file for this fd
- * @exec: V3D job being set up
- *
- * The command validator needs to reference BOs by their index within
- * the submitted job's BO list.  This does the validation of the job's
- * BO list and reference counting for the lifetime of the job.
- */
-static int
-vc4_cl_lookup_bos(struct drm_device *dev,
-		  struct drm_file *file_priv,
-		  struct vc4_exec_info *exec)
-{
-	struct drm_vc4_submit_cl *args = exec->args;
-	int ret = 0;
-	int i;
-
-	exec->bo_count = args->bo_handle_count;
-
-	if (!exec->bo_count) {
-		/* See comment on bo_index for why we have to check
-		 * this.
-		 */
-		DRM_DEBUG("Rendering requires BOs to validate\n");
-		return -EINVAL;
-	}
-
-	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
-				     exec->bo_count, &exec->bo);
-
-	if (ret)
-		goto fail_put_bo;
-
-	for (i = 0; i < exec->bo_count; i++) {
-		ret = vc4_bo_inc_usecnt(to_vc4_bo(exec->bo[i]));
-		if (ret)
-			goto fail_dec_usecnt;
-	}
-
-	return 0;
-
-fail_dec_usecnt:
-	/* Decrease usecnt on acquired objects.
-	 * We cannot rely on  vc4_complete_exec() to release resources here,
-	 * because vc4_complete_exec() has no information about which BO has
-	 * had its ->usecnt incremented.
-	 * To make things easier we just free everything explicitly and set
-	 * exec->bo to NULL so that vc4_complete_exec() skips the 'BO release'
-	 * step.
-	 */
-	for (i-- ; i >= 0; i--)
-		vc4_bo_dec_usecnt(to_vc4_bo(exec->bo[i]));
-
-fail_put_bo:
-	/* Release any reference to acquired objects. */
-	for (i = 0; i < exec->bo_count && exec->bo[i]; i++)
-		drm_gem_object_put(exec->bo[i]);
-
-	kvfree(exec->bo);
-	exec->bo = NULL;
-	return ret;
-}
-
-static int
-vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
-{
-	struct drm_vc4_submit_cl *args = exec->args;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	void *temp = NULL;
-	void *bin;
-	int ret = 0;
-	uint32_t bin_offset = 0;
-	uint32_t shader_rec_offset = roundup(bin_offset + args->bin_cl_size,
-					     16);
-	uint32_t uniforms_offset = shader_rec_offset + args->shader_rec_size;
-	uint32_t exec_size = uniforms_offset + args->uniforms_size;
-	uint32_t temp_size = exec_size + (sizeof(struct vc4_shader_state) *
-					  args->shader_rec_count);
-	struct vc4_bo *bo;
-
-	if (shader_rec_offset < args->bin_cl_size ||
-	    uniforms_offset < shader_rec_offset ||
-	    exec_size < uniforms_offset ||
-	    args->shader_rec_count >= (UINT_MAX /
-					  sizeof(struct vc4_shader_state)) ||
-	    temp_size < exec_size) {
-		DRM_DEBUG("overflow in exec arguments\n");
-		ret = -EINVAL;
-		goto fail;
-	}
-
-	/* Allocate space where we'll store the copied in user command lists
-	 * and shader records.
-	 *
-	 * We don't just copy directly into the BOs because we need to
-	 * read the contents back for validation, and I think the
-	 * bo->vaddr is uncached access.
-	 */
-	temp = kvmalloc_array(temp_size, 1, GFP_KERNEL);
-	if (!temp) {
-		drm_err(dev, "Failed to allocate storage for copying "
-			"in bin/render CLs.\n");
-		ret = -ENOMEM;
-		goto fail;
-	}
-	bin = temp + bin_offset;
-	exec->shader_rec_u = temp + shader_rec_offset;
-	exec->uniforms_u = temp + uniforms_offset;
-	exec->shader_state = temp + exec_size;
-	exec->shader_state_size = args->shader_rec_count;
-
-	if (copy_from_user(bin,
-			   u64_to_user_ptr(args->bin_cl),
-			   args->bin_cl_size)) {
-		ret = -EFAULT;
-		goto fail;
-	}
-
-	if (copy_from_user(exec->shader_rec_u,
-			   u64_to_user_ptr(args->shader_rec),
-			   args->shader_rec_size)) {
-		ret = -EFAULT;
-		goto fail;
-	}
-
-	if (copy_from_user(exec->uniforms_u,
-			   u64_to_user_ptr(args->uniforms),
-			   args->uniforms_size)) {
-		ret = -EFAULT;
-		goto fail;
-	}
-
-	bo = vc4_bo_create(dev, exec_size, true, VC4_BO_TYPE_BCL);
-	if (IS_ERR(bo)) {
-		drm_err(dev, "Couldn't allocate BO for binning\n");
-		ret = PTR_ERR(bo);
-		goto fail;
-	}
-	exec->exec_bo = &bo->base;
-
-	list_add_tail(&to_vc4_bo(&exec->exec_bo->base)->unref_head,
-		      &exec->unref_list);
-
-	exec->ct0ca = exec->exec_bo->dma_addr + bin_offset;
-
-	exec->bin_u = bin;
-
-	exec->shader_rec_v = exec->exec_bo->vaddr + shader_rec_offset;
-	exec->shader_rec_p = exec->exec_bo->dma_addr + shader_rec_offset;
-	exec->shader_rec_size = args->shader_rec_size;
-
-	exec->uniforms_v = exec->exec_bo->vaddr + uniforms_offset;
-	exec->uniforms_p = exec->exec_bo->dma_addr + uniforms_offset;
-	exec->uniforms_size = args->uniforms_size;
-
-	ret = vc4_validate_bin_cl(dev,
-				  exec->exec_bo->vaddr + bin_offset,
-				  bin,
-				  exec);
-	if (ret)
-		goto fail;
-
-	ret = vc4_validate_shader_recs(dev, exec);
-	if (ret)
-		goto fail;
-
-	if (exec->found_tile_binning_mode_config_packet) {
-		ret = vc4_v3d_bin_bo_get(vc4, &exec->bin_bo_used);
-		if (ret)
-			goto fail;
-	}
-
-fail:
-	kvfree(temp);
-	return ret;
-}
-
-static void
-vc4_complete_exec(struct drm_device *dev, struct vc4_exec_info *exec)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	unsigned long irqflags;
-	unsigned i;
-
-	/* If we got force-completed because of GPU reset rather than
-	 * through our IRQ handler, signal the fence now.
-	 */
-	if (exec->fence) {
-		dma_fence_signal(exec->fence);
-		dma_fence_put(exec->fence);
-	}
-
-	if (exec->bo) {
-		for (i = 0; i < exec->bo_count; i++) {
-			struct vc4_bo *bo = to_vc4_bo(exec->bo[i]);
-
-			vc4_bo_dec_usecnt(bo);
-			drm_gem_object_put(exec->bo[i]);
-		}
-		kvfree(exec->bo);
-	}
-
-	while (!list_empty(&exec->unref_list)) {
-		struct vc4_bo *bo = list_first_entry(&exec->unref_list,
-						     struct vc4_bo, unref_head);
-		list_del(&bo->unref_head);
-		drm_gem_object_put(&bo->base.base);
-	}
-
-	/* Free up the allocation of any bin slots we used. */
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	vc4->bin_alloc_used &= ~exec->bin_slots;
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	/* Release the reference on the binner BO if needed. */
-	if (exec->bin_bo_used)
-		vc4_v3d_bin_bo_put(vc4);
-
-	/* Release the reference we had on the perf monitor. */
-	vc4_perfmon_put(exec->perfmon);
-
-	vc4_v3d_pm_put(vc4);
-
-	kfree(exec);
-}
-
-void
-vc4_job_handle_completed(struct vc4_dev *vc4)
-{
-	unsigned long irqflags;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return;
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	while (!list_empty(&vc4->job_done_list)) {
-		struct vc4_exec_info *exec =
-			list_first_entry(&vc4->job_done_list,
-					 struct vc4_exec_info, head);
-		list_del(&exec->head);
-
-		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-		vc4_complete_exec(&vc4->base, exec);
-		spin_lock_irqsave(&vc4->job_lock, irqflags);
-	}
-
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-}
-
-/* Scheduled when any job has been completed, this walks the list of
- * jobs that had completed and unrefs their BOs and frees their exec
- * structs.
- */
-static void
-vc4_job_done_work(struct work_struct *work)
-{
-	struct vc4_dev *vc4 =
-		container_of(work, struct vc4_dev, job_done_work);
-
-	vc4_job_handle_completed(vc4);
-}
-
-static int
-vc4_wait_for_seqno_ioctl_helper(struct drm_device *dev,
-				uint64_t seqno,
-				uint64_t *timeout_ns)
-{
-	unsigned long start = jiffies;
-	int ret = vc4_wait_for_seqno(dev, seqno, *timeout_ns, true);
-
-	if ((ret == -EINTR || ret == -ERESTARTSYS) && *timeout_ns != ~0ull) {
-		uint64_t delta = jiffies_to_nsecs(jiffies - start);
-
-		if (*timeout_ns >= delta)
-			*timeout_ns -= delta;
-	}
-
-	return ret;
-}
-
-int
-vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
-		     struct drm_file *file_priv)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_vc4_wait_seqno *args = data;
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return -ENODEV;
-
-	return vc4_wait_for_seqno_ioctl_helper(dev, args->seqno,
-					       &args->timeout_ns);
-}
-
-/**
- * vc4_submit_cl_ioctl() - Submits a job (frame) to the VC4.
- * @dev: DRM device
- * @data: ioctl argument
- * @file_priv: DRM file for this fd
- *
- * This is the main entrypoint for userspace to submit a 3D frame to
- * the GPU.  Userspace provides the binner command list (if
- * applicable), and the kernel sets up the render command list to draw
- * to the framebuffer described in the ioctl, using the command lists
- * that the 3D engine's binner will produce.
- */
-int
-vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
-		    struct drm_file *file_priv)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_file *vc4file = file_priv->driver_priv;
-	struct drm_vc4_submit_cl *args = data;
-	struct drm_syncobj *out_sync = NULL;
-	struct vc4_exec_info *exec;
-	struct drm_exec exec_ctx;
-	struct dma_fence *in_fence;
-	int ret = 0;
-
-	trace_vc4_submit_cl_ioctl(dev, args->bin_cl_size,
-				  args->shader_rec_size,
-				  args->bo_handle_count);
-
-	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
-		return -ENODEV;
-
-	if (!vc4->v3d) {
-		DRM_DEBUG("VC4_SUBMIT_CL with no VC4 V3D probed\n");
-		return -ENODEV;
-	}
-
-	if ((args->flags & ~(VC4_SUBMIT_CL_USE_CLEAR_COLOR |
-			     VC4_SUBMIT_CL_FIXED_RCL_ORDER |
-			     VC4_SUBMIT_CL_RCL_ORDER_INCREASING_X |
-			     VC4_SUBMIT_CL_RCL_ORDER_INCREASING_Y)) != 0) {
-		DRM_DEBUG("Unknown flags: 0x%02x\n", args->flags);
-		return -EINVAL;
-	}
-
-	if (args->pad2 != 0) {
-		DRM_DEBUG("Invalid pad: 0x%08x\n", args->pad2);
-		return -EINVAL;
-	}
-
-	exec = kcalloc(1, sizeof(*exec), GFP_KERNEL);
-	if (!exec)
-		return -ENOMEM;
-
-	exec->dev = vc4;
-
-	ret = vc4_v3d_pm_get(vc4);
-	if (ret) {
-		kfree(exec);
-		return ret;
-	}
-
-	exec->args = args;
-	INIT_LIST_HEAD(&exec->unref_list);
-
-	ret = vc4_cl_lookup_bos(dev, file_priv, exec);
-	if (ret)
-		goto fail;
-
-	if (args->perfmonid) {
-		exec->perfmon = vc4_perfmon_find(vc4file,
-						 args->perfmonid);
-		if (!exec->perfmon) {
-			ret = -ENOENT;
-			goto fail;
-		}
-	}
-
-	if (args->in_sync) {
-		ret = drm_syncobj_find_fence(file_priv, args->in_sync,
-					     0, 0, &in_fence);
-		if (ret)
-			goto fail;
-
-		/* When the fence (or fence array) is exclusively from our
-		 * context we can skip the wait since jobs are executed in
-		 * order of their submission through this ioctl and this can
-		 * only have fences from a prior job.
-		 */
-		if (!dma_fence_match_context(in_fence,
-					     vc4->dma_fence_context)) {
-			ret = dma_fence_wait(in_fence, true);
-			if (ret) {
-				dma_fence_put(in_fence);
-				goto fail;
-			}
-		}
-
-		dma_fence_put(in_fence);
-	}
-
-	if (exec->args->bin_cl_size != 0) {
-		ret = vc4_get_bcl(dev, exec);
-		if (ret)
-			goto fail;
-	} else {
-		exec->ct0ca = 0;
-		exec->ct0ea = 0;
-	}
-
-	ret = vc4_get_rcl(dev, exec);
-	if (ret)
-		goto fail;
-
-	ret = vc4_lock_bo_reservations(exec, &exec_ctx);
-	if (ret)
-		goto fail;
-
-	if (args->out_sync) {
-		out_sync = drm_syncobj_find(file_priv, args->out_sync);
-		if (!out_sync) {
-			ret = -EINVAL;
-			goto fail_unreserve;
-		}
-
-		/* We replace the fence in out_sync in vc4_queue_submit since
-		 * the render job could execute immediately after that call.
-		 * If it finishes before our ioctl processing resumes the
-		 * render job fence could already have been freed.
-		 */
-	}
-
-	/* Clear this out of the struct we'll be putting in the queue,
-	 * since it's part of our stack.
-	 */
-	exec->args = NULL;
-
-	ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
-
-	/* The syncobj isn't part of the exec data and we need to free our
-	 * reference even if job submission failed.
-	 */
-	if (out_sync)
-		drm_syncobj_put(out_sync);
-
-	if (ret)
-		goto fail_unreserve;
-
-	/* Return the seqno for our job. */
-	args->seqno = vc4->emit_seqno;
-
-	return 0;
-
-fail_unreserve:
-	drm_exec_fini(&exec_ctx);
-fail:
-	vc4_complete_exec(&vc4->base, exec);
-
-	return ret;
-}
-
 static void vc4_gem_destroy(struct drm_device *dev, void *unused);
 int vc4_gem_init(struct drm_device *dev)
 {
@@ -1139,11 +279,6 @@ int vc4_gem_init(struct drm_device *dev)
 		spin_lock_init(&queue->fence_lock);
 	}
 
-	vc4->dma_fence_context = dma_fence_context_alloc(1);
-
-	INIT_LIST_HEAD(&vc4->bin_job_list);
-	INIT_LIST_HEAD(&vc4->render_job_list);
-	INIT_LIST_HEAD(&vc4->job_done_list);
 	spin_lock_init(&vc4->job_lock);
 	ret = drmm_mutex_init(dev, &vc4->reset_lock);
 	if (ret)
@@ -1152,11 +287,6 @@ int vc4_gem_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&vc4->hangcheck.reset_work, vc4_reset_work);
-	timer_setup(&vc4->hangcheck.timer, vc4_hangcheck_elapsed, 0);
-
-	INIT_WORK(&vc4->job_done_work, vc4_job_done_work);
-
 	ret = drmm_mutex_init(dev, &vc4->power_lock);
 	if (ret)
 		return ret;
@@ -1181,7 +311,8 @@ static void vc4_gem_destroy(struct drm_device *dev, void *unused)
 	/* Waiting for exec to finish would need to be done before
 	 * unregistering V3D.
 	 */
-	WARN_ON(vc4->emit_seqno != vc4->finished_seqno);
+	WARN_ON(vc4->bin_job);
+	WARN_ON(vc4->render_job);
 
 	/* V3D should already have disabled its interrupt and cleared
 	 * the overflow allocation registers.  Now free the object.
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 63e88f90eef7c0720e32547f4e8b5ed289b2427b..aa6cccf58917a51549099ede4b3272e9627ff39c 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -65,7 +65,6 @@ vc4_overflow_mem_work(struct work_struct *work)
 		container_of(work, struct vc4_dev, overflow_mem_work);
 	struct vc4_bo *bo;
 	int bin_bo_slot;
-	struct vc4_exec_info *exec;
 	unsigned long irqflags;
 
 	mutex_lock(&vc4->bin_bo_lock);
@@ -85,16 +84,14 @@ vc4_overflow_mem_work(struct work_struct *work)
 
 	if (vc4->bin_alloc_overflow) {
 		/* If we had overflow memory allocated previously,
-		 * then that chunk will free when the current bin job
-		 * is done.  If we don't have a bin job running, then
-		 * the chunk will be done whenever the list of render
-		 * jobs has drained.
+		 * then that chunk will free when the current render job
+		 * is done. If we don't have a render job running, then
+		 * the chunk is free immediately.
 		 */
-		exec = vc4_first_bin_job(vc4);
-		if (!exec)
-			exec = vc4_last_render_job(vc4);
-		if (exec) {
-			exec->bin_slots |= vc4->bin_alloc_overflow;
+		if (vc4->bin_job) {
+			vc4->bin_job->render->bin_slots |= vc4->bin_alloc_overflow;
+		} else if (vc4->render_job) {
+			vc4->render_job->bin_slots |= vc4->bin_alloc_overflow;
 		} else {
 			/* There's nothing queued in the hardware, so
 			 * the old slot is free immediately.
@@ -114,92 +111,6 @@ vc4_overflow_mem_work(struct work_struct *work)
 	mutex_unlock(&vc4->bin_bo_lock);
 }
 
-static void
-vc4_irq_finish_bin_job(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *next, *exec = vc4_first_bin_job(vc4);
-
-	if (!exec)
-		return;
-
-	trace_vc4_bcl_end_irq(dev, exec->seqno);
-
-	vc4_move_job_to_render(dev, exec);
-	next = vc4_first_bin_job(vc4);
-
-	/* Only submit the next job in the bin list if it matches the perfmon
-	 * attached to the one that just finished (or if both jobs don't have
-	 * perfmon attached to them).
-	 */
-	if (next && next->perfmon == exec->perfmon)
-		vc4_submit_next_bin_job(dev);
-}
-
-static void
-vc4_cancel_bin_job(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *exec = vc4_first_bin_job(vc4);
-
-	if (!exec)
-		return;
-
-	/* Stop the perfmon so that the next bin job can be started. */
-	if (exec->perfmon)
-		vc4_perfmon_stop(vc4, exec->perfmon, false);
-
-	list_move_tail(&exec->head, &vc4->bin_job_list);
-	vc4_submit_next_bin_job(dev);
-}
-
-static void
-vc4_irq_finish_render_job(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_exec_info *exec = vc4_first_render_job(vc4);
-	struct vc4_exec_info *nextbin, *nextrender;
-
-	if (!exec)
-		return;
-
-	trace_vc4_rcl_end_irq(dev, exec->seqno);
-
-	vc4->finished_seqno++;
-	list_move_tail(&exec->head, &vc4->job_done_list);
-
-	nextbin = vc4_first_bin_job(vc4);
-	nextrender = vc4_first_render_job(vc4);
-
-	/* Only stop the perfmon if following jobs in the queue don't expect it
-	 * to be enabled.
-	 */
-	if (exec->perfmon && !nextrender &&
-	    (!nextbin || nextbin->perfmon != exec->perfmon))
-		vc4_perfmon_stop(vc4, exec->perfmon, true);
-
-	/* If there's a render job waiting, start it. If this is not the case
-	 * we may have to unblock the binner if it's been stalled because of
-	 * perfmon (this can be checked by comparing the perfmon attached to
-	 * the finished renderjob to the one attached to the next bin job: if
-	 * they don't match, this means the binner is stalled and should be
-	 * restarted).
-	 */
-	if (nextrender)
-		vc4_submit_next_render_job(dev);
-	else if (nextbin && nextbin->perfmon != exec->perfmon)
-		vc4_submit_next_bin_job(dev);
-
-	if (exec->fence) {
-		dma_fence_signal_locked(exec->fence);
-		dma_fence_put(exec->fence);
-		exec->fence = NULL;
-	}
-
-	wake_up_all(&vc4->job_wait_queue);
-	schedule_work(&vc4->job_done_work);
-}
-
 static irqreturn_t
 vc4_irq(int irq, void *arg)
 {
@@ -226,16 +137,26 @@ vc4_irq(int irq, void *arg)
 	}
 
 	if (intctl & V3D_INT_FLDONE) {
-		spin_lock(&vc4->job_lock);
-		vc4_irq_finish_bin_job(dev);
-		spin_unlock(&vc4->job_lock);
+		struct vc4_fence *fence =
+			to_vc4_fence(vc4->bin_job->base.irq_fence);
+
+		trace_vc4_bcl_end_irq(dev, fence->seqno);
+
+		vc4->bin_job = NULL;
+		dma_fence_signal(&fence->base);
+
 		status = IRQ_HANDLED;
 	}
 
 	if (intctl & V3D_INT_FRDONE) {
-		spin_lock(&vc4->job_lock);
-		vc4_irq_finish_render_job(dev);
-		spin_unlock(&vc4->job_lock);
+		struct vc4_fence *fence =
+			to_vc4_fence(vc4->render_job->base.irq_fence);
+
+		trace_vc4_rcl_end_irq(dev, fence->seqno);
+
+		vc4->render_job = NULL;
+		dma_fence_signal(&fence->base);
+
 		status = IRQ_HANDLED;
 	}
 
@@ -250,7 +171,6 @@ vc4_irq_prepare(struct drm_device *dev)
 	if (!vc4->v3d)
 		return;
 
-	init_waitqueue_head(&vc4->job_wait_queue);
 	INIT_WORK(&vc4->overflow_mem_work, vc4_overflow_mem_work);
 
 	/* Clear any pending interrupts someone might have left around
@@ -336,7 +256,6 @@ void vc4_irq_uninstall(struct drm_device *dev)
 void vc4_irq_reset(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	unsigned long irqflags;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
@@ -351,9 +270,4 @@ void vc4_irq_reset(struct drm_device *dev)
 	 * memory yet.
 	 */
 	V3D_WRITE(V3D_INTENA, V3D_DRIVER_IRQS);
-
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	vc4_cancel_bin_job(dev);
-	vc4_irq_finish_render_job(dev);
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index edc471e71c0eb1729c0dcf823ca6c9e0a7e207ed..6c8aa49d6f84bdbfb98289599196732b1fac5049 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -255,6 +255,7 @@ static void emit_tile(struct vc4_exec_info *exec,
 static int vc4_create_rcl_bo(struct drm_device *dev, struct vc4_exec_info *exec,
 			     struct vc4_rcl_setup *setup)
 {
+	struct vc4_render_job *render = exec->render;
 	struct drm_vc4_submit_cl *args = exec->args;
 	bool has_bin = args->bin_cl_size != 0;
 	uint8_t min_x_tile = args->min_x_tile;
@@ -334,7 +335,7 @@ static int vc4_create_rcl_bo(struct drm_device *dev, struct vc4_exec_info *exec,
 	if (IS_ERR(setup->rcl))
 		return PTR_ERR(setup->rcl);
 	list_add_tail(&to_vc4_bo(&setup->rcl->base)->unref_head,
-		      &exec->unref_list);
+		      &render->unref_list);
 
 	/* The tile buffer gets cleared when the previous tile is stored.  If
 	 * the clear values changed between frames, then the tile buffer has
@@ -376,8 +377,8 @@ static int vc4_create_rcl_bo(struct drm_device *dev, struct vc4_exec_info *exec,
 	}
 
 	BUG_ON(setup->next_offset != size);
-	exec->ct1ca = setup->rcl->dma_addr;
-	exec->ct1ea = setup->rcl->dma_addr + setup->next_offset;
+	render->ct1ca = setup->rcl->dma_addr;
+	render->ct1ea = setup->rcl->dma_addr + setup->next_offset;
 
 	return 0;
 }
@@ -412,6 +413,8 @@ static int vc4_rcl_msaa_surface_setup(struct vc4_exec_info *exec,
 				      struct drm_gem_dma_object **obj,
 				      struct drm_vc4_submit_rcl_surface *surf)
 {
+	struct vc4_render_job *render = exec->render;
+
 	if (surf->flags != 0 || surf->bits != 0) {
 		DRM_DEBUG("MSAA surface had nonzero flags/bits\n");
 		return -EINVAL;
@@ -424,7 +427,7 @@ static int vc4_rcl_msaa_surface_setup(struct vc4_exec_info *exec,
 	if (!*obj)
 		return -EINVAL;
 
-	exec->rcl_write_bo[exec->rcl_write_bo_count++] = *obj;
+	render->rcl_write_bo[render->rcl_write_bo_count++] = *obj;
 
 	if (surf->offset & 0xf) {
 		DRM_DEBUG("MSAA write must be 16b aligned.\n");
@@ -439,6 +442,7 @@ static int vc4_rcl_surface_setup(struct vc4_exec_info *exec,
 				 struct drm_vc4_submit_rcl_surface *surf,
 				 bool is_write)
 {
+	struct vc4_render_job *render = exec->render;
 	uint8_t tiling = VC4_GET_FIELD(surf->bits,
 				       VC4_LOADSTORE_TILE_BUFFER_TILING);
 	uint8_t buffer = VC4_GET_FIELD(surf->bits,
@@ -461,7 +465,7 @@ static int vc4_rcl_surface_setup(struct vc4_exec_info *exec,
 		return -EINVAL;
 
 	if (is_write)
-		exec->rcl_write_bo[exec->rcl_write_bo_count++] = *obj;
+		render->rcl_write_bo[render->rcl_write_bo_count++] = *obj;
 
 	if (surf->flags & VC4_SUBMIT_RCL_SURFACE_READ_IS_FULL_RES) {
 		if (surf == &exec->args->zs_write) {
@@ -538,6 +542,7 @@ vc4_rcl_render_config_surface_setup(struct vc4_exec_info *exec,
 				    struct drm_gem_dma_object **obj,
 				    struct drm_vc4_submit_rcl_surface *surf)
 {
+	struct vc4_render_job *render = exec->render;
 	uint8_t tiling = VC4_GET_FIELD(surf->bits,
 				       VC4_RENDER_CONFIG_MEMORY_FORMAT);
 	uint8_t format = VC4_GET_FIELD(surf->bits,
@@ -565,7 +570,7 @@ vc4_rcl_render_config_surface_setup(struct vc4_exec_info *exec,
 	if (!*obj)
 		return -EINVAL;
 
-	exec->rcl_write_bo[exec->rcl_write_bo_count++] = *obj;
+	render->rcl_write_bo[render->rcl_write_bo_count++] = *obj;
 
 	if (tiling > VC4_TILING_FORMAT_LT) {
 		DRM_DEBUG("Bad tiling format\n");
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d31b906cb8e787517ba3ff72c236ffcf810522b1..4a3de002ad841f3c35f4a91d3bf6d8b3acd7daba 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -174,11 +174,10 @@ static void vc4_v3d_init_hw(struct drm_device *dev)
 
 int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 {
-	struct drm_device *dev = &vc4->base;
+	struct dma_fence *fence;
 	unsigned long irqflags;
 	int slot;
-	uint64_t seqno = 0;
-	struct vc4_exec_info *exec;
+	long ret;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
@@ -194,21 +193,20 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 		return slot;
 	}
 
-	/* Couldn't find an open slot.  Wait for render to complete
+	/* Couldn't find an open slot. Wait for render to complete
 	 * and try again.
 	 */
-	exec = vc4_last_render_job(vc4);
-	if (exec)
-		seqno = exec->seqno;
+	fence = NULL;
+	if (vc4->render_job)
+		fence = dma_fence_get(vc4->render_job->base.done_fence);
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
 
-	if (seqno) {
-		int ret = vc4_wait_for_seqno(dev, seqno, ~0ull, true);
-
-		if (ret == 0)
+	if (fence) {
+		ret = dma_fence_wait_timeout(fence, true, MAX_SCHEDULE_TIMEOUT);
+		dma_fence_put(fence);
+		if (ret > 0)
 			goto try_again;
-
-		return ret;
+		return ret < 0 ? ret : -ETIMEDOUT;
 	}
 
 	return -ENOMEM;
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 545c4c3608f5683209ea1462d61d9d0dd68d0bd7..39dc3e42ac430d133edf29de565bbb409cc0e55f 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -108,18 +108,19 @@ struct drm_gem_dma_object *
 vc4_use_bo(struct vc4_exec_info *exec, uint32_t hindex)
 {
 	struct vc4_dev *vc4 = exec->dev;
+	struct vc4_render_job *render = exec->render;
 	struct drm_gem_dma_object *obj;
 	struct vc4_bo *bo;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return NULL;
 
-	if (hindex >= exec->bo_count) {
+	if (hindex >= render->bo_count) {
 		DRM_DEBUG("BO index %d greater than BO count %d\n",
-			  hindex, exec->bo_count);
+			  hindex, render->bo_count);
 		return NULL;
 	}
-	obj = to_drm_gem_dma_obj(exec->bo[hindex]);
+	obj = to_drm_gem_dma_obj(render->bo[hindex]);
 	bo = to_vc4_bo(&obj->base);
 
 	if (bo->validated_shader) {
@@ -355,8 +356,8 @@ validate_gl_shader_state(VALIDATE_ARGS)
 static int
 validate_tile_binning_config(VALIDATE_ARGS)
 {
-	struct drm_device *dev = exec->exec_bo->base.dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_dev *vc4 = exec->dev;
+	struct drm_device *dev = &vc4->base;
 	uint8_t flags;
 	uint32_t tile_state_size;
 	uint32_t tile_count, bin_addr;
@@ -398,7 +399,7 @@ validate_tile_binning_config(VALIDATE_ARGS)
 	/* The slot we allocated will only be used by this job, and is
 	 * free when the job completes rendering.
 	 */
-	exec->bin_slots |= BIT(bin_slot);
+	exec->render->bin_slots |= BIT(bin_slot);
 	bin_addr = vc4->bin_bo->base.dma_addr + bin_slot * vc4->bin_alloc_size;
 
 	/* The tile state data array is 48 bytes per tile, and we put it at
@@ -489,6 +490,7 @@ vc4_validate_bin_cl(struct drm_device *dev,
 		    void *unvalidated,
 		    struct vc4_exec_info *exec)
 {
+	struct vc4_bin_job *bin = exec->bin;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	uint32_t len = exec->args->bin_cl_size;
 	uint32_t dst_offset = 0;
@@ -545,7 +547,7 @@ vc4_validate_bin_cl(struct drm_device *dev,
 			break;
 	}
 
-	exec->ct0ea = exec->ct0ca + dst_offset;
+	bin->ct0ea = bin->ct0ca + dst_offset;
 
 	if (!exec->found_start_tile_binning_packet) {
 		DRM_DEBUG("Bin CL missing VC4_PACKET_START_TILE_BINNING\n");
@@ -761,6 +763,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 	uint32_t shader_reloc_count = ARRAY_SIZE(shader_reloc_offsets);
 	struct drm_gem_dma_object *bo[ARRAY_SIZE(shader_reloc_offsets) + 8];
 	uint32_t nr_attributes, nr_relocs, packet_size;
+	struct vc4_render_job *render = exec->render;
 	int i;
 
 	nr_attributes = state->addr & 0x7;
@@ -799,12 +802,12 @@ validate_gl_shader_rec(struct drm_device *dev,
 	exec->shader_rec_size -= packet_size;
 
 	for (i = 0; i < shader_reloc_count; i++) {
-		if (src_handles[i] > exec->bo_count) {
+		if (src_handles[i] > render->bo_count) {
 			DRM_DEBUG("Shader handle %d too big\n", src_handles[i]);
 			return -EINVAL;
 		}
 
-		bo[i] = to_drm_gem_dma_obj(exec->bo[src_handles[i]]);
+		bo[i] = to_drm_gem_dma_obj(render->bo[src_handles[i]]);
 		if (!bo[i])
 			return -EINVAL;
 	}

-- 
2.52.0

