Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6449D3F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9F10E46A;
	Wed, 26 Jan 2022 20:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741AD10E2E4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0R+6+w1NT8PmkQCoUkTSCylJ5Er3/ZSDMCsR3sthdDw=; b=HNObPwBWW+5TWd+ZeSkeU2UFip
 ovHIiUWIWKBrBvTCe7xJmRB3KFN607+UP6kavrMEYreWDlIxnlaTJU16vjFY6X9kVeXIWQo5fI60Z
 qMhgs1DU3iiQXlCoaPF0NaJ/ii0DxGbJb6+meVreAv1kwCf/iptuctcv3KRTiR3cN0s3V1QuREeKu
 oHFkeCleZs010nBRSYkFhGmz+PuNI4VRejq1FGv98ayXHdMP738s1mDZl51yFEz74jj4dadvo32LY
 9a/pwisPC529Dn2D1R2j7F2n9eWZy7NgqpAopYupjklRe9jkFzMqrIylri7VxCiO3RhM2KfD7bSSN
 L0RvRE9w==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nCpML-0003Mr-TD; Wed, 26 Jan 2022 21:57:42 +0100
Date: Wed, 26 Jan 2022 19:57:26 -0100
From: Melissa Wen <mwen@igalia.com>
To: Yongzhi Liu <lyz_cs@pku.edu.cn>
Subject: Re: [PATCH] drm/v3d: Add missing unlock
Message-ID: <20220126205726.phfikh7kn3lks5ib@mail.igalia.com>
References: <1642868787-61384-1-git-send-email-lyz_cs@pku.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qjusil2tsea5ma46"
Content-Disposition: inline
In-Reply-To: <1642868787-61384-1-git-send-email-lyz_cs@pku.edu.cn>
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


--qjusil2tsea5ma46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/22, Yongzhi Liu wrote:
> [why]
> Unlock is needed on the error handling path to prevent dead lock.
>=20
> [how]
> Fix this by adding drm_gem_unlock_reservations on the error handling path.
>=20
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index c7ed2e1..0c989dc 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -798,6 +798,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
> =20
>  		if (!render->base.perfmon) {
>  			ret =3D -ENOENT;
> +			drm_gem_unlock_reservations(last_job->bo,
> +				    last_job->bo_count, &acquire_ctx);
>  			goto fail;
Hi,

Nice catch!

As unlock is handle in fail_unreserve, I would suggest you to keep the
failures handling around there. In that case, the goto will target a
place between `fail_unreserve:` and `fail:`, i.e. calls
drm_gem_unlock_reservations (and the following cleanings) but don't call
mutex_unlock.

Thanks,

Melissa

>  		}
>  	}
> @@ -1027,6 +1029,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *=
data,
>  						     args->perfmon_id);
>  		if (!job->base.perfmon) {
>  			ret =3D -ENOENT;
> +			drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
> +						    &acquire_ctx);
>  			goto fail;
>  		}
>  	}
> --=20
> 2.7.4
>=20

--qjusil2tsea5ma46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHxtbIACgkQwqF3j0dL
ehxmmhAAls6eo7gT76XvCoDqs3iMlPsv655BIOg65UFxTFirde5AiItWnvNwT3e5
Iyf3a1LnRPjvCB+YM793XU14YbVxgGgwQcRjlo00j93bBPAtTGK9ko+nyZnNn4ns
OMr+GZpXL9DNFaY9evlgKXlplbOotkDlQbf0TwHjuxyfuyKdLxtwaSs3/EXGsgjP
WKAtOBoP5Cdk112rvQg3u4IunKETNcm7a9tzbJU5u7SnwGKBsqPBqB0P+jtkD5ww
MZDtxCpoGJAHG8w9sgWainPn7qDtLpPnNUbQVhYtnTeJpyGrCzj/V+mt9lj5WCt+
+f4JkdUhDZrxmTwbwDifM3boUN4tHE89ab5QiQ8xzB+kG1Ui64RvokZT2S6Xk+Yw
J+hrYTsd9Ta+kieSVVKuka65qGxsuPcZ2hWFA8sEb4WbCjn6yuke5MVhsouH0SlF
+9LjIHLSuAvY5Z/mGY9WnMCYJn71hQoSyKJS8aAkyeE2uGi/hTYyyTMdtUtBSnuQ
lWKP8r/TuJFoUudVpzEVJZfStg4vDOO5M1lFnXqvaOUKzqTESfIWhbm2urHqwZnI
rPS+Fq8d1w7gcDI28l1EA5cR+P7bf7A536bXb4aP10JL8ZLWEW87hyYAUA/hbcI4
5DPNmTwDzGLhV2gnxGoUI8tMPCLwCcVsPl7nULC5IVY0D3/f7Zc=
=1pGY
-----END PGP SIGNATURE-----

--qjusil2tsea5ma46--
