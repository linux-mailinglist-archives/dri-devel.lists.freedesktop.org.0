Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JHXJ8x0qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:19:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733D2117BE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3410E293;
	Thu,  5 Mar 2026 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nh/RwnQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7CB10E293
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mmus++X1aStF5G4xL6G52u6tbWBeCkx6SybKDqxaTrg=; b=nh/RwnQOTVNu3MwLncjUAt8yuq
 LbxBo3e1TWIJp+TqcM85RUlTor4o/kAajoK0TllOdOlDtvErP8Ur5AoRiXR+D8+FZyo5pGuxCg5m4
 7paWBoIpqChBTxtAalzFsmnjbTjeNwJRfoP0P65fURapxnK6zMHeiEp4pvduuEfRGZaEytS56iPKX
 kaeg77lJSbLSRqUzkS9dKW6yo0NssA3vuUDAhV1QE7avQUidUEuaCPvYvnWnlZDDBXyxJIQCVl9mu
 gfanyga2jKQ5UwLBcH8Qfl5qza4WlAFjspgioLCz4/yTOjNGFBi1yiTiT+S3eVlUFTKUed2LgHqfv
 B/4pvKlg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy7fa-009M5G-2k; Thu, 05 Mar 2026 13:19:10 +0100
Message-ID: <d7b29e86-c5fe-451a-b52d-62b78d908031@igalia.com>
Date: Thu, 5 Mar 2026 12:19:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/vc4: Add DRM GPU scheduler infrastructure
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-5-c6174fd7bbc1@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-5-c6174fd7bbc1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Queue-Id: 0733D2117BE
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
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.331];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[args.name:url,igalia.com:mid,igalia.com:email,base.base:url]
X-Rspamd-Action: no action


