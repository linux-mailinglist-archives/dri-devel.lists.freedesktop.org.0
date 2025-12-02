Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B33C9A684
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F86310E543;
	Tue,  2 Dec 2025 07:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Nb9qQDjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5F10E543;
 Tue,  2 Dec 2025 07:17:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLBtJ2Cdcz9tQR;
 Tue,  2 Dec 2025 08:17:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764659848; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvYlzThd7v1Kn3YwhmxsymsCQ2EmPWq7s2Dps/0YHys=;
 b=Nb9qQDjtSxtNnaI9B/lYBHnlMi9qdhjt49k01xfaRmMdo7g+Cpm9o/NVEaN/68NlTInQ9r
 baJzXM36vj1J/0Z0b+PDWLUqUZF5Nu3k45Uiw6uXNN0ggxIfp4KBVljPn0A7X9I99wypiG
 NvQTKn1EvFoO8i2FH+zx1kKSMUxQOOm8wJn1+n+EW7uHUIwvWu36yD2LTFQIHEwwRb1n6y
 uuOzVZmjCqG9hqAGL1qIaSRHzoUlEhX4xJp0qRfbPqJ4uEYYXlqJcpRqDPnz7k6mqkODdf
 wokX4Zs0jhWkMAIjUMvVXYIVqvfkZwIagWV5bVZy/FQTcIMLNDvtzW87A5gyAQ==
Message-ID: <e2799662727a10b77b77ceb2fc2cdabe27537e3e.camel@mailbox.org>
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 08:17:17 +0100
In-Reply-To: <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 702b4ab20e6fde04118
X-MBO-RS-META: ncm8u3cindi4bqsz41sdpt7zknz4tbdg
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

On Mon, 2025-12-01 at 11:38 -0800, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:50:08AM +0100, Philipp Stanner wrote:
> > Xe is one of the few users utilizing the return code of
> > dma_fence_signal() to check whether a fence had already been signaled b=
y
> > someone else.
> >=20
> > To clean up and simplify the dma_fence API, the few kernel users relyin=
g
> > on that behavior shall be ported to an alternative function.
> >=20
> > Replace dma_fence_signal_locked() with
> > dma_fence_check_and_signal_locked().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
> > =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_h=
w_fence.c
> > index b2a0c46dfcd4..f6057456e460 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *i=
rq)
> > =C2=A0{
> > =C2=A0	struct xe_hw_fence *fence, *next;
> > =C2=A0	unsigned long flags;
> > -	int err;
> > =C2=A0	bool tmp;
> > =C2=A0
> > =C2=A0	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *i=
rq)
> > =C2=A0		spin_lock_irqsave(&irq->lock, flags);
> > =C2=A0		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) =
{
> > =C2=A0			list_del_init(&fence->irq_link);
> > -			err =3D dma_fence_signal_locked(&fence->dma);
> > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
>=20
> I think XE_WARN_ON can compile out in certain builds. Best to leave warn =
on logic as is.

OK, will adjust.

>=20
> Also a little confused by this new helper... Doesn't
> dma_fence_signal_locked already check if a fence is already signaled and
> bail? Running out the door so I don't have time dig in here, but can you
> explain?

Yes, that is what dma_fence_signal_locked() *currently* does. The
series, however, is about removing that check from the default
interfaces because barely anyone uses dma_fence_signal() et.al.'s
return code. To simplify the interfaces.
The 2-3 users who need the code get this new function. See cover
letter.


P.

>=20
> Matt
>=20
> > =C2=A0			dma_fence_put(&fence->dma);
> > -			XE_WARN_ON(err);
> > =C2=A0		}
> > =C2=A0		spin_unlock_irqrestore(&irq->lock, flags);
> > =C2=A0		dma_fence_end_signalling(tmp);
> > --=20
> > 2.49.0
> >=20

