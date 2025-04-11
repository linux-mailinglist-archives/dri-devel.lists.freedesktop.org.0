Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F2A86011
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 16:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D1A10EBCF;
	Fri, 11 Apr 2025 14:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="P69RrHQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5310EBCF;
 Fri, 11 Apr 2025 14:10:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZYz9P26k0z9snv;
 Fri, 11 Apr 2025 16:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744380633; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRhJW5jicPYJ3BT6+JTiDRHAzS7z/btQ3Ka6vbAdHmw=;
 b=P69RrHQ+i34M14yVUZLq7X7ujch5aOr81j3uSNqO8Y8XtZ+M0yzgk7RK2Mw/oJRCRNC+2c
 eQqlfEx+utW6E4KPuBZC+3fr/3LzB9ThFNKSfcFhj7PvqkIZ7rFZqRPKIAql9UCC6zLvT+
 tw4ULLBNqv2s5MndRfv5LyCG4QKae77nvvVx0mQH+TVOdqwktldtYNha4+N5fKoyzhj0Ys
 5dBkzuadgSwzaZFhGmT+KGS3l3rUjPQLae0IaAnSxyQjabIGAKuN6BDAOLKnbNFWB+sMk1
 BqKtJqwl9f2OeZhxdpxffv+GLUhMNbYZuSSQTPOyJuTV3kFrQC1ccuwjFzXXUw==
Message-ID: <1127db242503055b2e5e8d07db3aeae46cfb7a24.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 stable@vger.kernel.org
Date: Fri, 11 Apr 2025 16:10:29 +0200
In-Reply-To: <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
 <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: c9c4ztxjf4myurkd7ymjqraayr6dm8uq
X-MBO-RS-ID: 57e74fcf47f15cb7df3
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

