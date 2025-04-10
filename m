Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A382AA8443C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15A10E9A8;
	Thu, 10 Apr 2025 13:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JLIa0Hqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0CC10E9A8;
 Thu, 10 Apr 2025 13:09:47 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZYKsh20Kcz9sFb;
 Thu, 10 Apr 2025 15:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744290584; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNo4RWbN6OOQmatSWnTpJ3Sh3OCGI8DiobFht1mvBP4=;
 b=JLIa0HquJgjRKsl6VGI2sxxfZVuwKrlEnzrtHs2vUWdYskSAy4m8cWSpMDpMheH5h2Skgi
 NlwbeHPHoHvO1XAT+3TBkM0DbFgEy4JPwFTVa/IVeHaLXUSdyJgTj4rKjzAOB01rmEvo/Q
 5q+I26dMY3DK2iGsGaZM54MpPsnfj9WlPBcWukDoF2RC3WD25x4JZW8Zs1VGF5m5BSGTdo
 QU+DL6NjbZk43TGAtKlQbIJO6q8pDuB7C5MJqGGqZzuSvW6qt+F8eblUpKQwDlEmGqpuey
 /1E0zRPYbKgYOehnQNlPRH0XFt5yoOCEgiLppCE931Rq9Ml+Jf2cPEGgIV7kcA==
Message-ID: <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,  Sumit
 Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 stable@vger.kernel.org
Date: Thu, 10 Apr 2025 15:09:39 +0200
In-Reply-To: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: w17gddazuhiderzamj37mege4ojzpn7m
X-MBO-RS-ID: d885f1ea80fc186b76b
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

On Thu, 2025-04-10 at 14:58 +0200, Christian K=C3=B6nig wrote:
> Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> > Nouveau currently relies on the assumption that dma_fences will
> > only
> > ever get signaled through nouveau_fence_signal(), which takes care
> > of
> > removing a signaled fence from the list nouveau_fence_chan.pending.
> >=20
> > This self-imposed rule is violated in nouveau_fence_done(), where
> > dma_fence_is_signaled() (somewhat surprisingly, considering its
> > name)
> > can signal the fence without removing it from the list. This
> > enables
> > accesses to already signaled fences through the list, which is a
> > bug.
> >=20
> > In particular, it can race with nouveau_fence_context_kill(), which
> > would then attempt to set an error code on an already signaled
> > fence,
> > which is illegal.
> >=20
> > In nouveau_fence_done(), the call to nouveau_fence_update() already
> > ensures to signal all ready fences. Thus, the signaling potentially
> > performed by dma_fence_is_signaled() is actually not necessary.
>=20
> Ah, I now got what you are trying to do here! But that won't help.
>=20
> The problem is it is perfectly valid for somebody external (e.g.
> other driver, TTM etc...) to call dma_fence_is_signaled() on a
> nouveau fence.
>=20
> This will then in turn still signal the fence and leave it on the
> pending list and creating the problem you have.

Good to hear =E2=80=93 precisely that then is the use case for a dma_fence
callback! ^_^ It guarantees that, no matter who signals a fence, no
matter at what place, a certain action will always be performed.

I can't think of any other mechanism which could guarantee that a
signaled fence immediately gets removed from nouveau's pending list,
other than the callbacks.

But seriously, I don't think that anyone does this currently, nor do I
think that anyone could get away with doing it without the entire
computer burning down.

P.



>=20
> Regards,
> Christian.
>=20
> >=20
> > Replace the call to dma_fence_is_signaled() with
> > nouveau_fence_base_is_signaled().
> >=20
> > Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be
> > determined
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 7cc84472cece..33535987d8ed 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0			nvif_event_block(&fctx->event);
> > =C2=A0		spin_unlock_irqrestore(&fctx->lock, flags);
> > =C2=A0	}
> > -	return dma_fence_is_signaled(&fence->base);
> > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >base.flags);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static long
>=20

