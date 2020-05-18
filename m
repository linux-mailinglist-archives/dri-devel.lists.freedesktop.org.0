Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C01D70DA
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 08:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CAE6E123;
	Mon, 18 May 2020 06:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1EF6E0A6;
 Mon, 18 May 2020 06:24:29 +0000 (UTC)
IronPort-SDR: 9FyZldtlLavcdwkg6RAfmnwuvEXEsMzWah8twtUCsxQsO7ephTWo7YxIH/ffSjTn7mf/FEt6xW
 GQI7hWEJwXaA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:24:28 -0700
IronPort-SDR: i/Efo5wE8sji1KgHmHKQOoWISCOrfbaG9dNAnzdGRzbN+bl1tSNbeTVj+LVpGkktlgEAS0whlt
 u7ComdAa8dGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
 d="asc'?scan'208";a="299674577"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2020 23:24:25 -0700
Date: Mon, 18 May 2020 14:09:29 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] drm/i915: Mark check_shadow_context_ppgtt as maybe unused
Message-ID: <20200518060929.GS18545@zhen-hp.sh.intel.com>
References: <20200516023545.3332334-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200516023545.3332334-1-natechancellor@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1415837119=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1415837119==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t54s24TTWYm6oOX+"
Content-Disposition: inline


--t54s24TTWYm6oOX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.15 19:35:45 -0700, Nathan Chancellor wrote:
> When CONFIG_DRM_I915_DEBUG_GEM is not set, clang warns:
>=20
> drivers/gpu/drm/i915/gvt/scheduler.c:884:1: warning: function
> 'check_shadow_context_ppgtt' is not needed and will not be emitted
> [-Wunneeded-internal-declaration]
> check_shadow_context_ppgtt(struct execlist_ring_context *c, struct
> intel_vgpu_mm *m)
> ^
> 1 warning generated.
>=20
> This warning is similar to -Wunused-function but rather than warning
> that the function is completely unused, it warns that it is used in some
> expression within the file but that expression will be evaluated to a
> constant or be optimized away in the final assembly, essentially making
> it appeared used but really isn't. Usually, this happens when a function
> or variable is only used in sizeof, where it will appear to be used but
> will be evaluated at compile time and not be required to be emitted.
>=20
> In this case, the function is only used in GEM_BUG_ON, which is defined
> as BUILD_BUG_ON_INVALID, which intentionally follows this pattern. To
> fix this warning, add __maybe_unused to make it clear that this is
> intentional depending on the configuration.
>=20
> Fixes: bec3df930fbd ("drm/i915/gvt: Support PPGTT table load command")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1027
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index f776c92de8d7..0fb1df71c637 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -880,7 +880,7 @@ static void update_guest_pdps(struct intel_vgpu *vgpu,
>  				gpa + i * 8, &pdp[7 - i], 4);
>  }
> =20
> -static bool
> +static __maybe_unused bool
>  check_shadow_context_ppgtt(struct execlist_ring_context *c, struct intel=
_vgpu_mm *m)
>  {
>  	if (m->ppgtt_mm.root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
>=20
> base-commit: bdecf38f228bcca73b31ada98b5b7ba1215eb9c9

Thanks for the fix!

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

I'll pick up for gvt-next-fixes pull.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--t54s24TTWYm6oOX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsImmQAKCRCxBBozTXgY
JxfOAJ94e1oxLhfjkCYgNWLtG0s7S2z1fACggFwQWbFs3UxsTHtWE9Ln1GA6M2A=
=gdfP
-----END PGP SIGNATURE-----

--t54s24TTWYm6oOX+--

--===============1415837119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1415837119==--
