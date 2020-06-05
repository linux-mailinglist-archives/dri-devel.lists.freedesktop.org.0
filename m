Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69E1EF0D4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 07:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887406E837;
	Fri,  5 Jun 2020 05:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D0F6E837;
 Fri,  5 Jun 2020 05:10:10 +0000 (UTC)
IronPort-SDR: l9AVh7jvT45hknyrArF9rIHvgjcP+HHgg3gVnhxazqbHPsQN0JShS6s03TVtLGL0oaOEOnMbSH
 dPrWSuj0M5/A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:10:09 -0700
IronPort-SDR: 4idtIugdnOHQYK2nosQvAUNWjA4rL6bAZOJwhqMG8P8YiBjNHy5yvSIA3oUSYEWxW9LZRDSuZc
 TLH/up3j8ssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
 d="asc'?scan'208";a="445768791"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 04 Jun 2020 22:10:07 -0700
Date: Fri, 5 Jun 2020 12:54:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [PATCH] drm/i915/gvt: print actionable error message when gm
 runs out
Message-ID: <20200605045430.GS5687@zhen-hp.sh.intel.com>
References: <20200603123321.263895-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <20200603123321.263895-1-julian.stecklina@cyberus-technology.de>
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1220154404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1220154404==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tuFXEhzhBeitrIAu"
Content-Disposition: inline


--tuFXEhzhBeitrIAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.03 14:33:21 +0200, Julian Stecklina wrote:
> When a user tries to allocate too many or too big vGPUs and runs out
> of graphics memory, the resulting error message is not actionable and
> looks like an internal error.
>=20
> Change the error message to clearly point out what actions a user can
> take to resolve this situation.
>=20
> Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> ---
>  drivers/gpu/drm/i915/gvt/aperture_gm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i91=
5/gvt/aperture_gm.c
> index 0d6d598713082..5c5c8e871dae2 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -69,9 +69,12 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high=
_gm)
>  				  start, end, flags);
>  	mmio_hw_access_post(gt);
>  	mutex_unlock(&gt->ggtt->vm.mutex);
> -	if (ret)
> -		gvt_err("fail to alloc %s gm space from host\n",
> -			high_gm ? "high" : "low");
> +	if (ret) {
> +		gvt_err("vgpu%d: failed to allocate %s gm space from host\n",
> +			vgpu->id, high_gm ? "high" : "low");
> +		gvt_err("vgpu%d: destroying vGPUs, decreasing vGPU memory size or incr=
easing GPU aperture size may resolve this\n",
> +			vgpu->id);

Currently we can't decrease vGPU mem size as defined by mdev type,
so actually you may try different vGPU type. And aperture size is
also handled for supported vGPU mdev types, so assume user should
already be awared of that too. I just don't want us to be too chatty. :)

> +	}
> =20
>  	return ret;
>  }
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--tuFXEhzhBeitrIAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXtnQBgAKCRCxBBozTXgY
J/c4AKCKRut0XbYE1ZzbeKKaRdpwFEG8cgCfRE5+/HXqXZ4OypqRUdPCM+ACVTk=
=2IF1
-----END PGP SIGNATURE-----

--tuFXEhzhBeitrIAu--

--===============1220154404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1220154404==--
