Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3015B2BC80
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B2910E55A;
	Tue, 19 Aug 2025 09:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dD8NsG0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34F10E55A;
 Tue, 19 Aug 2025 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755594259; x=1787130259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35wbuXUWqXLw3bf6coBuXABFfBPt40tPdTPKUaMbrMo=;
 b=dD8NsG0bNaLSibAI1iioopdLS+r/fDHVxWPweT7QA6LZf4RJ91/krLWX
 fkM8Cr4zeETzee9bykxHDs3GNl6HZJvYBJWGhPP9tG+UYenQ6s7RSpQ3Q
 MCJlt7OxNgT/MD0xHLZkOJy8aUbYThqsO/T6P2Lb++E941XXxYkLriAan
 j3H0DlGiM49nHYhD6foXuGxMU78RZaqGAS5Xd8QvsR3Mpj56QLrksGp+7
 rNDwIEN78PDHtpNN9UzGK+sov/FFN91HqZ9DR7GTp7sExV7B0rPX5xmUw
 ccPkIi2LL61lFYsDasLA2KN76Ln4eeER0DbD0EQP0YcxpqfPdylK/abdE w==;
X-CSE-ConnectionGUID: bUDqvG+sSHWux8IFbVXsGQ==
X-CSE-MsgGUID: gwZtUGghSqmGE/mVBX82NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68540643"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68540643"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 02:04:18 -0700
X-CSE-ConnectionGUID: uvbEHuYfT9O568xJmssRyw==
X-CSE-MsgGUID: asPcGpJWT1e3UldB8qS6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172222542"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 02:04:14 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
Date: Tue, 19 Aug 2025 11:04:11 +0200
Message-ID: <2067093.PIDvDuAF1L@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c4bac4d8-9c5b-446c-b9a1-1bc7ac6b38ff@amd.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
 <2443311.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
 <c4bac4d8-9c5b-446c-b9a1-1bc7ac6b38ff@amd.com>
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

On Monday, 18 August 2025 16:42:56 CEST Christian K=C3=B6nig wrote:
> On 18.08.25 16:30, Janusz Krzysztofik wrote:
> > Hi Christian,
> >=20
> > On Thursday, 14 August 2025 14:24:29 CEST Christian K=C3=B6nig wrote:
> >>
> >> On 14.08.25 10:16, Janusz Krzysztofik wrote:
> >>> When first user starts waiting on a not yet signaled fence of a chain
> >>> link, a dma_fence_chain callback is added to a user fence of that lin=
k.
> >>> When the user fence of that chain link is then signaled, the chain is
> >>> traversed in search for a first not signaled link and the callback is
> >>> rearmed on a user fence of that link.
> >>>
> >>> Since chain fences may be exposed to user space, e.g. over drm_syncobj
> >>> IOCTLs, users may start waiting on any link of the chain, then many l=
inks
> >>> of a chain may have signaling enabled and their callbacks added to th=
eir
> >>> user fences.  Once an arbitrary user fence is signaled, all
> >>> dma_fence_chain callbacks added to it so far must be rearmed to anoth=
er
> >>> user fence of the chain.  In extreme scenarios, when all N links of a
> >>> chain are awaited and then signaled in reverse order, the dma_fence_c=
hain
> >>> callback may be called up to N * (N + 1) / 2 times (an arithmetic ser=
ies).
> >>>
> >>> To avoid that potential excessive accumulation of dma_fence_chain
> >>> callbacks, rearm a trimmed-down, signal only callback version to the =
base
> >>> fence of a previous link, if not yet signaled, otherwise just signal =
the
> >>> base fence of the current link instead of traversing the chain in sea=
rch
> >>> for a first not signaled link and moving all callbacks collected so f=
ar to
> >>> a user fence of that link.
> >>
> >> Well clear NAK to that! You can easily overflow the kernel stack with =
that!
> >=20
> > I'll be happy to propose a better solution, but for that I need to unde=
rstand=20
> > better your message.  Could you please point out an exact piece of the=
=20
> > proposed code and/or describe a scenario where you can see the risk of =
stack=20
> > overflow?
>=20
> The sentence "rearm .. to the base fence of a previous link" sounds like =
you are trying to install a callback on the signaling to the previous chain=
 element.
>=20
> That is exactly what I pointed out previously where you need to be super =
careful because when this chain signals the callbacks will execute recursiv=
ely which means that you can trivially overflow the kernel stack if you hav=
e more than a handful of chain elements.
>=20
> In other words A waits for B, B waits for C, C waits for D etc.... when D=
 finally signals it will call C which in turn calls B which in turn calls A.

