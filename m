Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D883130DC4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9776EAD1;
	Wed,  3 Feb 2021 14:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537A6EACF;
 Wed,  3 Feb 2021 14:12:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 737A8ACBA;
 Wed,  3 Feb 2021 14:12:02 +0000 (UTC)
Subject: Re: [PATCH v5 5/6] drm/qxl: properly free qxl releases
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210203131615.1714021-1-kraxel@redhat.com>
 <20210203131615.1714021-6-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cbcd0aff-0794-69d8-f51a-bb85e3346400@suse.de>
Date: Wed, 3 Feb 2021 15:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203131615.1714021-6-kraxel@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1563435662=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1563435662==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="P1ROlwt3XnL7xKCOS5cdaNUu1OyHVTH4S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P1ROlwt3XnL7xKCOS5cdaNUu1OyHVTH4S
Content-Type: multipart/mixed; boundary="cVIa0Dj3W935BV3F1gR9wv6Y5HbbiySzJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <cbcd0aff-0794-69d8-f51a-bb85e3346400@suse.de>
Subject: Re: [PATCH v5 5/6] drm/qxl: properly free qxl releases
References: <20210203131615.1714021-1-kraxel@redhat.com>
 <20210203131615.1714021-6-kraxel@redhat.com>
In-Reply-To: <20210203131615.1714021-6-kraxel@redhat.com>

