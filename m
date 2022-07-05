Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0256717E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9510EE3F;
	Tue,  5 Jul 2022 14:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E7C10EE3F;
 Tue,  5 Jul 2022 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657032609; x=1688568609;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ktx5bqyQm+POAAlqPAQDllYR70kQWk5/SQchslYhd4Q=;
 b=ckN3VWPTghj1L50A/O/524EjikJ7u1IUmKHxm5iJ7fKI+firzS2/apY5
 Mk5pzegfHi5FIycySxdt5JtnxDQMjIkHJ7GE01E+4kgT9/KoIG9KWe8Ww
 Py8xvY4LaKefkFEEG61uhPerua1pujv2l/y7huLeBSwdFs7A0fT8UT12Q
 IOjdIOQJL7G5g7iA+48gEtrMJs5BPk3NSKtw1NreGoxqWs44q9LkySene
 htKdvSCdJtIUuVYppmRiYqT+oFVauvbvJfpQzMv8izgwGqecpsWT69p+J
 UvvAgt1oeXz2JhmrnuR+YKVvWgIfeOQfsk6yY7XYUM0Y/UriEAP/BECQE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="280924642"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="280924642"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:50:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="919746182"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:50:06 -0700
Date: Tue, 5 Jul 2022 16:50:03 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 5/7] drm/i915: Check if the size is too big while
 creating shmem file
Message-ID: <20220705165003.3d0feaa0@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-6-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-6-gwan-gyeong.mun@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Jul 2022 15:24:53 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> The __shmem_file_setup() function returns -EINVAL if size is greater than
> MAX_LFS_FILESIZE. To handle the same error as other code that returns
> -E2BIG when the size is too large, it add a code that returns -E2BIG when
> the size is larger than the size that can be handled.
>=20
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index 604e8829e8ea..8495e87432f6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -541,6 +541,15 @@ static int __create_shmem(struct drm_i915_private *i=
915,
> =20
>  	drm_gem_private_object_init(&i915->drm, obj, size);
> =20
> +	/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
> +	 * greater than MAX_LFS_FILESIZE.
> +	 * To handle the same error as other code that returns -E2BIG when
> +	 * the size is too large, we add a code that returns -E2BIG when the
> +	 * size is larger than the size that can be handled.
> +	 */
> +	if (size > MAX_LFS_FILESIZE)
> +		return -E2BIG;
> +
>  	if (i915->mm.gemfs)
>  		filp =3D shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
>  						 flags);
=20
