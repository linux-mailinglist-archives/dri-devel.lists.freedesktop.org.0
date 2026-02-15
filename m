Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ODuN3OIkWmrjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:48:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348613E4EA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A378510E073;
	Sun, 15 Feb 2026 08:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z+BzLvkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C668510E073
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771145324;
 bh=MUTlGwD2138aD/4Q5SOAYPGTR9SS9BBUsahlryve2B0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z+BzLvkAeuxfRYF7AVldYh2PZg6ytNKupiA74RSFIWdQkKk0TGp5WiWMP2G962R+7
 yrwnW1ZGzeYZtoHacmL2ZHrVPQyHUBBGAy/TAQ+Nz6wDJZqYemwo8rg+htf47sxJVu
 OdI5QjfJsuZDIC7gUjONyJSJ2PbISHepwuaCUA3IDdhxg9YTkWUV4Lm6tSQkFDrA9R
 EiYr+4kGKa5yPjrQoVO5VSWQEcdApx/4koweqOud1NQ1A0nVv21BjC/lAMdSg6H4a7
 /ymCeSgBdtvzgbukuovTgWUBbhQrlmQWIFs4nL2qsLK+fZjL4xioGA9URnGAFgE+Iq
 yu1ytI2fC2ITA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8567E17E3905;
 Sun, 15 Feb 2026 09:48:44 +0100 (CET)
Date: Sun, 15 Feb 2026 09:48:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
Message-ID: <20260215094839.1bab6aef@fedora>
In-Reply-To: <20260213152733.36789fa2@fedora>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
 <20260213152733.36789fa2@fedora>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 4348613E4EA
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 15:27:33 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Tue, 10 Feb 2026 11:01:59 +0100
> "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:
>=20
> > Implement per-fence spinlocks, allowing implementations to not give an
> > external spinlock to protect the fence internal statei. Instead a spinl=
ock
> > embedded into the fence structure itself is used in this case.
> >=20
> > Shared spinlocks have the problem that implementations need to guarantee
> > that the lock live at least as long all fences referencing them.
> >=20
> > Using a per-fence spinlock allows completely decoupling spinlock produc=
er
> > and consumer life times, simplifying the handling in most use cases.
> >=20
> > v2: improve naming, coverage and function documentation
> > v3: fix one additional locking in the selftests
> > v4: separate out some changes to make the patch smaller,
> >     fix one amdgpu crash found by CI systems
> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >  drivers/dma-buf/dma-fence.c             | 21 ++++++++++++++++-----
> >  drivers/dma-buf/sync_debug.h            |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
> >  drivers/gpu/drm/drm_crtc.c              |  2 +-
> >  drivers/gpu/drm/drm_writeback.c         |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
> >  drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
> >  drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
> >  include/linux/dma-fence.h               | 19 +++++++++++++------
> >  10 files changed, 41 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 56aa59867eaa..1833889e7466 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
> >  }
> >  #endif
> > =20
> > -
> >  /**
> >   * dma_fence_signal_timestamp_locked - signal completion of a fence
> >   * @fence: the fence to signal
> > @@ -1067,7 +1066,6 @@ static void
> >  __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *=
ops,
> >  	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flag=
s)
> >  {
> > -	BUG_ON(!lock);
> >  	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> > =20
> >  	kref_init(&fence->refcount);
> > @@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const=
 struct dma_fence_ops *ops,
> >  	 */
> >  	RCU_INIT_POINTER(fence->ops, ops);
> >  	INIT_LIST_HEAD(&fence->cb_list);
> > -	fence->lock =3D lock;
> >  	fence->context =3D context;
> >  	fence->seqno =3D seqno;
> >  	fence->flags =3D flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
> > +	if (lock) {
> > +		fence->extern_lock =3D lock;
> > +	} else {
> > +		spin_lock_init(&fence->inline_lock);
> > +		fence->flags |=3D BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT); =20
>=20
> Hm, does this even make a different in term of instructions to check for
> a bit instead of extern_lock =3D=3D NULL? If not, I'd be in favor of
> killing this redundancy and checking extern_lock against NULL in
> dma_fence_spinlock().