--cVIa0Dj3W935BV3F1gR9wv6Y5HbbiySzJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.02.21 um 14:16 schrieb Gerd Hoffmann:
> Reorganize qxl_device_fini() a bit.
> Add missing unpin() calls.
>=20
> Count releases.  Add wait queue for releases.  That way
> qxl_device_fini() can easily wait until everything is
> ready for proper shutdown.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/qxl/qxl_drv.h     |  2 ++
>   drivers/gpu/drm/qxl/qxl_cmd.c     |  1 +
>   drivers/gpu/drm/qxl/qxl_irq.c     |  1 +
>   drivers/gpu/drm/qxl/qxl_kms.c     | 22 ++++++++++++++++++++--
>   drivers/gpu/drm/qxl/qxl_release.c |  2 ++
>   5 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_dr=
v.h
> index 01354b43c413..6dd57cfb2e7c 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -214,6 +214,8 @@ struct qxl_device {
>   	spinlock_t	release_lock;
>   	struct idr	release_idr;
>   	uint32_t	release_seqno;
> +	atomic_t	release_count;
> +	wait_queue_head_t release_event;
>   	spinlock_t release_idr_lock;
>   	struct mutex	async_io_mutex;
>   	unsigned int last_sent_io_cmd;
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cm=
d.c
> index 54e3c3a97440..7e22a81bfb36 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -254,6 +254,7 @@ int qxl_garbage_collect(struct qxl_device *qdev)
>   		}
>   	}
>  =20
> +	wake_up_all(&qdev->release_event);
>   	DRM_DEBUG_DRIVER("%d\n", i);
>  =20
>   	return i;
> diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_ir=
q.c
> index ddf6588a2a38..d312322cacd1 100644
> --- a/drivers/gpu/drm/qxl/qxl_irq.c
> +++ b/drivers/gpu/drm/qxl/qxl_irq.c
> @@ -87,6 +87,7 @@ int qxl_irq_init(struct qxl_device *qdev)
>   	init_waitqueue_head(&qdev->display_event);
>   	init_waitqueue_head(&qdev->cursor_event);
>   	init_waitqueue_head(&qdev->io_cmd_event);
> +	init_waitqueue_head(&qdev->release_event);
>   	INIT_WORK(&qdev->client_monitors_config_work,
>   		  qxl_client_monitors_config_work_func);
>   	atomic_set(&qdev->irq_received, 0);
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_km=
s.c
> index 4a60a52ab62e..616aea948863 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -286,8 +286,26 @@ int qxl_device_init(struct qxl_device *qdev,
>  =20
>   void qxl_device_fini(struct qxl_device *qdev)
>   {
> -	qxl_bo_unref(&qdev->current_release_bo[0]);
> -	qxl_bo_unref(&qdev->current_release_bo[1]);
> +	int cur_idx;
> +
> +	for (cur_idx =3D 0; cur_idx < 3; cur_idx++) {
> +		if (!qdev->current_release_bo[cur_idx])
> +			continue;
> +		qxl_bo_unpin(qdev->current_release_bo[cur_idx]);
> +		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
> +		qdev->current_release_bo_offset[cur_idx] =3D 0;
> +		qdev->current_release_bo[cur_idx] =3D NULL;
> +	}
> +
> +	/*
> +	 * Ask host to release resources (+fill release ring),
> +	 * then wait for the release actually happening.
> +	 */
> +	qxl_io_notify_oom(qdev);
> +	wait_event_timeout(qdev->release_event,
> +			   atomic_read(&qdev->release_count) =3D=3D 0,
> +			   HZ);
> +
>   	qxl_gem_fini(qdev);
>   	qxl_bo_fini(qdev);
>   	flush_work(&qdev->gc_work);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qx=
l_release.c
> index 28013fd1f8ea..43a5436853b7 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -196,6 +196,7 @@ qxl_release_free(struct qxl_device *qdev,
>   		qxl_release_free_list(release);
>   		kfree(release);
>   	}
> +	atomic_dec(&qdev->release_count);
>   }
>  =20
>   static int qxl_release_bo_alloc(struct qxl_device *qdev,
> @@ -344,6 +345,7 @@ int qxl_alloc_release_reserved(struct qxl_device *q=
dev, unsigned long size,
>   			*rbo =3D NULL;
>   		return idr_ret;
>   	}
> +	atomic_inc(&qdev->release_count);
>  =20
>   	mutex_lock(&qdev->release_mutex);
>   	if (qdev->current_release_bo_offset[cur_idx] + 1 >=3D releases_per_b=
o[cur_idx]) {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cVIa0Dj3W935BV3F1gR9wv6Y5HbbiySzJ--

--P1ROlwt3XnL7xKCOS5cdaNUu1OyHVTH4S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAarzEFAwAAAAAACgkQlh/E3EQov+Ca
8A/+Kt/gdssrZcE0FhwfqHXDkIHMDFZwgofwKLvcfXuuddrlNc/iu3wm5FOXv+fEkf1JlhxUYA8s
7jUHy8Nx8f8+IauLGfE7kv84pMvNNdTSL66c/JxHQVTj6QQl1mJi3S5jtCB3hGNAQo3YcpFGvJ8b
+3WmUSaQDc+hfpBf1pkhnCRJyFGe7H7OR1TEYExMckE7Ex38RMzKdvFPXIalowFnd21DVe3jPb2x
Sb5OBsfZNgOEb4XSzttgA7paS9YXfaKYhkaba/Y6GpPfi6dDlaB7vTsGZSFtdXqpW4ohk6huU9AK
XJb5VI3MSRWY3ek85Wna0R+Kwet31Gzb0YDfnPmzbrIdj6gLc3jeHW03In1k2WHmLmR/u7RlYz2R
f6ux8oLbZDV+SrechzMp2qD531uIhvRUGbnrp2nX7qjQld1Z0isKjSJJ8q0wIQF3JdMf/lBKQQHA
gX/9SqXnWPm8dO8d1ko5IVqeum59phpUVzq8NuZKVcFMyDcq2I0dINtfB1c+lSLI0TElygUE0yMY
wqwOYDB3N16/ZUCrkbjqYXzZ2N88jQ+qUus5Gie1LVub7XnUo+ITfjnWTBuxQ4w6lwzcP7W86kRB
/LB0AiyxscdMTQcX79N2OGp1Mscg9exXSrYVJLJIc0lVtdcqY2R1qj6lpsCuMjeXXmY+Xr1e68sZ
oFo=
=4dIi
-----END PGP SIGNATURE-----

--P1ROlwt3XnL7xKCOS5cdaNUu1OyHVTH4S--

--===============1563435662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1563435662==--
