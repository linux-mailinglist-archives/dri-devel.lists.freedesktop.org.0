Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AEF31E732
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 09:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0B6E1B4;
	Thu, 18 Feb 2021 08:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75D36E167;
 Thu, 18 Feb 2021 08:03:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF7F7AD4E;
 Thu, 18 Feb 2021 08:02:59 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210217123213.2199186-1-kraxel@redhat.com>
 <20210217123213.2199186-11-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/11] drm/qxl: rework cursor plane
Message-ID: <6a5581b2-8e62-1310-d42e-abfa301edc88@suse.de>
Date: Thu, 18 Feb 2021 09:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217123213.2199186-11-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1417114445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1417114445==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ApDBxD4nqqySV561QZ7abU2zXJeqh4yMJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ApDBxD4nqqySV561QZ7abU2zXJeqh4yMJ
Content-Type: multipart/mixed; boundary="x9qCAZEFpMSQcn5cRKCOnzVd9PqQm2ttB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <6a5581b2-8e62-1310-d42e-abfa301edc88@suse.de>
Subject: Re: [PATCH v2 10/11] drm/qxl: rework cursor plane
References: <20210217123213.2199186-1-kraxel@redhat.com>
 <20210217123213.2199186-11-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-11-kraxel@redhat.com>

--x9qCAZEFpMSQcn5cRKCOnzVd9PqQm2ttB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.02.21 um 13:32 schrieb Gerd Hoffmann:
> Add helper functions to create and move the cursor.
> Create the cursor_bo in prepare_fb callback, in the
> atomic_commit callback we only send the update command
> to the host.

I'm still trying to wrap my head around the qxl cursor code.

Getting vmap out of the commit tail is good, but I feel like this isn't=20
going in the right direction overall.

In ast, these helper functions were only good when converting the drvier =

to atomic modesetting. So I removed them in the latst patchset and did=20
all the updates in the plane helpers directly.

For cursor_bo itself, it seems to be transitional state that is only=20
used during the plane update and crtc update . It should probably be=20
stored in a plane-state structure.

Some of the primary plane's functions seem to deal with cursor handling. =

What's the role of the primary plane in cursor handling?

For now, I suggest to merge patch 1 to 8 and 11; and move the cursor=20
patches into a new patchset. I'd like ot hear Daniel's opinion on this.=20
Do you have further plans here?

If you absolutely want patches 9 and 10, I'd rubber-stamp an A-b on them.=


Best regards
Thomas

