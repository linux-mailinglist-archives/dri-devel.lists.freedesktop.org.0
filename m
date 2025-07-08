Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F4AFCA4C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5834D10E617;
	Tue,  8 Jul 2025 12:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TLDa8ijn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F017A10E613;
 Tue,  8 Jul 2025 12:22:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00554A53C4C;
 Tue,  8 Jul 2025 12:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD66C4CEF6;
 Tue,  8 Jul 2025 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751977319;
 bh=hHyU7AasjCe8ZrbeygdDOLCykJLqpN/yiekXwJkrW3I=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=TLDa8ijnbyDLx0ksswbqsrvPFR+syEj5mMLbPmQVW24a1vuYKA/dxMuZg2zIAOEJm
 P58VukQzXuVhpKZlpTDsg7XPM27zdqUKmVGLLi62nlFq5qX0oDwsC2ht1vWpR6JPpu
 5hX5PSPC1yfoH6VmFDmNWYwRIoTdW5LAlizb6V80C2l5QNKMfTqyiRYvtDz/4glTkO
 Ab6LN+O23SraWUgJzvVx5rvmy2PquBDRw3D3YVQa6S4FgHjGqr1n0/YwCNP69Qd0z3
 cOpfKwMyRuXhL13nglmt9Rmfk34H86u3qhZ5QX1NFit+vyW+2QZ1ZhT5voi6LUuLQJ
 q0mDIn2/WEbOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 14:21:56 +0200
Message-Id: <DB6O4K387ANN.1RJ3EOYFKIJTN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 05/15] drm/sched: Consolidate
 drm_sched_rq_select_entity_rr
Cc: <phasta@kernel.org>, "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Matthew
 Brost" <matthew.brost@intel.com>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-6-tvrtko.ursulin@igalia.com>
 <dcfae9b0caa19e46c36ec7e30c741867d145a828.camel@mailbox.org>
In-Reply-To: <dcfae9b0caa19e46c36ec7e30c741867d145a828.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue Jul 8, 2025 at 1:31 PM CEST, Philipp Stanner wrote:
> On Tue, 2025-07-08 at 10:51 +0100, Tvrtko Ursulin wrote:
>> Extract out two copies of the identical code to function epilogue to
>> make
>> it smaller and more readable.
>>=20
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>
> Can also be branched out.

There seems to be something going on with your mail client. I saw it a coup=
le of
times now that it somehow messes up the original code in your replies, such=
 as
below.

>> ---
>> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++-----------=
--
>> --
>> =C2=A01 file changed, 20 insertions(+), 28 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 2335df4de2b8..9212ebae7476 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct
>> drm_gpu_scheduler *sched,
>> =C2=A0	entity =3D rq->current_entity;
>> =C2=A0	if (entity) {
>> =C2=A0		list_for_each_entry_continue(entity, &rq->entities,
>> list) {
>> -			if (drm_sched_entity_is_ready(entity)) {
>> -				/* If we can't queue yet, preserve
>> the current
>> -				 * entity in terms of fairness.
>> -				 */
>> -				if (!drm_sched_can_queue(sched,
>> entity)) {
>> -					spin_unlock(&rq->lock);
>> -					return ERR_PTR(-ENOSPC);
>> -				}
>> -
>> -				rq->current_entity =3D entity;
>> -				reinit_completion(&entity-
>> >entity_idle);
>> -				spin_unlock(&rq->lock);
>> -				return entity;
>> -			}
>> +			if (drm_sched_entity_is_ready(entity))
>> +				goto found;
>> =C2=A0		}
>> =C2=A0	}
>> =C2=A0
>> =C2=A0	list_for_each_entry(entity, &rq->entities, list) {
>> -		if (drm_sched_entity_is_ready(entity)) {
>> -			/* If we can't queue yet, preserve the
>> current entity in
>> -			 * terms of fairness.
>> -			 */
>> -			if (!drm_sched_can_queue(sched, entity)) {
>> -				spin_unlock(&rq->lock);
>> -				return ERR_PTR(-ENOSPC);
>> -			}
>> -
>> -			rq->current_entity =3D entity;
>> -			reinit_completion(&entity->entity_idle);
>> -			spin_unlock(&rq->lock);
>> -			return entity;
>> -		}
>> +		if (drm_sched_entity_is_ready(entity))
>> +			goto found;
>> =C2=A0
>> =C2=A0		if (entity =3D=3D rq->current_entity)
>> =C2=A0			break;
>> @@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct
>> drm_gpu_scheduler *sched,
>> =C2=A0	spin_unlock(&rq->lock);
>> =C2=A0
>> =C2=A0	return NULL;
>> +
>> +found:
>> +	if (!drm_sched_can_queue(sched, entity)) {
>> +		/*
>> +		 * If scheduler cannot take more jobs signal the
>> caller to not
>> +		 * consider lower priority queues.
>> +		 */
>> +		entity =3D ERR_PTR(-ENOSPC);
>> +	} else {
>> +		rq->current_entity =3D entity;
>> +		reinit_completion(&entity->entity_idle);
>> +	}
>> +
>> +	spin_unlock(&rq->lock);
>> +
>> +	return entity;
>> =C2=A0}
>> =C2=A0
>> =C2=A0/**

