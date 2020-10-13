Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD228C962
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D396E8A4;
	Tue, 13 Oct 2020 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8176E8A4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 07:31:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Rzw1m0qz9sVH;
 Tue, 13 Oct 2020 18:31:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602574270;
 bh=V/UtxiMXVJw0j5PGw9Bq2WshrzH3dzmQXoAanhACYH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r5eQRHa41qZJNZpYlkT9DluxxtXHn78TAkOlG2qSVyYG8S2/IBq84BsJtfDfs8UqA
 XnCcvS2ou9DnpN5v97kWUEKUQjPeDvvn8GRAh2afBvVVP/M97lrmTAK/+esigT2eH+
 jbPIhyTlY8mKbZUc0WKOMJ7Njncncp6jqh7zKjKX0W5x+uQ54CsvKzrgoXYL5hpKuI
 kVkuDLCrjVHm7mT2uLbdMxh5UMytyNTqxAEOPH8SXLWha30dxeq4Hq82cZkxyJUPnf
 ZzObjuLyt3BaGDu+UUKW8ziB7kgKT746W1AnJ9ysquiDkaKtCtgjyiwKjjPRAxr3dS
 OMy3A7DnMN0Yg==
Date: Tue, 13 Oct 2020 18:31:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20201013183107.65c15fd5@canb.auug.org.au>
In-Reply-To: <20200921140901.16adf8c2@canb.auug.org.au>
References: <20200921140901.16adf8c2@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Tom Murphy <murphyt7@tcd.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, DRI <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1991740925=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1991740925==
Content-Type: multipart/signed; boundary="Sig_/gObwaAEGm=S6y1zPfwPtW1.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gObwaAEGm=S6y1zPfwPtW1.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 21 Sep 2020 14:09:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the iommu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/msm/msm_iommu.c: In function 'msm_iommu_pagetable_unmap':
> drivers/gpu/drm/msm/msm_iommu.c:46:2: error: implicit declaration of func=
tion 'iommu_flush_tlb_all'; did you mean 'iommu_flush_iotlb_all'? [-Werror=
=3Dimplicit-function-declaration]
>    46 |  iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
>       |  ^~~~~~~~~~~~~~~~~~~
>       |  iommu_flush_iotlb_all
>=20
> Caused by commit
>=20
>   aae4c8e27bd7 ("iommu: Rename iommu_tlb_* functions to iommu_iotlb_*")
>=20
> interacting with commit
>=20
>   b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
>=20
> from the drm-msm tree.
>=20
> I have applied the following merge fix patch.  Someone will need to tell
> Linus about this fix up when the trees get merged.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 21 Sep 2020 14:04:14 +1000
> Subject: [PATCH] merge fix upt for iommu_flush_iotlb_all() rename
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index 3a83ffdb3b90..22ac7c692a81 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -43,7 +43,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mm=
u, u64 iova,
>  		size -=3D 4096;
>  	}
> =20
> -	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> +	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
> =20
>  	return (unmapped =3D=3D size) ? 0 : -EINVAL;
>  }
> @@ -199,7 +199,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm=
_mmu *parent)
> =20
>  	/*
>  	 * TODO we would like each set of page tables to have a unique ASID
> -	 * to optimize TLB invalidation.  But iommu_flush_tlb_all() will
> +	 * to optimize TLB invalidation.  But iommu_flush_iotlb_all() will
>  	 * end up flushing the ASID used for TTBR1 pagetables, which is not
>  	 * what we want.  So for now just use the same ASID as TTBR1.
>  	 */
> --=20
> 2.28.0

This merge fix up is now needed when the iommu tree and the drm tree are me=
rged.
--=20
Cheers,
Stephen Rothwell

--Sig_/gObwaAEGm=S6y1zPfwPtW1.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FV7sACgkQAVBC80lX
0GyRqgf/Rh1Gn5zJlXloxhJDs1NZzBo3XiaNUkZRZ2M4MEuSGUB8ReqD9UBmkQkN
QiA5dfRteGKS71hLS8IzUk3sW7cRm5z3lMKeLpju5vJpcdd+MlZ2shYFNpB34wOj
7N+80Z5khRT+Yficya98rRcHKGQ+OL7jxIKxKjjnlbB2XqS1PZ6eSN2PIntqYnbD
8vKjbLAczSbMNDJNpGPk/QC+qVKKvmpNA6QWDinwNa0dFI3Y1KKZmkg5OSvhviww
5s9IG1hQuCzksnK56umNwXOQSr07pmpk+6+TucgsEhCXKDPYTWeehLkxYlrBXP58
uD/sWTUhI4euQO45Tt9XwoL5ZcRhZQ==
=pFEv
-----END PGP SIGNATURE-----

--Sig_/gObwaAEGm=S6y1zPfwPtW1.--

--===============1991740925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1991740925==--
