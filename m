Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083FC97BD0
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC91410E0F6;
	Mon,  1 Dec 2025 13:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="plcljVeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8162310E0F6;
 Mon,  1 Dec 2025 13:55:47 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKlmJ3765z9tKR;
 Mon,  1 Dec 2025 14:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764597344; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rg+qhwib/8O51wxToBYimy9Y6f9JgB1Dve23+PJJ9c=;
 b=plcljVequGv0OMIsFPb86XNV4g2m9g3I+RHMEU8zV0rghuZsg0MzGDQHsXqkSQFGTku3CO
 aTeIELWAFnJMKOxoDTK16nzwjM19+EdhEain46pjNjdjrDSrRKqVVYa6fJWkuQtobynU4J
 YoXAbCw302S+z+S+nfAWczEYDmgQ8sAbU8YwrrT3t7sl29U0hGEdqV55lqtfo2NmjHcwvc
 IPUfI+GE/z+9qMgq3kJgNnOv4AQkckPMr7TwKfefnvdAEzM5K1TxQyjJeAlmgah1y/jZ4a
 28V2etrXFlq8B6oHzClbjtCUfUwM9TjCV1r9IdIk0iopGll+KYhuS+NznsHJMg==
Message-ID: <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 14:55:36 +0100
In-Reply-To: <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0547f98a82f20db491e
X-MBO-RS-META: mgfutdw3e6i3579mwk8uso567ryge67a
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

On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 11:50, Philipp Stanner wrote:
> > The overwhelming majority of users of dma_fence signaling functions
> > don't care about whether the fence had already been signaled by someone
> > else. Therefore, the return code shall be removed from those functions.
> >=20
> > For the few users who rely on the check, a new, specialized function
> > shall be provided.
> >=20
> > Add dma_fence_check_and_signal(), which signals a fence if it had not
> > yet been signaled, and informs the user about that.
> >=20
> > Add a counter part, dma_fence_check_and_signal_locked(), which doesn't
> > take the spinlock.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c | 44 ++++++++++++++++++++++++++++++++=
+++++
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A02 files changed, 46 insertions(+)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 96d72ffc0750..146de62887cf 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *fenc=
e)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(dma_fence_signal_locked);
> > =C2=A0
> > +/**
> > + * dma_fence_check_and_signal_locked - signal the fence if it's not ye=
t signaled
> > + * @fence: the fence to check and signal
> > + *
> > + * Checks whether a fence was signaled and signals it if it was not ye=
t signaled.
> > + *
> > + * Unlike dma_fence_check_and_signal(), this function must be called w=
ith
> > + * &struct dma_fence.lock being held.
> > + *
> > + * Return: true if fence has been signaled already, false otherwise.
> > + */
> > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
>=20
> I'm seriously considering to nuke all the unlocked variants of dma_fence =
functions and just make it mandatory for callers to grab the lock manually.
>=20

You mean "nuke the *locked* variants.

Why, though? Aren't they enough for most users?
I suppose you have all those subtle races in mind..

> > +{
> > +	bool ret;
> > +
> > +	ret =3D dma_fence_test_signaled_flag(fence);
> > +	dma_fence_signal_locked(fence);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
> > +
> > +/**
> > + * dma_fence_check_and_signal - signal the fence if it's not yet signa=
led
> > + * @fence: the fence to check and signal
> > + *
> > + * Checks whether a fence was signaled and signals it if it was not ye=
t signaled.
> > + * All this is done in a race-free manner.
> > + *
> > + * Return: true if fence has been signaled already, false otherwise.
> > + */
> > +bool dma_fence_check_and_signal(struct dma_fence *fence)
>=20
> So I think we should name this one here dma_fence_check_and_signal_unlock=
ed() and drop the postfix from the locked variant.

postfix?

Well, now, IDK. Can't we, for this series, keep the _locked() variant
so that it's congruent with all the other dma_fence code?

And then later if you want to force manual locking you can add that
kernel-wide in a separate series, since it'll be a discussion-worthy,
bigger chunk of work.

That's cleaner, and my series here won't prevent that once merged.

>=20
> > +{
> > +	unsigned long flags;
> > +	bool ret;
> > +
> > +	spin_lock_irqsave(fence->lock, flags);
> > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > +	spin_unlock_irqrestore(fence->lock, flags);
>=20
> Could this use guard(fence->lock, flags) ?

guard? You mean a lockdep guard? Do you have a pointer to someplace in
dma_fence who does what you mean / want?


P.

>=20
> Regards,
> Christian.
>=20
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(dma_fence_check_and_signal);
> > +
> > =C2=A0/**
> > =C2=A0 * dma_fence_signal - signal completion of a fence
> > =C2=A0 * @fence: the fence to signal
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 19972f5d176f..0504afe52c2a 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void) {}
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0int dma_fence_signal(struct dma_fence *fence);
> > +bool dma_fence_check_and_signal(struct dma_fence *fence);
> > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
> > =C2=A0int dma_fence_signal_locked(struct dma_fence *fence);
> > =C2=A0int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t t=
imestamp);
> > =C2=A0int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>=20

