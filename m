Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB18F115A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 09:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24716E1C0;
	Wed,  6 Nov 2019 08:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2A6E1C0;
 Wed,  6 Nov 2019 08:44:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 00:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; 
 d="asc'?scan'208";a="205770424"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 06 Nov 2019 00:44:06 -0800
Date: Wed, 6 Nov 2019 16:43:49 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Pan Bian <bianpan2016@163.com>
Subject: Re: [PATCH] drm/i915/gvt: fix dropping obj reference twice
Message-ID: <20191106084349.GB4196@zhen-hp.sh.intel.com>
References: <1573025467-18278-1-git-send-email-bianpan2016@163.com>
MIME-Version: 1.0
In-Reply-To: <1573025467-18278-1-git-send-email-bianpan2016@163.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============2054966370=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2054966370==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.06 15:31:07 +0800, Pan Bian wrote:
> The reference count of obj will be decremented twice if error occurs
> in dma_buf_fd(). Additionally, attempting to read the reference count of
> obj after dropping reference may lead to a use after free bug. Here, we
> drop obj's reference until it is not used.
>=20
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 13044c027f27..4bfaefdf548d 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -498,8 +498,6 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, un=
signed int dmabuf_id)
>  		goto out_free_gem;
>  	}
> =20
> -	i915_gem_object_put(obj);
> -
>  	ret =3D dma_buf_fd(dmabuf, DRM_CLOEXEC | DRM_RDWR);
>  	if (ret < 0) {
>  		gvt_vgpu_err("create dma-buf fd failed ret:%d\n", ret);
> @@ -524,6 +522,8 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, un=
signed int dmabuf_id)
>  		    file_count(dmabuf->file),
>  		    kref_read(&obj->base.refcount));
> =20
> +	i915_gem_object_put(obj);
> +
>  	return dmabuf_fd;
> =20
>  out_free_dmabuf:

Looks fine to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXcKHxQAKCRCxBBozTXgY
J4mOAJ9LQBbGYBz26qSqTKOjlyHG7O92MQCgh6qkF9/0GTRd05GChiCic5//yLQ=
=6K7k
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

--===============2054966370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2054966370==--
