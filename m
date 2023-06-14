Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CA72FE6E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 14:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9A10E44E;
	Wed, 14 Jun 2023 12:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEFE10E44E;
 Wed, 14 Jun 2023 12:23:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 388F76606EF9;
 Wed, 14 Jun 2023 13:23:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686745435;
 bh=94jmGvb9/fisLQL3Z5Z7hxHVRD0/khMmbpRfmP6wJ8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SpJIu6f4Qv270Sov/+Cy+4WaSHapbmxUPWNfElcbl6SDq3VxwZR+YrBx77z5ztxFZ
 gSpwu3PWaSqaqygGMONYcGVjbzUWpxPq6YFL1FltLjFZ3gikZNZFqpqYH8HKtU8TQ/
 ZOFrlRc6CJGh2xAvQwLhDCx9/7V9rpolx0cfEzUo0XGVW232GWRD4dXGtfJkkzSv7y
 YgnVIema7QHlpgYRLSJoVBzyMKOKRL3IBBB8TrvH+PtqIVmQjkGTkb5mAPeShX9KGj
 BHITIsAi80j4+W0IDVjz5uo5NehnrGWcVKltP1WRW0oZUwknJeI1erhtzSIVU0dxxq
 tK6+OAz2PG5Zw==
Date: Wed, 14 Jun 2023 14:23:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230614142339.04df5111@collabora.com>
In-Reply-To: <20230504115159.2245-2-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: arunpravin.paneerselvam@amd.com, felix.kuehling@amd.com,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, thomas_os@shipmail.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Thu,  4 May 2023 13:51:47 +0200
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existing TTMs execbuf util and intended to replace
> it in the long term.
>=20
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.

As many other drivers do already, we are considering using drm_exec()
for our resv locking in the PowerVR driver, so we might have more
questions/comments in the coming days/weeks, but I already have a
couple right now (see below).

> v3: drop duplicate tracking, radeon is really the only one needing that

I think we'd actually be interested in duplicate tracking. Is there any
way we can make it an optional feature through some extra helpers/flags?
Doesn't have to be done in this patch series, I'm just wondering if this
is something we can share as well.

[...]

> +/**
> + * DOC: Overview
> + *
> + * This component mainly abstracts the retry loop necessary for locking
> + * multiple GEM objects while preparing hardware operations (e.g. command
> + * submissions, page table updates etc..).
> + *
> + * If a contention is detected while locking a GEM object the cleanup pr=
ocedure
> + * unlocks all previously locked GEM objects and locks the contended one=
 first
> + * before locking any further objects.
> + *
> + * After an object is locked fences slots can optionally be reserved on =
the
> + * dma_resv object inside the GEM object.
> + *
> + * A typical usage pattern should look like this::
> + *
> + *	struct drm_gem_object *obj;
> + *	struct drm_exec exec;
> + *	unsigned long index;
> + *	int ret;
> + *
> + *	drm_exec_init(&exec, true);
> + *	drm_exec_while_not_all_locked(&exec) {
> + *		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *

Have you considered defining a drm_exec_try_prepare_obj_or_retry()
combining drm_exec_prepare_obj() and drm_exec_continue_on_contention()?

#define drm_exec_try_prepare_obj_or_retry(exec, obj, num_fences) \
        ({ \
                int __ret =3D drm_exec_prepare_obj(exec, bo, num_fences); \
                if (unlikely(drm_exec_is_contended(exec))) \
                        continue; \
                __ret; \
        })

This way the following pattern

		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
		drm_exec_continue_on_contention(&exec);
		if (ret)
			goto error;

can be turned into something more conventional:

		ret =3D drm_exec_try_prepare_obj_or_retry(&exec, boA, 1);
		if (ret)
			goto error;

I guess we could even add static checks to make sure
drm_exec_try_prepare_obj() is called inside a
drm_exec_while_not_all_locked() loop.

> + *		ret =3D drm_exec_prepare_obj(&exec, boB, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *	}
> + *
> + *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
> + *		...
> + *	}
> + *	drm_exec_fini(&exec);
> + *
> + * See struct dma_exec for more details.
> + */

[...]

> +/**
> + * drm_exec_prepare_array - helper to prepare an array of objects
> + * @exec: the drm_exec object with the state
> + * @objects: array of GEM object to prepare
> + * @num_objects: number of GEM objects in the array
> + * @num_fences: number of fences to reserve on each GEM object
> + *
> + * Prepares all GEM objects in an array, handles contention but aports o=
n first
> + * error otherwise. Reserves @num_fences on each GEM object after lockin=
g it.
> + *
> + * Returns: -EALREADY when object is already locked, -ENOMEM when memory
> + * allocation failed and zero for success.
> + */
> +int drm_exec_prepare_array(struct drm_exec *exec,
> +			   struct drm_gem_object **objects,
> +			   unsigned int num_objects,
> +			   unsigned int num_fences)
> +{
> +	int ret;
> +
> +	drm_exec_while_not_all_locked(exec) {
> +		for (unsigned int i =3D 0; i < num_objects; ++i) {
> +			ret =3D drm_exec_prepare_obj(exec, objects[i],
> +						   num_fences);
> +			drm_exec_break_on_contention(exec);

I had a hard time understanding what the intent was here: we do want the
locking to keep going on contention (reset and retry), but we need to
break out of the inner loop for this to happen, which is what this
drm_exec_break_on_contention() is doing. My misunderstanding was coming
from the fact I was expecting drm_exec_break_on_contention() to stop
the process of preparing objects. Maybe it's just me, but I think it'd
be less confusing if we were getting rid of
drm_exec_{break,continue}_on_contention and have the loop slightly
adjusted:

	unsigned int obj_ptr =3D 0;

	drm_exec_while_not_all_locked(exec) {
		int ret;

		/* We acquired/prepared all objects, we can leave the loop now. */
		if (obj_ptr =3D=3D num_objects)
			break;

		ret =3D drm_exec_try_prepare_obj_or_retry(exec, objects[obj_ptr++],
							num_fences);
		if (ret)
			return ret;
	}

	return 0;

Of course, this is just my personal view on this, and none of these
comments should be considered as blockers, but I thought I'd share
my concerns anyway.

Thanks again for your work!

Regards,

Boris

