Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D186214614F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 06:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAE26F9AA;
	Thu, 23 Jan 2020 05:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46466F9A7;
 Thu, 23 Jan 2020 05:19:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 21:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,352,1574150400"; 
 d="asc'?scan'208";a="216152482"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by orsmga007.jf.intel.com with ESMTP; 22 Jan 2020 21:19:24 -0800
Date: Thu, 23 Jan 2020 13:07:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] drm/i915/gvt: fix high-order allocation failure on late
 load
Message-ID: <20200123050727.GA25905@zhen-hp.sh.intel.com>
References: <1579723824-25711-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
In-Reply-To: <1579723824-25711-1-git-send-email-igor.druzhinin@citrix.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============0701678212=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0701678212==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.22 20:10:24 +0000, Igor Druzhinin wrote:
> If the module happens to be loaded later at runtime there is a chance
> memory is already fragmented enough to fail allocation of firmware
> blob storage and consequently GVT init. Since it doesn't seem to be
> necessary to have the blob contiguous, use vmalloc() instead to avoid
> the issue.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  drivers/gpu/drm/i915/gvt/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/g=
vt/firmware.c
> index 049775e..b0c1fda 100644
> --- a/drivers/gpu/drm/i915/gvt/firmware.c
> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
> @@ -146,7 +146,7 @@ void intel_gvt_free_firmware(struct intel_gvt *gvt)
>  		clean_firmware_sysfs(gvt);
> =20
>  	kfree(gvt->firmware.cfg_space);
> -	kfree(gvt->firmware.mmio);
> +	vfree(gvt->firmware.mmio);
>  }
> =20
>  static int verify_firmware(struct intel_gvt *gvt,
> @@ -229,7 +229,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)
> =20
>  	firmware->cfg_space =3D mem;
> =20
> -	mem =3D kmalloc(info->mmio_size, GFP_KERNEL);
> +	mem =3D vmalloc(info->mmio_size);
>  	if (!mem) {
>  		kfree(path);
>  		kfree(firmware->cfg_space);
> --=20
> 2.7.4
>

Looks fine to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXikqDwAKCRCxBBozTXgY
J+4uAJ96YbLIY0cQA9wjsw2Zc/jXBf4gXwCeMpf5uwvjnowmgSrYjEle8958Ezw=
=DlrF
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

--===============0701678212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0701678212==--
