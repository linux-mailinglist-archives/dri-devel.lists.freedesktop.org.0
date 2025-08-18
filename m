Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6CB2AA58
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 16:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46D510E455;
	Mon, 18 Aug 2025 14:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/UzzCxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6616710E0D9;
 Mon, 18 Aug 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755527461; x=1787063461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJAMC0HCJO7tKBZkMQPbzlc8d29ZVJcuKp1kUO5veFQ=;
 b=k/UzzCxhitapn/0yF6/mjJrnd6sNMyxfuZ0NVsYdxRGcYn/FSV+6bN7m
 le7vhPy1OhHrvlCc4gDLXfjd3vtph8ppPU2AIrdUM85KpkXOqVSdDLRFq
 NLjikw5LvT1EiRizeHV8SJohQE5QIbH3OXJlR7hrdE60yfm/fpfHq/b0b
 +MAh6NyHMXK8nfv6jsJR2iIRHk/HeT0UD7b5THH+PuLqoBu8glFRdYfHh
 g7bBoeXorGcP+cWgorlja2exStKSBhP2bHqgMHDPBak8BWKZ1H8Iy8BdJ
 92pyFP0FXrCcWQGH66Owsdc7iI7mYp/V5q5cNM+ReU4F2sW67DJTSe5Cp A==;
X-CSE-ConnectionGUID: aCSKefnISn62bZSKLwcPBA==
X-CSE-MsgGUID: qVBynor0Ry2dRZQUdN4GHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61377966"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61377966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 07:31:00 -0700
X-CSE-ConnectionGUID: n3NaAbFuSNCUSRnuczmQtw==
X-CSE-MsgGUID: 34KBZ80xT7u9ev+HWcfQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172796445"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.221])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 07:30:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
Date: Mon, 18 Aug 2025 16:30:54 +0200
Message-ID: <2443311.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <0920872a-6f8d-4301-b9fb-c8fa54b7ffe7@amd.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
 <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
 <0920872a-6f8d-4301-b9fb-c8fa54b7ffe7@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Christian,

On Thursday, 14 August 2025 14:24:29 CEST Christian K=C3=B6nig wrote:
>=20
> On 14.08.25 10:16, Janusz Krzysztofik wrote:
> > When first user starts waiting on a not yet signaled fence of a chain
> > link, a dma_fence_chain callback is added to a user fence of that link.
> > When the user fence of that chain link is then signaled, the chain is
> > traversed in search for a first not signaled link and the callback is
> > rearmed on a user fence of that link.
> >=20
> > Since chain fences may be exposed to user space, e.g. over drm_syncobj
> > IOCTLs, users may start waiting on any link of the chain, then many lin=
ks
> > of a chain may have signaling enabled and their callbacks added to their
> > user fences.  Once an arbitrary user fence is signaled, all
> > dma_fence_chain callbacks added to it so far must be rearmed to another
> > user fence of the chain.  In extreme scenarios, when all N links of a
> > chain are awaited and then signaled in reverse order, the dma_fence_cha=
in
> > callback may be called up to N * (N + 1) / 2 times (an arithmetic serie=
s).
> >=20
> > To avoid that potential excessive accumulation of dma_fence_chain
> > callbacks, rearm a trimmed-down, signal only callback version to the ba=
se
> > fence of a previous link, if not yet signaled, otherwise just signal the
> > base fence of the current link instead of traversing the chain in search
> > for a first not signaled link and moving all callbacks collected so far=
 to
> > a user fence of that link.
>=20
> Well clear NAK to that! You can easily overflow the kernel stack with tha=
t!

I'll be happy to propose a better solution, but for that I need to understa=
nd=20
better your message.  Could you please point out an exact piece of the=20
proposed code and/or describe a scenario where you can see the risk of stac=
k=20
overflow?

>=20
> Additional to this messing with the fence ops outside of the dma_fence co=
de is an absolute no-go.

Could you please explain what piece of code you are referring to when you s=
ay=20
"messing with the fence ops outside the dma_fence code"?  If not this patch=
=20
then which particular one of this series did you mean?  I'm assuming you=20
didn't mean drm_syncobj code that I mentioned in my commit descriptions.

Thanks,
Janusz

