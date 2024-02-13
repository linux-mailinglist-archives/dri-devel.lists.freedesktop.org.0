Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F9852D97
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 11:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4A10E318;
	Tue, 13 Feb 2024 10:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3DA3u2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B419E10E2D7;
 Tue, 13 Feb 2024 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818672; x=1739354672;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J7i4hg0ziGrlmf3vTFEfUk1q2oL5XXsskSRGKTloeXQ=;
 b=E3DA3u2HFWmMcYroisQiUI5/RNVomJHYdWfBoA7/J6MkpnxLafOiP2aR
 5AxneIXL9RgDlaN/4IU1RTxvAxH41yej3LCIFRf1Zftsb0rc0S6BocOzA
 C5sXpmkVQehhgSzoejDtdt3RdlzlMuIKf9Zv9hnjLq709OAkcrD1DZhyO
 66i9JaGUgc2JjeOsVo6PlkPq4y386PFS3ulYBVUJPJ7LI9m+BdqE264eL
 kOMoSz6MyUqWcMofP8RizGfJqNlMZ93dqbQ9e+pPuFUyaocbyPX0zONqL
 gUjh0ITzhkWiWF6ei2TKsw1iGCOx9UU0ShAhT12tbktAVFOykug75Zqsl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1940300"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1940300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2826055"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.89])
 ([10.249.254.89])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:04:27 -0800
Message-ID: <4ebd085d9c2100e0709c9ee7fb9685f58810c937.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: avoid function cast warnings
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Oded Gabbay <ogabbay@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Tue, 13 Feb 2024 11:04:23 +0100
In-Reply-To: <20240213095719.454865-1-arnd@kernel.org>
References: <20240213095719.454865-1-arnd@kernel.org>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Tue, 2024-02-13 at 10:56 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> clang-16 warns about a cast between incompatible function types:
>=20
> drivers/gpu/drm/xe/xe_range_fence.c:155:10: error: cast from 'void
> (*)(const void *)' to 'void (*)(struct xe_range_fence *)' converts to
> incompatible function type [-Werror,-Wcast-function-type-strict]
> =C2=A0 155 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D (v=
oid (*)(struct xe_range_fence *rfence))
> kfree,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Avoid this with a trivial helper function that calls kfree() here.
>=20
> Fixes: 845f64bdbfc9 ("drm/xe: Introduce a range-fence utility")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, will push as soon as it passes CI.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_range_fence.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_range_fence.c
> b/drivers/gpu/drm/xe/xe_range_fence.c
> index d35d9ec58e86..8510be4466eb 100644
> --- a/drivers/gpu/drm/xe/xe_range_fence.c
> +++ b/drivers/gpu/drm/xe/xe_range_fence.c
> @@ -151,6 +151,11 @@ xe_range_fence_tree_next(struct xe_range_fence
> *rfence, u64 start, u64 last)
> =C2=A0	return xe_range_fence_tree_iter_next(rfence, start, last);
> =C2=A0}
> =C2=A0
> +static void xe_range_fence_free(struct xe_range_fence * rfence)
> +{
> +	kfree(rfence);
> +}
> +
> =C2=A0const struct xe_range_fence_ops xe_range_fence_kfree_ops =3D {
> -	.free =3D (void (*)(struct xe_range_fence *rfence)) kfree,
> +	.free =3D xe_range_fence_free,
> =C2=A0};

