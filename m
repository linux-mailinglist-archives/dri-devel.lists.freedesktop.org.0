Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B45C98182
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC210E419;
	Mon,  1 Dec 2025 15:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hv0AKTGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3B10E419
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:49:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dKpH24B8yz9sn0;
 Mon,  1 Dec 2025 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764604142; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hruJaujoQmZgouv4eWn1NVs1FLCVSTsn8oYJm+4wmRw=;
 b=hv0AKTGBE6vMtT3AIP7sWa36gEGP84YzlBx1OYwsomPLfHKixDy7mGf1WSXMZgjQLjTMeG
 GGtRdczS0N1zMlUl7PaDGz3GDGnib8cD0bhzbx4CoxCkulj7z+7U2s5NGm1PTcwt6fgzSm
 7cyCwvbubXZ5WC8zMECJCDbTr2uv2LTuVSlBjjcyMKr+t/Vy9FTSSjvMRCw5OfeyhDo17r
 Yqu+YgNoUr9TbudfknYzrpX6CjTZGBnNPUTRwGlh3YllDvUHz2QxQ1Ren6uCMobWNXEHI3
 OrKdg/JJ4nQUz+v6jxpUzK5obLUEPKWUjC/uoFYDNbfwEC8oUr/2Ggfh4LHpKQ==
Message-ID: <671926034e54072cb096c22e72cc826a19c84862.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
From: Philipp Stanner <phasta@mailbox.org>
To: Steven Price <steven.price@arm.com>, Philipp Stanner
 <phasta@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Mon, 01 Dec 2025 16:48:59 +0100
In-Reply-To: <1d9cef1f-3b51-42a9-b1e8-794d67f8e328@arm.com>
References: <20251125104443.82974-2-phasta@kernel.org>
 <1d9cef1f-3b51-42a9-b1e8-794d67f8e328@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f2a28e08b6326e83409
X-MBO-RS-META: fkmz7mmxhsgp4z47bgpsm5g8z8jq5izu
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

On Mon, 2025-12-01 at 15:46 +0000, Steven Price wrote:
> On 25/11/2025 10:44, Philipp Stanner wrote:
> > The dma_fence framework checks at many places whether the signaled bit
> > of a fence is already set. The code can be simplified and made more
> > readable by providing a helper function for that.
> >=20
> > Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> > signaled. Use it internally.
> >=20
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c | 19 +++++++++----------
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 24 ++++++++++++++++++++++=
--
> > =C2=A02 files changed, 31 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 39e6f93dc310..3a48896ded62 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fe=
nce *fence,
> > =C2=A0
> > =C2=A0	lockdep_assert_held(fence->lock);
> > =C2=A0
> > -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> > +	if (unlikely(__dma_fence_is_signaled(fence)))
>=20
> Here you are replacing test_and_set_bit(), but the helper just does
> test_bit() - so this is changing the behaviour (and I suspect is wrong).
>=20
> Thanks,
> Steve
>=20
>=20

Yes, that is a bug and has already been caught by various parties =E2=80=93=
 but
it's good that you're paying attention :)

We're currently in this revision, where the bug is fixed:
https://lore.kernel.org/dri-devel/20251201105011.19386-2-phasta@kernel.org/


P.
