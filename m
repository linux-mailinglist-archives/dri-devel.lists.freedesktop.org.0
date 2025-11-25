Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C054FC852C8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7D10E3E0;
	Tue, 25 Nov 2025 13:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pVSN/Bee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D910E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:28:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dG3RR23KVz9tGQ;
 Tue, 25 Nov 2025 14:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764077299; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvEYEAgfetSiQtd3hbQ329ZV6SuQkLikEh+RnSIy9Ck=;
 b=pVSN/BeeDZQxi29oaSuvHenyB9uZf8BRmnIk65z83iklSwtrCy6z5+yy8L9H2A8wvkQIcE
 lH77SgLOtfRYktVtq2fsUD6wUlqqR1N0LLb7NXKTYNDQCG1h9DkTT2OZy/DN5pTvlGBqu+
 BNVOYbomZIvXssFmxoNU8bdpAaVM0xhwlOve0mus6FWf+o2xFLFCO9A4Ql9nBoWYz4xlGp
 OZTWBVsDtMrKvR6G7BPaRcTZaatQd2TNpQDf5bxJAwR8vENKe2pGLgMP9cxdvwgHPERUe+
 VLIF3zyDt2+uFfRxSc5OxKy6t0N+QYuxJY/laLijz4xoNYW5hr8NFvl8QkplPA==
Message-ID: <afaace6487f15c8ba51f3f2e9cddf13e1a749696.camel@mailbox.org>
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled
 fences
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 25 Nov 2025 14:28:14 +0100
In-Reply-To: <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
References: <20251125104443.82974-2-phasta@kernel.org>
 <20251125104443.82974-3-phasta@kernel.org>
 <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: tnkcsrph5bnq7f5su6qf9tftdqroueug
X-MBO-RS-ID: c2d8e951c74feaac195
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

On Tue, 2025-11-25 at 13:20 +0000, Tvrtko Ursulin wrote:
>=20
> On 25/11/2025 10:44, Philipp Stanner wrote:
> > Almost all users of dma_fence_signal() ignore the return code which
> > would indicate that the fence was already signaled. The same return cod=
e
> > by dma_fence_add_callback() cannot be ignored, however, because it's
> > needed to detect races.
> >=20
> > For an already signaled fence, dma_fence_signal() returns -EINVAL,
> > whereas dma_fence_add_callback() returns -ENOENT.
> >=20
> > Unify the error codes by having dma_fence_signal() return -ENOENT, too.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/dma-buf/dma-fence.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 3a48896ded62..09d97624e647 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fe=
nce *fence,
> > =C2=A0=C2=A0	lockdep_assert_held(fence->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (unlikely(__dma_fence_is_signaled(fence)))
> > -		return -EINVAL;
> > +		return -ENOENT;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Stash the cb_list before replacing it with the timestam=
p */
> > =C2=A0=C2=A0	list_replace(&fence->cb_list, &cb_list);
>=20
> Story checks out AFAICT - only two callers fetch the error, xe and kfd,=
=20
> and neither does anything with it. So I'd say it makes sense to unify
> the errno.
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Regards,
>=20
> Tvrtko
>=20
> P.S. Just not sure of the 1/2 on which this one ends depending on. I=20
> *think* I suggested the helper in the context of some discussion long
> long time ago but what it was? And what about all the drivers which look=
=20
> at the signaled bit directly?

That was in a discussion where we could have needed such a function to
solve a bug in Nouveau where dma_fence_is_signaled() unexpetedely
signaled a fence. AFAIR that caused locking issues in that context.

The other test_bit() users could be ported, of course.


P.
