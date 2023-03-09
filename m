Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F076B1AEC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 06:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888A10E78E;
	Thu,  9 Mar 2023 05:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355310E78C;
 Thu,  9 Mar 2023 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678340562; x=1709876562;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=uCAzubwyGzB49kfOfD/iqib1FthJTGQPSb2PAavTWeQ=;
 b=BhNgzPwwCcm9uh/gbE0EG4q/jagiFH1jjyp6Zt2KfoW3qqkZyjm+Ki1b
 habNOAsmx737AkRF0pP8tZCvISV0Bh7+TfNdoiTVm0eLPyqTWFj3erhVK
 HOe4noP6McunlmZ+bPOyneHoJ+hK0SOAFc6xcmIdgmm5qfWsJMeiR59dp
 RdQlyvfx2Y0/8cg8d91TpZ+GKnEVZY3Oxt/Vdp7tOumcM2HPNRc5Ja/UE
 X4dXLkJxFVxzuCFwTcLBMLSqg0/v6AhokrbNFrTmsLkWgNlN5nuURsB37
 2kes2nVsvXmWoS3iYCYXe3ezi0AZ/FQbSgLjT0G/RtlZrmsrp32JwYXRD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338695607"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
 d="asc'?scan'208";a="338695607"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 21:42:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="801047130"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
 d="asc'?scan'208";a="801047130"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 21:42:37 -0800
Date: Thu, 9 Mar 2023 13:41:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2] drm/i915/gvt: Make use of idr_find and
 idr_for_each_entry in dmabuf
Message-ID: <ZAlxge8ENvruScGf@debian-scheme>
References: <20230303140718.25355-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="duxpWjsI3Cucd3ft"
Content-Disposition: inline
In-Reply-To: <20230303140718.25355-1-cai.huoqing@linux.dev>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--duxpWjsI3Cucd3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.03.03 22:07:18 +0800, Cai Huoqing wrote:
> This patch uses the already existing IDR mechanism to simplify
> and improve the dmabuf code.
>=20
> Using 'vgpu.object_idr' directly instead of 'dmabuf_obj_list_head'
> or 'dmabuf.list', because the dmabuf_obj can be found by 'idr_find'
> or 'idr_for_each_entry'.
>=20
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
> v1->v2:
> 	1.Use idr_find to get the target one and free it instead of free all dma=
 objs.
> 	2.Revert the original code 'ret' related
> 	3.Add '&& !idr_is_empty()' like the original code '&& !list_empty()'

Looks good to me. I'll send it for some regression test before upstream.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