OK, maybe my commit description was not precise enough, however, I didn't=20
describe implementation details (how) intentionally.
When D signals then it doesn't call C directly, only it submits an irq work=
=20
that calls C.  Then C doesn't just call B, only it submits another irq work=
=20
that calls B, and so on.
Doesn't that code pattern effectively break the recursion loop into separat=
e=20
work items, each with its own separate stack?

>=20
> Even if the chain is a recursive data structure you absolutely can't use =
recursion for the handling of it.
>=20
> Maybe I misunderstood your textual description but reading a sentence lik=
e this rings all alarm bells here. Otherwise I can't see what the patch is =
supposed to be optimizing.

OK, maybe I should start my commit description of this patch with a copy of=
=20
the first sentence from cover letter and also from patch 1/4 description th=
at=20
informs about the problem as reported by CI.  Maybe I should also provide a=
=20
comparison of measured signaling times from trybot executions [1][2][3]. =20
Here are example numbers from CI machine fi-bsw-n3050:

With signaling time reports only added to selftests (patch 1 of 4):
<6> [777.914451] dma-buf: Running dma_fence_chain/wait_forward
<6> [778.123516] wait_forward: 4096 signals in 21373487 ns
<6> [778.335709] dma-buf: Running dma_fence_chain/wait_backward
<6> [795.791546] wait_backward: 4096 signals in 17249051192 ns
<6> [795.859699] dma-buf: Running dma_fence_chain/wait_random
<6> [796.161375] wait_random: 4096 signals in 97386256 ns

With dma_fence_enable_signaling() replaced in selftests with dma_fence_wait=
()=20
(patches 1-3 of 4):
<6> [782.505692] dma-buf: Running dma_fence_chain/wait_forward
<6> [784.609213] wait_forward: 4096 signals in 36513103 ns
<3> [784.837226] Reported -4 for kthread_stop_put(0)!
<6> [785.147643] dma-buf: Running dma_fence_chain/wait_backward
<6> [806.367763] wait_backward: 4096 signals in 18428009499 ns
<6> [807.175325] dma-buf: Running dma_fence_chain/wait_random
<6> [809.453942] wait_random: 4096 signals in 119761950 ns

With the fix (patches 1-4 of 4):
<6> [731.519020] dma-buf: Running dma_fence_chain/wait_forward
<6> [733.623375] wait_forward: 4096 signals in 31890220 ns
<6> [734.258972] dma-buf: Running dma_fence_chain/wait_backward
<6> [736.267325] wait_backward: 4096 signals in 39007955 ns
<6> [736.700221] dma-buf: Running dma_fence_chain/wait_random
<6> [739.346706] wait_random: 4096 signals in 48384865 ns

Signaling time in wait_backward selftest has been reduced from 17s to 39ms.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152785v1/index.html?
[2] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152828v2/index.html?
[3] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152830v2/index.html?

>=20
> >>
> >> Additional to this messing with the fence ops outside of the dma_fence=
 code is an absolute no-go.
