Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMveJciVjWnd4wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:56:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0E12B97C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CFE10E6FD;
	Thu, 12 Feb 2026 08:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TkTeMQ0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A9510E6FC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:56:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fBTgL2fYqz9snh;
 Thu, 12 Feb 2026 09:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770886590; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHcTbCW6HJhsA3VV7Y4nfZhOIBFiLpdxVzphuahC5A4=;
 b=TkTeMQ0FjpV80QbNLW+RH6bCslGoFRkxTNo4P7t+CV8xTYAeOyjiVa8xG5D4E3Idd+8T0V
 xUN3lJP7cVlFBEhe1ys3dkEPVjIH2kMJQq5HrGz6ziiXY1OJMfNp0Zg/0RFpehqqPD4Oo1
 +nqsfpSzf7A4IcrQXeen2DtcSLyCiTRpsqDScQHUtzRipBavEEcuuLiFe0DPCrjIQ8Pegi
 39rA19oJtgR6Vy6WAGvMHDMInd4RSoMbWXrZvib4oJC1S7Anv8qIkJOTDDeiGkY/qp1+GN
 SjgFPWRMxQwwGnZaNG/iT6mwmd4DLX7ayXCd2hpi1BWJTMdyqmb8T3ldLaXVeA==
Message-ID: <9f929535744546bcb4eed26f6c27b4497ebc37bb.camel@mailbox.org>
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 12 Feb 2026 09:56:26 +0100
In-Reply-To: <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
 <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: cgdzotw8c6nhd5g17ayany1aedroitbh
X-MBO-RS-ID: ec77ea12e42bbb6050d
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
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,mailbox.org:mid,mailbox.org:dkim,bootlin.com:url];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: ADD0E12B97C
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 16:43 +0100, Christian K=C3=B6nig wrote:
> On 2/11/26 11:06, Philipp Stanner wrote:
> > On Tue, 2026-02-10 at 11:01 +0100, Christian K=C3=B6nig wrote:
> > > At first glance it is counter intuitive to protect a constant functio=
n
> > > pointer table by RCU, but this allows modules providing the function
> > > table to unload by waiting for an RCU grace period.
> >=20
> > I think that someone who does not already have a deep understanding
> > about dma-buf and fences will have much trouble understanding *why*
> > this patch is in the log and *what it achieves*.
> >=20
> > Good commit messages are at least as important as good code. In
> > drm/sched for example I've been trying so many times to figure out why
> > certain hacks and changes were implemented, but all that git-blame ever
> > gave me was one liners, often hinting at some driver internal work
> > around ._.
>=20
> How about something like this:
>=20
> The fence ops of a dma_fence currently need to life as long as the dma_fe=
nce is alive.
>=20
> This means that the module who originally issued a dma_fence can't unload=
 unless all of them are freed up.

s/who/which
s/of them/fences

>=20
> As first step to solve this issue protect the fence ops by RCU.
>=20
> While it is counter intuitive to protect a constant function pointer tabl=
e by RCU it allows modules to wait for an RCU grace period to make sure tha=
t nobody is executing their functions any more.

I'd say "=E2=80=A6 allows modules to wait for an RCU grace period before th=
ey
unload, to make sure that =E2=80=A6"

As for the commit's purpose, see bottom of my reply

>=20
>=20
> >=20
> > >=20
> > > v2: make one the now duplicated lockdep warnings a comment instead.
> > > v3: Add more documentation to ->wait and ->release callback.
> > > v4: fix typo in documentation
> > > v5: rebased on drm-tip
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++-----=
-------
> > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 29 ++++++++++++++--
> > > =C2=A02 files changed, 73 insertions(+), 25 deletions(-)
> > >=20
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.=
c
> > > index e05beae6e407..de9bf18be3d4 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
> > > =C2=A0signed long
> > > =C2=A0dma_fence_wait_timeout(struct dma_fence *fence, bool intr, sign=
ed long timeout)
> > > =C2=A0{
> > > +	const struct dma_fence_ops *ops;
> > > =C2=A0	signed long ret;
> > > =C2=A0
> > > =C2=A0	if (WARN_ON(timeout < 0))
> > > @@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence,=
 bool intr, signed long timeout)
> > > =C2=A0
> > > =C2=A0	dma_fence_enable_sw_signaling(fence);
> > > =C2=A0
> > > -	if (trace_dma_fence_wait_start_enabled()) {
> >=20
> > Why can wait_start_enabled() be removed? Is that related to the life
> > time decoupling or is it a separate topic?
>=20
> It isn't removed, I've just removed the "if (trace_dma_fence_wait_start_e=
nabled())" optimization which is used by the tracing subsystem as self-patc=
hing code (longer story).
>=20
> The trace_dma_fence_wait_start() trace point function is still called a f=
ew lines below.

OK.

>=20
> > > -		rcu_read_lock();
> > > -		trace_dma_fence_wait_start(fence);
> > > +	rcu_read_lock();
> > > +	ops =3D rcu_dereference(fence->ops);
> > > +	trace_dma_fence_wait_start(fence);
> > > +	if (ops->wait) {
> > > +		/*
> > > +		 * Implementing the wait ops is deprecated and not supported for
> > > +		 * issuer independent fences, so it is ok to use the ops outside
> >=20
> > s/issuer/issuers of
>=20
> Fixed.
>=20
> > And how do we know that this here is an independent fence?
> > What even is an "independent fence" =E2=80=93 one with internal spinloc=
k?
>=20
> I rephrased the sentence a bit to make that more clearer:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * Implementing the wait ops is deprecated and not =
supported for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * issuers of fences who wants them to be independe=
nt of their

s/wants/need their lifetime to be

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * module after they signal, so it is ok to use the=
 ops outside
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * the RCU protected section.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
>=20
> >=20
> > > +		 * the RCU protected section.
> > > +		 */
> > > +		rcu_read_unlock();
> > > +		ret =3D ops->wait(fence, intr, timeout);
> > > +	} else {
> > > =C2=A0		rcu_read_unlock();
> > > -	}
> > > -	if (fence->ops->wait)
> > > -		ret =3D fence->ops->wait(fence, intr, timeout);
> > > -	else
> > > =C2=A0		ret =3D dma_fence_default_wait(fence, intr, timeout);
> > > +	}
> >=20
> > The git diff here looks awkward. Do you use git format-patch --
> > histogram?
>=20
> Nope, what's the matter?

