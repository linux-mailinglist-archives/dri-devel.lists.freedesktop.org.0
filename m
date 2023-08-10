Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C9777A36
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC0A10E194;
	Thu, 10 Aug 2023 14:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB0B10E194;
 Thu, 10 Aug 2023 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691676765; x=1723212765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bdIIOTKh7IfFQ6pXhNlODCj7FRjKYScx0QSb05B/Zzw=;
 b=naxYDxm6LubqtWl28vughBNBF3Uc3fokwgJPbPJSlHV9T+enGkHDgkUj
 Y7Hzx+Gs2fJ5HjqpTeCVR9KiC2kgOejYBqhj8gbjQUZaGru18JnZw8ICO
 FPf+bgnXGTwajU38vkFeJwTHj4waO2uHP/+MhsjkokrUAdeWddVFSuImR
 ex/9ycYIZ8GxYSoTDs6WsxesDpevjnUImAKVOhqs38zRJdDJygm+6Wtvl
 FOqWEbIBpK+vkdO40BZoSi/Ux5dasG5TXgDTyjMNei7CueBDF2YVGAmKl
 ACT0MhP4eUssFzuV6utgZELwMacuptZtjhyHGuQqsJVGDsj6ZTHk8c1tk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="356373936"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356373936"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 07:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="846410883"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="846410883"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 07:12:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wang Jinchao <wangjinchao@xfusion.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gmch: fix build error var set but not used
In-Reply-To: <ZNTsl/mlElF/spog@fedora>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZNTsl/mlElF/spog@fedora>
Date: Thu, 10 Aug 2023 17:12:31 +0300
Message-ID: <87sf8rq94g.fsf@intel.com>
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
Cc: stone.xulei@xfusion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023, Wang Jinchao <wangjinchao@xfusion.com> wrote:
> When CONFIG_PNP is not defined, i915 will fail to compile with error bell=
ow:
> 	drivers/gpu/drm/i915/soc/intel_gmch.c:43:13: error: variable =E2=80=98mc=
hbar_addr=E2=80=99 set but not used
> Fix it by surrounding variable declaration and assignment with ifdef
>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>

Thanks for the patch, but this was fixed a couple of months ago by
commit b02a9a0c6cb3 ("drm/i915/gmch: avoid unused variable warning").

Please check the development trees or linux-next before sending fixes.

Thanks,
Jani.


> ---
>  drivers/gpu/drm/i915/soc/intel_gmch.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915=
/soc/intel_gmch.c
> index 6d0204942f7a..d2c442b0b4eb 100644
> --- a/drivers/gpu/drm/i915/soc/intel_gmch.c
> +++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
> @@ -38,16 +38,17 @@ intel_alloc_mchbar_resource(struct drm_i915_private *=
i915)
>  {
>  	int reg =3D GRAPHICS_VER(i915) >=3D 4 ? MCHBAR_I965 : MCHBAR_I915;
>  	u32 temp_lo, temp_hi =3D 0;
> -	u64 mchbar_addr;
>  	int ret;
> -
> +#ifdef CONFIG_PNP
> +	u64 mchbar_addr;
> +#endif
>  	if (GRAPHICS_VER(i915) >=3D 4)
>  		pci_read_config_dword(i915->gmch.pdev, reg + 4, &temp_hi);
>  	pci_read_config_dword(i915->gmch.pdev, reg, &temp_lo);
> -	mchbar_addr =3D ((u64)temp_hi << 32) | temp_lo;
>=20=20
>  	/* If ACPI doesn't have it, assume we need to allocate it ourselves */
>  #ifdef CONFIG_PNP
> +	mchbar_addr =3D ((u64)temp_hi << 32) | temp_lo;
>  	if (mchbar_addr &&
>  	    pnp_range_reserved(mchbar_addr, mchbar_addr + MCHBAR_SIZE))
>  		return 0;

--=20
Jani Nikula, Intel Open Source Graphics Center
