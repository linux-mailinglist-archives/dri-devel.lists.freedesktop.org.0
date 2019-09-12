Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F5B1371
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 19:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F596EDDE;
	Thu, 12 Sep 2019 17:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 249876EDDE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 4A74C10A37AE;
 Thu, 12 Sep 2019 10:25:25 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id WCGZJ_fz0uqc; Thu, 12 Sep 2019 10:25:22 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id A798410A3528;
 Thu, 12 Sep 2019 10:25:22 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 053D92FE2E27; Thu, 12 Sep 2019 10:25:22 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/v3d: clean caches at the end of render jobs on
 request from user space
In-Reply-To: <20190912083516.13797-1-itoral@igalia.com>
References: <20190912083516.13797-1-itoral@igalia.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 12 Sep 2019 10:25:20 -0700
Message-ID: <87d0g5l94v.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: Iago Toral Quiroga <itoral@igalia.com>
Content-Type: multipart/mixed; boundary="===============2014914835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2014914835==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Iago Toral Quiroga <itoral@igalia.com> writes:

> Extends the user space ioctl for CL submissions so it can include a reque=
st
> to flush the cache once the CL execution has completed. Fixes memory
> write violation messages reported by the kernel in workloads involving
> shader memory writes (SSBOs, shader images, scratch, etc) which sometimes
> also lead to GPU resets during Piglit and CTS workloads.

Some context for any other reviewers: This patch is the interface change
necessary to expose GLES 3.1 on V3D.  It turns out the HW packets for
flushing the caches were broken in multiple ways.

> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 51 +++++++++++++++++++++++++++++------
>  include/uapi/drm/v3d_drm.h    |  7 ++---
>  2 files changed, 47 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5d80507b539b..530fe9d9d5bd 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -530,13 +530,16 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *d=
ata,
>  	struct drm_v3d_submit_cl *args =3D data;
>  	struct v3d_bin_job *bin =3D NULL;
>  	struct v3d_render_job *render;
> +	struct v3d_job *clean_job =3D NULL;
> +	struct v3d_job *last_job;
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret =3D 0;
>=20=20
>  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
>=20=20
> -	if (args->pad !=3D 0) {
> -		DRM_INFO("pad must be zero: %d\n", args->pad);
> +	if (args->flags !=3D 0 &&
> +	    args->flags !=3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG) {
> +		DRM_INFO("invalid flags: %d\n", args->flags);
>  		return -EINVAL;
>  	}
>=20=20
> @@ -575,12 +578,28 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *d=
ata,
>  		bin->render =3D render;
>  	}
>=20=20
> -	ret =3D v3d_lookup_bos(dev, file_priv, &render->base,
> +	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG) {
> +		clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
> +		if (!clean_job) {
> +			ret =3D -ENOMEM;
> +			goto fail;
> +		}
> +
> +		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
> +		if (ret)
> +			goto fail;

Only issue I see: If v3d_job_init() fails, we need to not v3d_job_put()
it.  I'm fine with either kfree() it and NULL the ptr before jumping to
fail, or open code the bin/render puts.

With that,

Reviewed-by: Eric Anholt <eric@anholt.net>

> +
> +		last_job =3D clean_job;
> +	} else {
> +		last_job =3D &render->base;
> +	}
> +
> +	ret =3D v3d_lookup_bos(dev, file_priv, last_job,
>  			     args->bo_handles, args->bo_handle_count);
>  	if (ret)
>  		goto fail;
>=20=20
> -	ret =3D v3d_lock_bo_reservations(&render->base, &acquire_ctx);
> +	ret =3D v3d_lock_bo_reservations(last_job, &acquire_ctx);
>  	if (ret)
>  		goto fail;
>=20=20
> @@ -599,28 +618,44 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *d=
ata,
>  	ret =3D v3d_push_job(v3d_priv, &render->base, V3D_RENDER);
>  	if (ret)
>  		goto fail_unreserve;
> +
> +	if (clean_job) {
> +		struct dma_fence *render_fence =3D
> +			dma_fence_get(render->base.done_fence);
> +		ret =3D drm_gem_fence_array_add(&clean_job->deps, render_fence);
> +		if (ret)
> +			goto fail_unreserve;
> +		ret =3D v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
> +		if (ret)
> +			goto fail_unreserve;
> +	}
> +
>  	mutex_unlock(&v3d->sched_lock);
>=20=20
>  	v3d_attach_fences_and_unlock_reservation(file_priv,
> -						 &render->base,
> +						 last_job,
>  						 &acquire_ctx,
>  						 args->out_sync,
> -						 render->base.done_fence);
> +						 last_job->done_fence);
>=20=20
>  	if (bin)
>  		v3d_job_put(&bin->base);
>  	v3d_job_put(&render->base);
> +	if (clean_job)
> +		v3d_job_put(clean_job);
>=20=20
>  	return 0;
>=20=20
>  fail_unreserve:
>  	mutex_unlock(&v3d->sched_lock);
> -	drm_gem_unlock_reservations(render->base.bo,
> -				    render->base.bo_count, &acquire_ctx);
> +	drm_gem_unlock_reservations(last_job->bo,
> +				    last_job->bo_count, &acquire_ctx);
>  fail:
>  	if (bin)
>  		v3d_job_put(&bin->base);
>  	v3d_job_put(&render->base);
> +	if (clean_job)
> +		v3d_job_put(clean_job);
>=20=20
>  	return ret;
>  }
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 58fbe48c91e9..58d2040ea48c 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -48,6 +48,8 @@ extern "C" {
>  #define DRM_IOCTL_V3D_SUBMIT_TFU          DRM_IOW(DRM_COMMAND_BASE + DRM=
_V3D_SUBMIT_TFU, struct drm_v3d_submit_tfu)
>  #define DRM_IOCTL_V3D_SUBMIT_CSD          DRM_IOW(DRM_COMMAND_BASE + DRM=
_V3D_SUBMIT_CSD, struct drm_v3d_submit_csd)
>=20=20
> +#define DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG        0x01
> +
>  /**
>   * struct drm_v3d_submit_cl - ioctl argument for submitting commands to =
the 3D
>   * engine.
> @@ -61,7 +63,7 @@ extern "C" {
>   * flushed by the time the render done IRQ happens, which is the
>   * trigger for out_sync.  Any dirtying of cachelines by the job (only
>   * possible using TMU writes) must be flushed by the caller using the
> - * CL's cache flush commands.
> + * DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG flag.
>   */
>  struct drm_v3d_submit_cl {
>  	/* Pointer to the binner command list.
> @@ -124,8 +126,7 @@ struct drm_v3d_submit_cl {
>  	/* Number of BO handles passed in (size is that times 4). */
>  	__u32 bo_handle_count;
>=20=20
> -	/* Pad, must be zero-filled. */
> -	__u32 pad;
> +	__u32 flags;
>  };
>=20=20
>  /**
> --=20
> 2.17.1

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl16f4AACgkQtdYpNtH8
nuh3hhAArTqZNnEex0+Or9jdCAjUaZnMBWFwnAsxCD5JKhqpTdQU2dgQwYHKRvvw
DY3JLOqoLiUDD3pVLl0mJZMAzn5ryLBuWdtoR4iD5hSRCto1+p6G0II/uQ+erZUo
pcn40/uMd62924YPDfqN+fjwPYiV3P+nv5G41+UWWNphuwGE+OydsFtkGFXxBWoz
/UFYqGMyOPceH8d8BLtzu4nAYF1d4BewtKdNY2smSI+k1k7GCpUqvjo2ST5/EF7/
7nobLke7O9JbrBmzU88AavtuHSpEEdHk1CVpH+mKggPIdAEXkDByLeNFimW4Xwjm
TCfx4qoSjygazwBJtUSwUVfywI15UmvuT0V1X1eyTElzStyGd+2iPXvp9HARdNau
qc73yqBH8h7+ySiopNOyfuefTp9xTfb5GWskCsQ7kr5whpThuzL3PS+PHEoPjvCt
T1Lnhn0iY+SiQb2ryz2wbPJGKqdPY86QEnwI7Mqrc7TbbDT5pvCk1VWtCyZWkczL
wM7Y+bol2WTwv05wS6J5T+XterS18Ln/FaBFkckKCVaKLGsOhA1Alobh99PXTKv8
eSbJDwbsMqVgPQ34xzOmh2yV9oe2GMD8rUkZtAweouN7GdiAJJNlD63TPNJdtDa7
qUd7rU7HWnsBouIjKW9GKR0hmdUPSAgSi9bgKU8/LZaIBkit+0U=
=EMcd
-----END PGP SIGNATURE-----
--=-=-=--

--===============2014914835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2014914835==--
