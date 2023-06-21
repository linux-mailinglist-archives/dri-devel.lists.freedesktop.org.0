Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8B73863B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5310E48D;
	Wed, 21 Jun 2023 14:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5510E491
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:08:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FAFC6606F95;
 Wed, 21 Jun 2023 15:08:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687356496;
 bh=CWr8Zy4GWky49Wqr1WQ2GAslpxKat1lqCqYXWK5GlQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WXkmkpZSua/fYi3chElwtQvm+6c2Z/A2WbqwRSkYNW1JDMNixTPUIoKHkLkpxQ6be
 Ijcyu4Oj6Z2fN+d07sGg9VKA/iiJal5+Hng7WcBk4fVEedn7JX+/PmoXR7hw8gBSpt
 0Su9f3Zr/Ao/dbANmqNuCB9273U8fTf7XC4v6b745pWZ2iiSMJIw5+jPF9/S0u/cQ/
 9ERIqKbOMbSOL4mS7vc5JZkZo6A/ZPg6A/DCwJuXgcBkElf6hvP1vPGdspOz6VDW17
 4pV37w6gxHcXdQKYYxLBvNp0NkkMTbnEPBFifCVeHw3GcoH1vTOxQYwFxF4mDCHcrL
 GLEJd18/UKJvQ==
Date: Wed, 21 Jun 2023 16:08:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm: execution context for GEM buffers v5
Message-ID: <20230621160813.5916991a@collabora.com>
In-Reply-To: <20230621133700.7588-1-christian.koenig@amd.com>
References: <20230621133700.7588-1-christian.koenig@amd.com>
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
Cc: thomas_os@shipmail.org, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Wed, 21 Jun 2023 15:36:59 +0200
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existing TTMs execbuf util and intended to replace
> it in the long term.
>=20
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
>=20
> v2: drop xarray and use dynamic resized array instead, the locking
>     overhead is unecessary and measurable.
> v3: drop duplicate tracking, radeon is really the only one needing that.
> v4: fixes issues pointed out by Danilo, some typos in comments and a
>     helper for lock arrays of GEM objects.
> v5: some suggestions by Boris Brezillon, especially just use one retry
>     macro, drop loop in prepare_array, use flags instead of bool

One minor comment below, but otherwise, I think I'm happy with this version.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +
> +/**
> + * drm_exec_prepare_array - helper to prepare an array of objects
> + * @exec: the drm_exec object with the state
> + * @objects: array of GEM object to prepare
> + * @num_objects: number of GEM objects in the array
> + * @num_fences: number of fences to reserve on each GEM object
> + *
> + * Prepares all GEM objects in an array, handles contention but aports o=
n first

								   ^
								   aborts

> + * error otherwise. Reserves @num_fences on each GEM object after lockin=
g it.

Either the documentation if wrong, or you unintentionally picked my
version. If that's the intended usage:

	drm_exec_until_all_locked(exec) {
		ret =3D drm_exec_prepare_array(exec, bos, num_bos, num_fences);
		drm_exec_retry_on_contention(exec)
		if (ret)
			break;
	}

you should drop the 'handles contention' part in the doc, and you
should probably give an example to show how it's supposed to be used.

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
> +	for (unsigned int i =3D 0; i < num_objects; ++i) {
> +		ret =3D drm_exec_prepare_obj(exec, objects[i], num_fences);
> +		if (unlikely(ret))
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_exec_prepare_array);

[...]

> +/**
> + * drm_exec_until_all_locked - loop until all GEM objects are locked
> + * @exec: drm_exec object
> + *
> + * Core functionality of the drm_exec object. Loops until all GEM object=
s are
> + * locked and no more contention exists. At the beginning of the loop it=
 is
> + * guaranteed that no GEM object is locked.
> + *
> + * Since labels can't be defined local to the loops body we use a jump p=
ointer
> + * to make sure that the retry is only used from within the loops body.
> + */
> +#define drm_exec_until_all_locked(exec)				\
> +	for (void *__drm_exec_retry_ptr; ({			\
> +		__label__ __drm_exec_retry;			\
> +__drm_exec_retry:						\
> +		__drm_exec_retry_ptr =3D &&__drm_exec_retry;	\
> +		drm_exec_cleanup(exec);				\
> +	});)
> +
> +/**
> + * drm_exec_retry_on_contention - restart the loop to grap all locks
> + * @exec: drm_exec object
> + *
> + * Control flow helper to continue when a contention was detected and we=
 need to
> + * clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_retry_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		goto *__drm_exec_retry_ptr

Glad that this ended up working.

Regards,

Boris
