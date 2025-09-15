Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B9B57B58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28210E495;
	Mon, 15 Sep 2025 12:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgg5eDCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61F10E487;
 Mon, 15 Sep 2025 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757940154; x=1789476154;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oAEeoHs9rXo/wf2oE06+wQRWp/MuIBStmQIAXSQs2Yc=;
 b=Dgg5eDCQT4ZFzRh1+mEjh6ag0c6mFBeOZNj8figqyyUHHEzBDS+ONBTE
 3uCBlyw8enrCE3dFqyIH4mJc5OYyJ6sVi16b7hIOixCkV4i5WWuOpKlXr
 fhUq/BvKbh6vMlTF3cMk26c8DoWzjv4OlaeCeXYk4DxIGBpi8C+t5h3/S
 rfxub1SFFG0K49liXlQLbXbbEde9smYOjqZaD02diozEKvuagq9BuSXox
 iR2GJmW8D2LLQxNXNRUVrHXT/iMYejFjALSq5t0UvLr6P6RxaKoiMVOxk
 8UF3RAG1ZNDkMcIT6EMgkfH6h63mLR4pd9Aqd9iMY0KgGSZoa4WrEbxcJ A==;
X-CSE-ConnectionGUID: hs3caE73RV6F3U76DCARGQ==
X-CSE-MsgGUID: VdkQzPRkSo6HEuAwQmY39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71617243"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="71617243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:42:34 -0700
X-CSE-ConnectionGUID: cOZDlnkpT02cRk3T8k23uw==
X-CSE-MsgGUID: XKZSDT/hQSW8OJec2XHG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175056198"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:42:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian =?utf-8?Q?K=C3=B6ni?=
 =?utf-8?Q?g?= <christian.koenig@amd.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Alex
 Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, David Airlie
 <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona
 Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
In-Reply-To: <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 15:42:23 +0300
Message-ID: <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Sep 2025, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wro=
te:
> PCI core provides pci_rebar_size_supported() that helps in checking if
> a BAR Size is supported for the BAR or not. Use it in
> i915_resize_lmem_bar() to simplify code.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree is convenient.

> ---
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/dr=
m/i915/gt/intel_region_lmem.c
> index 51bb27e10a4f..69c65fc8a72d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -61,16 +61,12 @@ static void i915_resize_lmem_bar(struct drm_i915_priv=
ate *i915, resource_size_t
>  	current_size =3D roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_B=
AR));
>=20=20
>  	if (i915->params.lmem_bar_size) {
> -		u32 bar_sizes;
> -
> -		rebar_size =3D i915->params.lmem_bar_size *
> -			(resource_size_t)SZ_1M;
> -		bar_sizes =3D pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
> -
> +		rebar_size =3D i915->params.lmem_bar_size * (resource_size_t)SZ_1M;
>  		if (rebar_size =3D=3D current_size)
>  			return;
>=20=20
> -		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
> +		if (!pci_rebar_size_supported(pdev, GEN12_LMEM_BAR,
> +					      pci_rebar_bytes_to_size(rebar_size)) ||
>  		    rebar_size >=3D roundup_pow_of_two(lmem_size)) {
>  			rebar_size =3D lmem_size;

--=20
Jani Nikula, Intel
