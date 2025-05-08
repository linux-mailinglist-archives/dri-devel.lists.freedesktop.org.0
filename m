Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B368AAF676
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3F10E1DE;
	Thu,  8 May 2025 09:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gJ/JbHnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5410E1DE;
 Thu,  8 May 2025 09:13:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZtRJT2S05z9st4;
 Thu,  8 May 2025 11:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746695625; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSaQ2U9dW1z6yZyF5dUSbdQvElX9UoQjbIz44faGFp4=;
 b=gJ/JbHnhScbQ4Qk0oLgM+A7P95WHA3lTu44PlG/MGylK4qssRALzG8tg3nn6ymiLnRl3kU
 8fUflr1Bvx/gFqoMy+xZ+b1mB2fMrXNODojdEA0I0UYxMzHOPXsDZm7oYztDLOqVvPeM5A
 8Ih/Gl6V7AkDRmZr+bc0EMhAjCChnTyIrtZ8HfQqUOl0Jngt/dD3jgfa/jZtXuvhty0M1C
 EUc1uIUn1NKfJdxOdCgKsVpuY2g5kDZz3gh/h/57EQ9mUe43waNj6batdScEw/DGyqbkyl
 HRRaIjFJc87NoNpZTyPur6g6oiyccnaRufAN18rVDsI0k0iLVieYMruiTAGePw==
Message-ID: <3b64a3e0659dbfa2c5f819f40f9f0624309d24ed.camel@mailbox.org>
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Thu, 08 May 2025 11:13:39 +0200
In-Reply-To: <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
 <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 2f653366805965cb815
X-MBO-RS-META: 9rdhgij9nsbopajeda3zjr5fzy3oh5ip
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

On Mon, 2025-04-28 at 16:45 +0200, Christian K=C3=B6nig wrote:
> On 4/24/25 15:02, Philipp Stanner wrote:
> > In nouveau_fence_done(), a fence is checked for being signaled by
> > manually evaluating the base fence's bits. This can be done in a
> > canonical manner through dma_fence_is_signaled().
> >=20
> > Replace the bit-check with dma_fence_is_signaled().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
>=20
> I think the bit check was used here as fast path optimization because
> we later call dma_fence_is_signaled() anyway.

That fast path optimization effectively saves one JMP instruction to
the function.

I'm increasingly of the opinion that we shall work towards all DRM
users only ever using infrastructure through officially documented API
functions, without touching internal data structures.

> Feel free to add my acked-by, but honestly what nouveau does here
> looks rather suspicious to me.

:)


P.

>=20
> Regards,
> Christian.
>=20
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index fb9811938c82..d5654e26d5bc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0	struct nouveau_channel *chan;
> > =C2=A0	unsigned long flags;
> > =C2=A0
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >base.flags))
> > +	if (dma_fence_is_signaled(&fence->base))
> > =C2=A0		return true;
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
>=20

