Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463DAC0BCD
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3842F10E8CC;
	Thu, 22 May 2025 12:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l43TTqeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAA910E8CC;
 Thu, 22 May 2025 12:42:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b37H110tnz9tmV;
 Thu, 22 May 2025 14:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747917757; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZRaaTqj5Cjmu8Cm39Xc6qLz7c51j9UUiiCjsfDUhMU=;
 b=l43TTqeDEP4Xf9nqEFSLqYxzhHhSGues+VdzMZzP/bRVlgsJg7U/wVjgphvoPjEpO97V34
 drn4g+OXgnkN9fCwrHXDPaYiyGqA/6zGdEXzQu/dH+fyo2nlz8dC0Eh+raeCbs0y+WJsrG
 kVEdB3m2ZsnIwroZSF6A5vYyUXUFZgug518LU816/oQh+42NZuVgZoG1dfxeUFk5r2sIMS
 5h4hXnYFljtf3JsyCJeoMOy3MKrPFd+HNb6f/jxV9sqf7SfxOhbLJxPDFBDJn3JukvmFEZ
 tN/nFzKieH1Qsa7NcXgHwW2TqcuQMMV3RYhvfw1xyR5STPjIJux/NximcCDmow==
Message-ID: <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 22 May 2025 14:42:33 +0200
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8c291cbe92786a4703e
X-MBO-RS-META: 1uap477khfoygdr83y94pwexqf8u73fz
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

On Thu, 2025-05-22 at 14:34 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 14:20, Philipp Stanner wrote:
> > On Thu, 2025-05-22 at 14:06 +0200, Christian K=C3=B6nig wrote:
> > > On 5/22/25 13:25, Philipp Stanner wrote:
> > > > dma_fence_is_signaled_locked(), which is used in
> > > > nouveau_fence_context_kill(), can signal fences below the
> > > > surface
> > > > through a callback.
> > > >=20
> > > > There is neither need for nor use in doing that when killing a
> > > > fence
> > > > context.
> > > >=20
> > > > Replace dma_fence_is_signaled_locked() with
> > > > __dma_fence_is_signaled(), a
> > > > function which only checks, never signals.
> > >=20
> > > That is not a good approach.
> > >=20
> > > Having the __dma_fence_is_signaled() means that other would be
> > > allowed to call it as well.
> > >=20
> > > But nouveau can do that here only because it knows that the fence
> > > was
> > > issued by nouveau.
> > >=20
> > > What nouveau can to is to test the signaled flag directly, but
> > > that's
> > > what you try to avoid as well.
> >=20
> > There's many parties who check the bit already.
> >=20
> > And if Nouveau is allowed to do that, one can just as well provide
> > a
> > wrapper for it.
>=20
> No, exactly that's what is usually avoided in cases like this here.
>=20
> See all the functions inside include/linux/dma-fence.h can be used by
> everybody. It's basically the public interface of the dma_fence
> object.
>=20
> So testing if a fence is signaled without calling the callback is
> only allowed by whoever implemented the fence.

Why?

See, who owns the callback? -> the driver which emitted the fence. If
the driver doesn't guarantee that all fences will be signaled, the
callback (always returning false) doesn't help you in any way.

I think the issue you're seeing is more that a party that only ever
checks a fence's state through callbacks (and doesn't signal them
through interrupts for example) would run danger of fences never
getting signaled.

But that's already the case if someone doesn't implement the callback.

The fundamental basis is always the same: The driver must guarantee
that all fences get signaled. Independently from other users checking
the fence this or that way, independently from the callback being
implemented.

>=20
> In other words nouveau can test nouveau fences, i915 can test i915
> fences, amdgpu can test amdgpu fences etc... But if you have the
> wrapper that makes it officially allowed that nouveau starts testing
> i915 fences and that would be problematic.

I don't see the context here. That applies to the other functions as
well.


P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > That has the advantage of centralizing the responsibility and
> > documenting it.
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > index d5654e26d5bc..993b3dcb5db0 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
> > > > nouveau_fence_chan *fctx, int error)
> > > > =C2=A0
> > > > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
> > > > =C2=A0	list_for_each_entry_safe(fence, tmp, &fctx->pending,
> > > > head)
> > > > {
> > > > -		if (error &&
> > > > !dma_fence_is_signaled_locked(&fence-
> > > > > base))
> > > > +		if (error && !__dma_fence_is_signaled(&fence-
> > > > > base))
> > > > =C2=A0			dma_fence_set_error(&fence->base,
> > > > error);
> > > > =C2=A0
> > > > =C2=A0		if (nouveau_fence_signal(fence))
> > >=20
> >=20
>=20

