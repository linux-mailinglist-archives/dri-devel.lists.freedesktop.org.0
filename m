Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BD769245
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2D10E186;
	Mon, 31 Jul 2023 09:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7A10E186
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690797059; x=1722333059;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Hc7qlONwtKizmYUKKi4OOGq8e7LaT2BN2NXfHTrBwpk=;
 b=c2Fp40otpOz0yWrmC8zjYCH2ibmNc2v1MaM0b613bY/4t+5hIcDsuIDY
 AtUA6am+jJ3I6H67UwOEyiv0iZzhkia2tLT3y0Bv1bG2jXOUktUE7iS/b
 pR8EHYuLbFgw0nMzGxSUpLh6C0qaiOftyAr87haONShtx2yu6PRKLgoj+
 RCZAbUaGgePzx2V4soYDb43thKeSxXFfNbd9T05h0B7FtpK425G9sEHR1
 AW9LTVAocu1izsJUcj9IJjsj1tQZx4GEZ7ZFBTBZx3/yCMrsuepHkmuhU
 L74jEKF6mfN1lu2YbXMsC7smdhx30Uczq0URwd/yEmJcssLKuf/ubolut Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348573105"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="348573105"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 02:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678256882"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="678256882"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO localhost)
 ([10.252.36.230])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 02:50:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ioctl: turn on -Woverride-init for IOCTL table
In-Reply-To: <20230720103107.817084-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230720103107.817084-1-contact@emersion.fr>
Date: Mon, 31 Jul 2023 12:50:53 +0300
Message-ID: <87o7jsxvcy.fsf@intel.com>
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
Cc: Erik Kurzinger <ekurzinger@nvidia.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jul 2023, Simon Ser <contact@emersion.fr> wrote:
> Recently two patches [1] [2] have hit a case of mistakenly picking
> an IOCTL number which was already in-use. This is hard to debug
> because the last definition wins and there is no indication that
> there is a conflict.
>
> Fix this by enabling -Werror=3Doverride-init for the IOCTL table.
> When there is a duplicate entry, the compiler now errors out:
>
>       CC [M]  drivers/gpu/drm/drm_ioctl.o
>     drivers/gpu/drm/drm_ioctl.c:555:33: error: initialized field overwrit=
ten [-Werror=3Doverride-init]
>       555 |         [DRM_IOCTL_NR(ioctl)] =3D {               \
>           |                                 ^
>     drivers/gpu/drm/drm_ioctl.c:708:9: note: in expansion of macro =E2=80=
=98DRM_IOCTL_DEF=E2=80=99
>       708 |         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_=
reset_ioctl,
>           |         ^~~~~~~~~~~~~
>     drivers/gpu/drm/drm_ioctl.c:555:33: note: (near initialization for =
=E2=80=98drm_ioctls[207]=E2=80=99)
>       555 |         [DRM_IOCTL_NR(ioctl)] =3D {               \
>           |                                 ^
>     drivers/gpu/drm/drm_ioctl.c:708:9: note: in expansion of macro =E2=80=
=98DRM_IOCTL_DEF=E2=80=99
>       708 |         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_=
reset_ioctl,
>           |         ^~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
>
> [1]: https://lore.kernel.org/dri-devel/20230714111257.11940-1-contact@eme=
rsion.fr/
> [2]: https://lore.kernel.org/dri-devel/vVFDBgHpdcB0vOwnl02QPOFmAZPEbIV56E=
_wQ8B012K2GZ-fAGyG0JMbSrMu3-IcKYVf0JpJyrf71e6KFHfeMoSPJlYRACxlxy91eW9c6Fc=
=3D@emersion.fr/
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Erik Kurzinger <ekurzinger@nvidia.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f03ffbacfe9b..cd485eb54d2a 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -566,6 +566,8 @@ static int drm_ioctl_permit(u32 flags, struct drm_fil=
e *file_priv)
>  #endif
>=20=20
>  /* Ioctl table */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic error "-Woverride-init"

You should probably use __diag_push(), __diag_warn(), and __diag_pop()
compiler agnostic wrappers instead of using #pragmas directly.

BR,
Jani.

>  static const struct drm_ioctl_desc drm_ioctls[] =3D {
>  	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
> @@ -718,6 +720,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_M=
ASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,=
 DRM_MASTER),
>  };
> +#pragma GCC diagnostic pop
>=20=20
>  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)

--=20
Jani Nikula, Intel Open Source Graphics Center
