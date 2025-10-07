Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CFBBC218F
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69410E6E6;
	Tue,  7 Oct 2025 16:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oy6JPO8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1D910E6E6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759854049;
 bh=2fEwLuPhzM8A+jG8Jh4BEEDphvVP+ZSL+92/amnexyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oy6JPO8y9XnNaLP4Sk2bewDlY3H1B6YQ3oKcRxbx4JLUnU03ACzvM1j0ougQicbFr
 Fye+ajTW7ViIfU+jW3u43ZaU96Xvf61i1NECvmX/TH5jzk03SHgvM8jYUFgJ+y1fwn
 Un1N3Q+3J0lIw/Xx+G2ALvYGS1qscIt1zIFCYNDzJ6esyIh6OvvpNCmz/MHGwCTBc4
 AlGW0Ss2XAu0TR+u6W8Coa3w5FWLbOu+gi4MS02SJpenOA53UREIc9ipWhpQO9xRJs
 jBYJYTEmX96Dc7Hns7CzdT/wcytmw6iPOYFeCDVWgOc2JwKzRH1R5C5q0Nqeh+UXHC
 qBCyKDGtFZFVg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A5DE17E1310;
 Tue,  7 Oct 2025 18:20:48 +0200 (CEST)
Date: Tue, 7 Oct 2025 18:20:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Rob Herring
 <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH v5 05/12] drm/panfrost: Check sgt to know whether pages
 are already mapped
Message-ID: <20251007182045.6a239bb8@fedora>
In-Reply-To: <20251007150216.254250-6-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-6-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  7 Oct 2025 16:01:47 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> In the MMU's page fault ISR for a heap object, determine whether the
> faulting address belongs to a 2MiB block that was already mapped by
> checking its corresponding sgt in the Panfrost BO.
>=20
> Also avoid retrieving pages from the shmem file if last one in the block
> was already present, as this means all of them had already been fetched.
>=20
> This is done in preparation for a future commit in which the MMU mapping
> helper might fail, but the page array is left populated, so this cannot
> be used as a check for an early bail-out.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 41 +++++++++++++++----------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index cf272b167feb..72864d0d478e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -600,32 +600,39 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
>  		refcount_set(&bo->base.pages_use_count, 1);
>  	} else {
>  		pages =3D bo->base.pages;
> -		if (pages[page_offset]) {
> -			/* Pages are already mapped, bail out. */
> -			goto out;
> -		}
> +	}
> +
> +	sgt =3D &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
> +	if (sgt->sgl) {
> +		/* Pages are already mapped, bail out. */
> +		goto out;
>  	}
> =20
>  	mapping =3D bo->base.base.filp->f_mapping;
>  	mapping_set_unevictable(mapping);
> =20
> -	for (i =3D page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> -		/* Can happen if the last fault only partially filled this
> -		 * section of the pages array before failing. In that case
> -		 * we skip already filled pages.
> +	if (!pages[page_offset + NUM_FAULT_PAGES - 1]) {
> +		/* Pages are retrieved sequentially, so if the very last
> +		 * one in the subset we want to map is already assigned, then
> +		 * there's no need to further iterate.
>  		 */

I don't think we care about optimizing the page range walk in the
unlikely case of a double fault on the same section, so I'd just keep
the existing loop unchanged.

> -		if (pages[i])
> -			continue;
> -
> -		pages[i] =3D shmem_read_mapping_page(mapping, i);
> -		if (IS_ERR(pages[i])) {
> -			ret =3D PTR_ERR(pages[i]);
> -			pages[i] =3D NULL;
> -			goto err_unlock;
> +		for (i =3D page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> +			/* Can happen if the last fault only partially filled this
> +			 * section of the pages array before failing. In that case
> +			 * we skip already filled pages.
> +			 */
> +			if (pages[i])
> +				continue;
> +
> +			pages[i] =3D shmem_read_mapping_page(mapping, i);
> +			if (IS_ERR(pages[i])) {
> +				ret =3D PTR_ERR(pages[i]);
> +				pages[i] =3D NULL;
> +				goto err_unlock;
> +			}
>  		}
>  	}
> =20
> -	sgt =3D &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
>  	ret =3D sg_alloc_table_from_pages(sgt, pages + page_offset,
>  					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
>  	if (ret)