On Fri, 2025-04-11 at 15:06 +0200, Christian K=C3=B6nig wrote:
> Am 11.04.25 um 14:44 schrieb Philipp Stanner:
> > On Fri, 2025-04-11 at 13:05 +0200, Christian K=C3=B6nig wrote:
> > > =C2=A0Am 11.04.25 um 11:29 schrieb Philipp Stanner:
> > > =C2=A0
> > > > [SNIP]
> > > > =C2=A0
> > > > It could be, however, that at the same moment
> > > > nouveau_fence_signal() is
> > > > removing that entry, holding the appropriate lock.
> > > >=20
> > > > So we have a race. Again.
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0Ah, yes of course. If signaled is called with or without the
> > > lock is
> > > actually undetermined.
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > You see, fixing things in Nouveau is difficult :)
> > > > It gets more difficult if you want to clean it up "properly",
> > > > so it
> > > > conforms to rules such as those from dma_fence.
> > > >=20
> > > > I have now provided two fixes that both work, but you are not
> > > > satisfied
> > > > with from the dma_fence-maintainer's perspective. I understand
> > > > that,
> > > > but please also understand that it's actually not my primary
> > > > task
> > > > to
> > > > work on Nouveau. I just have to fix this bug to move on with my
> > > > scheduler work.
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0Well I'm happy with whatever solution as long as it works, but
> > > as
> > > far as I can see the approach with the callback simply doesn't.
> > > =C2=A0
> > > =C2=A0You just can't drop the fence reference for the list from the
> > > callback.
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > So if you have another idea, feel free to share it. But I'd
> > > > like to
> > > > know how we can go on here.
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0Well the fence code actually works, doesn't it? The problem is
> > > rather that setting the error throws a warning because it doesn't
> > > expect signaled fences on the pending list.
> > > =C2=A0
> > > =C2=A0Maybe we should fix that instead.
> > The fence code works as the author intended, but I would be happy
> > if it
> > were more explicitly documented.
> >=20
> > Regarding the WARN_ON: It occurs in dma_fence_set_error() because
> > there
> > is an attempt to set an error code on a signaled fence. I don't
> > think
> > that should be "fixed", it works as intended: You must not set an
> > error
> > code of a fence that was already signaled.
> >=20
> > The reason seems to be that once a fence is signaled, a third party
> > might evaluate the error code.
>=20
> Yeah, more or less correct. The idea is you can't declare an
> operation as having an error after the operation has already
> completed.
>=20
> Because everyone will just wait for the completion and nobody checks
> the status again after that.
>=20
> >=20
> > But I think this wasn't wat you meant with "fix".
>=20
> The idea was to avoid calling dma_fence_set_error() on already
> signaled fences. Something like this:
>=20
> @@ -90,7 +90,7 @@ nouveau_fence_context_kill(struct
> nouveau_fence_chan *fctx, int error)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (!list_empty(&fctx->pend=
ing)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fence =3D list_entry(fctx->pending.next,
> typeof(*fence), head);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (error)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (error & !dma_fence_is_signaled_locked(&fence-
> >base))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fenc=
e_set_error(&fence->base, error);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (nouveau_fence_signal(fence))
>=20
> That would also improve the handling quite a bit since we now don't
> set errors on fences which are already completed even if we haven't
> realized that they are already completed yet.
>=20
> > In any case, there must not be signaled fences in nouveau's
> > pending-
> > list. They must be removed immediately once they signal, and this
> > must
> > not race.
>=20
> Why actually? As far as I can see the pending list is not for the
> unsignaled fences, but rather the pending interrupt processing.

That's a list of fences that are "in the air", i.e., whose jobs are
currently being processed by the hardware. Once a job is done, its
fence must be removed.

>=20
> So having signaled fences on the pending list is perfectly possible.

It is possible, and that is a bug. The list is used by
nouveau_fence_context_kill() to kill still pending jobs. It shall not
try to kill and set error codes for fences that are already signaled.



Anyways, forget about the "remove callbacks solution" it actually
causes a MASSIVE performance regression. No idea why, AFAICS the fast
path is only ever evaluated in nouveau_fence_done(), but maybe I missed
something.

Will re-iterate next week=E2=80=A6


P.


>=20
> Regards,
> Christian.
>=20
> >=20
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > I'm running out of ideas. What I'm wondering if we couldn't
> > > > just
> > > > remove
> > > > performance hacky fastpath functions such as
> > > > nouveau_fence_is_signaled() completely. It seems redundant to
> > > > me.
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0That would work for me as well.
> > I'll test this approach. Seems a bit like the nuclear approach, but
> > if
> > it works we'd at least clean up a lot of this mess.
> >=20
> >=20
> > P.
> >=20
> >=20
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > >=20
> > > > Or we might add locking to it, but IDK what was achieved with
> > > > RCU
> > > > here.
> > > > In any case it's definitely bad that Nouveau has so many
> > > > redundant
> > > > and
> > > > half-redundant mechanisms.
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0Yeah, agree messing with the locks even more won't help us here=
.
> > > =C2=A0
> > > =C2=A0Regards,
> > > =C2=A0Christian.
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > >=20
> > > >=20
> > > > P.
> > > >=20
> > > > =C2=A0
> > > > > =C2=A0
> > > > >=20
> > > > > P.
> > > > >=20
> > > > > =C2=A0
> > > > > > =C2=A0
> > > > > > Regards,
> > > > > > Christian.
> > > > > >=20
> > > > > > =C2=A0
> > > > > > > =C2=A0
> > > > > > > P.
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > =C2=A0
> > > > > > > > =C2=A0
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > >=20
> > > > > > > > =C2=A0
> > > > > > > > > =C2=A0
> > > > > > > > > Replace the call to dma_fence_is_signaled() with
> > > > > > > > > nouveau_fence_base_is_signaled().
> > > > > > > > >=20
> > > > > > > > > Cc: <stable@vger.kernel.org> # 4.10+, precise commit
> > > > > > > > > not
> > > > > > > > > to
> > > > > > > > > be
> > > > > > > > > determined
> > > > > > > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > > > > > > ---
> > > > > > > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > > > > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > > > index 7cc84472cece..33535987d8ed 100644
> > > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > > > @@ -274,7 +274,7 @@ nouveau_fence_done(struct
> > > > > > > > > nouveau_fence
> > > > > > > > > *fence)
> > > > > > > > > =C2=A0			nvif_event_block(&fctx-
> > > > > > > > > >event);
> > > > > > > > > =C2=A0		spin_unlock_irqrestore(&fctx->lock,
> > > > > > > > > flags);
> > > > > > > > > =C2=A0	}
> > > > > > > > > -	return dma_fence_is_signaled(&fence->base);
> > > > > > > > > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > > > > > &fence-
> > > > > > > > > =C2=A0
> > > > > > > > > > =C2=A0
> > > > > > > > > > base.flags);
> > > > > > > > > > =C2=A0
> > > > > > > > > =C2=A0
> > > > > > > > > =C2=A0}
> > > > > > > > > =C2=A0
> > > > > > > > > =C2=A0static long
> > > > > > > > > =C2=A0
> > > > > > > > =C2=A0
> > > > > > > =C2=A0
> > > > > > =C2=A0
> > > > > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0
> > > =C2=A0
> > > =C2=A0
>=20