>=20
> Regards,
> Christian.
>=20
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> > Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
> >  1 file changed, 84 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fe=
nce-chain.c
> > index a8a90acf4f34d..90eff264ee05c 100644
> > --- a/drivers/dma-buf/dma-fence-chain.c
> > +++ b/drivers/dma-buf/dma-fence-chain.c
> > @@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_=
name(struct dma_fence *fence)
> >          return "unbound";
> >  }
> > =20
> > -static void dma_fence_chain_irq_work(struct irq_work *work)
> > +static void signal_irq_work(struct irq_work *work)
> >  {
> >  	struct dma_fence_chain *chain;
> > =20
> >  	chain =3D container_of(work, typeof(*chain), work);
> > =20
> > -	/* Try to rearm the callback */
> > -	if (!dma_fence_chain_enable_signaling(&chain->base))
> > -		/* Ok, we are done. No more unsignaled fences left */
> > -		dma_fence_signal(&chain->base);
> > +	dma_fence_signal(&chain->base);
> >  	dma_fence_put(&chain->base);
> >  }
> > =20
> > -static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_c=
b *cb)
> > +static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> > +{
> > +	struct dma_fence_chain *chain;
> > +
> > +	chain =3D container_of(cb, typeof(*chain), cb);
> > +	init_irq_work(&chain->work, signal_irq_work);
> > +	irq_work_queue(&chain->work);
> > +}
> > +
> > +static void rearm_irq_work(struct irq_work *work)
> > +{
> > +	struct dma_fence_chain *chain;
> > +	struct dma_fence *prev;
> > +
> > +	chain =3D container_of(work, typeof(*chain), work);
> > +
> > +	rcu_read_lock();
> > +	prev =3D rcu_dereference(chain->prev);
> > +	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
> > +		prev =3D NULL;
> > +	rcu_read_unlock();
> > +	if (prev)
> > +		return;
> > +
> > +	/* Ok, we are done. No more unsignaled fences left */
> > +	signal_irq_work(work);
> > +}
> > +
> > +static inline bool fence_is_signaled__nested(struct dma_fence *fence)
> > +{
> > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > +		return true;
> > +
> > +	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> > +		unsigned long flags;
> > +
> > +		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
> > +		dma_fence_signal_locked(fence);
> > +		spin_unlock_irqrestore(fence->lock, flags);
> > +
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static bool prev_is_signaled(struct dma_fence_chain *chain)
> > +{
> > +	struct dma_fence *prev;
> > +	bool result;
> > +
> > +	rcu_read_lock();
> > +	prev =3D rcu_dereference(chain->prev);
> > +	result =3D !prev || fence_is_signaled__nested(prev);
> > +	rcu_read_unlock();
> > +
> > +	return result;
> > +}
> > +
> > +static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_c=
b *cb)
> >  {
> >  	struct dma_fence_chain *chain;
> > =20
> >  	chain =3D container_of(cb, typeof(*chain), cb);
> > -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
> > +	if (prev_is_signaled(chain)) {
> > +		/* Ok, we are done. No more unsignaled fences left */
> > +		init_irq_work(&chain->work, signal_irq_work);
> > +	} else {
> > +		/* Try to rearm the callback */
> > +		init_irq_work(&chain->work, rearm_irq_work);
> > +	}
> > +
> >  	irq_work_queue(&chain->work);
> > -	dma_fence_put(f);
> >  }
> > =20
> >  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
> >  {
> >  	struct dma_fence_chain *head =3D to_dma_fence_chain(fence);
> > +	int err =3D -ENOENT;
> > =20
> > -	dma_fence_get(&head->base);
> > -	dma_fence_chain_for_each(fence, &head->base) {
> > -		struct dma_fence *f =3D dma_fence_chain_contained(fence);
> > +	if (WARN_ON(!head))
> > +		return false;
> > =20
> > -		dma_fence_get(f);
> > -		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
> > +	dma_fence_get(fence);
> > +	if (head->fence)
> > +		err =3D dma_fence_add_callback(head->fence, &head->cb, rearm_or_sign=
al_cb);
> > +	if (err) {
> > +		if (prev_is_signaled(head)) {
> >  			dma_fence_put(fence);
> > -			return true;
> > +		} else {
> > +			init_irq_work(&head->work, rearm_irq_work);
> > +			irq_work_queue(&head->work);
> > +			err =3D 0;
> >  		}
> > -		dma_fence_put(f);
> >  	}
> > -	dma_fence_put(&head->base);
> > -	return false;
> > +
> > +	return !err;
> >  }
> > =20
> >  static bool dma_fence_chain_signaled(struct dma_fence *fence)
>=20
>=20




