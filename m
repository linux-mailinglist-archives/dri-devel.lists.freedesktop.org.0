Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C653AC0B83
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A510E802;
	Thu, 22 May 2025 12:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="X/GzKpRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324710E802;
 Thu, 22 May 2025 12:20:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b36n42b4Fz9smv;
 Thu, 22 May 2025 14:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747916408; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6les8TOi5wRq0T8kDR8xQDFeOUCbVRDYJE8WXeCcMbk=;
 b=X/GzKpRLGoUU1TIQgiCFE33WMIXEgo2bOzU2gD+5YBWIA+Xch5he0PNQ5L4B9c50ClsLa0
 AjpL/vNQ5PL/0zlPieZL2EAYcfWWP/bIBv6d89Kf0PWtotOHOLZ7ZA8biPCX8dC56KGSWG
 Y8/2y9AWnSS5zLtZUQOBfdXZA7jwqGKTIEP+HeIOzkSQ0921vADAkAE3w233nXJohb09hu
 uJpNHTUx13lSzntM5QICqUvDqMwqDt5Ci8pzqtl+FIhYpTiocEwbz+lkwNoKYktLfXSIB/
 o8JOG2n2ugalDzKQawb+80VuNMOtXViSR9pY7rlEHNP0KKrhN7lq2T06KRtSWg==
Message-ID: <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 22 May 2025 14:20:03 +0200
In-Reply-To: <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 081f752363f695d129f
X-MBO-RS-META: zq69kf63muzfjptq7ehgdi67s8374jom
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

On Thu, 2025-05-22 at 14:06 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 13:25, Philipp Stanner wrote:
> > dma_fence_is_signaled_locked(), which is used in
> > nouveau_fence_context_kill(), can signal fences below the surface
> > through a callback.
> >=20
> > There is neither need for nor use in doing that when killing a
> > fence
> > context.
> >=20
> > Replace dma_fence_is_signaled_locked() with
> > __dma_fence_is_signaled(), a
> > function which only checks, never signals.
>=20
> That is not a good approach.
>=20
> Having the __dma_fence_is_signaled() means that other would be
> allowed to call it as well.
>=20
> But nouveau can do that here only because it knows that the fence was
> issued by nouveau.
>=20
> What nouveau can to is to test the signaled flag directly, but that's
> what you try to avoid as well.

There's many parties who check the bit already.

And if Nouveau is allowed to do that, one can just as well provide a
wrapper for it.

That has the advantage of centralizing the responsibility and
documenting it.

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index d5654e26d5bc..993b3dcb5db0 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
> > nouveau_fence_chan *fctx, int error)
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
> > =C2=A0	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
> > {
> > -		if (error && !dma_fence_is_signaled_locked(&fence-
> > >base))
> > +		if (error && !__dma_fence_is_signaled(&fence-
> > >base))
> > =C2=A0			dma_fence_set_error(&fence->base, error);
> > =C2=A0
> > =C2=A0		if (nouveau_fence_signal(fence))
>=20

