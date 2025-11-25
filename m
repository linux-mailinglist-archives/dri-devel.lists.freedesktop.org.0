Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C6C83E3F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EBC10E377;
	Tue, 25 Nov 2025 08:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Gtm/zalU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E166310E377
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:08:35 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dFwLR4T3hz9vBB;
 Tue, 25 Nov 2025 09:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764058111; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PT4VsBoAmpd79SJA1++Lws41TWqxGgc2ZDbNW+wa7kU=;
 b=Gtm/zalURKsKr3l9tXYogDU6cV9p1ZEA6QSqaGXSRu5CcFTu88G8lnSQVvFnMG42B/+Puh
 +G6szJhNCCPJKLt1meTqCaWAKzeGcltOD7rhgLNDVmBj60Rssfr7rjT31sUtuLs326aD/C
 oG6sVAb8HXp/I+QJCGf/XYu1mUoFErAtwMaS5VAArAqqstEAVq8L8p6IRfJd97RXOZEI4J
 PiOhTFAKbweiMdrDeI8bftmviizU+dViZU7GeGOu95KRSb/LheAAJJ/pCLTKTDAF1oCSw3
 2kwB8xVYpBP3mD66+gR8UURi/1LChbp55R1pPR0ZAr6isxGhGrj0lDOxsqASmg==
Message-ID: <14e674a02c9028ea20b448c68cd24a987ee239cd.camel@mailbox.org>
Subject: Re: [PATCH 4/4] drm/sched: warn and taint the kernel when maximum
 timeout is exceeded.
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Lyude Paul <lyude@redhat.com>
Date: Tue, 25 Nov 2025 09:08:26 +0100
In-Reply-To: <20251120150018.27385-5-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 79oht67zzwi3uywgm3p76ggjj89ze7fa
X-MBO-RS-ID: 7aa57234933f9e1d21f
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

+Cc Lyude, Danilo

On Thu, 2025-11-20 at 15:41 +0100, Christian K=C3=B6nig wrote:
> Exceeding the recommended maximum timeout should be noted in logs and
> crash dumps.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++++++-
> =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1d4f1b822e7b..88e24e140def 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1318,12 +1318,22 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d, const struct drm_sched_init_
> =C2=A0	sched->ops =3D args->ops;
> =C2=A0	sched->credit_limit =3D args->credit_limit;
> =C2=A0	sched->name =3D args->name;
> -	sched->timeout =3D args->timeout;
> =C2=A0	sched->hang_limit =3D args->hang_limit;
> =C2=A0	sched->timeout_wq =3D args->timeout_wq ? args->timeout_wq : system=
_percpu_wq;
> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0
> +	sched->timeout =3D args->timeout;
> +	if (sched->timeout > DMA_FENCE_MAX_REASONABLE_TIMEOUT) {
> +		dev_warn(sched->dev, "Timeout %ld exceeds the maximum recommended one!=
\n",
> +			 sched->timeout);
> +		/*
> +		 * Make sure that exceeding the recommendation is noted in
> +		 * logs and crash dumps.
> +		 */
> +		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
> +	}
> +


I have to NACK this in the current form, it would cause a bunch of
drivers to fire warnings, despite there being absolutely nothing wrong
with them in the past

https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/gpu/drm/nouveau/n=
ouveau_sched.c#L412
https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/gpu/drm/lima/lima=
_sched.c#L519

I guess there are more.

Nouveau's current timeout is an astonishing 10 seconds, and AFAIK there
has never been a problem with that. If you want to declare this
behavior invalid, you need to discuss that with the Nouveau maintainers
first.

It also didn't become clear to me why dma_fence is to define a timeout
rule? I like to think that "must be signalled within reasonable time"
is as precise as it gets. As demonstrated by the drivers, there is just
no objectively correct definiton of "reasonable".

BTW your series doesn't make clear to me why you only touch very few
components: there are many more users of dma_fence than just vgem and
sched. What about the others?


P.