The '}' is removed and then added again.

>=20
> > > =C2=A0	if (trace_dma_fence_wait_end_enabled()) {
> > > =C2=A0		rcu_read_lock();
> > > =C2=A0		trace_dma_fence_wait_end(fence);
>=20
> > > =C2=A0
> > > @@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, cons=
t struct dma_fence_ops *ops,
> > > =C2=A0	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_nam=
e);
> > > =C2=A0
> > > =C2=A0	kref_init(&fence->refcount);
> > > -	fence->ops =3D ops;
> > > +	/*
> > > +	 * At first glance it is counter intuitive to protect a constant
> > > +	 * function pointer table by RCU, but this allows modules providing=
 the
> > > +	 * function table to unload by waiting for an RCU grace period.
> >=20
> > Maybe add a sentence like "Fences can live longer than the module which
> > issued them."
>=20
> Going to use the same as the commit message here as soon as we synced up =
on that.

Jawohl.

>=20
> >=20
> > > +	 */
> > > +	RCU_INIT_POINTER(fence->ops, ops);
> > > =C2=A0	INIT_LIST_HEAD(&fence->cb_list);
> > > =C2=A0	fence->lock =3D lock;
> > > =C2=A0	fence->context =3D context;
> > > @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
> > > =C2=A0 */
> > > =C2=A0const char __rcu *dma_fence_driver_name(struct dma_fence *fence=
)
> > > =C2=A0{
> > > -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> > > -			 "RCU protection is required for safe access to returned string")=
;
> > > +	const struct dma_fence_ops *ops;
> > > =C2=A0
> > > +	/* RCU protection is required for safe access to returned string */
> > > +	ops =3D rcu_dereference(fence->ops);
> > > =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> > > -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> > > +		return (const char __rcu *)ops->get_driver_name(fence);
> > > =C2=A0	else
> > > =C2=A0		return (const char __rcu *)"detached-driver";
> > > =C2=A0}
> > > @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
> > > =C2=A0 */
> > > =C2=A0const char __rcu *dma_fence_timeline_name(struct dma_fence *fen=
ce)
> > > =C2=A0{
> > > -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> > > -			 "RCU protection is required for safe access to returned string")=
;
> > > +	const struct dma_fence_ops *ops;
> > > =C2=A0
> > > +	/* RCU protection is required for safe access to returned string */
> > > +	ops =3D rcu_dereference(fence->ops);
> > > =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> > > -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> > > +		return (const char __rcu *)ops->get_driver_name(fence);
> > > =C2=A0	else
> > > =C2=A0		return (const char __rcu *)"signaled-timeline";
> > > =C2=A0}
> >=20
> > Did we make any progress in our conversation about removing those two
> > functions and callbacks? They're only used by i915.
>=20
> Actually they are mostly used by the trace points and debugfs, so we cert=
ainly can't remove them.

._.

>=20
> But I'm really wondering why the heck i915 is using them?

I just got confused because I couldn't find the place anymore. Since
they have removed it since then.

In older kernels it was used for driver logging:

https://elixir.bootlin.com/linux/v6.15.11/source/drivers/gpu/drm/i915/i915_=
sw_fence.c#L437


>=20
> > >=20
> > > @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *=
fence)
> > > =C2=A0static inline bool
> > > =C2=A0dma_fence_is_signaled_locked(struct dma_fence *fence)
> > > =C2=A0{
> > > +	const struct dma_fence_ops *ops;
> > > +
> > > =C2=A0	if (dma_fence_test_signaled_flag(fence))
> > > =C2=A0		return true;
> > > =C2=A0
> > > -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> > > +	rcu_read_lock();
> > > +	ops =3D rcu_dereference(fence->ops);
> > > +	if (ops->signaled && ops->signaled(fence)) {
> >=20
> > Maybe you can educate me a bit about RCU here =E2=80=93 couldn't this s=
till
> > race? If the ops were unloaded before you take rcu_read_lock(),
> > rcu_dereference() would give you an invalid pointer here since you
> > don't check for !ops, no?
>=20
> Perfectly correct thinking, yes.
>=20
> But the check for !ops is added in patch #2 when we actually start to set=
 ops =3D NULL when the fence signals.
>=20
> I intentionally separated that because it is basically the second step in=
 making the solution to detach the fence ops from the module by RCU work.
>=20
> We could merge the two patches together, but I think the separation actua=
lly makes sense should anybody start to complain about the additional RCU o=
verhead.
>=20

Alright, makes sense. However the above does not read correct..

But then my question would be: What's the purpose of this patch, what
does it solve or address atomically?

Adding RCU here does not yet change behavior and it does not solve the
unloading problem, does it?


If it's a mere preperational step and the patches should not be merged,
I'd guard the above with a simple comment like "Cleanup preparation.
'ops' can yet not be NULL, but this will be the case subsequently."


P.

