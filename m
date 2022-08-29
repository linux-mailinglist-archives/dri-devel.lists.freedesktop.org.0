Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E45A4596
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39FA10F10A;
	Mon, 29 Aug 2022 08:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9671110F101;
 Mon, 29 Aug 2022 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661763553; x=1693299553;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PfBjtqfIpcS8CoTv/YjLo/naSLWkJaJ3mxlPJQ6m0vY=;
 b=lY6SqbZrpj/zVK46D5vDP6sPaPSb/sp8FAnP2TLQouQUIQv4M1QmlF+H
 r+nolPJww1NiZcfmutijtXMyuceJ/T82q4rZpNeda+oJGCTNhU2+hqLGL
 TiFOQsOoYxMj+D7tpF3bDsPUP4V5nOs49xWAgaO5iY/BduE91scsrgLfk
 8Xqn9bWlyRHOm/nCwOUAzqUruZiE1n/DtnwwcFXcyuH1p5mPtjWxdNvW9
 IOLGHHmgbSVRCh0MMeExRJZcr/7vvhkpEfMUw4cOQhM+B8NXy1X7eQNjD
 vAef13tIsI5rlCdIhGL6vQ4X2zI+IRdYfhv8w5m4G4R1DuXu1baeUwtOp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="274597172"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="274597172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:59:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672303547"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:59:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 05/11] drm/edid: Only parse VRR range for continuous
 frequency displays
In-Reply-To: <20220826213501.31490-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-6-ville.syrjala@linux.intel.com>
Date: Mon, 29 Aug 2022 11:58:53 +0300
Message-ID: <87wnarfmsy.fsf@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Since we only use the parsed vrefresh range to determine
> if VRR should be supported we should only accept continuous
> frequency displays here.
>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Makes sense, at least for sane EDIDs. :p

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 856d304a1354..b459fdf12b58 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6064,7 +6064,10 @@ static void drm_get_vrr_range(struct drm_connector=
 *connector,
>  		.drm_edid =3D drm_edid,
>  	};
>=20=20
> -	if (!version_greater(drm_edid, 1, 1))
> +	if (!version_greater(drm_edid, 1, 3))
> +		return;
> +
> +	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
>  		return;
>=20=20
>  	drm_for_each_detailed_block(drm_edid, get_vrr_range, &closure);

--=20
Jani Nikula, Intel Open Source Graphics Center
