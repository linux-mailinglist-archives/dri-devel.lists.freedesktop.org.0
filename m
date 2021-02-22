Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7294321A44
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70A16E52E;
	Mon, 22 Feb 2021 14:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1375B6E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 14:24:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA504ACBF;
 Mon, 22 Feb 2021 14:24:19 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20210217165910.3820374-1-nroberts@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8f3ea5bb-4bfa-a3de-2d45-ec7110338587@suse.de>
Date: Mon, 22 Feb 2021 15:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217165910.3820374-1-nroberts@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0903162084=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0903162084==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BbckVkDMolbFy74PkRDLeHi7vFS7kf5BT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BbckVkDMolbFy74PkRDLeHi7vFS7kf5BT
Content-Type: multipart/mixed; boundary="C0z4wx7Dz2wdtGavVZBVec1fs2L3SPYz3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8f3ea5bb-4bfa-a3de-2d45-ec7110338587@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
References: <20210217165910.3820374-1-nroberts@igalia.com>
In-Reply-To: <20210217165910.3820374-1-nroberts@igalia.com>

--C0z4wx7Dz2wdtGavVZBVec1fs2L3SPYz3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.02.21 um 17:59 schrieb Neil Roberts:
> When mmapping the shmem, it would previously adjust the pgoff in the
> vm_area_struct to remove the fake offset that is added to be able to
> identify the buffer. This patch removes the adjustment and makes the
> fault handler use the vm_fault address to calculate the page offset
> instead. Although using this address is apparently discouraged, several=

> DRM drivers seem to be doing it anyway.
>=20
> The problem with removing the pgoff is that it prevents
> drm_vma_node_unmap from working because that searches the mapping tree
> by address. That doesn't work because all of the mappings are at offset=

> 0. drm_vma_node_unmap is being used by the shmem helpers when purging
> the buffer.

I just want to ask if this is how the mmap callbacks are supposed to=20
work now?

I have a number of patches in here that convert several drivers to the=20
GEM object's mmap callback. They might not be affected by the vm_pgoff=20
bug, but I'd like to submit something that could work in the longer term.=


Best regards
Thomas

>=20
> It looks like panfrost is using drm_gem_shmem_purge so this might fix a=

> potential bug there.
>=20
> Signed-off-by: Neil Roberts <nroberts@igalia.com>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 9825c378dfa6..4b14157f1962 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -526,11 +526,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_f=
ault *vmf)
>   	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>   	loff_t num_pages =3D obj->size >> PAGE_SHIFT;
>   	struct page *page;
> +	pgoff_t page_offset;
>  =20
> -	if (vmf->pgoff >=3D num_pages || WARN_ON_ONCE(!shmem->pages))
> +	/* We don't use vmf->pgoff since that has the fake offset */
> +	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +
> +	if (page_offset < 0 || page_offset >=3D num_pages ||
> +	    WARN_ON_ONCE(!shmem->pages))
>   		return VM_FAULT_SIGBUS;
>  =20
> -	page =3D shmem->pages[vmf->pgoff];
> +	page =3D shmem->pages[page_offset];
>  =20
>   	return vmf_insert_page(vma, vmf->address, page);
>   }
> @@ -581,9 +586,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
>   	struct drm_gem_shmem_object *shmem;
>   	int ret;
>  =20
> -	/* Remove the fake offset */
> -	vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
> -
>   	if (obj->import_attach) {
>   		/* Drop the reference drm_gem_mmap_obj() acquired.*/
>   		drm_gem_object_put(obj);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--C0z4wx7Dz2wdtGavVZBVec1fs2L3SPYz3--

--BbckVkDMolbFy74PkRDLeHi7vFS7kf5BT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAzvpEFAwAAAAAACgkQlh/E3EQov+AJ
iQ/7BpSNPFjs2AYWR2lP8CSnMEznMVwJJ7SeFi2y8KvP82S1llBNzCSy4BepVnbxeosN2EP93A67
8zFt/q30mVPquk30wQ1apMvt15Z5h4gmeC/qWMoixix98RCD6drgFrdIRpf7Yu8r85nQzrYFDfYf
LA48tTCpnk4WKr4SNHuIEdkYKoaMclNe6NssK/vkffOLE3e0VNd3Iy+fkPyA8Amqp779snFExKni
5wsEkiGHoq5C0kyvNHZ7mc0VUUn2DcFaROMovRVWxMnkEUS5t1Ome1wLnkSxuLNej4F/g1EQti8n
1TQdMHjrzYJC+WCzxdG1ZvfvnnChJIocKu47FrH0WY89Qn92gJ7rJ5uri0wBM7ukH+yPzb5qh6Z9
l8UGZr++LiHTvO4h5a6qMOSb5VxWYjevO20gZIx1t33IU5VJIIB1dXiQ7G84SCbBh4DoQ9+Ox0pQ
lZghySefbmrcqDQsPotchCI1ndXvcD/P2DDGgPsK+Q0FxNh5GC/zQgovq0epuyLkSTvxPmPH0z51
B3r9DGiC7QLRWX13mpBO0/N65E4cW3JIo2c6xBwxOLxRsMy1+y2xGzxzJGxbfJfaDhbrtdPmNDiW
N0nDYbczZwJ9vY7yoUkbaNvnTcTQL/tcyXx0S86kXuhkGh0wzKUtx0oDBRuqiJZBAlgncEsXqjwD
DPg=
=IP/r
-----END PGP SIGNATURE-----

--BbckVkDMolbFy74PkRDLeHi7vFS7kf5BT--

--===============0903162084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0903162084==--
