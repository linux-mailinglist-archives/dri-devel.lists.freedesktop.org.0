Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCyBGdlQjGmukgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:50:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C10122F5D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3AC10E029;
	Wed, 11 Feb 2026 09:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cetDFnP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5D610E029
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:50:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f9tvf5xs8z9tnG;
 Wed, 11 Feb 2026 10:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770803406; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FpFYTXtCoQFQs7Mq48800Tx1mqSbae72F6z1y5Yyas=;
 b=cetDFnP7T106Bs9xzlnYeHcngF1yT71oiyd4agTsF7twp6CKprgDMtMC96unTS5+B8nyDI
 35L5xkCoJ0gOlVeaPlUrHDRByg5vFIWpR9Ov+/Mgcii8/6RJ15TbcJSNbelrUV/8f0sTmx
 a3tokdGJDUOTX4WgutsPtRmIix+U4oIxbrGh1Z6fVi87uBVF8Du497AieAqMTgI4b2vWAX
 9MC+rketj+uodEX0O4fkboevbrpehvhBo+Px7q3WwbiaBjA/UPtT4ii/Bn55I3eYpJ4IB7
 xxAIvvFAIcNTdEzj0ohWJ/6xy0xEnvgYK5NTGFTs8LL8zACKu14TW7MINHjHiA==
Message-ID: <ebfe7aa7f409513d5e04ac407700a8bbac76e948.camel@mailbox.org>
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 11 Feb 2026 10:50:02 +0100
In-Reply-To: <20260210102232.1642-5-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d7d9deb8907911eedfd
X-MBO-RS-META: s38c5qtsk7tbdkzwkwe37zu5ufcbhite
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: A3C10122F5D
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 11:01 +0100, Christian K=C3=B6nig wrote:
> Implement per-fence spinlocks, allowing implementations to not give an
> external spinlock to protect the fence internal statei. Instead a spinloc=
k

s/statei/state

> embedded into the fence structure itself is used in this case.
>=20
> Shared spinlocks have the problem that implementations need to guarantee
> that the lock live at least as long all fences referencing them.

s/live/lives

>=20
> Using a per-fence spinlock allows completely decoupling spinlock producer
> and consumer life times, simplifying the handling in most use cases.

That's a good commit message btw, detailing what the motivation is.
Would be great to see messages like that more frequently :]

>=20
> v2: improve naming, coverage and function documentation
> v3: fix one additional locking in the selftests
> v4: separate out some changes to make the patch smaller,
> =C2=A0=C2=A0=C2=A0 fix one amdgpu crash found by CI systems
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++-----
> =C2=A0drivers/dma-buf/sync_debug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/drm_writeback.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/qxl/qxl_release.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++------
> =C2=A010 files changed, 41 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 56aa59867eaa..1833889e7466 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> -
> =C2=A0/**
> =C2=A0 * dma_fence_signal_timestamp_locked - signal completion of a fence
> =C2=A0 * @fence: the fence to signal
> @@ -1067,7 +1066,6 @@ static void
> =C2=A0__dma_fence_init(struct dma_fence *fence, const struct dma_fence_op=
s *ops,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t *lock,=
 u64 context, u64 seqno, unsigned long flags)
> =C2=A0{
> -	BUG_ON(!lock);
> =C2=A0	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> =C2=A0
> =C2=A0	kref_init(&fence->refcount);
> @@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const s=
truct dma_fence_ops *ops,
> =C2=A0	 */
> =C2=A0	RCU_INIT_POINTER(fence->ops, ops);
> =C2=A0	INIT_LIST_HEAD(&fence->cb_list);
> -	fence->lock =3D lock;
> =C2=A0	fence->context =3D context;
> =C2=A0	fence->seqno =3D seqno;
> =C2=A0	fence->flags =3D flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
> +	if (lock) {
> +		fence->extern_lock =3D lock;
> +	} else {
> +		spin_lock_init(&fence->inline_lock);
> +		fence->flags |=3D BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT);
> +	}
> =C2=A0	fence->error =3D 0;
> =C2=A0
> =C2=A0	trace_dma_fence_init(fence);
> @@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const str=
uct dma_fence_ops *ops,
> =C2=A0 * dma_fence_init - Initialize a custom fence.
> =C2=A0 * @fence: the fence to initialize
> =C2=A0 * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
> =C2=A0 * @context: the execution context this fence is run on
> =C2=A0 * @seqno: a linear increasing sequence number for this context
> =C2=A0 *
> @@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
> =C2=A0 *
> =C2=A0 * context and seqno are used for easy comparison between fences, a=
llowing
> =C2=A0 * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only =
allowed

