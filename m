Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB50B6910
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFEF6F5B1;
	Wed, 18 Sep 2019 17:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C66F5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 17:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 09BC710A3821;
 Wed, 18 Sep 2019 10:28:43 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VSiWnZVPMvtf; Wed, 18 Sep 2019 10:28:41 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id D7A4710A3783;
 Wed, 18 Sep 2019 10:28:40 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id C9A2E2FE2E27; Wed, 18 Sep 2019 10:28:41 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/v3d: clean caches at the end of render jobs on
 request from user space
In-Reply-To: <20190918091521.9765-1-itoral@igalia.com>
References: <20190918091521.9765-1-itoral@igalia.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Wed, 18 Sep 2019 10:28:40 -0700
Message-ID: <87woe5econ.fsf@anholt.net>
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
Content-Type: multipart/mixed; boundary="===============0926062193=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0926062193==
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
>
> v2: if v3d_job_init() fails we need to kfree() the job instead of
>     v3d_job_put() it (Eric Anholt).
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Link: https://patchwork.freedesktop.org/patch/msgid/20190912083516.13797-=
1-itoral@igalia.com

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

Hmm.  vc4, msm, panfrost, etnaviv, i915 all name their submit flags
without "_FLAG" in the name, can we drop that?

Also, I just noticed: You don't have a new param to indicate the
availability of the new flag.  You're going to need that (unless you've
got some other clever plan?) so that new Mesa can detect an old kernel
and not expose the GLES 3.1 features that require it.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl2CaUgACgkQtdYpNtH8
nugaBxAAhHbdmhvKALXTJJDK0hPR9jkaTEBvgzC1FXQEzQ2bgJ+r12PEwu0wFyfe
c/nd1rXE5QikN7NJMHR+2GWhCzwPLy9tQGp/GZuo0FTO4AtkqTA7GV9tBy1O3ERH
drEcmKomd8N91CgBXfDgpomFt6aCLTi1slJLV0BOXyx1eibKLQhidnGXse4AbZRm
oXNkJM6Tn3x/Pxrhu9g9FuxKiAGoqNICxznC8yfno23P6AdAeuARe1yCV/MguonW
yKoFtBeBIX7cprc+uv3uInHETT05XrYLPciZjQAAgEq35wp74OLmbdogNlzZzA37
bwG/m4h/Yuu4ciN8B3VITix6AYzhdrP6jmYpP/Ye9LzVinke2VJ65exga2wGcYxw
i6DW9BNUKU2j2UeTBA0sgtSqgsx1GzW9+oRAVKrQbGqAr3e4YMR5INutiHqT6Enl
H/QsjMv0nrjzhC+OlCn0f6ilcbeQMktNdil6U0kQPt+UGGy8KOYE2NPfmZ/Cuc1q
1OvKqgk2sV2v9kKOl6iLuM2F+F/4UeM+o8qGexHgEvpBQ4mXuc4qxOKLb0m8kHZ/
CfnxP8/NRJtv9hAay3qvVSy5WI366ts4P/Cvm6Na7F0t/Wuzj5vJRCvQcWH1/qOc
hliYtrRM63ERuuixoSHKVXDMsDgXWA76ZNvTP5uy7YG5dxA+RU4=
=E47I
-----END PGP SIGNATURE-----
--=-=-=--

--===============0926062193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0926062193==--