Scratch that, I didn't notice {extern,inline}_lock were under a union
(which makes sense). Looks all good to me.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> > +	}
> >  	fence->error =3D 0;
> > =20
> >  	trace_dma_fence_init(fence);
> > @@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const s=
truct dma_fence_ops *ops,
> >   * dma_fence_init - Initialize a custom fence.
> >   * @fence: the fence to initialize
> >   * @ops: the dma_fence_ops for operations on this fence
> > - * @lock: the irqsafe spinlock to use for locking this fence
> > + * @lock: optional irqsafe spinlock to use for locking this fence
> >   * @context: the execution context this fence is run on
> >   * @seqno: a linear increasing sequence number for this context
> >   *
> > @@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const =
struct dma_fence_ops *ops,
> >   *
> >   * context and seqno are used for easy comparison between fences, allo=
wing
> >   * to check which fence is later by simply using dma_fence_later().
> > + *
> > + * It is strongly discouraged to provide an external lock. This is onl=
y allowed
> > + * for legacy use cases when multiple fences need to be prevented from
> > + * signaling out of order.
> >   */
> >  void
> >  dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *op=
s,
> > @@ -1114,7 +1121,7 @@ EXPORT_SYMBOL(dma_fence_init);
> >   * dma_fence_init64 - Initialize a custom fence with 64-bit seqno supp=
ort.
> >   * @fence: the fence to initialize
> >   * @ops: the dma_fence_ops for operations on this fence
> > - * @lock: the irqsafe spinlock to use for locking this fence
> > + * @lock: optional irqsafe spinlock to use for locking this fence
> >   * @context: the execution context this fence is run on
> >   * @seqno: a linear increasing sequence number for this context
> >   *
> > @@ -1124,6 +1131,10 @@ EXPORT_SYMBOL(dma_fence_init);
> >   *
> >   * Context and seqno are used for easy comparison between fences, allo=
wing
> >   * to check which fence is later by simply using dma_fence_later().
> > + *
> > + * It is strongly discouraged to provide an external lock. This is onl=
y allowed
> > + * for legacy use cases when multiple fences need to be prevented from
> > + * signaling out of order.
> >   */
> >  void
> >  dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *=
ops,
> > diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> > index 02af347293d0..c49324505b20 100644
> > --- a/drivers/dma-buf/sync_debug.h
> > +++ b/drivers/dma-buf/sync_debug.h
> > @@ -47,7 +47,7 @@ struct sync_timeline {
> > =20
> >  static inline struct sync_timeline *dma_fence_parent(struct dma_fence =
*fence)
> >  {
> > -	return container_of(fence->lock, struct sync_timeline, lock);
> > +	return container_of(fence->extern_lock, struct sync_timeline, lock);
> >  }
> > =20
> >  /**
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.h
> > index 139642eacdd0..d5c41e24fb51 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > @@ -638,7 +638,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amd=
gpu_vm *vm)
> >  	 * sure that the dma_fence structure isn't freed up.
> >  	 */
> >  	rcu_read_lock();
> > -	lock =3D vm->last_tlb_flush->lock;
> > +	lock =3D dma_fence_spinlock(vm->last_tlb_flush);
> >  	rcu_read_unlock();
> > =20
> >  	spin_lock_irqsave(lock, flags);
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index a7797d260f1e..17472915842f 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -159,7 +159,7 @@ static const struct dma_fence_ops drm_crtc_fence_op=
s;
> >  static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
> >  {
> >  	BUG_ON(fence->ops !=3D &drm_crtc_fence_ops);
> > -	return container_of(fence->lock, struct drm_crtc, fence_lock);
> > +	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
> >  }
> > =20
> >  static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fe=
nce)
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writ=
eback.c
> > index 95b8a2e4bda6..624a4e8b6c99 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -81,7 +81,7 @@
> >   *	From userspace, this property will always read as zero.
> >   */
> > =20
> > -#define fence_to_wb_connector(x) container_of(x->lock, \
> > +#define fence_to_wb_connector(x) container_of(x->extern_lock, \
> >  					      struct drm_writeback_connector, \
> >  					      fence_lock)
> > =20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/=
nouveau/nouveau_fence.c
> > index 4a193b7d6d9e..c282c94138b2 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -41,7 +41,8 @@ static const struct dma_fence_ops nouveau_fence_ops_l=
egacy;
> >  static inline struct nouveau_fence_chan *
> >  nouveau_fctx(struct nouveau_fence *fence)
> >  {
> > -	return container_of(fence->base.lock, struct nouveau_fence_chan, lock=
);
> > +	return container_of(fence->base.extern_lock, struct nouveau_fence_cha=
n,
> > +			    lock);
> >  }
> > =20
> >  static bool
> > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qx=
l_release.c
> > index 06b0b2aa7953..37d4ae0faf0d 100644
> > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > @@ -62,7 +62,8 @@ static long qxl_fence_wait(struct dma_fence *fence, b=
ool intr,
> >  	struct qxl_device *qdev;
> >  	unsigned long cur, end =3D jiffies + timeout;
> > =20
> > -	qdev =3D container_of(fence->lock, struct qxl_device, release_lock);
> > +	qdev =3D container_of(fence->extern_lock, struct qxl_device,
> > +			    release_lock);
> > =20
> >  	if (!wait_event_timeout(qdev->release_event,
> >  				(dma_fence_is_signaled(fence) ||
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_fence.c
> > index 85795082fef9..d251eec57df9 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> > @@ -47,7 +47,8 @@ struct vmw_event_fence_action {
> >  static struct vmw_fence_manager *
> >  fman_from_fence(struct vmw_fence_obj *fence)
> >  {
> > -	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
> > +	return container_of(fence->base.extern_lock, struct vmw_fence_manager,
> > +			    lock);
> >  }
> > =20
> >  static void vmw_fence_obj_destroy(struct dma_fence *f)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_h=
w_fence.c
> > index ae8ed15b64c5..14720623ad00 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > @@ -124,7 +124,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dm=
a_fence *fence);
> > =20
> >  static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fen=
ce)
> >  {
> > -	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
> > +	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
> > +			    lock);
> >  }
> > =20
> >  static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_f=
ence)
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 88c842fc35d5..6eabbb1c471c 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -34,7 +34,8 @@ struct seq_file;
> >   * @ops: dma_fence_ops associated with this fence
> >   * @rcu: used for releasing fence with kfree_rcu
> >   * @cb_list: list of all callbacks to call
> > - * @lock: spin_lock_irqsave used for locking
> > + * @extern_lock: external spin_lock_irqsave used for locking
> > + * @inline_lock: alternative internal spin_lock_irqsave used for locki=
ng
> >   * @context: execution context this fence belongs to, returned by
> >   *           dma_fence_context_alloc()
> >   * @seqno: the sequence number of this fence inside the execution cont=
ext,
> > @@ -49,6 +50,7 @@ struct seq_file;
> >   * of the time.
> >   *
> >   * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
> > + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of ext=
ernal one
> >   * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
> >   * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signali=
ng
> >   * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been=
 called
> > @@ -66,7 +68,10 @@ struct seq_file;
> >   * been completed, or never called at all.
> >   */
> >  struct dma_fence {
> > -	spinlock_t *lock;
> > +	union {
> > +		spinlock_t *extern_lock;
> > +		spinlock_t inline_lock;
> > +	};
> >  	const struct dma_fence_ops __rcu *ops;
> >  	/*
> >  	 * We clear the callback list on kref_put so that by the time we
> > @@ -100,6 +105,7 @@ struct dma_fence {
> > =20
> >  enum dma_fence_flag_bits {
> >  	DMA_FENCE_FLAG_INITIALIZED_BIT,
> > +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
> >  	DMA_FENCE_FLAG_SEQNO64_BIT,
> >  	DMA_FENCE_FLAG_SIGNALED_BIT,
> >  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > @@ -381,11 +387,12 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **f=
encep)
> >   * dma_fence_spinlock - return pointer to the spinlock protecting the =
fence
> >   * @fence: the fence to get the lock from
> >   *
> > - * Return the pointer to the extern lock.
> > + * Return either the pointer to the embedded or the external spin lock.
> >   */
> >  static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> >  {
> > -	return fence->lock;
> > +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> > +		&fence->inline_lock : fence->extern_lock;
> >  }
> > =20
> >  /**
> > @@ -396,7 +403,7 @@ static inline spinlock_t *dma_fence_spinlock(struct=
 dma_fence *fence)
> >   * Lock the fence, preventing it from changing to the signaled state.
> >   */
> >  #define dma_fence_lock_irqsave(fence, flags)	\
> > -	spin_lock_irqsave(fence->lock, flags)
> > +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
> > =20
> >  /**
> >   * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> > @@ -406,7 +413,7 @@ static inline spinlock_t *dma_fence_spinlock(struct=
 dma_fence *fence)
> >   * Unlock the fence, allowing it to change it's state to signaled agai=
n.
> >   */
> >  #define dma_fence_unlock_irqrestore(fence, flags)	\
> > -	spin_unlock_irqrestore(fence->lock, flags)
> > +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
> > =20
> >  /**
> >   * dma_fence_assert_held - lockdep assertion that fence is locked =20
>=20

