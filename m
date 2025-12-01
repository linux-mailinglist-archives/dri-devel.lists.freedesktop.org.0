Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA89C980FE
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6A510E010;
	Mon,  1 Dec 2025 15:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RJMoTVd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CAD10E010;
 Mon,  1 Dec 2025 15:34:43 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dKnyS2nxQz9t7d;
 Mon,  1 Dec 2025 16:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764603280; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgphQImo2CsCBeaCQs8YEn7VRVszdQcY1N+6nFeVvP0=;
 b=RJMoTVd0KT3Am/i7RHmcUdZ67k5CBi+kZl9EEsPD2iE2f9yWC00VfQQQO2/mLq4ICSbzFl
 WAgy6uiwm5pAQ/ojek1ecv4MOkfHekA8bbcJEUryGB6pq2RPO4M1OsPyMEueel5O26+hmQ
 1/Llt1MOxBbvN1T+1THDoJ3uMwBzjAdVCGqsJRpQqWGidV9YTkEODLrJG3lF2NQaTChQFM
 8EQx/2yicrNHVndvn8SZOZt8pBkFq0PkJMIje+VIJbUQIwj/DVsVjuF0sPdR/z03JastDN
 27Bj6re/HOL2ghT0W3FwWx28bTsxjfM09+AT6/QUN2rkgn2aZ5cf+RJcK0oSug==
Message-ID: <8eaab4c04fad84bde279ee2cd228fac4f84c5184.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 16:34:32 +0100
In-Reply-To: <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b98572e8d9faed18a8e
X-MBO-RS-META: 51juwjpfinahneyw9wwu3nc86zzu6ucz
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

On Mon, 2025-12-01 at 16:20 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 14:55, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 11:50, Philipp Stanner wrote:
> > > > The overwhelming majority of users of dma_fence signaling functions
> > > > don't care about whether the fence had already been signaled by som=
eone
> > > > else. Therefore, the return code shall be removed from those functi=
ons.
> > > >=20
> > > > For the few users who rely on the check, a new, specialized functio=
n
> > > > shall be provided.
> > > >=20
> > > > Add dma_fence_check_and_signal(), which signals a fence if it had n=
ot
> > > > yet been signaled, and informs the user about that.
> > > >=20
> > > > Add a counter part, dma_fence_check_and_signal_locked(), which does=
n't
> > > > take the spinlock.
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0drivers/dma-buf/dma-fence.c | 44 ++++++++++++++++++++++++++++=
+++++++++
> > > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 2 ++
> > > > =C2=A02 files changed, 46 insertions(+)
> > > >=20
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fenc=
e.c
> > > > index 96d72ffc0750..146de62887cf 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *=
fence)
> > > > =C2=A0}
> > > > =C2=A0EXPORT_SYMBOL(dma_fence_signal_locked);
> > > > =C2=A0
> > > > +/**
> > > > + * dma_fence_check_and_signal_locked - signal the fence if it's no=
t yet signaled
> > > > + * @fence: the fence to check and signal
> > > > + *
> > > > + * Checks whether a fence was signaled and signals it if it was no=
t yet signaled.
> > > > + *
> > > > + * Unlike dma_fence_check_and_signal(), this function must be call=
ed with
> > > > + * &struct dma_fence.lock being held.
> > > > + *
> > > > + * Return: true if fence has been signaled already, false otherwis=
e.
> > > > + */
> > > > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
> > >=20
> > > I'm seriously considering to nuke all the unlocked variants of dma_fe=
nce functions and just make it mandatory for callers to grab the lock manua=
lly.
> > >=20
> >=20
> > You mean "nuke the *locked* variants.
>=20
> Sorry, that wasn't specific enough.
>=20
> What I meant was making the locked variants the default instead of the un=
locked ones.

Well, no :D

What you want to do is:
- Delete / deprecate the *locked* variants
- Force all users to take the fence lock manually, then use the (now
all unlocked) dma fence functions.

ACK?

>=20
> >=20
> > Why, though? Aren't they enough for most users?
> > I suppose you have all those subtle races in mind..
>=20
> Yeah, exactly that.
>=20
> >=20
> > > > +{
> > > > +	bool ret;
> > > > +
> > > > +	ret =3D dma_fence_test_signaled_flag(fence);
> > > > +	dma_fence_signal_locked(fence);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
> > > > +
> > > > +/**
> > > > + * dma_fence_check_and_signal - signal the fence if it's not yet s=
ignaled
> > > > + * @fence: the fence to check and signal
> > > > + *
> > > > + * Checks whether a fence was signaled and signals it if it was no=
t yet signaled.
> > > > + * All this is done in a race-free manner.
> > > > + *
> > > > + * Return: true if fence has been signaled already, false otherwis=
e.
> > > > + */
> > > > +bool dma_fence_check_and_signal(struct dma_fence *fence)
> > >=20
> > > So I think we should name this one here dma_fence_check_and_signal_un=
locked() and drop the postfix from the locked variant.
> >=20
> > postfix?
> >=20
> > Well, now, IDK. Can't we, for this series, keep the _locked() variant
> > so that it's congruent with all the other dma_fence code?
>=20
> Good point. That thought was not really related to this series here.

OK, then let's progress with this here for now.


P.

>=20
> >=20
> > And then later if you want to force manual locking you can add that
> > kernel-wide in a separate series, since it'll be a discussion-worthy,
> > bigger chunk of work.
> >=20
> > That's cleaner, and my series here won't prevent that once merged.
> >=20
> > >=20
> > > > +{
> > > > +	unsigned long flags;
> > > > +	bool ret;
> > > > +
> > > > +	spin_lock_irqsave(fence->lock, flags);
> > > > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > > > +	spin_unlock_irqrestore(fence->lock, flags);
> > >=20
> > > Could this use guard(fence->lock, flags) ?
> >=20
> > guard? You mean a lockdep guard? Do you have a pointer to someplace in
> > dma_fence who does what you mean / want?
>=20
> E.g. like guard(spinlock_irqsave)(&fence->lock);
>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_check_and_signal);
> > > > +
> > > > =C2=A0/**
> > > > =C2=A0 * dma_fence_signal - signal completion of a fence
> > > > =C2=A0 * @fence: the fence to signal
> > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > index 19972f5d176f..0504afe52c2a 100644
> > > > --- a/include/linux/dma-fence.h
> > > > +++ b/include/linux/dma-fence.h
> > > > @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void)=
 {}
> > > > =C2=A0#endif
> > > > =C2=A0
> > > > =C2=A0int dma_fence_signal(struct dma_fence *fence);
> > > > +bool dma_fence_check_and_signal(struct dma_fence *fence);
> > > > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
> > > > =C2=A0int dma_fence_signal_locked(struct dma_fence *fence);
> > > > =C2=A0int dma_fence_signal_timestamp(struct dma_fence *fence, ktime=
_t timestamp);
> > > > =C2=A0int dma_fence_signal_timestamp_locked(struct dma_fence *fence=
,
> > >=20
> >=20
>=20

