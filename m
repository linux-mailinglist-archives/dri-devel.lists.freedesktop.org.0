Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EECD3A0AC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74D010E388;
	Mon, 19 Jan 2026 07:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UT54VmzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7826010E388
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E3w+S/8zNZ0AUMP4T/ehCCqn3VIvYjYL27xJDbHiVjM=; b=UT54VmzWL9/z2mi11v+0D6QwAW
 1qX/mYKG/OYlKH1hzq0YfEzW4O4rAZH5sHeoiQKHRFlWkWvrVdPPdZ4nz1qtJiGbDVqhSaGenLwlz
 tv7a/OkT1yYTyRUi0hJj1b9HT2CLg6QJWOxpdx1AzyNDMALUUygq8GdWWl+meV8uhPCuTQ7BWzXrz
 Izu+HhFzIAHDRRd4RB6WnpXKOdBFcg5uXyXB0K8jEouTFBSK9rS3gOcNGk7HJWnzjiign/x0/QWgo
 nIA6N8T+k8Rk59I3wR9ilOy1rJlf30t/qXalX5f7/2q6Uao4GqMA+QIboi0x/MuJ8w/YhtQX2Aeso
 uqChWP4Q==;
Received: from [159.147.11.231] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vhk51-0071fx-OI; Mon, 19 Jan 2026 08:53:43 +0100
Message-ID: <3d1cf3028cf97af35e5192db01bede8b7111b613.camel@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: Replace IDR with XArray for perfmon tracking
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Mon, 19 Jan 2026 08:53:33 +0100
In-Reply-To: <20260115150903.92163-2-mcanal@igalia.com>
References: <20260115150903.92163-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both patches are:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El jue, 15-01-2026 a las 12:05 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> The IDR interface is deprecated and the XArray API is the recommended
> replacement. Replace the per-file IDR used to track perfmons with an
> XArray. This allows us to remove the external mutex that protects the
> IDR.
>=20
> While here, introduce the v3d_perfmon_delete() helper to consolidate
> the perfmon cleanup logic used by both v3d_perfmon_close_file() and
> v3d_perfmon_destroy_ioctl().
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +--
> =C2=A0drivers/gpu/drm/v3d/v3d_perfmon.c | 55 +++++++++++-----------------=
-
> --
> =C2=A02 files changed, 21 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index 99a39329bb85..314213c26710 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -220,10 +220,7 @@ v3d_has_csd(struct v3d_dev *v3d)
> =C2=A0struct v3d_file_priv {
> =C2=A0	struct v3d_dev *v3d;
> =C2=A0
> -	struct {
> -		struct idr idr;
> -		struct mutex lock;
> -	} perfmon;
> +	struct xarray perfmons;
> =C2=A0
> =C2=A0	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c
> b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 9a3fe5255874..41325ffc7f43 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -290,24 +290,23 @@ struct v3d_perfmon *v3d_perfmon_find(struct
> v3d_file_priv *v3d_priv, int id)
> =C2=A0{
> =C2=A0	struct v3d_perfmon *perfmon;
> =C2=A0
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	perfmon =3D idr_find(&v3d_priv->perfmon.idr, id);
> +	xa_lock(&v3d_priv->perfmons);
> +	perfmon =3D xa_load(&v3d_priv->perfmons, id);
> =C2=A0	v3d_perfmon_get(perfmon);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> +	xa_unlock(&v3d_priv->perfmons);
> =C2=A0
> =C2=A0	return perfmon;
> =C2=A0}
> =C2=A0
> =C2=A0void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
> =C2=A0{
> -	mutex_init(&v3d_priv->perfmon.lock);
> -	idr_init_base(&v3d_priv->perfmon.idr, 1);
> +	xa_init_flags(&v3d_priv->perfmons, XA_FLAGS_ALLOC1);
> =C2=A0}
> =C2=A0
> -static int v3d_perfmon_idr_del(int id, void *elem, void *data)
> +static void v3d_perfmon_delete(struct v3d_file_priv *v3d_priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v3d_perfmon *perfmon)
> =C2=A0{
> -	struct v3d_perfmon *perfmon =3D elem;
> -	struct v3d_dev *v3d =3D (struct v3d_dev *)data;
> +	struct v3d_dev *v3d =3D v3d_priv->v3d;
> =C2=A0
> =C2=A0	/* If the active perfmon is being destroyed, stop it first
> */
> =C2=A0	if (perfmon =3D=3D v3d->active_perfmon)
> @@ -317,19 +316,17 @@ static int v3d_perfmon_idr_del(int id, void
> *elem, void *data)
> =C2=A0	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> =C2=A0
> =C2=A0	v3d_perfmon_put(perfmon);
> -
> -	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
> =C2=A0{
> -	struct v3d_dev *v3d =3D v3d_priv->v3d;
> +	struct v3d_perfmon *perfmon;
> +	unsigned long id;
> =C2=A0
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del,
> v3d);
> -	idr_destroy(&v3d_priv->perfmon.idr);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -	mutex_destroy(&v3d_priv->perfmon.lock);
> +	xa_for_each(&v3d_priv->perfmons, id, perfmon)
> +		v3d_perfmon_delete(v3d_priv, perfmon);
> +
> +	xa_destroy(&v3d_priv->perfmons);
> =C2=A0}
> =C2=A0
> =C2=A0int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
> @@ -341,6 +338,7 @@ int v3d_perfmon_create_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0	struct v3d_perfmon *perfmon;
> =C2=A0	unsigned int i;
> =C2=A0	int ret;
> +	u32 id;
> =C2=A0
> =C2=A0	/* Number of monitored counters cannot exceed HW limits. */
> =C2=A0	if (req->ncounters > DRM_V3D_MAX_PERF_COUNTERS ||
> @@ -366,18 +364,16 @@ int v3d_perfmon_create_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0	refcount_set(&perfmon->refcnt, 1);
> =C2=A0	mutex_init(&perfmon->lock);
> =C2=A0
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	ret =3D idr_alloc(&v3d_priv->perfmon.idr, perfmon,
> V3D_PERFMONID_MIN,
> -			V3D_PERFMONID_MAX, GFP_KERNEL);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -
> +	ret =3D xa_alloc(&v3d_priv->perfmons, &id, perfmon,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XA_LIMIT(V3D_PERFMONID_MIN,
> V3D_PERFMONID_MAX),
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0	if (ret < 0) {
> =C2=A0		mutex_destroy(&perfmon->lock);
> =C2=A0		kfree(perfmon);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	req->id =3D ret;
> +	req->id =3D id;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -387,24 +383,13 @@ int v3d_perfmon_destroy_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0{
> =C2=A0	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> =C2=A0	struct drm_v3d_perfmon_destroy *req =3D data;
> -	struct v3d_dev *v3d =3D v3d_priv->v3d;
> =C2=A0	struct v3d_perfmon *perfmon;
> =C2=A0
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	perfmon =3D idr_remove(&v3d_priv->perfmon.idr, req->id);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -
> +	perfmon =3D xa_erase(&v3d_priv->perfmons, req->id);
> =C2=A0	if (!perfmon)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* If the active perfmon is being destroyed, stop it first
> */
> -	if (perfmon =3D=3D v3d->active_perfmon)
> -		v3d_perfmon_stop(v3d, perfmon, false);
> -
> -	/* If the global perfmon is being destroyed, set it to NULL
> */
> -	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> -
> -	v3d_perfmon_put(perfmon);
> +	v3d_perfmon_delete(v3d_priv, perfmon);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}

