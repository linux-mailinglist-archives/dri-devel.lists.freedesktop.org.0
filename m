Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B70B3592
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600D36E84F;
	Mon, 16 Sep 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404C86F423
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 17:25:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 6CA7C28F116
Date: Fri, 13 Sep 2019 13:24:54 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Prevent race when handling page fault
Message-ID: <20190913172454.GA5387@kevin>
References: <20190905121141.42820-1-steven.price@arm.com>
MIME-Version: 1.0
In-Reply-To: <20190905121141.42820-1-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1287925738=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1287925738==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm conflicted on this series.

On the one hand, userspace should obviously not be able to crash the
kernel. So the crash should be fixed in one way or another.

On the other hand, userspace really has to supply all the BOs it uses
for correctness. I realize the DDK doesn't do this but... it probably
should, umm...

Would it be possible to check for the NULL pointer in the kernel and
skip printing information that would require a dereference? (Without
having to play games with reference counts). Presumably that might fix
crashes in other corner cases.

On Thu, Sep 05, 2019 at 01:11:41PM +0100, Steven Price wrote:
> When handling a GPU page fault addr_to_drm_mm_node() is used to
> translate the GPU address to a buffer object. However it is possible for
> the buffer object to be freed after the function has returned resulting
> in a use-after-free of the BO.
>=20
> Change addr_to_drm_mm_node to return the panfrost_gem_object with an
> extra reference on it, preventing the BO from being freed until after
> the page fault has been handled.
>=20
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>=20
> I've managed to trigger this, generating the following stack trace.
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
090
> pgd =3D 33a6a181
> [00000090] *pgd=3D00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 0 PID: 81 Comm: irq/60-mmu Not tainted 5.3.0-rc1+ #4
> Hardware name: Rockchip (Device Tree)
> PC is at panfrost_mmu_map_fault_addr+0x140/0x3a0
> LR is at _raw_spin_unlock+0x20/0x3c
> pc : [<c0508944>]    lr : [<c07ced10>]    psr: 20030013
> sp : ec643e88  ip : ea70ce24  fp : ec5fe840
> r10: 00000001  r9 : 00000000  r8 : 000178c9
> r7 : 00000000  r6 : 178c9f00  r5 : ec5fe940  r4 : ea70ce08
> r3 : 00000000  r2 : 00000000  r1 : ec640e00  r0 : ec5fe940
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 29f8406a  DAC: 00000051
> Process irq/60-mmu (pid: 81, stack limit =3D 0x4b907106)
> Stack: (0xec643e88 to 0xec644000)
> 3e80:                   ec640e00 c07cede0 c0c0b200 ec640e00 00000000 0000=
0000
> 3ea0: 000178c9 00000000 c0c0b200 c07cede0 eef91040 ec5fe840 00000001 0000=
0000
> 3ec0: 00010001 010003c3 000000c3 00000001 178c9f00 c0508c98 eef91050 0000=
0000
> 3ee0: ec643f34 c07c9188 00000001 c0167854 00000000 ec643ef8 c0c08448 c07c=
933c
> 3f00: 00000000 ec643f04 fffefffe 3d182b17 ee193468 ee193400 ec5db3c0 ec5d=
b3c0
> 3f20: c0183840 ec5db3e4 c0cb2874 c0183b08 00000001 c018385c ffffe000 ee19=
3400
> 3f40: ec5db3c0 c0183b8c c0c08448 00000000 60000013 00000000 c01839b8 3d18=
2b17
> 3f60: ffffe000 ec5d0500 ec5db380 ec642000 ec5db3c0 c0183a64 00000000 ed02=
5cd8
> 3f80: ec5d0538 c0146cfc ec642000 ec5db380 c0146bc0 00000000 00000000 0000=
0000
> 3fa0: 00000000 00000000 00000000 c01010b4 00000000 00000000 00000000 0000=
0000
> 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 0000=
0000
> [<c0508944>] (panfrost_mmu_map_fault_addr) from [<c0508c98>] (panfrost_mm=
u_irq_handler_thread+0xf4/0x248)
> [<c0508c98>] (panfrost_mmu_irq_handler_thread) from [<c018385c>] (irq_thr=
ead_fn+0x1c/0x58)
> [<c018385c>] (irq_thread_fn) from [<c0183b8c>] (irq_thread+0x128/0x240)
> [<c0183b8c>] (irq_thread) from [<c0146cfc>] (kthread+0x13c/0x154)
> [<c0146cfc>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> Exception stack(0xec643fb0 to 0xec643ff8)
> 3fa0:                                     00000000 00000000 00000000 0000=
0000
> 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: 1affffec eaffffe8 e5143004 e59d2014 (e5933090)
> ---[ end trace 04eadc3009b8f507 ]---
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 38 ++++++++++++++++---------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 842bdd7cf6be..115925e7460a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -392,9 +392,11 @@ void panfrost_mmu_pgtable_free(struct panfrost_file_=
priv *priv)
>  	free_io_pgtable_ops(mmu->pgtbl_ops);
>  }
> =20
> -static struct drm_mm_node *addr_to_drm_mm_node(struct panfrost_device *p=
fdev, int as, u64 addr)
> +static struct panfrost_gem_object *
> +addr_to_drm_mm_node(struct panfrost_device *pfdev, int as, u64 addr)
>  {
> -	struct drm_mm_node *node =3D NULL;
> +	struct panfrost_gem_object *bo =3D NULL;
> +	struct drm_mm_node *node;
>  	u64 offset =3D addr >> PAGE_SHIFT;
>  	struct panfrost_mmu *mmu;
> =20
> @@ -406,14 +408,17 @@ static struct drm_mm_node *addr_to_drm_mm_node(stru=
ct panfrost_device *pfdev, in
> =20
>  		priv =3D container_of(mmu, struct panfrost_file_priv, mmu);
>  		drm_mm_for_each_node(node, &priv->mm) {
> -			if (offset >=3D node->start && offset < (node->start + node->size))
> +			if (offset >=3D node->start &&
> +			    offset < (node->start + node->size)) {
> +				bo =3D drm_mm_node_to_panfrost_bo(node);
> +				drm_gem_object_get(&bo->base.base);
>  				goto out;
> +			}
>  		}
>  	}
> -
>  out:
>  	spin_unlock(&pfdev->as_lock);
> -	return node;
> +	return bo;
>  }
> =20
>  #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
> @@ -421,29 +426,28 @@ static struct drm_mm_node *addr_to_drm_mm_node(stru=
ct panfrost_device *pfdev, in
>  int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as, u=
64 addr)
>  {
>  	int ret, i;
> -	struct drm_mm_node *node;
>  	struct panfrost_gem_object *bo;
>  	struct address_space *mapping;
>  	pgoff_t page_offset;
>  	struct sg_table *sgt;
>  	struct page **pages;
> =20
> -	node =3D addr_to_drm_mm_node(pfdev, as, addr);
> -	if (!node)
> +	bo =3D addr_to_drm_mm_node(pfdev, as, addr);
> +	if (!bo)
>  		return -ENOENT;
> =20
> -	bo =3D drm_mm_node_to_panfrost_bo(node);
>  	if (!bo->is_heap) {
>  		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA =3D %llx)",
> -			 node->start << PAGE_SHIFT);
> -		return -EINVAL;
> +			 bo->node.start << PAGE_SHIFT);
> +		ret =3D -EINVAL;
> +		goto err_bo;
>  	}
>  	WARN_ON(bo->mmu->as !=3D as);
> =20
>  	/* Assume 2MB alignment and size multiple */
>  	addr &=3D ~((u64)SZ_2M - 1);
>  	page_offset =3D addr >> PAGE_SHIFT;
> -	page_offset -=3D node->start;
> +	page_offset -=3D bo->node.start;
> =20
>  	mutex_lock(&bo->base.pages_lock);
> =20
> @@ -452,7 +456,8 @@ int panfrost_mmu_map_fault_addr(struct panfrost_devic=
e *pfdev, int as, u64 addr)
>  				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
>  		if (!bo->sgts) {
>  			mutex_unlock(&bo->base.pages_lock);
> -			return -ENOMEM;
> +			ret =3D -ENOMEM;
> +			goto err_bo;
>  		}
> =20
>  		pages =3D kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
> @@ -461,7 +466,8 @@ int panfrost_mmu_map_fault_addr(struct panfrost_devic=
e *pfdev, int as, u64 addr)
>  			kfree(bo->sgts);
>  			bo->sgts =3D NULL;
>  			mutex_unlock(&bo->base.pages_lock);
> -			return -ENOMEM;
> +			ret =3D -ENOMEM;
> +			goto err_bo;
>  		}
>  		bo->base.pages =3D pages;
>  		bo->base.pages_use_count =3D 1;
> @@ -499,12 +505,16 @@ int panfrost_mmu_map_fault_addr(struct panfrost_dev=
ice *pfdev, int as, u64 addr)
> =20
>  	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
> =20
> +	drm_gem_object_put_unlocked(&bo->base.base);
> +
>  	return 0;
> =20
>  err_map:
>  	sg_free_table(sgt);
>  err_pages:
>  	drm_gem_shmem_put_pages(&bo->base);
> +err_bo:
> +	drm_gem_object_put_unlocked(&bo->base.base);
>  	return ret;
>  }
> =20
> --=20
> 2.20.1
>=20

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl170OEACgkQ/v5QWgr1
WA0hOA//ZJSOyN64IAwBuFNExFXfkSPd64K3WKQ5wlPHTLkwvFSVYzWku8YF3yMj
Wq+CPElVvycjpOTKHrMjyTSbgdOPJiG4UHcPu9cX7vIV2gJQQs5sthsoW9t1D5Ii
ZFbmdH6Vl6b7ItGXCKWrvU9IawZcc5+SsrwOtxq/kDbmeARGYf09TnabPzdkrQ8k
9K6IFQHxCBGs4TnIcRFPiWGSP6TF0Hsc+BGxeS5PI2k7MWdSlPrx5T2m76roBMOk
gxG37kRyb11Vigum6hZfSzJEQS1pGYJsMLTzaizJaJn1DtfEefab4TbkS2FXXyLA
GfUIQRoU9BSKRMt/A9mjh5UUcycs7QG8sB5CrA9BGcRUCv12apR/VFl3zQ4dEbU9
CLvG/9jBrGK9BJOKz4MBbh8909Ma8+Jr2Hg3MCTwXKFeWqnQBrTSPy9eUSDZY84j
aaXk1VybkqvPPgR5A9ZVQKOssxD1e9RBMRuJvPQnLRv8s8e8HeNQZj2wWGed8851
/gdyEks3ugG4HiA1y2zp4r5FB5XOXM3HtVtcSP75vwYiK66czdvE5UGdyNY6EDmd
a00HUESG8koW504f7JBEJMKj8xSJ2YhHq4iXU05yuXNwh8H9zJ9e7f0q9qnQOq7S
qqIjhGcFkcu3DaVjakI4b6vfpZYiYnp7uT4O7KsSPGARvHY5e98=
=N8AC
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

--===============1287925738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1287925738==--
