Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8F429EE8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 09:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964AA89F01;
	Tue, 12 Oct 2021 07:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5DC89F01;
 Tue, 12 Oct 2021 07:46:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="250466779"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="250466779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 00:45:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="490845240"
Received: from pakumpul-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.40.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 00:45:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org
Cc: Fernando Ramos <greenfoo@u92.eu>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: replacing drm_modeset_lock_all for
 DRM_MODESET_LOCK_ALL_*
In-Reply-To: <YWL1kxAbsq26//kF@fedora>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YWL1kxAbsq26//kF@fedora>
Date: Tue, 12 Oct 2021 10:45:53 +0300
Message-ID: <87v922znwu.fsf@intel.com>
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

On Sun, 10 Oct 2021, Ma=C3=ADra Canal <maira.canal@usp.br> wrote:
> As requested in GPU Driver Developers Guide TODO list, replaces all
> drm_lock boilerplates for DRM_MODESET_LOCK_ALL_* helpers.

Please see [1].

Also, all i915 patches must be Cc'd to intel-gfx mailing list. Please
see MAINTAINERS file.


BR,
Jani.


[1] https://lore.kernel.org/r/20211007193755.29579-1-greenfoo@u92.eu


>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 17f44ffea586..71b7ff7b7dea 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13466,22 +13466,13 @@ void intel_display_resume(struct drm_device *de=
v)
>  	if (state)
>  		state->acquire_ctx =3D &ctx;
>=20=20
> -	drm_modeset_acquire_init(&ctx, 0);
> -
> -	while (1) {
> -		ret =3D drm_modeset_lock_all_ctx(dev, &ctx);
> -		if (ret !=3D -EDEADLK)
> -			break;
> -
> -		drm_modeset_backoff(&ctx);
> -	}
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>=20=20
>  	if (!ret)
>  		ret =3D __intel_display_resume(dev, state, &ctx);
>=20=20
>  	intel_enable_ipc(dev_priv);
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>=20=20
>  	if (ret)
>  		drm_err(&dev_priv->drm,

--=20
Jani Nikula, Intel Open Source Graphics Center