> >=20
> > Could you please explain what piece of code you are referring to when y=
ou say=20
> > "messing with the fence ops outside the dma_fence code"?  If not this p=
atch=20
> > then which particular one of this series did you mean?  I'm assuming yo=
u=20
> > didn't mean drm_syncobj code that I mentioned in my commit descriptions.
>=20
> See below.
>=20
> >=20
> > Thanks,
> > Janusz
> >=20
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> >>> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> >>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >>> ---
> >>>  drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++---=
=2D-
> >>>  1 file changed, 84 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-=
fence-chain.c
> >>> index a8a90acf4f34d..90eff264ee05c 100644
> >>> --- a/drivers/dma-buf/dma-fence-chain.c
> >>> +++ b/drivers/dma-buf/dma-fence-chain.c
> >>> @@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timelin=
e_name(struct dma_fence *fence)
> >>>          return "unbound";
> >>>  }
> >>> =20
> >>> -static void dma_fence_chain_irq_work(struct irq_work *work)
> >>> +static void signal_irq_work(struct irq_work *work)
> >>>  {
> >>>  	struct dma_fence_chain *chain;
> >>> =20
> >>>  	chain =3D container_of(work, typeof(*chain), work);
> >>> =20
> >>> -	/* Try to rearm the callback */
> >>> -	if (!dma_fence_chain_enable_signaling(&chain->base))
> >>> -		/* Ok, we are done. No more unsignaled fences left */
> >>> -		dma_fence_signal(&chain->base);
> >>> +	dma_fence_signal(&chain->base);
> >>>  	dma_fence_put(&chain->base);
> >>>  }
> >>> =20
> >>> -static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence=
_cb *cb)
> >>> +static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> >>> +{
> >>> +	struct dma_fence_chain *chain;
> >>> +
> >>> +	chain =3D container_of(cb, typeof(*chain), cb);
> >>> +	init_irq_work(&chain->work, signal_irq_work);
> >>> +	irq_work_queue(&chain->work);
> >>> +}
> >>> +
> >>> +static void rearm_irq_work(struct irq_work *work)
> >>> +{
> >>> +	struct dma_fence_chain *chain;
> >>> +	struct dma_fence *prev;
> >>> +
> >>> +	chain =3D container_of(work, typeof(*chain), work);
> >>> +
> >>> +	rcu_read_lock();
> >>> +	prev =3D rcu_dereference(chain->prev);
> >>> +	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
> >>> +		prev =3D NULL;
> >>> +	rcu_read_unlock();
> >>> +	if (prev)
> >>> +		return;
> >>> +
> >>> +	/* Ok, we are done. No more unsignaled fences left */
> >>> +	signal_irq_work(work);
> >>> +}
> >>> +
> >>> +static inline bool fence_is_signaled__nested(struct dma_fence *fence)
> >>> +{
> >>> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >>> +		return true;
> >>> +
>=20
> >>> +	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>=20
> Calling this outside of dma-fence.[ch] is a clear no-go.

But this patch applies only to drivers/dma-buf/dma-fence-chain.c, not=20
outside of it.

Thanks,
Janusz

>=20
> Regards,
> Christian.
>=20
> >>> +		unsigned long flags;
> >>> +
> >>> +		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
> >>> +		dma_fence_signal_locked(fence);
> >>> +		spin_unlock_irqrestore(fence->lock, flags);
> >>> +
> >>> +		return true;
> >>> +	}
> >>> +
> >>> +	return false;
> >>> +}
> >>> +
> >>> +static bool prev_is_signaled(struct dma_fence_chain *chain)
> >>> +{
> >>> +	struct dma_fence *prev;
> >>> +	bool result;
> >>> +
> >>> +	rcu_read_lock();
> >>> +	prev =3D rcu_dereference(chain->prev);
> >>> +	result =3D !prev || fence_is_signaled__nested(prev);
> >>> +	rcu_read_unlock();
> >>> +
> >>> +	return result;
> >>> +}
> >>> +
> >>> +static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence=
_cb *cb)
> >>>  {
> >>>  	struct dma_fence_chain *chain;
> >>> =20
> >>>  	chain =3D container_of(cb, typeof(*chain), cb);
> >>> -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
> >>> +	if (prev_is_signaled(chain)) {
> >>> +		/* Ok, we are done. No more unsignaled fences left */
> >>> +		init_irq_work(&chain->work, signal_irq_work);
> >>> +	} else {
> >>> +		/* Try to rearm the callback */
> >>> +		init_irq_work(&chain->work, rearm_irq_work);
> >>> +	}
> >>> +
> >>>  	irq_work_queue(&chain->work);
> >>> -	dma_fence_put(f);
> >>>  }
> >>> =20
> >>>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
> >>>  {
> >>>  	struct dma_fence_chain *head =3D to_dma_fence_chain(fence);
> >>> +	int err =3D -ENOENT;
> >>> =20
> >>> -	dma_fence_get(&head->base);
> >>> -	dma_fence_chain_for_each(fence, &head->base) {
> >>> -		struct dma_fence *f =3D dma_fence_chain_contained(fence);
> >>> +	if (WARN_ON(!head))
> >>> +		return false;
> >>> =20
> >>> -		dma_fence_get(f);
> >>> -		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
> >>> +	dma_fence_get(fence);
> >>> +	if (head->fence)
> >>> +		err =3D dma_fence_add_callback(head->fence, &head->cb, rearm_or_si=
gnal_cb);
> >>> +	if (err) {
> >>> +		if (prev_is_signaled(head)) {
> >>>  			dma_fence_put(fence);
> >>> -			return true;
> >>> +		} else {
> >>> +			init_irq_work(&head->work, rearm_irq_work);
> >>> +			irq_work_queue(&head->work);
> >>> +			err =3D 0;
> >>>  		}
> >>> -		dma_fence_put(f);
> >>>  	}
> >>> -	dma_fence_put(&head->base);
> >>> -	return false;
> >>> +
> >>> +	return !err;
> >>>  }
> >>> =20
> >>>  static bool dma_fence_chain_signaled(struct dma_fence *fence)
> >>
> >>
> >=20
> >=20
> >=20
> >=20
>=20
>=20




