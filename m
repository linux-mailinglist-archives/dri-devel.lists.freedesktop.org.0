Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964ACAFE490
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7C410E04D;
	Wed,  9 Jul 2025 09:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gyzHPcww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7510E04D;
 Wed,  9 Jul 2025 09:50:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bcYBC12K6z9swp;
 Wed,  9 Jul 2025 11:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752054627; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Deqq+ucfC+w9oLgtcUnvMiNGyQpGuWg2IVkp9JmzFmw=;
 b=gyzHPcwwn5eZ01qQvMpvbFtHw9szRpEJuCJo8+ztz+9OEbqBYsUdjGyoE4DclVsu5mt/b6
 DSL/E9TG21ZLLcNOkMBh4TmDylLNBuPqqMSY/65WRVNCK6w5j/hCv6xpiIksirvFCSNe+h
 mDUsetvt28pynjttUTTy/kBy2bwnlkdwBWGE7pOEM+doh7BIFaBrGPSP4LpZv17yRB55e7
 IqtFI1gbCnoSa+n74QA+zU30f2hAb2DTtsIm7P8EemjpLc2iEMaw4soZDOk0+vBrDGQgJo
 QbGuayyEQBb+1//lOmYUjSdas8Os9BHpXGRScJMW1HEMDSKSwrPmzu8otKBylQ==
Message-ID: <eae8f04690d4b5889310a5d338699f1a53517f0e.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Consolidate drm_sched_rq_select_entity_rr
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Wed, 09 Jul 2025 11:50:20 +0200
In-Reply-To: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
References: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e8c0032f0a103f38cd5
X-MBO-RS-META: 5rhk6succ1s3yxx5b8zn7q34tcex7skz
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

On Tue, 2025-07-08 at 13:21 +0100, Tvrtko Ursulin wrote:
> Extract out two copies of the identical code to function epilogue to
> make
> it smaller and more readable.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Pushed to drm-misc-next, thx.

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++------------=
-
> --
> =C2=A01 file changed, 20 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 2335df4de2b8..9212ebae7476 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct
> drm_gpu_scheduler *sched,
> =C2=A0	entity =3D rq->current_entity;
> =C2=A0	if (entity) {
> =C2=A0		list_for_each_entry_continue(entity, &rq->entities,
> list) {
> -			if (drm_sched_entity_is_ready(entity)) {
> -				/* If we can't queue yet, preserve
> the current
> -				 * entity in terms of fairness.
> -				 */
> -				if (!drm_sched_can_queue(sched,
> entity)) {
> -					spin_unlock(&rq->lock);
> -					return ERR_PTR(-ENOSPC);
> -				}
> -
> -				rq->current_entity =3D entity;
> -				reinit_completion(&entity-
> >entity_idle);
> -				spin_unlock(&rq->lock);
> -				return entity;
> -			}
> +			if (drm_sched_entity_is_ready(entity))
> +				goto found;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> =C2=A0	list_for_each_entry(entity, &rq->entities, list) {
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the
> current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			rq->current_entity =3D entity;
> -			reinit_completion(&entity->entity_idle);
> -			spin_unlock(&rq->lock);
> -			return entity;
> -		}
> +		if (drm_sched_entity_is_ready(entity))
> +			goto found;
> =C2=A0
> =C2=A0		if (entity =3D=3D rq->current_entity)
> =C2=A0			break;
> @@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct
> drm_gpu_scheduler *sched,
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0
> =C2=A0	return NULL;
> +
> +found:
> +	if (!drm_sched_can_queue(sched, entity)) {
> +		/*
> +		 * If scheduler cannot take more jobs signal the
> caller to not
> +		 * consider lower priority queues.
> +		 */
> +		entity =3D ERR_PTR(-ENOSPC);
> +	} else {
> +		rq->current_entity =3D entity;
> +		reinit_completion(&entity->entity_idle);
> +	}
> +
> +	spin_unlock(&rq->lock);
> +
> +	return entity;
> =C2=A0}
> =C2=A0
> =C2=A0/**

