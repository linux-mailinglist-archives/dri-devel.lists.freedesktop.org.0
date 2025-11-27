Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C2C8DEE1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652610E72E;
	Thu, 27 Nov 2025 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DQJVIS7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA4F10E678;
 Thu, 27 Nov 2025 11:17:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dHDRS2fwjz9t8m;
 Thu, 27 Nov 2025 12:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764242244; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdLhtFqYrGAAE3G7PcwuS9PaciP06RnxEbDvvNTDD/Y=;
 b=DQJVIS7ewZzM9YvbsjEUaBWPNvLb1ZMsuRtiTTLb/pTG6W3zasbrbLy4xc2cfgWoRW3Pd4
 t1+ui2QrBJLaS+EPrJeJQfcQPuQkzTZSOPIoUqeeD7sEvd6nUKpKoZr32z5GV0Fqd0Aa0y
 Bp4QUNfx5a4AJ7V/TZXB5g+TaQbrUeC3OgsEGJDIHS5hmQHFweg0D1d1E9afDy5Dm2Pz0K
 OK49kcpVMpz7ASaQM34+HNh+kVWaUbO9uLO4Sfac4GKS1/jaIl2/DCn38pcm5QU9pjwuXn
 aED50hAvcuU8ZFdGmzN//DNn0ZmGigIji6Oq1CX6cjFHFvcJ5mw2/W5tYiXBSA==
Message-ID: <ce96cf250dfca4aea9ddfc00e45fc1b47caceedc.camel@mailbox.org>
Subject: Re: [PATCH 18/18] drm/xe: Finish disconnect HW fences from module
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 12:17:19 +0100
In-Reply-To: <20251113145332.16805-19-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-19-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: bfbff4823f15586f625
X-MBO-RS-META: u74iaqnp9jeowrxeu5hz8h5ni6i6syeu
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>=20
> Be safe when dereferencing fence->xe.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c | 13 +++++++------
> =C2=A01 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_=
fence.c
> index f5fad4426729..8181dfc628e4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -159,9 +159,7 @@ static struct xe_hw_fence_irq *xe_hw_fence_irq(struct=
 xe_hw_fence *fence)
> =C2=A0
> =C2=A0static const char *xe_hw_fence_get_driver_name(struct dma_fence *dm=
a_fence)
> =C2=A0{
> -	struct xe_hw_fence *fence =3D to_xe_hw_fence(dma_fence);
> -
> -	return dev_name(fence->xe->drm.dev);
> +	return "xe";
> =C2=A0}

May I ask what those name callbacks are used for in Xe?
I had so far only seen those dma_fence callbacks being used in i915.

I'm asking because in Rust DmaFence I discovered that having those
callbacks in the first place creates the life time problems Christian
addresses in this series.

I think we had begun brainstorming whether removing get_driver_name()
and get_timeline_name() in dma_fence's backend_ops would be the cleaner
thing to do, compared to the RCU guards.


P.

