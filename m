Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C26209B0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 07:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80410E208;
	Tue,  8 Nov 2022 06:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8E10E0F0;
 Tue,  8 Nov 2022 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667889900; x=1699425900;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=AQcWoCcHM2weWRCMEOUkXBLqWa1s2gGh6x77ixq+6UA=;
 b=kvMxr94GLRNNRiYxA/af3g3ID3TlUntyLI8bZC67qD58mSYIo3mpjfwf
 T+IWAFPkXh5oFRi0EJjCVH1w3IsgbPE1orbVvx165wDlGRpI3XrA06RJv
 mQgveM0ZRbs0lzJiVGgOQsXyvugWTtjEpH3fEX5Vcxr453+yY68+OFfIP
 vtIEN+e9YLXcqKi7IA1oPtfNaSOcmGcoEJcQYEbw1+WBVRMjasMzQBb4Q
 ZHW6VXwyIljpEVD4sS5kJGWfgusXAMOYXnrOI5Q4oi2A2nnoK63vsDSaC
 ZBsMYf6vXAYZhpkooQjO+j2PRdFj3eG/KD2ZiBaQxFX/Y4iHT3jGkheB6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293990107"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="293990107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 22:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667476860"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="667476860"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 07 Nov 2022 22:44:37 -0800
Date: Tue, 8 Nov 2022 14:44:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Subject: Re: [PATCH] [next] i915/gvt: remove hardcoded value on crc32_start
 calculation
Message-ID: <20221108064412.GJ30028@zhen-hp.sh.intel.com>
References: <20221030033628.GA279284@mail.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline
In-Reply-To: <20221030033628.GA279284@mail.google.com>
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
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.10.30 16:36:28 +1300, Paulo Miguel Almeida wrote:
> struct gvt_firmware_header has a crc32 member in which all members that
> come after the that field are used to calculate it. The previous
> implementation added the value '4' (crc32's u32 size) to calculate the
> crc32_start offset which came across as a bit cryptic until you take a
> deeper look at the struct.
>=20
> This patch changes crc32_start offset to the 'version' member which is
> the first member of the struct gvt_firmware_header after crc32.
>=20
> It's worth mentioning that doing a build before/after this patch results
> in no binary output differences.
>=20
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>
> ---
>  drivers/gpu/drm/i915/gvt/firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/g=
vt/firmware.c
> index 54fe442238c6..a683c22d5b64 100644
> --- a/drivers/gpu/drm/i915/gvt/firmware.c
> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
> @@ -104,7 +104,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gv=
t)
> =20
>  	memcpy(p, gvt->firmware.mmio, info->mmio_size);
> =20
> -	crc32_start =3D offsetof(struct gvt_firmware_header, crc32) + 4;
> +	crc32_start =3D offsetof(struct gvt_firmware_header, version);
>  	h->crc32 =3D crc32_le(0, firmware + crc32_start, size - crc32_start);
> =20
>  	firmware_attr.size =3D size;
> --=20
> 2.25.4
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2n6vAAKCRCxBBozTXgY
J9NOAJ90+/zrOO+G2J0btugVOX3Rka6vUQCgnzp1wLu+ynVS2gklxJ1YxffpPhc=
=je3g
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
