Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED7C8E9A3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786B910E721;
	Thu, 27 Nov 2025 13:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AE7unJJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96E10E721;
 Thu, 27 Nov 2025 13:51:52 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dHHsd1yj1z9tHd;
 Thu, 27 Nov 2025 14:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764251509; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAh7JsuhDwTA6puzFjLHmry2BMuVgc6R6juTrQrgIDM=;
 b=AE7unJJ9EOQPnAi6TAazDIz1H8bRe3kpfr2AeFzAgESqZiwAEGdMEwcmGwd9lP9QIprYgh
 +PMh8zg92MzpeUgxSx28dQ927sQ6NE4O47T8ZF3lEEBHHwgmkPlI2p8kwblFme8QlvxLdI
 Iz8kanTYpfmMBM6qMw9no4nwu2B0knIA9nw2FbiExLcEylLQ5ehjP826FrDzY8tJWsfLyj
 LlDOWYm9sCS7rYd5IcfyPmlQjaVxaXhYJipYOYd1Zx97lZVEH+jb12tn+HBH2J7TWr1/n4
 fUYiUEHM8WA6v1LZOWZnMGPjFLvi/mg2i2OBErArYZulsdATYMJGDtjk8NFB1g==
Message-ID: <63274dd281ac94f2680a4aa91f541de82435fda5.camel@mailbox.org>
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
From: Philipp Stanner <phasta@mailbox.org>
To: Andi Shyti <andi.shyti@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Gustavo Padovan <gustavo@padovan.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Felix
 Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>,  Matthew Auld <matthew.auld@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Thu, 27 Nov 2025 14:51:39 +0100
In-Reply-To: <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
 <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
 <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 63157739c600c3e8b1c
X-MBO-RS-META: 86chu8ma6etgk766suyxb85nfygh4osp
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

On Thu, 2025-11-27 at 14:37 +0100, Andi Shyti wrote:
> Hi Matt,
>=20
> On Wed, Nov 26, 2025 at 03:56:32PM -0800, Matthew Brost wrote:
> > On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> > > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_ir=
q *irq)
> > > > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_ir=
q *irq)
> > > > =C2=A0		spin_lock_irqsave(&irq->lock, flags);
> > > > =C2=A0		list_for_each_entry_safe(fence, next, &irq->pending, irq_li=
nk) {
> > > > =C2=A0			list_del_init(&fence->irq_link);
> > > > -			err =3D dma_fence_signal_locked(&fence->dma);
> > >=20
> > > why don't we do
> > >=20
> > > XE_WARN_ON(dma_fence_signal_locked(..))

because it's impossible because the series is about removing the return
codes from the dma_fence_signal_* functions.

> > >=20
> >=20
> > IIRC the above statement can compile out. So the patch looks correct to=
 me.
>=20
> you have defined XE_WARN_ON as WARN_ON that should always
> evaluate the content and, depending on the configuration, it
> prints the logs or not.
>=20
> What I don't like from this patch is that we end up checking
> twice for the DMA_FENCE_FLAG_SIGNALED_BIT bit.

Depends on what you mean by "we". The Xe code checks it only once, with
dma_fence_test_signaled_flag(). The dma_fence backend checks it yet
again, as it always does, to avoid signaling a signaled fence.

That's not racy here, however, because the fence lock is already being
held, as evidenced by the current usage of dma_fence_signal_locked().


P.
