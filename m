Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B3233FCB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A386E9E9;
	Fri, 31 Jul 2020 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81DC6E9E9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 07:14:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63A2CB57D;
 Fri, 31 Jul 2020 07:14:41 +0000 (UTC)
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <43f848a2-579a-873f-4271-7bff0968888b@suse.de>
Date: Fri, 31 Jul 2020 09:14:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731040520.3701599-27-airlied@gmail.com>
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============2072314724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2072314724==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4oaHXP2SdUgi7fjm8LX58YwV5dSqYyVcX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4oaHXP2SdUgi7fjm8LX58YwV5dSqYyVcX
Content-Type: multipart/mixed; boundary="SpyQVecTKgH8QNUfnDlhhcQ9Ch626ghdn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Message-ID: <43f848a2-579a-873f-4271-7bff0968888b@suse.de>
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-27-airlied@gmail.com>

--SpyQVecTKgH8QNUfnDlhhcQ9Ch626ghdn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> This will allow different abstractions later.

You should consider moving this patch to the beginning of the series, so
that patches 1 to 25 can benefit from it.

Best regards
Thomas

>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      | 34 +++++++++++++++----------------=

>  drivers/gpu/drm/ttm/ttm_bo_util.c | 20 +++++++++---------
>  drivers/gpu/drm/ttm/ttm_bo_vm.c   |  2 +-
>  include/drm/ttm/ttm_bo_driver.h   |  6 ++++++
>  4 files changed, 34 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 07c653374f15..7c6389ea067f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -80,7 +80,7 @@ static inline int ttm_mem_type_from_place(const struc=
t ttm_place *place,
>  static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_=
printer *p,
>  			       int mem_type)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, mem_type)=
;
> =20
>  	drm_printf(p, "    has_type: %d\n", man->has_type);
>  	drm_printf(p, "    use_type: %d\n", man->use_type);
> @@ -156,7 +156,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer=
_object *bo,
>  	if (mem->placement & TTM_PL_FLAG_NO_EVICT)
>  		return;
> =20
> -	man =3D &bdev->man[mem->mem_type];
> +	man =3D ttm_manager_type(bdev, mem->mem_type);
>  	list_add_tail(&bo->lru, &man->lru[bo->priority]);
> =20
>  	if (man->use_tt && bo->ttm &&
> @@ -231,7 +231,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_=
move *bulk)
>  		dma_resv_assert_held(pos->first->base.resv);
>  		dma_resv_assert_held(pos->last->base.resv);
> =20
> -		man =3D &pos->first->bdev->man[TTM_PL_TT];
> +		man =3D ttm_manager_type(pos->first->bdev, TTM_PL_TT);
>  		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>  				    &pos->last->lru);
>  	}
> @@ -246,7 +246,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_=
move *bulk)
>  		dma_resv_assert_held(pos->first->base.resv);
>  		dma_resv_assert_held(pos->last->base.resv);
> =20
> -		man =3D &pos->first->bdev->man[TTM_PL_VRAM];
> +		man =3D ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
>  		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>  				    &pos->last->lru);
>  	}
> @@ -272,8 +272,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *old_man =3D &bdev->man[bo->mem.mem_type]=
;
> -	struct ttm_mem_type_manager *new_man =3D &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *old_man =3D ttm_manager_type(bdev, bo->m=
em.mem_type);
> +	struct ttm_mem_type_manager *new_man =3D ttm_manager_type(bdev, mem->=
mem_type);
>  	int ret;
> =20
>  	ret =3D ttm_mem_io_lock(old_man, true);
> @@ -338,7 +338,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
>  	return 0;
> =20
>  out_err:
> -	new_man =3D &bdev->man[bo->mem.mem_type];
> +	new_man =3D ttm_manager_type(bdev, bo->mem.mem_type);
>  	if (!new_man->use_tt) {
>  		ttm_tt_destroy(bo->ttm);
>  		bo->ttm =3D NULL;
> @@ -550,7 +550,7 @@ static void ttm_bo_release(struct kref *kref)
>  	struct ttm_buffer_object *bo =3D
>  	    container_of(kref, struct ttm_buffer_object, kref);
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *man =3D &bdev->man[bo->mem.mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, bo->mem.m=
em_type);
>  	size_t acc_size =3D bo->acc_size;
>  	int ret;
> =20
> @@ -838,7 +838,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object =
*bo,
>  			  const struct ttm_place *place,
>  			  struct ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bo->bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bo->bdev, mem->=
mem_type);
> =20
>  	mem->mm_node =3D NULL;
>  	if (!man->func || !man->func->get_node)
> @@ -849,7 +849,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object =
*bo,
> =20
>  void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *=
mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bo->bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bo->bdev, mem->=
mem_type);
> =20
>  	if (!man->func || !man->func->put_node)
>  		return;
> @@ -906,7 +906,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer=
_object *bo,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, mem->mem_=
type);
>  	struct ww_acquire_ctx *ticket;
>  	int ret;
> =20
> @@ -996,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_o=
bject *bo,
>  	if (ret)
>  		return ret;
> =20
> -	man =3D &bdev->man[mem_type];
> +	man =3D ttm_manager_type(bdev, mem_type);
>  	if (!man->has_type || !man->use_type)
>  		return -EBUSY;
> =20
> @@ -1059,7 +1059,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo=
,
>  		if (unlikely(ret))
>  			goto error;
> =20
> -		man =3D &bdev->man[mem->mem_type];
> +		man =3D ttm_manager_type(bdev, mem->mem_type);
>  		ret =3D ttm_bo_add_move_fence(bo, man, mem, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
>  			ttm_bo_mem_put(bo, mem);
> @@ -1448,7 +1448,7 @@ EXPORT_SYMBOL(ttm_bo_force_list_clean);
> =20
>  int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, mem_type)=
;
> =20
>  	if (mem_type =3D=3D 0 || mem_type >=3D TTM_NUM_MEM_TYPES) {
>  		pr_err("Illegal memory manager memory type %u\n", mem_type);
> @@ -1551,7 +1551,7 @@ int ttm_bo_device_release(struct ttm_bo_device *b=
dev)
>  	unsigned i;
>  	struct ttm_mem_type_manager *man;
> =20
> -	man =3D &bdev->man[TTM_PL_SYSTEM];
> +	man =3D ttm_manager_type(bdev, TTM_PL_SYSTEM);
>  	ttm_bo_disable_mm(man);
> =20
>  	mutex_lock(&ttm_global_mutex);
> @@ -1578,7 +1578,7 @@ EXPORT_SYMBOL(ttm_bo_device_release);
> =20
>  static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[TTM_PL_SYSTEM];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, TTM_PL_SY=
STEM);
> =20
>  	/*
>  	 * Initialize the system memory buffer type.
> @@ -1642,7 +1642,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffe=
r_object *bo)
>  void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *man =3D &bdev->man[bo->mem.mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, bo->mem.m=
em_type);
> =20
>  	ttm_mem_io_lock(man, false);
>  	ttm_bo_unmap_virtual_locked(bo);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> index 1f502be0b646..879c8ded0cd8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -129,7 +129,7 @@ static int ttm_mem_io_evict(struct ttm_mem_type_man=
ager *man)
>  int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>  		       struct ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, mem->mem_=
type);
>  	int ret;
> =20
>  	if (mem->bus.io_reserved_count++)
> @@ -162,7 +162,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
> =20
>  int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
>  {
> -	struct ttm_mem_type_manager *man =3D &bo->bdev->man[bo->mem.mem_type]=
;
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bo->bdev, bo->m=
em.mem_type);
>  	struct ttm_mem_reg *mem =3D &bo->mem;
>  	int ret;
> =20
> @@ -195,7 +195,7 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device=
 *bdev,
>  			       struct ttm_mem_reg *mem,
>  			       void **virtual)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, mem->mem_=
type);
>  	int ret;
>  	void *addr;
> =20
> @@ -232,7 +232,7 @@ static void ttm_mem_reg_iounmap(struct ttm_bo_devic=
e *bdev,
>  {
>  	struct ttm_mem_type_manager *man;
> =20
> -	man =3D &bdev->man[mem->mem_type];
> +	man =3D ttm_manager_type(bdev, mem->mem_type);
> =20
>  	if (virtual && mem->bus.addr =3D=3D NULL)
>  		iounmap(virtual);
> @@ -303,7 +303,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo=
,
>  		       struct ttm_mem_reg *new_mem)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *man =3D &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, new_mem->=
mem_type);
>  	struct ttm_tt *ttm =3D bo->ttm;
>  	struct ttm_mem_reg *old_mem =3D &bo->mem;
>  	struct ttm_mem_reg old_copy =3D *old_mem;
> @@ -571,7 +571,7 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>  		struct ttm_bo_kmap_obj *map)
>  {
>  	struct ttm_mem_type_manager *man =3D
> -		&bo->bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
>  	unsigned long offset, size;
>  	int ret;
> =20
> @@ -601,7 +601,7 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>  {
>  	struct ttm_buffer_object *bo =3D map->bo;
>  	struct ttm_mem_type_manager *man =3D
> -		&bo->bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
> =20
>  	if (!map->virtual)
>  		return;
> @@ -634,7 +634,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_obj=
ect *bo,
>  			      struct ttm_mem_reg *new_mem)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	struct ttm_mem_type_manager *man =3D &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(bdev, new_mem->=
mem_type);
>  	struct ttm_mem_reg *old_mem =3D &bo->mem;
>  	int ret;
>  	struct ttm_buffer_object *ghost_obj;
> @@ -697,8 +697,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *=
bo,
>  	struct ttm_bo_device *bdev =3D bo->bdev;
>  	struct ttm_mem_reg *old_mem =3D &bo->mem;
> =20
> -	struct ttm_mem_type_manager *from =3D &bdev->man[old_mem->mem_type];
> -	struct ttm_mem_type_manager *to =3D &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *from =3D ttm_manager_type(bdev, old_mem-=
>mem_type);
> +	struct ttm_mem_type_manager *to =3D ttm_manager_type(bdev, new_mem->m=
em_type);
> =20
>  	int ret;
> =20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> index 468a0eb9e632..5ae679184eb5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -282,7 +282,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault=
 *vmf,
>  	vm_fault_t ret =3D VM_FAULT_NOPAGE;
>  	unsigned long address =3D vmf->address;
>  	struct ttm_mem_type_manager *man =3D
> -		&bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bdev, bo->mem.mem_type);
> =20
>  	/*
>  	 * Refuse to fault imported pages. This should be handled
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index 9d066529ca61..ec25451b503f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -444,6 +444,12 @@ struct ttm_bo_device {
>  	bool no_retry;
>  };
> =20
> +static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm=
_bo_device *bdev,
> +							    int mem_type)
> +{
> +	return &bdev->man[mem_type];
> +}
> +
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SpyQVecTKgH8QNUfnDlhhcQ9Ch626ghdn--

--4oaHXP2SdUgi7fjm8LX58YwV5dSqYyVcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8jxNAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP0vwf8CeG065kQZiDe0B2u9fHOAItKcnC3
Zusm2wzRjY75seXOg3WjWOm72yqhxSNUG3yvu/X/HeTXlgeP9bhbqkZ1hWpAjBgm
+uAlLk9mWbnmJtSFJi7AJg/OpFe2mJLGdE39+09W3Qw++2MiFb2PK4re2nXOa81q
8WImDreuBw6r+m/UKUMEAgGGfN1ZgVtGM0KnxPff8tcJlfXUwN9J3FZ5nLujP/cA
PvON5lq5jYPAzASKSTetWYrNWR2CnOuGRSLUKPYRZeFvEquhaBdgiPKX73KJtsH8
XL0561ojvUMkfAQ5wTblGSTJZDuOJ8GE/V2u5TymrtNmayrLd+tLo/CULg==
=psDd
-----END PGP SIGNATURE-----

--4oaHXP2SdUgi7fjm8LX58YwV5dSqYyVcX--

--===============2072314724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2072314724==--
