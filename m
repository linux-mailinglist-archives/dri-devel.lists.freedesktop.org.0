Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0577AFC9A0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 13:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999EE10E600;
	Tue,  8 Jul 2025 11:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jLLTMa3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5E10E613;
 Tue,  8 Jul 2025 11:31:31 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bbzTD27xhz9st5;
 Tue,  8 Jul 2025 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751974288; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48NORqQb787FlAELzadA21brdOxJHxlBAxmaGaPZ7ZI=;
 b=jLLTMa3a2MLXSYsIEz3znHf8Xn6iS7u7sdZ4n1lHadXc9CNPGzchco6tNKohNp8AfjOI5f
 Zosgv+FG+Vm/s4QylPngjDkx6SK4ltD8HqIX2+d5gzW23eAZ4Bh7/1OcUWranutP4TUXjM
 WjfdH2xeUn74inEtNNw+GZIvTW/XS793jGNVbZqs+7qKZ00O4MShM8MEtW6N3H2aJTxcgj
 nX2eLKACBnulfD8Jg1IwDS5hRXDFHqUfHfsDYoA8ft7KeLKrlzt/9Fv+JZkJVHsOILARBn
 UCC52GhxsV2bq21cQb+/5Nip+I7Dl/U0DBjuXryqbVkRedORdYg9XYHvj4UP4g==
Message-ID: <dcfae9b0caa19e46c36ec7e30c741867d145a828.camel@mailbox.org>
Subject: Re: [PATCH v6 05/15] drm/sched: Consolidate
 drm_sched_rq_select_entity_rr
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Tue, 08 Jul 2025 13:31:25 +0200
In-Reply-To: <20250708095147.73366-6-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c8927dff1cbdafaed81
X-MBO-RS-META: zkddzsr6ji61shex7n9swhh5wmb1d786
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

On Tue, 2025-07-08 at 10:51 +0100, Tvrtko Ursulin wrote:
> Extract out two copies of the identical code to function epilogue to
> make
> it smaller and more readable.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Can also be branched out.

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

