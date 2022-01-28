Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452149FA1F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 13:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA2A10E930;
	Fri, 28 Jan 2022 12:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E5F10E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9FRISzbgmrCCWcZD8ftGDL8nC0adXQ2wlur/JTV7yik=; b=peBzp/nGizhvgKckGBo/K3wk4L
 yU9q/Zq4so6T2o8K4ZXDDUSUydNsC4OKwpq3us+0J5m+tHQtwwwqhyXOrdOuHyBHkotfUyI6xdZSf
 2HwM/23B4oPWo3rOrswoUarONEYMhwSF6IL/A5aezbnPWvnjjjrUibWspfoerGNjNSnyfNP6qTfNN
 6AqLkRRPvHaosCmFIV7UgMw4GjaLrURdRah1dthINSE52tJWEVlt1qkzzECEPeuNATPJOYq3IkCBo
 AolVQyQx5aJp9OlQTkJK8FXhLMyCoOai3e+UPjCZb/7R1hMO9THwux0bjXZknffKbL4XmGA5lB8GD
 JaaX+tyQ==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nDQmk-0003ko-Ne; Fri, 28 Jan 2022 13:55:26 +0100
Date: Fri, 28 Jan 2022 11:55:10 -0100
From: Melissa Wen <mwen@igalia.com>
To: Yongzhi Liu <lyz_cs@pku.edu.cn>
Subject: Re: [PATCH v2] drm/v3d: fix missing unlock
Message-ID: <20220128125510.idyai4bp3g5nbzd2@mail.igalia.com>
References: <20220126205726.phfikh7kn3lks5ib@mail.igalia.com>
 <1643278460-100473-1-git-send-email-lyz_cs@pku.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g64nw4ibv7tj6mml"
Content-Disposition: inline
In-Reply-To: <1643278460-100473-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g64nw4ibv7tj6mml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/27, Yongzhi Liu wrote:
> [why]
> Unlock is needed on the error handling path to prevent dead lock.
> v3d_submit_cl_ioctl and v3d_submit_csd_ioctl is missing unlock.
>=20
> [how]
> Fix this by change goto target on the error handling path.
s/change/changing/g

I would just say: `Changing the goto to target an error handling path
that includes drm_gem_unlock reservations.`

and drop the explanation below

> As unlock is handle in fail_unreserve, i keep the failures
> handling around there. So the goto targets a place between
> `fail_unreserve:` and `fail:`.
>=20
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index c7ed2e1..d9c7b39 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -798,7 +798,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
> =20
>  		if (!render->base.perfmon) {
>  			ret =3D -ENOENT;
> -			goto fail;
> +			goto v3d_unlock;
We usually use a `fail` prefix when handling failures.
A suggestion: `fail_perfmon` ?
>  		}
>  	}
> =20
> @@ -847,6 +847,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
> =20
>  fail_unreserve:
>  	mutex_unlock(&v3d->sched_lock);
> +v3d_unlock:
>  	drm_gem_unlock_reservations(last_job->bo,
>  				    last_job->bo_count, &acquire_ctx);
>  fail:
> @@ -1027,7 +1028,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *=
data,
>  						     args->perfmon_id);
>  		if (!job->base.perfmon) {
>  			ret =3D -ENOENT;
> -			goto fail;
> +			goto v3d_unlock;
>  		}
>  	}
> =20
> @@ -1056,6 +1057,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *=
data,
> =20
>  fail_unreserve:
>  	mutex_unlock(&v3d->sched_lock);
> +v3d_unlock:
>  	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
>  				    &acquire_ctx);
>  fail:

With these changes, you can include in the next version my r-b:
Reviewed-by: Melissa Wen <mwen@igalia.com>

> --=20
> 2.7.4
>=20

--g64nw4ibv7tj6mml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHz56kACgkQwqF3j0dL
ehykixAAmS9Q4WCWvnB3FYPwrZS1XcYgs7c54qP1W+vYzZAAlx7aPQZYKv0lIXup
yslTjdhGHTIsWvYu5+gGxdbT+7Mt2RBynrBWW2Cy3DFAblgxeqdifKosN27Jg4qt
wR4GYebsEMnZ8UYPKqtZpPmXPlkT/4K/oFKxgQhHtRUNFIp+pmXLXYF816fI0Wf8
H9mCgEBn8nGeTAjlJMhujj4l1v+3V2VTThpzz0LEX18s8T1+3+LpdTDNFJjo1F+j
6ALfxpDu8LXBOKnOClKopXMZG0SrPfsx+p0WEToNTATG26L2irs6PNHK2zh4RDyl
jSMeJ1pCrqvo/vokW2YT8aEFr+p+w2DAc4RwkmGhD1vbz/M/K83vUJQCpglVTNhA
rebuXrjlBpLMADjWNZioPVHcnNqWpqkaKniN7CRPfW6gM0KPKjVpj6p78H+/9BFZ
Pnid2szvwzrHqXQkzt77swJ1lwG8bPB2l7YZig8ONIUYEbIWNjt5exbfBQcRrzxH
ubRxSsIpv65MOfD4060SQwdoCcdi7u1k/BxSnXDFfOUZgSCKsfDU5ZvLL8hp3Bxj
MWBFGcup59QDkfMwT+KJEvZFKabE7WXvIJqHm4T9mdC3uwnNCeVdLU4laFaeHFTG
jZTqi0NKsLl4szXy1s/Rrzla1D86FYK7oDPQGjfYVSy5NIn6AK8=
=vq1L
-----END PGP SIGNATURE-----

--g64nw4ibv7tj6mml--
