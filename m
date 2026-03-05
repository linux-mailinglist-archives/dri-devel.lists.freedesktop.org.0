Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LFvCUZ0qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:17:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16221173C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65D10E289;
	Thu,  5 Mar 2026 12:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZzXAOAee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C822D10E289
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0CW6Q4/oujOT3eATwhXFRllubo/kt65iMyE0vzeLiec=; b=ZzXAOAee1JoqpmKBQxyLbRYVCw
 ON7qHFvzPfnIqjE4Z2EOULCgRw82F2RGKK9d0KZDNegW3019jfIXmRqLNx2QDH3/MGFEwXUT1qn50
 4Ijl6XTfnazhmWQyvrOWqSnYAPHDVGbgG/MteP7N0/+rpprRPZVNUkqDoGu3GTGyKQAVJHdoIxKFk
 YEElBvl0+ESDPGg4QsL5sp+mVOmIHtCqhjCGJHh7uLLuhDHsONFJfXeaXpdxpgLflKVb1IoeaGInj
 rieom7cuLbBVkEWEUPRYtkXgcaJUg38xCC7DISAikTD0DuoEbReHdyzfnIo74v/jV2fG9vRMiW0wx
 gTQMYy5Q==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy7dN-009M1f-Uk; Thu, 05 Mar 2026 13:16:54 +0100
Message-ID: <599e2136-c847-4071-849e-45054df2f3f5@igalia.com>
Date: Thu, 5 Mar 2026 12:16:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] drm/vc4: Introduce vc4_job structures for DRM
 scheduler integration
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-4-c6174fd7bbc1@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-4-c6174fd7bbc1@igalia.com>
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
X-Rspamd-Queue-Id: CA16221173C
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
	NEURAL_HAM(-0.00)[-0.238];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action


On 05/02/2026 21:31, Maíra Canal wrote:
> Introduce `struct vc4_job` as the new base structure for GPU jobs, with
> `vc4_bin_job` and `vc4_render_job` as specialized variants for BIN and
> RENDER jobs, respectively. These structures embed `struct drm_sched_job`
> and will be used with the DRM GPU scheduler.
> 
> The `vc4_exec_info` struct now holds pointers to these job structs,
> allowing the existing validation code to populate job fields during
> command list processing. Each submission will have a `vc4_exec_info`,
> and each execution info will hold a BIN and RENDER job.
> 
> This design is largely inspired by the v3d driver's job structures.

Not sure this patch is worth to have standalone. I am tempted to suggest 
squashing it with 5/11 and in there only have the fields which are 
actually used in 5/11. But lets hold off that for now until I 
familiarise myself more with the series.

Regards,

Tvrtko

> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h | 79 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 0f2fb035fef177dd446ff8322da2413c861ecfd3..0f6b7cda1193f0e5ee6b7a504ff447460dedab20 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -152,6 +152,10 @@ struct vc4_dev {
>   	 */
>   	uint64_t emit_seqno;
>   
> +	struct vc4_bin_job *bin_job;
> +
> +	struct vc4_render_job *render_job;
> +
>   	/* Sequence number for the last completed job on the GPU.
>   	 * Starts at 0 (no jobs completed).
>   	 */
> @@ -668,9 +672,84 @@ struct vc4_crtc_state {
>   
>   #define VC4_REG32(reg) { .name = #reg, .offset = reg }
>   
> +struct vc4_job {
> +	struct drm_sched_job base;
> +
> +	struct kref refcount;
> +
> +	struct vc4_dev *vc4;
> +
> +	/* v3d fence to be signaled by IRQ handler when the job is complete. */
> +	struct dma_fence *irq_fence;
> +
> +	/* scheduler fence for when the job is considered complete and
> +	 * the BO reservations can be released.
> +	 */
> +	struct dma_fence *done_fence;
> +
> +	/* Last current and return addresses the hardware was processing when
> +	 * the job timedout.
> +	 */
> +	u32 timedout_ctca, timedout_ctra;
> +
> +	/* Pointer to a performance monitor object if the user requested it,
> +	 * NULL otherwise.
> +	 */
> +	struct vc4_perfmon *perfmon;
> +
> +	/* Callback for the freeing of the job on refcount going to 0. */
> +	void (*free)(struct kref *ref);
> +};
> +
> +struct vc4_bin_job {
> +	struct vc4_job base;
> +
> +	uint32_t ct0ca, ct0ea;
> +
> +	/* Corresponding render job, for attaching our overflow memory. */
> +	struct vc4_render_job *render;
> +
> +	/* Whether the exec has taken a reference to the binner BO, which should
> +	 * happen with a VC4_PACKET_TILE_BINNING_MODE_CONFIG packet.
> +	 */
> +	bool bin_bo_used;
> +};
> +
> +struct vc4_render_job {
> +	struct vc4_job base;
> +
> +	uint32_t ct1ca, ct1ea;
> +
> +	/* This is the array of BOs that were looked up at the start of submission.
> +	 * Command validation will use indices into this array.
> +	 */
> +	struct drm_gem_object **bo;
> +	u32 bo_count;
> +
> +	/* List of other BOs used in the job that need to be released
> +	 * once the job is complete.
> +	 */
> +	struct list_head unref_list;
> +
> +	/* List of BOs that are being written by the RCL. Other than
> +	 * the binner temporary storage, this is all the BOs written
> +	 * by the job.
> +	 */
> +	struct drm_gem_dma_object *rcl_write_bo[4];
> +	uint32_t rcl_write_bo_count;
> +
> +	/* Bitmask of which binner slots are freed when this job completes.
> +	 * Must remain allocated until the render job completes.
> +	 */
> +	uint32_t bin_slots;
> +};
> +
>   struct vc4_exec_info {
>   	struct vc4_dev *dev;
>   
> +	struct vc4_bin_job *bin;
> +	struct vc4_render_job *render;
> +
>   	/* Sequence number for this bin/render job. */
>   	uint64_t seqno;
>   
> 

