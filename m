Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7284F820
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D8910F58F;
	Fri,  9 Feb 2024 15:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7A755IG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D904210F59D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707491223; x=1739027223;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yepMO4u59E++4QW9Rxe1Tub7oqWimXxD0lt0roVEjXE=;
 b=Y7A755IG9+QIk30H9v2MYxmXkztV4PXwD8JNCwpzqnEPFhUa19Yzq6/6
 zMMMCnkNZcvma4/SZUMOgd3sMmWqMHPpxOmx5dMP9hpzMx8ZM9c42/MK2
 83a0X7c1ZEWKnnQJ5+1n6iCY8C/Js/uNTrJ5EgDcaCyeBNjAudEZOkoM+
 mi2wY98Hmy6Iqd4ULoktIxG4++dOtvzDX871ExrGPNMr6YRdNDwJZFRr/
 VR85OKojAaO3M7WgwnoWvLa/Z2PuUwu9iHAPrDcyFPNBzJvEYFSuFjDKF
 ZbldHyXpFqbFyUzp15BqpNq9FpxJoR4P6tp2KkSpeOLx13yDWwaxqAoLL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1595452"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1595452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 07:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1956543"
Received: from dfischbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.64])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 07:06:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Luca Coelho
 <luciano.coelho@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/tests: mm: Convert to drm_dbg_printer
In-Reply-To: <20240209140818.106685-1-michal.winiarski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240209140818.106685-1-michal.winiarski@intel.com>
Date: Fri, 09 Feb 2024 17:06:53 +0200
Message-ID: <87o7cpad82.fsf@intel.com>
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

On Fri, 09 Feb 2024, Micha=C5=82 Winiarski <michal.winiarski@intel.com> wro=
te:
> Fix one of the tests in drm_mm that was not converted prior to
> drm_debug_printer removal, causing tests build failure.

My bad, thanks for fixing this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

For one thing, I must not have git grep'd for new drm_debug_printer()
additions since I wrote the patch.

For another, I'm missing some kernel config, because I built the changes
on x86, arm and arm64 before pushing. In particular the arm and arm64
configs I just recently added from drm-rerere repo. Those defconfigs
should probably be updated. They don't have CONFIG_DRM_XE=3Dm either.

BR,
Jani.

>
> Fixes: e154c4fc7bf2d ("drm: remove drm_debug_printer in favor of drm_dbg_=
printer")
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/=
drm_mm_test.c
> index 1eb0c304f9607..3488d930e3a38 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -188,7 +188,7 @@ static void drm_test_mm_init(struct kunit *test)
>=20=20
>  static void drm_test_mm_debug(struct kunit *test)
>  {
> -	struct drm_printer p =3D drm_debug_printer(test->name);
> +	struct drm_printer p =3D drm_dbg_printer(NULL, DRM_UT_CORE, test->name);
>  	struct drm_mm mm;
>  	struct drm_mm_node nodes[2];

--=20
Jani Nikula, Intel