On 05/02/2026 21:31, Maíra Canal wrote:
> Add the core infrastructure to integrate the DRM GPU scheduler. This
> commit introduces the file "vc4_sched.c", which implements scheduler
> operations for BIN and RENDER queues, timeout handling, and job cleanup.
> Each queue has its own scheduler instance.
> 
> This implementation follows the same design as the v3d driver.
> 
> The scheduler is initialized at driver load but not yet wired to the
> submission path. As of this commit, the jobs still flow through the
> legacy code. The actual switchover happens in a subsequent commit.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/Kconfig     |   1 +
>   drivers/gpu/drm/vc4/Makefile    |   1 +
>   drivers/gpu/drm/vc4/vc4_drv.c   |  13 ++
>   drivers/gpu/drm/vc4/vc4_drv.h   |  40 ++++-
>   drivers/gpu/drm/vc4/vc4_fence.c |  17 +++
>   drivers/gpu/drm/vc4/vc4_gem.c   |  23 ++-
>   drivers/gpu/drm/vc4/vc4_sched.c | 322 ++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 414 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index bb8c40be325033632d3e94db87a16b03554ad3af..c9839e0dd408f1e3d6b0994b7482a20244334449 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -23,6 +23,7 @@ config DRM_VC4
>   	select SND_SOC_GENERIC_DMAENGINE_PCM
>   	select SND_SOC_HDMI_CODEC
>   	select DRM_MIPI_DSI
> +	select DRM_SCHED
>   	help
>   	  Choose this option if you have a system that has a Broadcom
>   	  VC4 GPU, such as the Raspberry Pi or other BCM2708/BCM2835.
> diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
> index c41f89a15a5504f8f777e217ed01024463768044..8b8562000cf03413898dbeac6ebf3ec6a4f47e52 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -19,6 +19,7 @@ vc4-y := \
>   	vc4_perfmon.o \
>   	vc4_plane.o \
>   	vc4_render_cl.o \
> +	vc4_sched.o \
>   	vc4_trace_points.o \
>   	vc4_txp.o \
>   	vc4_v3d.o \
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 3846996f9028c865f7e489dd10290a5621a03bab..c18178f6c8cea0a182dc67c2b8a992d127c87fec 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -147,7 +147,9 @@ static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
>   static int vc4_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +	struct drm_gpu_scheduler *sched;
>   	struct vc4_file *vc4file;
> +	enum vc4_queue q;
>   
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return -ENODEV;
> @@ -157,6 +159,13 @@ static int vc4_open(struct drm_device *dev, struct drm_file *file)
>   		return -ENOMEM;
>   	vc4file->dev = vc4;
>   
> +	for (q = 0; q < VC4_MAX_QUEUES; q++) {
> +		sched = &vc4->queue[q].sched;
> +		drm_sched_entity_init(&vc4file->sched_entity[q],
> +				      DRM_SCHED_PRIORITY_NORMAL, &sched,
> +				      1, NULL);

For now drm_sched_entity_init still returns an int so error handling 
would be good.

> +	}
> +
>   	vc4_perfmon_open_file(vc4file);
>   	file->driver_priv = vc4file;
>   	return 0;
> @@ -166,6 +175,7 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
>   	struct vc4_file *vc4file = file->driver_priv;
> +	enum vc4_queue q;
>   
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return;
> @@ -173,6 +183,9 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
>   	if (vc4file->bin_bo_used)
>   		vc4_v3d_bin_bo_put(vc4);
>   
> +	for (q = 0; q < VC4_MAX_QUEUES; q++)
> +		drm_sched_entity_destroy(&vc4file->sched_entity[q]);
> +
>   	vc4_perfmon_close_file(vc4file);
>   	kfree(vc4file);
>   }
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 0f6b7cda1193f0e5ee6b7a504ff447460dedab20..dc04803efad9fdf9179a98701b31b9e360e9ab15 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -20,6 +20,7 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_mm.h>
>   #include <drm/drm_modeset_lock.h>
> +#include <drm/gpu_scheduler.h>
>   
>   #include <kunit/test-bug.h>
>   
> @@ -31,6 +32,21 @@ struct drm_gem_object;
>   extern const struct drm_driver vc4_drm_driver;
>   extern const struct drm_driver vc5_drm_driver;
>   
> +enum vc4_queue {
> +	VC4_BIN,
> +	VC4_RENDER,
> +	VC4_MAX_QUEUES,
> +};
> +
> +struct vc4_queue_state {
> +	struct drm_gpu_scheduler sched;
> +
> +	u64 fence_context;
> +	u64 emit_seqno;

The comment for sched_lock in vc4_dev makes it sounds like maybe that is 
protecting the emit_seqno, but in 6/11 emit_seqno is incremented from 
the run_job() schedule callback without that mutex held.

So sched_lock seems about protecting the DRM sched arm+push pair?

And emit_seqno is protected by the single threaded nature of a work 
queue? But each queue/scheduler has it's own wq so does that work?

> +
> +	spinlock_t fence_lock;

Since recently dma-fences support a built-in lock (pass NULL to 
dma_fence_init()). May be simpler if you do not end up needing this lock 
for something else in subsequent patches.

> +};
> +
>   /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
>    * this.
>    */
> @@ -152,6 +168,8 @@ struct vc4_dev {
>   	 */
>   	uint64_t emit_seqno;
>   
> +	struct vc4_queue_state queue[VC4_MAX_QUEUES];
> +
>   	struct vc4_bin_job *bin_job;
>   
>   	struct vc4_render_job *render_job;
> @@ -178,6 +196,18 @@ struct vc4_dev {
>   	 * job_done_work.
>   	 */
>   	struct list_head job_done_list;
> +
> +	/* Lock taken when resetting the GPU, to keep multiple
> +	 * processes from trying to park the scheduler threads and
> +	 * reset at once.
> +	 */
> +	struct mutex reset_lock;
> +
> +	/* Lock taken when creating and pushing the GPU scheduler
> +	 * jobs, to keep the sched-fence seqnos in order.
> +	 */
> +	struct mutex sched_lock;
> +
>   	/* Spinlock used to synchronize the job_list and seqno
>   	 * accesses between the IRQ handler and GEM ioctls.
>   	 */
> @@ -286,8 +316,8 @@ struct vc4_bo {
>   struct vc4_fence {
>   	struct dma_fence base;
>   	struct drm_device *dev;
> -	/* vc4 seqno for signaled() test */
>   	uint64_t seqno;
> +	enum vc4_queue queue;
>   };
>   
>   #define to_vc4_fence(_fence)					\
> @@ -872,6 +902,8 @@ struct vc4_file {
>   
>   	struct xarray perfmons;
>   
> +	struct drm_sched_entity sched_entity[VC4_MAX_QUEUES];
> +
>   	bool bin_bo_used;
>   };
>   
> @@ -1064,6 +1096,7 @@ extern struct platform_driver vc4_dsi_driver;
>   
>   /* vc4_fence.c */
>   extern const struct dma_fence_ops vc4_fence_ops;
> +struct dma_fence *vc4_fence_create(struct vc4_dev *vc4, enum vc4_queue queue);
>   
>   /* vc4_gem.c */
>   int vc4_gem_init(struct drm_device *dev);
> @@ -1079,6 +1112,7 @@ int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
>   void vc4_job_handle_completed(struct vc4_dev *vc4);
>   int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *file_priv);
> +void vc4_save_hang_state(struct drm_device *dev);
>   
>   /* vc4_hdmi.c */
>   extern struct platform_driver vc4_hdmi_driver;
> @@ -1177,4 +1211,8 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv);
>   
> +/* vc4_sched.c */
> +int vc4_sched_init(struct vc4_dev *vc4);
> +void vc4_sched_fini(struct vc4_dev *vc4);
> +
>   #endif /* _VC4_DRV_H_ */
> diff --git a/drivers/gpu/drm/vc4/vc4_fence.c b/drivers/gpu/drm/vc4/vc4_fence.c
> index 580214e2158c7dcf39253f2148dea478ffe20e68..a6c24eaf2594ade3dcd635452288c9dc20af14d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_fence.c
> +++ b/drivers/gpu/drm/vc4/vc4_fence.c
> @@ -23,6 +23,23 @@
>   
>   #include "vc4_drv.h"
>   
> +struct dma_fence *vc4_fence_create(struct vc4_dev *vc4, enum vc4_queue queue)
> +{
> +	struct vc4_fence *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence)
> +		return ERR_PTR(-ENOMEM);

It would be nice to avoid allocations in the run_job() callback. If 
maybe you could embed it, or at least preallocate? Not a deal breaker 
since you use the default WQ_MEM_RECLAIM wq provided by the scheduler, 
but just something to consider if it is doable.

> +
> +	fence->dev = &vc4->base;
> +	fence->queue = queue;
> +	fence->seqno = ++vc4->queue[queue].emit_seqno;
> +	dma_fence_init(&fence->base, &vc4_fence_ops, &vc4->queue[queue].fence_lock,
> +		       vc4->queue[queue].fence_context, fence->seqno);
> +
> +	return &fence->base;
> +}
> +
>   static const char *vc4_fence_get_driver_name(struct dma_fence *fence)
>   {
>   	return "vc4";
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 9df2634e48566ba12858c135a3c313efa7bd120c..030fa23a53e8c48dac7208453b00af3f59c16657 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -30,10 +30,10 @@
>   #include <linux/dma-fence-array.h>
>   
>   #include <drm/drm_exec.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_syncobj.h>
>   
> -#include "uapi/drm/vc4_drm.h"
>   #include "vc4_drv.h"
>   #include "vc4_regs.h"
>   #include "vc4_trace.h"
> @@ -150,7 +150,7 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
>   	return ret;
>   }
>   
> -static void
> +void
>   vc4_save_hang_state(struct drm_device *dev)
>   {
>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -1132,12 +1132,25 @@ int vc4_gem_init(struct drm_device *dev)
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return -ENODEV;
>   
> +	for (int i = 0; i < VC4_MAX_QUEUES; i++) {
> +		struct vc4_queue_state *queue = &vc4->queue[i];
> +
> +		queue->fence_context = dma_fence_context_alloc(1);
> +		spin_lock_init(&queue->fence_lock);
> +	}
> +
>   	vc4->dma_fence_context = dma_fence_context_alloc(1);
>   
>   	INIT_LIST_HEAD(&vc4->bin_job_list);
>   	INIT_LIST_HEAD(&vc4->render_job_list);
>   	INIT_LIST_HEAD(&vc4->job_done_list);
>   	spin_lock_init(&vc4->job_lock);
> +	ret = drmm_mutex_init(dev, &vc4->reset_lock);
> +	if (ret)
> +		return ret;
> +	ret = drmm_mutex_init(dev, &vc4->sched_lock);
> +	if (ret)
> +		return ret;
>   
>   	INIT_WORK(&vc4->hangcheck.reset_work, vc4_reset_work);
>   	timer_setup(&vc4->hangcheck.timer, vc4_hangcheck_elapsed, 0);
> @@ -1154,6 +1167,10 @@ int vc4_gem_init(struct drm_device *dev)
>   	if (ret)
>   		return ret;
>   
> +	ret = vc4_sched_init(vc4);
> +	if (ret)
> +		return ret;
> +
>   	return drmm_add_action_or_reset(dev, vc4_gem_destroy, NULL);
>   }
>   
> @@ -1176,6 +1193,8 @@ static void vc4_gem_destroy(struct drm_device *dev, void *unused)
>   
>   	if (vc4->hang_state)
>   		vc4_free_hang_state(dev, vc4->hang_state);
> +
> +	vc4_sched_fini(vc4);
>   }
>   
>   int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/vc4/vc4_sched.c b/drivers/gpu/drm/vc4/vc4_sched.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6d2d8704fdbaad3d82606dc8ba4249a43862b499
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/vc4_sched.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2026 Raspberry Pi */
> +
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "vc4_drv.h"
> +#include "vc4_regs.h"
> +#include "vc4_trace.h"
> +
> +static struct vc4_job *
> +to_vc4_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct vc4_job, base);
> +}
> +
> +static struct vc4_bin_job *
> +to_bin_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct vc4_bin_job, base.base);
> +}
> +
> +static struct vc4_render_job *
> +to_render_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct vc4_render_job, base.base);
> +}
> +
> +static void
> +vc4_flush_caches(struct drm_device *dev)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +	/* Flush the GPU L2 caches.  These caches sit on top of system
> +	 * L3 (the 128kb or so shared with the CPU), and are
> +	 * non-allocating in the L3.
> +	 */
> +	V3D_WRITE(V3D_L2CACTL, V3D_L2CACTL_L2CCLR);
> +
> +	V3D_WRITE(V3D_SLCACTL,
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T1CC) |
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T0CC) |
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_UCC) |
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_ICC));
> +}
> +
> +static void
> +vc4_flush_texture_caches(struct drm_device *dev)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +	V3D_WRITE(V3D_L2CACTL, V3D_L2CACTL_L2CCLR);
> +
> +	V3D_WRITE(V3D_SLCACTL,
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T1CC) |
> +		  VC4_SET_FIELD(0xf, V3D_SLCACTL_T0CC));
> +}
> +
> +static void
> +vc4_sched_job_free(struct drm_sched_job *sched_job)
> +{
> +	struct vc4_job *job = to_vc4_job(sched_job);
> +
> +	vc4_job_cleanup(job);
> +}
> +
> +static void
> +vc4_switch_perfmon(struct vc4_dev *vc4, struct vc4_job *job)
> +{
> +	if (vc4->active_perfmon && vc4->active_perfmon != job->perfmon)
> +		vc4_perfmon_stop(vc4, vc4->active_perfmon, true);
> +
> +	if (job->perfmon && vc4->active_perfmon != job->perfmon)
> +		vc4_perfmon_start(vc4, job->perfmon);
> +}
> +
> +static struct dma_fence *vc4_bin_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct vc4_bin_job *job = to_bin_job(sched_job);
> +	struct vc4_dev *vc4 = job->base.vc4;
> +	struct drm_device *dev = &vc4->base;
> +	struct dma_fence *fence;
> +	unsigned long irqflags;
> +
> +	if (unlikely(job->base.base.s_fence->finished.error)) {
> +		spin_lock_irqsave(&vc4->job_lock, irqflags);

run_job() is never run from irq context so all these locks could be 
spin_(un)lock_irq.

> +		vc4->bin_job = NULL;
> +		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> +		return NULL;
> +	}
> +
> +	/* Lock required around bin_job update vs vc4_overflow_mem_work(). */
> +	spin_lock_irqsave(&vc4->job_lock, irqflags);
> +	vc4->bin_job = job;
> +
> +	/* Clear out the overflow allocation, so we don't
> +	 * reuse the overflow attached to a previous job.
> +	 */
> +	V3D_WRITE(V3D_BPOA, 0);
> +	V3D_WRITE(V3D_BPOS, 0);