"strongly discouraged [=E2=80=A6] because this does not decouple lock and f=
ence
life times." ?

> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.

I think our previous discussions revealed that the external lock does
not even help with that, does it?

> =C2=A0 */
> =C2=A0void
> =C2=A0dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops =
*ops,
> @@ -1114,7 +1121,7 @@ EXPORT_SYMBOL(dma_fence_init);
> =C2=A0 * dma_fence_init64 - Initialize a custom fence with 64-bit seqno s=
upport.
> =C2=A0 * @fence: the fence to initialize
> =C2=A0 * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
> =C2=A0 * @context: the execution context this fence is run on
> =C2=A0 * @seqno: a linear increasing sequence number for this context
> =C2=A0 *
> @@ -1124,6 +1131,10 @@ EXPORT_SYMBOL(dma_fence_init);
> =C2=A0 *
> =C2=A0 * Context and seqno are used for easy comparison between fences, a=
llowing
> =C2=A0 * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only =
allowed

same

> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.
> =C2=A0 */
> =C2=A0void
> =C2=A0dma_fence_init64(struct dma_fence *fence, const struct dma_fence_op=
s *ops,
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 02af347293d0..c49324505b20 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -47,7 +47,7 @@ struct sync_timeline {
> =C2=A0
> =C2=A0static inline struct sync_timeline *dma_fence_parent(struct dma_fen=
ce *fence)
> =C2=A0{
> -	return container_of(fence->lock, struct sync_timeline, lock);
> +	return container_of(fence->extern_lock, struct sync_timeline, lock);

You're sure that this will never have to check for the flag?

> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.h
> index 139642eacdd0..d5c41e24fb51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -638,7 +638,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgp=
u_vm *vm)
> =C2=A0	 * sure that the dma_fence structure isn't freed up.
> =C2=A0	 */
> =C2=A0	rcu_read_lock();
> -	lock =3D vm->last_tlb_flush->lock;
> +	lock =3D dma_fence_spinlock(vm->last_tlb_flush);
> =C2=A0	rcu_read_unlock();
> =C2=A0
> =C2=A0	spin_lock_irqsave(lock, flags);
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index a7797d260f1e..17472915842f 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -159,7 +159,7 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
> =C2=A0static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
> =C2=A0{
> =C2=A0	BUG_ON(fence->ops !=3D &drm_crtc_fence_ops);
> -	return container_of(fence->lock, struct drm_crtc, fence_lock);
> +	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
> =C2=A0}
> =C2=A0
> =C2=A0static const char *drm_crtc_fence_get_driver_name(struct dma_fence =
*fence)
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index 95b8a2e4bda6..624a4e8b6c99 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -81,7 +81,7 @@
> =C2=A0 *	From userspace, this property will always read as zero.
> =C2=A0 */
> =C2=A0
> -#define fence_to_wb_connector(x) container_of(x->lock, \
> +#define fence_to_wb_connector(x) container_of(x->extern_lock, \
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_writeback_connector,=
 \
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_lock)
> =C2=A0
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index 4a193b7d6d9e..c282c94138b2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -41,7 +41,8 @@ static const struct dma_fence_ops nouveau_fence_ops_leg=
acy;
> =C2=A0static inline struct nouveau_fence_chan *
> =C2=A0nouveau_fctx(struct nouveau_fence *fence)
> =C2=A0{
> -	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
> +	return container_of(fence->base.extern_lock, struct nouveau_fence_chan,
> +			=C2=A0=C2=A0=C2=A0 lock);
> =C2=A0}
> =C2=A0
> =C2=A0static bool
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_=
release.c
> index 06b0b2aa7953..37d4ae0faf0d 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -62,7 +62,8 @@ static long qxl_fence_wait(struct dma_fence *fence, boo=
l intr,
> =C2=A0	struct qxl_device *qdev;
> =C2=A0	unsigned long cur, end =3D jiffies + timeout;
> =C2=A0
> -	qdev =3D container_of(fence->lock, struct qxl_device, release_lock);
> +	qdev =3D container_of(fence->extern_lock, struct qxl_device,
> +			=C2=A0=C2=A0=C2=A0 release_lock);
> =C2=A0
> =C2=A0	if (!wait_event_timeout(qdev->release_event,
> =C2=A0				(dma_fence_is_signaled(fence) ||
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 85795082fef9..d251eec57df9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -47,7 +47,8 @@ struct vmw_event_fence_action {
> =C2=A0static struct vmw_fence_manager *
> =C2=A0fman_from_fence(struct vmw_fence_obj *fence)
> =C2=A0{
> -	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
> +	return container_of(fence->base.extern_lock, struct vmw_fence_manager,
> +			=C2=A0=C2=A0=C2=A0 lock);
> =C2=A0}
> =C2=A0
> =C2=A0static void vmw_fence_obj_destroy(struct dma_fence *f)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_=
fence.c
> index ae8ed15b64c5..14720623ad00 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -124,7 +124,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_=
fence *fence);
> =C2=A0
> =C2=A0static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *=
fence)
> =C2=A0{
> -	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
> +	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
> +			=C2=A0=C2=A0=C2=A0 lock);
> =C2=A0}
> =C2=A0
> =C2=A0static const char *xe_hw_fence_get_driver_name(struct dma_fence *dm=
a_fence)
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 88c842fc35d5..6eabbb1c471c 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -34,7 +34,8 @@ struct seq_file;
> =C2=A0 * @ops: dma_fence_ops associated with this fence
> =C2=A0 * @rcu: used for releasing fence with kfree_rcu
> =C2=A0 * @cb_list: list of all callbacks to call
> - * @lock: spin_lock_irqsave used for locking
> + * @extern_lock: external spin_lock_irqsave used for locking

Add a "(deprecated)" ?

> + * @inline_lock: alternative internal spin_lock_irqsave used for locking
> =C2=A0 * @context: execution context this fence belongs to, returned by
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_=
fence_context_alloc()
> =C2=A0 * @seqno: the sequence number of this fence inside the execution c=
ontext,
> @@ -49,6 +50,7 @@ struct seq_file;
> =C2=A0 * of the time.
> =C2=A0 *
> =C2=A0 * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
> + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of exter=
nal one
> =C2=A0 * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
> =C2=A0 * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence sign=
aling
> =C2=A0 * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have b=
een called
> @@ -66,7 +68,10 @@ struct seq_file;
> =C2=A0 * been completed, or never called at all.
> =C2=A0 */
> =C2=A0struct dma_fence {
> -	spinlock_t *lock;
> +	union {
> +		spinlock_t *extern_lock;
> +		spinlock_t inline_lock;
> +	};
> =C2=A0	const struct dma_fence_ops __rcu *ops;
> =C2=A0	/*
> =C2=A0	 * We clear the callback list on kref_put so that by the time we
> @@ -100,6 +105,7 @@ struct dma_fence {
> =C2=A0
> =C2=A0enum dma_fence_flag_bits {
> =C2=A0	DMA_FENCE_FLAG_INITIALIZED_BIT,
> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,

Just asking about a nit: what's the order here, always alphabetically?

> =C2=A0	DMA_FENCE_FLAG_SEQNO64_BIT,
> =C2=A0	DMA_FENCE_FLAG_SIGNALED_BIT,
> =C2=A0	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -381,11 +387,12 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fen=
cep)
> =C2=A0 * dma_fence_spinlock - return pointer to the spinlock protecting t=
he fence
> =C2=A0 * @fence: the fence to get the lock from
> =C2=A0 *
> - * Return the pointer to the extern lock.
> + * Return either the pointer to the embedded or the external spin lock.
> =C2=A0 */
> =C2=A0static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fenc=
e)
> =C2=A0{
> -	return fence->lock;
> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> +		&fence->inline_lock : fence->extern_lock;

I personally am not a fan of using '?' for anything longer than 1 line
and think that

if (condition)
  return a;

return b;

is much better readable.



P.

> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -396,7 +403,7 @@ static inline spinlock_t *dma_fence_spinlock(struct d=
ma_fence *fence)
> =C2=A0 * Lock the fence, preventing it from changing to the signaled stat=
e.
> =C2=A0 */
> =C2=A0#define dma_fence_lock_irqsave(fence, flags)	\
> -	spin_lock_irqsave(fence->lock, flags)
> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
> =C2=A0
> =C2=A0/**
> =C2=A0 * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> @@ -406,7 +413,7 @@ static inline spinlock_t *dma_fence_spinlock(struct d=
ma_fence *fence)
> =C2=A0 * Unlock the fence, allowing it to change it's state to signaled a=
gain.
> =C2=A0 */
> =C2=A0#define dma_fence_unlock_irqrestore(fence, flags)	\
> -	spin_unlock_irqrestore(fence->lock, flags)
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
> =C2=A0
> =C2=A0/**
> =C2=A0 * dma_fence_assert_held - lockdep assertion that fence is locked

