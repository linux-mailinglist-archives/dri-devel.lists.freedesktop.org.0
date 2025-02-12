Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53091A321A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 10:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE3C10E80E;
	Wed, 12 Feb 2025 09:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ts8eYdH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F8810E80E;
 Wed, 12 Feb 2025 09:02:55 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YtC574Nkkz9tJh;
 Wed, 12 Feb 2025 10:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739350971; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqkZkSvqF+2mxRn3G0gzndFiRo982a/N1wIIocrfbcs=;
 b=ts8eYdH4NPX8oGudvrBh1ZEtufaapkv5pcQS8vn8EANYyzJYoGpN2qMcny3VNb1lItkYuZ
 exeHbUlWJti2JmhpOTg2hONcy/zIJE0sa8qxAukATWnHGP4RId38QvEKiNzA+rzO9h9cJF
 XcgiklI4JpLzFssoY8ePuLUBM9ma6GSErz5EbzieHbSKxELyYwrSlDMdV3WK/7wnCAuxz1
 D8GW7L43+EhRMT940SeJOCBMNu0kTOxi9Cp3GNsZFQLhCVFuG+Eu9SCE2NIBEZvEqgbzof
 VR30stVN9teY8MV98Qu7b33B56PdtQxVyvmidIRwjHz3Z07Z4utD6MHasZAH6g==
Message-ID: <4b234b06b2d32377fef4777c250b873e759a3c5c.camel@mailbox.org>
Subject: Re: [PATCH 4/6] drm/sched: Move drm_sched_entity_is_ready to
 internal header
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Wed, 12 Feb 2025 10:02:48 +0100
In-Reply-To: <20250207145104.60455-5-tvrtko.ursulin@igalia.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: gdyzsn5dw57ifzjytntx8ncmsk19stte
X-MBO-RS-ID: 01a50c62fa786bbaa8b
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

btw. I still believe that it would be helpful (and congruent with the
established norm) to have the version in all patch titles. I do use
threaded view, but inboxes are huge, and everything that helps you
orient yourself is welcome

On Fri, 2025-02-07 at 14:51 +0000, Tvrtko Ursulin wrote:
> Helper is for scheduler internal use so lets hide it from DRM drivers
> completely.
>=20
> At the same time we change the method of checking whethere there is
> anything in the queue from peeking to looking at the node count.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 | 12 ---------=
---
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h | 13 +++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A03 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index a171f05ad761..87f88259ddf6 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -151,18 +151,6 @@ static bool drm_sched_entity_is_idle(struct
> drm_sched_entity *entity)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> -/* Return true if entity could provide a job. */
> -bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
> -{
> -	if (spsc_queue_peek(&entity->job_queue) =3D=3D NULL)
> -		return false;
> -
> -	if (READ_ONCE(entity->dependency))
> -		return false;
> -
> -	return true;
> -}
> -
> =C2=A0/**
> =C2=A0 * drm_sched_entity_error - return error of last scheduled job
> =C2=A0 * @entity: scheduler entity to check
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> b/drivers/gpu/drm/scheduler/sched_internal.h
> index 25ac62ac2bf3..9ff5cddb5708 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -43,4 +43,17 @@ drm_sched_entity_queue_peek(struct
> drm_sched_entity *entity)
> =C2=A0	return container_of(node, struct drm_sched_job, queue_node);
> =C2=A0}
> =C2=A0
> +/* Return true if entity could provide a job. */
> +static inline bool
> +drm_sched_entity_is_ready(struct drm_sched_entity *entity)
> +{
> +	if (!spsc_queue_count(&entity->job_queue))
> +		return false;
> +
> +	if (READ_ONCE(entity->dependency))
> +		return false;
> +
> +	return true;
> +}

Is there any particular reason why you want the code in an header
instead of a new .c file?

We might want to consider this, since I'd expect that the number of
internal helpers increases over the years.


P.


> +
> =C2=A0#endif
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 5188c7f3bd3b..962825613596 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -606,7 +606,6 @@ struct drm_sched_job
> *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> =C2=A0				=C2=A0=C2=A0 enum drm_sched_priority
> priority);
> -bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> =C2=A0int drm_sched_entity_error(struct drm_sched_entity *entity);
> =C2=A0
> =C2=A0struct drm_sched_fence *drm_sched_fence_alloc(

