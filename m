Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA95AAF873
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 13:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2807710E8F5;
	Thu,  8 May 2025 11:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KwtsKkP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830C10E38A;
 Thu,  8 May 2025 11:03:41 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZtTlC0xVKz9tCf;
 Thu,  8 May 2025 13:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746702215; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EXQH6BCiFQKSZOW18WF484owkA/QLDEDighoVoI5Q0=;
 b=KwtsKkP9JVrcD9N5t2Zm4i6iI26NVgoXDSIJtbDlpQNMDeTwFL7lJF+e76UXBeT2V5iZ1+
 lWRpj7iXkv1Aj7dCZSvGXLcNRJ5ISVr+Q7+AeGUfcYLT5aUYaVUQ22ebj57uZmf0e76HKm
 S1q4ORcWUZkuJ2IlJqHVQ8vqACQmMaB6jORjS2Y8X/+yx5d4SVU1RuOc4Vyhn3igKtS47f
 JJwNsbJJ0LRV/FNQFvKrWYpgubqWLYTD2Lf6tHhGRacRHarKK5yfqI744zaIVltJCFzK4J
 gDA/L4ZEvPpgCtcSvjtsH4GapNPdqQJ42O0ygzBcxB4w+BPGul5LYJhb5nFJlg==
Message-ID: <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 13:03:29 +0200
In-Reply-To: <20250424095535.26119-8-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-8-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 8pzanuw3tqj7ojt1ehyhx681kpp7xrro
X-MBO-RS-ID: 987543049f878c8909b
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

On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
> The unit tests so far took care manually of avoiding memory leaks
> that
> might have occurred when calling drm_sched_fini().
>=20
> The scheduler now takes care by itself of avoiding memory leaks if
> the
> driver provides the callback
> drm_sched_backend_ops.kill_fence_context().
>=20
> Implement that callback for the unit tests. Remove the manual cleanup
> code.

@Tvrtko: On a scale from 1-10, how much do you love this patch? :)

P.

>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 34 +++++++++++=
+-----
> --
> =C2=A01 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..a72d26ca8262 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
> drm_sched_job *sched_job)
> =C2=A0	/* Mock job itself is freed by the kunit framework. */
> =C2=A0}
> =C2=A0
> +static void mock_sched_fence_context_kill(struct drm_gpu_scheduler
> *gpu_sched)
> +{
> +	struct drm_mock_scheduler *sched =3D
> drm_sched_to_mock_sched(gpu_sched);
> +	struct drm_mock_sched_job *job;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	list_for_each_entry(job, &sched->job_list, link) {
> +		spin_lock(&job->lock);
> +		if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +			dma_fence_set_error(&job->hw_fence, -
> ECANCELED);
> +			dma_fence_signal_locked(&job->hw_fence);
> +		}
> +		complete(&job->done);
> +		spin_unlock(&job->lock);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +}
> +
> =C2=A0static const struct drm_sched_backend_ops drm_mock_scheduler_ops =
=3D {
> =C2=A0	.run_job =3D mock_sched_run_job,
> =C2=A0	.timedout_job =3D mock_sched_timedout_job,
> -	.free_job =3D mock_sched_free_job
> +	.free_job =3D mock_sched_free_job,
> +	.kill_fence_context =3D mock_sched_fence_context_kill,
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
> drm_mock_scheduler *sched)
> =C2=A0		drm_mock_sched_job_complete(job);
> =C2=A0	spin_unlock_irqrestore(&sched->lock, flags);
> =C2=A0
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM
> scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
> =C2=A0	drm_sched_fini(&sched->base);
> =C2=A0}
> =C2=A0