This part I have no idea about. In the existing driver it appears to be 
programmed at a completely different place - at the component driver 
bind time. I think I will in general focus on the DRM scheduler angle to 
start with.

> +	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> +
> +	vc4_flush_caches(dev);
> +
> +	fence = vc4_fence_create(vc4, VC4_BIN);
> +	if (IS_ERR(fence))
> +		return NULL;

Exits with vc4->bin_job set, safe or accidental?

> +
> +	if (job->base.irq_fence)
> +		dma_fence_put(job->base.irq_fence);

When can this happen, on re-submit?

> +	job->base.irq_fence = dma_fence_get(fence);
> +
> +	trace_vc4_submit_cl(dev, false, to_vc4_fence(fence)->seqno,
> +			    job->ct0ca, job->ct0ea);
> +
> +	vc4_switch_perfmon(vc4, &job->base);
> +
> +	V3D_WRITE(V3D_CTNCA(0), job->ct0ca);
> +	V3D_WRITE(V3D_CTNEA(0), job->ct0ea);
> +
> +	return fence;
> +}
> +
> +static struct dma_fence *vc4_render_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct vc4_render_job *job = to_render_job(sched_job);
> +	struct vc4_dev *vc4 = job->base.vc4;
> +	struct drm_device *dev = &vc4->base;
> +	struct dma_fence *fence;
> +
> +	if (unlikely(job->base.base.s_fence->finished.error)) {
> +		vc4->render_job = NULL;

No spinlock for render, only bin? By design?

Regards,

Tvrtko

> +		return NULL;
> +	}
> +
> +	vc4->render_job = job;
> +
> +	/* A previous RCL may have written to one of our textures, and
> +	 * our full cache flush at bin time may have occurred before
> +	 * that RCL completed. Flush the texture cache now, but not
> +	 * the instructions or uniforms (since we don't write those
> +	 * from an RCL).
> +	 */
> +	vc4_flush_texture_caches(dev);
> +
> +	fence = vc4_fence_create(vc4, VC4_RENDER);
> +	if (IS_ERR(fence))
> +		return NULL;
> +
> +	if (job->base.irq_fence)
> +		dma_fence_put(job->base.irq_fence);
> +	job->base.irq_fence = dma_fence_get(fence);
> +
> +	trace_vc4_submit_cl(dev, true, to_vc4_fence(fence)->seqno,
> +			    job->ct1ca, job->ct1ea);
> +
> +	vc4_switch_perfmon(vc4, &job->base);
> +
> +	V3D_WRITE(V3D_CTNCA(1), job->ct1ca);
> +	V3D_WRITE(V3D_CTNEA(1), job->ct1ea);
> +
> +	return fence;
> +}
> +
> +static void
> +vc4_reset(struct drm_device *dev)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +	drm_err(dev, "Resetting GPU.\n");
> +
> +	mutex_lock(&vc4->power_lock);
> +	if (vc4->power_refcount) {
> +		/* Power the device off and back on the by dropping the
> +		 * reference on runtime PM.
> +		 */
> +		pm_runtime_put_sync_suspend(&vc4->v3d->pdev->dev);
> +		pm_runtime_get_sync(&vc4->v3d->pdev->dev);
> +	}
> +	mutex_unlock(&vc4->power_lock);
> +
> +	vc4_irq_reset(dev);
> +}
> +
> +static enum drm_gpu_sched_stat
> +vc4_gpu_reset_for_timeout(struct vc4_dev *vc4, struct drm_sched_job *sched_job)
> +{
> +	enum vc4_queue q;
> +
> +	mutex_lock(&vc4->reset_lock);
> +
> +	/* block scheduler */
> +	for (q = 0; q < VC4_MAX_QUEUES; q++)
> +		drm_sched_stop(&vc4->queue[q].sched, sched_job);
> +
> +	if (sched_job) {
> +		drm_sched_increase_karma(sched_job);
> +
> +		/* If the guilty job is a BIN job, also increase the karma
> +		 * of its paired render job. Otherwise, the RENDER job would
> +		 * be submitted to the GPU without binner output.
> +		 */
> +		if (sched_job->sched == &vc4->queue[VC4_BIN].sched) {
> +			struct vc4_bin_job *bin = to_bin_job(sched_job);
> +
> +			drm_sched_increase_karma(&bin->render->base.base);
> +		}
> +	}
> +
> +	vc4_save_hang_state(&vc4->base);
> +
> +	/* get the GPU back into the init state */
> +	vc4_reset(&vc4->base);
> +
> +	for (q = 0; q < VC4_MAX_QUEUES; q++)
> +		drm_sched_resubmit_jobs(&vc4->queue[q].sched);
> +
> +	/* Unblock schedulers and restart their jobs. */
> +	for (q = 0; q < VC4_MAX_QUEUES; q++)
> +		drm_sched_start(&vc4->queue[q].sched, 0);
> +
> +	mutex_unlock(&vc4->reset_lock);
> +
> +	return DRM_GPU_SCHED_STAT_RESET;
> +}
> +
> +static enum drm_gpu_sched_stat
> +vc4_cl_job_timedout(struct drm_sched_job *sched_job, enum vc4_queue q)
> +{
> +	struct vc4_job *job = to_vc4_job(sched_job);
> +	struct vc4_dev *vc4 = job->vc4;
> +	u32 ctca = V3D_READ(V3D_CTNCA(q));
> +	u32 ctra = V3D_READ(V3D_CTNRA0(q));
> +
> +	/* If the current address or return address have changed, then the GPU
> +	 * has probably made progress and we should delay the reset. This could
> +	 * fail if the GPU got in an infinite loop in the CL, but that is pretty
> +	 * unlikely outside of an i-g-t testcase.
> +	 */
> +	if (job->timedout_ctca != ctca || job->timedout_ctra != ctra) {
> +		job->timedout_ctca = ctca;
> +		job->timedout_ctra = ctra;
> +
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}
> +
> +	return vc4_gpu_reset_for_timeout(vc4, sched_job);
> +}
> +
> +static enum drm_gpu_sched_stat
> +vc4_bin_job_timedout(struct drm_sched_job *sched_job)
> +{
> +	return vc4_cl_job_timedout(sched_job, VC4_BIN);
> +}
> +
> +static enum drm_gpu_sched_stat
> +vc4_render_job_timedout(struct drm_sched_job *sched_job)
> +{
> +	return vc4_cl_job_timedout(sched_job, VC4_RENDER);
> +}
> +
> +static const struct drm_sched_backend_ops vc4_bin_sched_ops = {
> +	.run_job = vc4_bin_job_run,
> +	.timedout_job = vc4_bin_job_timedout,
> +	.free_job = vc4_sched_job_free,
> +};
> +
> +static const struct drm_sched_backend_ops vc4_render_sched_ops = {
> +	.run_job = vc4_render_job_run,
> +	.timedout_job = vc4_render_job_timedout,
> +	.free_job = vc4_sched_job_free,
> +};
> +
> +static int
> +vc4_queue_sched_init(struct vc4_dev *vc4, const struct drm_sched_backend_ops *ops,
> +		     enum vc4_queue queue, const char *name)
> +{
> +	struct drm_sched_init_args args = {
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,
> +		.timeout = msecs_to_jiffies(500),
> +		.dev = vc4->base.dev,
> +	};
> +
> +	args.ops = ops;
> +	args.name = name;
> +
> +	return drm_sched_init(&vc4->queue[queue].sched, &args);
> +}
> +
> +int
> +vc4_sched_init(struct vc4_dev *vc4)
> +{
> +	int ret;
> +
> +	ret = vc4_queue_sched_init(vc4, &vc4_bin_sched_ops,
> +				   VC4_BIN, "vc4_bin");
> +	if (ret)
> +		return ret;
> +
> +	ret = vc4_queue_sched_init(vc4, &vc4_render_sched_ops,
> +				   VC4_RENDER, "vc4_render");
> +	if (ret) {
> +		vc4_sched_fini(vc4);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void
> +vc4_sched_fini(struct vc4_dev *vc4)
> +{
> +	enum vc4_queue q;
> +
> +	for (q = 0; q < VC4_MAX_QUEUES; q++) {
> +		if (vc4->queue[q].sched.ready)
> +			drm_sched_fini(&vc4->queue[q].sched);
> +	}
> +}
> 