>=20
> v1 link:
> 	https://lore.kernel.org/lkml/20230302115318.79487-1-cai.huoqing@linux.de=
v/
>=20
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 58 +++++++------------------------
>  drivers/gpu/drm/i915/gvt/dmabuf.h |  1 -
>  drivers/gpu/drm/i915/gvt/gvt.h    |  1 -
>  drivers/gpu/drm/i915/gvt/vgpu.c   |  1 -
>  4 files changed, 12 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 6834f9fe40cf..cf619b1ed3ad 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -133,21 +133,15 @@ static void dmabuf_gem_object_free(struct kref *kre=
f)
>  	struct intel_vgpu_dmabuf_obj *obj =3D
>  		container_of(kref, struct intel_vgpu_dmabuf_obj, kref);
>  	struct intel_vgpu *vgpu =3D obj->vgpu;
> -	struct list_head *pos;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
> =20
>  	if (vgpu && test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status) &&
> -	    !list_empty(&vgpu->dmabuf_obj_list_head)) {
> -		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -			dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> -			if (dmabuf_obj =3D=3D obj) {
> -				list_del(pos);
> -				idr_remove(&vgpu->object_idr,
> -					   dmabuf_obj->dmabuf_id);
> -				kfree(dmabuf_obj->info);
> -				kfree(dmabuf_obj);
> -				break;
> -			}
> +	    !idr_is_empty(&vgpu->object_idr)) {
> +		dmabuf_obj =3D idr_find(&vgpu->object_idr, obj->dmabuf_id);
> +		if (dmabuf_obj) {
> +			idr_remove(&vgpu->object_idr, obj->dmabuf_id);
> +			kfree(dmabuf_obj->info);
> +			kfree(dmabuf_obj);
>  		}
>  	} else {
>  		/* Free the orphan dmabuf_objs here */
> @@ -340,13 +334,12 @@ static struct intel_vgpu_dmabuf_obj *
>  pick_dmabuf_by_info(struct intel_vgpu *vgpu,
>  		    struct intel_vgpu_fb_info *latest_info)
>  {
> -	struct list_head *pos;
>  	struct intel_vgpu_fb_info *fb_info;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj =3D NULL;
>  	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> +	int id;
> =20
> -	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> +	idr_for_each_entry(&vgpu->object_idr, dmabuf_obj, id) {
>  		if (!dmabuf_obj->info)
>  			continue;
> =20
> @@ -366,24 +359,6 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
>  	return ret;
>  }
> =20
> -static struct intel_vgpu_dmabuf_obj *
> -pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
> -{
> -	struct list_head *pos;
> -	struct intel_vgpu_dmabuf_obj *dmabuf_obj =3D NULL;
> -	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> -
> -	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> -		if (dmabuf_obj->dmabuf_id =3D=3D id) {
> -			ret =3D dmabuf_obj;
> -			break;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>  static void update_fb_info(struct vfio_device_gfx_plane_info *gvt_dmabuf,
>  		      struct intel_vgpu_fb_info *fb_info)
>  {
> @@ -477,11 +452,6 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, =
void *args)
> =20
>  	update_fb_info(gfx_plane_info, &fb_info);
> =20
> -	INIT_LIST_HEAD(&dmabuf_obj->list);
> -	mutex_lock(&vgpu->dmabuf_lock);
> -	list_add_tail(&dmabuf_obj->list, &vgpu->dmabuf_obj_list_head);
> -	mutex_unlock(&vgpu->dmabuf_lock);
> -
>  	gvt_dbg_dpy("vgpu%d: %s new dmabuf_obj ref %d, id %d\n", vgpu->id,
>  		    __func__, kref_read(&dmabuf_obj->kref), ret);
> =20
> @@ -508,7 +478,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, un=
signed int dmabuf_id)
> =20
>  	mutex_lock(&vgpu->dmabuf_lock);
> =20
> -	dmabuf_obj =3D pick_dmabuf_by_num(vgpu, dmabuf_id);
> +	dmabuf_obj =3D idr_find(&vgpu->object_idr, dmabuf_id);
>  	if (dmabuf_obj =3D=3D NULL) {
>  		gvt_vgpu_err("invalid dmabuf id:%d\n", dmabuf_id);
>  		ret =3D -EINVAL;
> @@ -570,23 +540,19 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, =
unsigned int dmabuf_id)
> =20
>  void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
>  {
> -	struct list_head *pos, *n;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
> +	int id;
> =20
>  	mutex_lock(&vgpu->dmabuf_lock);
> -	list_for_each_safe(pos, n, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> +	idr_for_each_entry(&vgpu->object_idr, dmabuf_obj, id) {
>  		dmabuf_obj->vgpu =3D NULL;
> =20
> -		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
> -		list_del(pos);
> -
> +		idr_remove(&vgpu->object_idr, id);
>  		/* dmabuf_obj might be freed in dmabuf_obj_put */
>  		if (dmabuf_obj->initref) {
>  			dmabuf_obj->initref =3D false;
>  			dmabuf_obj_put(dmabuf_obj);
>  		}
> -
>  	}
>  	mutex_unlock(&vgpu->dmabuf_lock);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt=
/dmabuf.h
> index 3dcdb6570eda..93c0e00bdab9 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.h
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
> @@ -57,7 +57,6 @@ struct intel_vgpu_dmabuf_obj {
>  	__u32 dmabuf_id;
>  	struct kref kref;
>  	bool initref;
> -	struct list_head list;
>  };
> =20
>  int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args);
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 2d65800d8e93..1100c789f207 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -211,7 +211,6 @@ struct intel_vgpu {
> =20
>  	struct dentry *debugfs;
> =20
> -	struct list_head dmabuf_obj_list_head;
>  	struct mutex dmabuf_lock;
>  	struct idr object_idr;
>  	struct intel_vgpu_vblank_timer vblank_timer;
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 08ad1bd651f1..0a511cfef067 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -329,7 +329,6 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
>  	vgpu->sched_ctl.weight =3D conf->weight;
>  	mutex_init(&vgpu->vgpu_lock);
>  	mutex_init(&vgpu->dmabuf_lock);
> -	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
>  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>  	idr_init_base(&vgpu->object_idr, 1);
>  	intel_vgpu_init_cfg_space(vgpu, 1);
> --=20
> 2.34.1
>=20

--duxpWjsI3Cucd3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZAlxfAAKCRCxBBozTXgY
J3ejAJ0QUaHuKKpb39kOTgKluWoSr+TGBQCeNkphZrUv4D9Ai64H2SOGGeLhUrU=
=9Zt+
-----END PGP SIGNATURE-----

--duxpWjsI3Cucd3ft--
