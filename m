Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C03852C68
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 10:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439D310E2C6;
	Tue, 13 Feb 2024 09:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="durSmcD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82210E1E4;
 Tue, 13 Feb 2024 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707817078; x=1739353078;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=p90uA94Z+LZxE9uZCXBI6vm07ZWueT4WnR7skAj2mHY=;
 b=durSmcD50OzMPBpa4VR8r5qhFOPTKT1M/GnRo8UaASCJV/0e3wBFmt62
 eEXB+eVlIqtnJp7Fm+S3u8Xu3zMfxWJTwTG8TiWOHjyCN4mNYL9zGk955
 3Qef8nr6nVlPYLKYZGYWVam1DdFZhtmtG6ePXuM3NpLtzTYMOObR+L4Oq
 P4NuGdZMbJtdeaUpEuU4uxtoZZIMIcAFhOd29XZnNbf97zFl+CdkxBRYG
 pe3YJ2HljueUZfrVVgE/NrwTBDJrEsksM6GE8UhbTEFv49Dpa7L6Xy/Y1
 J0V5R1kef00eFzKbVhKpsgAtHUE+SQNQ5Vxdn94HGjUvqHG2H1k02VvF9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1668795"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1668795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 01:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="3017159"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.89])
 ([10.249.254.89])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 01:37:55 -0800
Message-ID: <46f95691c86388a510f78187855d69a3d0132b82.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next] drm/xe: fix arguments to drm_err_printer()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Luca Coelho
 <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>
Date: Tue, 13 Feb 2024 10:37:53 +0100
In-Reply-To: <20240213084954.878643-1-jani.nikula@intel.com>
References: <20240213084954.878643-1-jani.nikula@intel.com>
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

On Tue, 2024-02-13 at 10:49 +0200, Jani Nikula wrote:
> The commit below changed drm_err_printer() arguments, but failed to
> update all places.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes:
> https://lore.kernel.org/r/20240213120410.75c45763@canb.auug.org.au
> Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device
> specific by using drm_err()")
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> ---
>=20
> Argh. This is getting embarrassing. This one was hiding behind
> CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE=3Dy.
> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4744668ef60a..0c763ceafbed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -812,7 +812,8 @@ static void guc_exec_queue_print(struct
> xe_exec_queue *q, struct drm_printer *p)
> =C2=A0static void simple_error_capture(struct xe_exec_queue *q)
> =C2=A0{
> =C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> -	struct drm_printer p =3D drm_err_printer("");
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct drm_printer p =3D drm_err_printer(&xe->drm, NULL);
> =C2=A0	struct xe_hw_engine *hwe;
> =C2=A0	enum xe_hw_engine_id id;
> =C2=A0	u32 adj_logical_mask =3D q->logical_mask;