>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 248 ++++++++++++++++-------------=
-
>   1 file changed, 133 insertions(+), 115 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index b315d7484e21..4a3d272e8d6c 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -476,12 +476,11 @@ static int qxl_primary_atomic_check(struct drm_pl=
ane *plane,
>   	return qxl_check_framebuffer(qdev, bo);
>   }
>  =20
> -static int qxl_primary_apply_cursor(struct drm_plane *plane)
> +static int qxl_primary_apply_cursor(struct qxl_device *qdev,
> +				    struct drm_plane_state *plane_state)
>   {
> -	struct drm_device *dev =3D plane->dev;
> -	struct qxl_device *qdev =3D to_qxl(dev);
> -	struct drm_framebuffer *fb =3D plane->state->fb;
> -	struct qxl_crtc *qcrtc =3D to_qxl_crtc(plane->state->crtc);
> +	struct drm_framebuffer *fb =3D plane_state->fb;
> +	struct qxl_crtc *qcrtc =3D to_qxl_crtc(plane_state->crtc);
>   	struct qxl_cursor_cmd *cmd;
>   	struct qxl_release *release;
>   	int ret =3D 0;
> @@ -505,8 +504,8 @@ static int qxl_primary_apply_cursor(struct drm_plan=
e *plane)
>  =20
>   	cmd =3D (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
>   	cmd->type =3D QXL_CURSOR_SET;
> -	cmd->u.set.position.x =3D plane->state->crtc_x + fb->hot_x;
> -	cmd->u.set.position.y =3D plane->state->crtc_y + fb->hot_y;
> +	cmd->u.set.position.x =3D plane_state->crtc_x + fb->hot_x;
> +	cmd->u.set.position.y =3D plane_state->crtc_y + fb->hot_y;
>  =20
>   	cmd->u.set.shape =3D qxl_bo_physical_address(qdev, qcrtc->cursor_bo,=
 0);
>  =20
> @@ -523,6 +522,113 @@ static int qxl_primary_apply_cursor(struct drm_pl=
ane *plane)
>   	return ret;
>   }
>  =20
> +static int qxl_primary_move_cursor(struct qxl_device *qdev,
> +				   struct drm_plane_state *plane_state)
> +{
> +	struct drm_framebuffer *fb =3D plane_state->fb;
> +	struct qxl_crtc *qcrtc =3D to_qxl_crtc(plane_state->crtc);
> +	struct qxl_cursor_cmd *cmd;
> +	struct qxl_release *release;
> +	int ret =3D 0;
> +
> +	if (!qcrtc->cursor_bo)
> +		return 0;
> +
> +	ret =3D qxl_alloc_release_reserved(qdev, sizeof(*cmd),
> +					 QXL_RELEASE_CURSOR_CMD,
> +					 &release, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qxl_release_reserve_list(release, true);
> +	if (ret) {
> +		qxl_release_free(qdev, release);
> +		return ret;
> +	}
> +
> +	cmd =3D (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
> +	cmd->type =3D QXL_CURSOR_MOVE;
> +	cmd->u.position.x =3D plane_state->crtc_x + fb->hot_x;
> +	cmd->u.position.y =3D plane_state->crtc_y + fb->hot_y;
> +	qxl_release_unmap(qdev, release, &cmd->release_info);
> +
> +	qxl_release_fence_buffer_objects(release);
> +	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
> +	return ret;
> +}
> +
> +static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
> +					struct qxl_bo *user_bo,
> +					int hot_x, int hot_y)
> +{
> +	static const u32 size =3D 64 * 64 * 4;
> +	struct qxl_bo *cursor_bo;
> +	struct dma_buf_map cursor_map;
> +	struct dma_buf_map user_map;
> +	struct qxl_cursor cursor;
> +	int ret;
> +
> +	if (!user_bo)
> +		return NULL;
> +
> +	ret =3D qxl_bo_create(qdev, sizeof(struct qxl_cursor) + size,
> +			    false, true, QXL_GEM_DOMAIN_VRAM, 1,
> +			    NULL, &cursor_bo);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D qxl_bo_vmap(cursor_bo, &cursor_map);
> +	if (ret)
> +		goto err_unref;
> +
> +	ret =3D qxl_bo_vmap(user_bo, &user_map);
> +	if (ret)
> +		goto err_unmap;
> +
> +	cursor.header.unique =3D 0;
> +	cursor.header.type =3D SPICE_CURSOR_TYPE_ALPHA;
> +	cursor.header.width =3D 64;
> +	cursor.header.height =3D 64;
> +	cursor.header.hot_spot_x =3D hot_x;
> +	cursor.header.hot_spot_y =3D hot_y;
> +	cursor.data_size =3D size;
> +	cursor.chunk.next_chunk =3D 0;
> +	cursor.chunk.prev_chunk =3D 0;
> +	cursor.chunk.data_size =3D size;
> +	if (cursor_map.is_iomem) {
> +		memcpy_toio(cursor_map.vaddr_iomem,
> +			    &cursor, sizeof(cursor));
> +		memcpy_toio(cursor_map.vaddr_iomem + sizeof(cursor),
> +			    user_map.vaddr, size);
> +	} else {
> +		memcpy(cursor_map.vaddr,
> +		       &cursor, sizeof(cursor));
> +		memcpy(cursor_map.vaddr + sizeof(cursor),
> +		       user_map.vaddr, size);
> +	}
> +
> +	qxl_bo_vunmap(user_bo);
> +	qxl_bo_vunmap(cursor_bo);
> +	return cursor_bo;
> +
> +err_unmap:
> +	qxl_bo_vunmap(cursor_bo);
> +err_unref:
> +	qxl_bo_unpin(cursor_bo);
> +	qxl_bo_unref(&cursor_bo);
> +err:
> +	return NULL;
> +}
> +
> +static void qxl_free_cursor(struct qxl_bo *cursor_bo)
> +{
> +	if (!cursor_bo)
> +		return;
> +
> +	qxl_bo_unpin(cursor_bo);
> +	qxl_bo_unref(&cursor_bo);
> +}
> +
>   static void qxl_primary_atomic_update(struct drm_plane *plane,
>   				      struct drm_plane_state *old_state)
>   {
> @@ -543,7 +649,7 @@ static void qxl_primary_atomic_update(struct drm_pl=
ane *plane,
>   		if (qdev->primary_bo)
>   			qxl_io_destroy_primary(qdev);
>   		qxl_io_create_primary(qdev, primary);
> -		qxl_primary_apply_cursor(plane);
> +		qxl_primary_apply_cursor(qdev, plane->state);
>   	}
>  =20
>   	if (bo->is_dumb)
> @@ -574,124 +680,21 @@ static void qxl_primary_atomic_disable(struct dr=
m_plane *plane,
>   static void qxl_cursor_atomic_update(struct drm_plane *plane,
>   				     struct drm_plane_state *old_state)
>   {
> -	struct drm_device *dev =3D plane->dev;
> -	struct qxl_device *qdev =3D to_qxl(dev);
> +	struct qxl_device *qdev =3D to_qxl(plane->dev);
>   	struct drm_framebuffer *fb =3D plane->state->fb;
> -	struct qxl_crtc *qcrtc =3D to_qxl_crtc(plane->state->crtc);
> -	struct qxl_release *release;
> -	struct qxl_cursor_cmd *cmd;
> -	struct qxl_cursor *cursor;
> -	struct drm_gem_object *obj;
> -	struct qxl_bo *cursor_bo =3D NULL, *user_bo =3D NULL, *old_cursor_bo =
=3D NULL;
> -	int ret;
> -	struct dma_buf_map user_map;
> -	struct dma_buf_map cursor_map;
> -	void *user_ptr;
> -	int size =3D 64*64*4;
> -
> -	ret =3D qxl_alloc_release_reserved(qdev, sizeof(*cmd),
> -					 QXL_RELEASE_CURSOR_CMD,
> -					 &release, NULL);
> -	if (ret)
> -		return;
>  =20
>   	if (fb !=3D old_state->fb) {
> -		obj =3D fb->obj[0];
> -		user_bo =3D gem_to_qxl_bo(obj);
> -
> -		/* pinning is done in the prepare/cleanup framevbuffer */
> -		ret =3D qxl_bo_vmap_locked(user_bo, &user_map);
> -		if (ret)
> -			goto out_free_release;
> -		user_ptr =3D user_map.vaddr; /* TODO: Use mapping abstraction proper=
ly */
> -
> -		ret =3D qxl_alloc_bo_reserved(qdev, release,
> -					    sizeof(struct qxl_cursor) + size,
> -					    &cursor_bo);
> -		if (ret)
> -			goto out_kunmap;
> -
> -		ret =3D qxl_bo_pin(cursor_bo);
> -		if (ret)
> -			goto out_free_bo;
> -
> -		ret =3D qxl_release_reserve_list(release, true);
> -		if (ret)
> -			goto out_unpin;
> -
> -		ret =3D qxl_bo_vmap_locked(cursor_bo, &cursor_map);
> -		if (ret)
> -			goto out_backoff;
> -		if (cursor_map.is_iomem) /* TODO: Use mapping abstraction properly *=
/
> -			cursor =3D (struct qxl_cursor __force *)cursor_map.vaddr_iomem;
> -		else
> -			cursor =3D (struct qxl_cursor *)cursor_map.vaddr;
> -
> -		cursor->header.unique =3D 0;
> -		cursor->header.type =3D SPICE_CURSOR_TYPE_ALPHA;
> -		cursor->header.width =3D 64;
> -		cursor->header.height =3D 64;
> -		cursor->header.hot_spot_x =3D fb->hot_x;
> -		cursor->header.hot_spot_y =3D fb->hot_y;
> -		cursor->data_size =3D size;
> -		cursor->chunk.next_chunk =3D 0;
> -		cursor->chunk.prev_chunk =3D 0;
> -		cursor->chunk.data_size =3D size;
> -		memcpy(cursor->chunk.data, user_ptr, size);
> -		qxl_bo_vunmap_locked(cursor_bo);
> -		qxl_bo_vunmap_locked(user_bo);
> -
> -		cmd =3D (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
> -		cmd->u.set.visible =3D 1;
> -		cmd->u.set.shape =3D qxl_bo_physical_address(qdev,
> -							   cursor_bo, 0);
> -		cmd->type =3D QXL_CURSOR_SET;
> -
> -		old_cursor_bo =3D qcrtc->cursor_bo;
> -		qcrtc->cursor_bo =3D cursor_bo;
> -		cursor_bo =3D NULL;
> +		qxl_primary_apply_cursor(qdev, plane->state);
>   	} else {
> -
> -		ret =3D qxl_release_reserve_list(release, true);
> -		if (ret)
> -			goto out_free_release;
> -
> -		cmd =3D (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
> -		cmd->type =3D QXL_CURSOR_MOVE;
> +		qxl_primary_move_cursor(qdev, plane->state);
>   	}
> -
> -	cmd->u.position.x =3D plane->state->crtc_x + fb->hot_x;
> -	cmd->u.position.y =3D plane->state->crtc_y + fb->hot_y;
> -
> -	qxl_release_unmap(qdev, release, &cmd->release_info);
> -	qxl_release_fence_buffer_objects(release);
> -	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
> -
> -	if (old_cursor_bo !=3D NULL)
> -		qxl_bo_unpin(old_cursor_bo);
> -	qxl_bo_unref(&old_cursor_bo);
> -	qxl_bo_unref(&cursor_bo);
> -
> -	return;
> -
> -out_backoff:
> -	qxl_release_backoff_reserve_list(release);
> -out_unpin:
> -	qxl_bo_unpin(cursor_bo);
> -out_free_bo:
> -	qxl_bo_unref(&cursor_bo);
> -out_kunmap:
> -	qxl_bo_vunmap_locked(user_bo);
> -out_free_release:
> -	qxl_release_free(qdev, release);
> -	return;
> -
>   }
>  =20
>   static void qxl_cursor_atomic_disable(struct drm_plane *plane,
>   				      struct drm_plane_state *old_state)
>   {
>   	struct qxl_device *qdev =3D to_qxl(plane->dev);
> +	struct qxl_crtc *qcrtc;
>   	struct qxl_release *release;
>   	struct qxl_cursor_cmd *cmd;
>   	int ret;
> @@ -714,6 +717,10 @@ static void qxl_cursor_atomic_disable(struct drm_p=
lane *plane,
>  =20
>   	qxl_release_fence_buffer_objects(release);
>   	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
> +
> +	qcrtc =3D to_qxl_crtc(old_state->crtc);
> +	qxl_free_cursor(qcrtc->cursor_bo);
> +	qcrtc->cursor_bo =3D NULL;
>   }
>  =20
>   static void qxl_update_dumb_head(struct qxl_device *qdev,
> @@ -822,6 +829,17 @@ static int qxl_plane_prepare_fb(struct drm_plane *=
plane,
>   		qxl_prepare_shadow(qdev, user_bo, new_state->crtc->index);
>   	}
>  =20
> +	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR &&
> +	    plane->state->fb !=3D new_state->fb) {
> +		struct qxl_crtc *qcrtc =3D to_qxl_crtc(new_state->crtc);
> +		struct qxl_bo *old_cursor_bo =3D qcrtc->cursor_bo;
> +
> +		qcrtc->cursor_bo =3D qxl_create_cursor(qdev, user_bo,
> +						     new_state->fb->hot_x,
> +						     new_state->fb->hot_y);
> +		qxl_free_cursor(old_cursor_bo);
> +	}
> +
>   	return qxl_bo_pin(user_bo);
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--x9qCAZEFpMSQcn5cRKCOnzVd9PqQm2ttB--

--ApDBxD4nqqySV561QZ7abU2zXJeqh4yMJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAuHzIFAwAAAAAACgkQlh/E3EQov+Ad
ZhAAmURmYv4JTvF6N6MEa2GNyXvw6BKxt1E45y4UR6TOx2HITNijCYsxA1mFBie8Eho2n3t3umS0
o098fbCG45p2kXbe+mRrVASXuKjcMOTxzGrwjB/y7DS02n0dmDCS0bJEqTljLtGgDOnnbD0hpSR+
j1uB/fwxWLvxbAU9vdqwWr78s3v41PiWIb+/gaC6JW4RLuRoIcHM0TYtZqu+cupiWjVVLyt9rMkz
3rX4Z9JLMbLgtOAwsxcPIqUoE1Ckxk7gWdm50UJ7REDdOxIu4tYHb8wxQiyTK+YsB4KEzPc5h8Nb
azmnIVhc9zF6SlOA6GWF/pbPwGLMtAe6dR6PDQbn/7rEiiDzLUnKOe+Z0mQlXb8lmz6V0phekztc
nyHlHjrJdCskiLeUJPyEisVZx5FIOJ1c/7kTkZcX0YLrSelQu3S33VID2t8P3k0sMbNaU9ONztpX
EBXMeIu8+tRll8lGUrziW0FerssKBH2I1k/8/hr9jZwb3T+FnHMk0/VoPN9kvRfknWG0VIe5F8p5
0ZfJ5BMOqWpd5uaea6pZcsBIGxK29lTN+FTM5w8y09BPXtwbw9zLkTsAVE+zCERPpN5tIFItOEVv
cIXLGfgrmNtd43WGuIBO23nw2sTFyUGokl27On3Q0Hyx5diajvwDwnMvkWuC6Afc3abD+HU7jHny
Qv8=
=e5fd
-----END PGP SIGNATURE-----

--ApDBxD4nqqySV561QZ7abU2zXJeqh4yMJ--

--===============1417114445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1417114445==--
