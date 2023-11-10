Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5937E7BC4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60E10E932;
	Fri, 10 Nov 2023 11:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2204C10E932;
 Fri, 10 Nov 2023 11:20:04 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CAD5466071D4;
 Fri, 10 Nov 2023 11:20:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699615202;
 bh=g9TyoOYvkxRuOxwkgEkdZD2BKRl3kf4lLjfgbCUhWc8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GzDjgmK9aPYDeZzee4qKNzG9AjxX6gPG8FQGY/9vJ607I1iQrmt4wBHStGxQLVsx7
 GumM5B1c9B3UXihIb222uqyDOvIoEaufq6TuM8JGHxO4tPKjuGhgQkGJwFvfkuVznw
 Xo9vFH5FhFPHQ0fmpKmaspbT0ihIiodVS/a1j3m/MAriRraGk7ehyHy6iONWbQhCM2
 1BeeHwXYmFTfQXQo+fY2d2sY8rKKMLO6+Th99VipiGLARpAkZ29krcJDoJh3S2R2Ni
 vtvpFnH/hqTT6GCCe4I+lkzb7iIVRVS1kDSUn2ZWNMx6+L3QiKsWQlrBnU4rkvuHve
 I2oq0ccAVeaPA==
Date: Fri, 10 Nov 2023 12:19:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v9 02/12] drm/gpuvm: don't always WARN in
 drm_gpuvm_check_overflow()
Message-ID: <20231110121958.59f9d330@collabora.com>
In-Reply-To: <20231108001259.15123-3-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
 <20231108001259.15123-3-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, donald.robson@imgtec.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Nov 2023 01:12:32 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> Don't always WARN in drm_gpuvm_check_overflow() and separate it into a
> drm_gpuvm_check_overflow() and a dedicated
> drm_gpuvm_warn_check_overflow() variant.
>=20
> This avoids printing warnings due to invalid userspace requests.
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index d7367a202fee..445767f8fbc4 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -614,12 +614,18 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpu=
vm,
>  static void __drm_gpuva_remove(struct drm_gpuva *va);
> =20
>  static bool
> -drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
> +drm_gpuvm_check_overflow(u64 addr, u64 range)
>  {
>  	u64 end;
> =20
> -	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
> -			"GPUVA address limited to %zu bytes.\n", sizeof(end));
> +	return check_add_overflow(addr, range, &end);
> +}
> +
> +static bool
> +drm_gpuvm_warn_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 ran=
ge)
> +{
> +	return drm_WARN(gpuvm->drm, drm_gpuvm_check_overflow(addr, range),
> +			"GPUVA address limited to %zu bytes.\n", sizeof(addr));
>  }
> =20
>  static bool
> @@ -647,7 +653,7 @@ static bool
>  drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>  		      u64 addr, u64 range)
>  {
> -	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
> +	return !drm_gpuvm_check_overflow(addr, range) &&
>  	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
>  	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
>  }
> @@ -682,7 +688,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *n=
ame,
>  	gpuvm->ops =3D ops;
>  	gpuvm->drm =3D drm;
> =20
> -	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
> +	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
>  	gpuvm->mm_start =3D start_offset;
>  	gpuvm->mm_range =3D range;
> =20
> @@ -691,8 +697,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *n=
ame,
>  		gpuvm->kernel_alloc_node.va.addr =3D reserve_offset;
>  		gpuvm->kernel_alloc_node.va.range =3D reserve_range;
> =20
> -		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
> -						     reserve_range)))
> +		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
> +							  reserve_range)))
>  			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>  	}
>  }

