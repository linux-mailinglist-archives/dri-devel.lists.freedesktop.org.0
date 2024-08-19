Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2E9565E5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1940410E20F;
	Mon, 19 Aug 2024 08:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IA6x6PZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895310E20F;
 Mon, 19 Aug 2024 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724057144; x=1755593144;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BwO9G9DSxzsNbJAx83jRWAZlxWASmFoV86cMBGMNnX8=;
 b=IA6x6PZcX5xw0r8UaP6y7FnKIy7N/3NI3VQaNC9ni/Sb8pSf8UUKFrW0
 5IK15gLvDwzwb+MJOFJsTtublpzlvcC2QQAyradZhPcqDPRqLJinqwdtz
 qhI0dFrQtmXoRAsSeqYfRvIvl91GFxxD4i8vgjWm2UAKi0GXrPZGibIvr
 BBZv47bWiupDHvbNAHDriGOZRcqCgxvRpJ7dmmRuEZurOqXSqlCgripCK
 hF0/DMaALu5tlX6NTIKdByueauVgC4VCGamWogEaCLfqBq6J/5tJUObjg
 Sy16vcBgl04q4NyPn78rJbZQ1h5drxSKUBPhEW+LaaT4hpyIrZURJu+VX g==;
X-CSE-ConnectionGUID: yWmyTJYZT/mQx69Y9cBN5g==
X-CSE-MsgGUID: tp0HeTQZTy6eQ73y6iOsRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22451312"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22451312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:45:44 -0700
X-CSE-ConnectionGUID: K2j25Us7SbStyTFdemgwLg==
X-CSE-MsgGUID: iw+RIGyQTc+pBwxsD/u7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60358532"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:45:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, Aric Cyr
 <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, Tony Cheng
 <Tony.Cheng@amd.com>, Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 10/12] drm/edid: add a helper to compare two EDIDs
In-Reply-To: <20240818-amdgpu-drm_edid-v1-10-aea66c1f7cf4@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
 <20240818-amdgpu-drm_edid-v1-10-aea66c1f7cf4@weissschuh.net>
Date: Mon, 19 Aug 2024 11:45:34 +0300
Message-ID: <871q2k7vf5.fsf@intel.com>
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

On Sun, 18 Aug 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> As struct drm_edid is opaque, drivers can't directly memcmp() the
> contained data. Add a helper to provide this functionality.

I'm not sure why drivers would need to compare EDIDs.

The only user was added in commit eb815442e840 ("drm/amd/display: don't
create new dc_sink if nothing changed at detection") with absolutely no
explanation why.

Other drivers use connector->epoch_counter to see if the EDID or status
changed.


BR,
Jani.


>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 69fb11741abd..c2493c983a64 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1840,6 +1840,24 @@ static bool drm_edid_eq(const struct drm_edid *drm=
_edid,
>  	return true;
>  }
>=20=20
> +/**
> + * drm_edid_equal - compare two EDID
> + * @drm_edid_a: First EDID data
> + * @drm_edid_b: Second EDID data
> + *
> + * Compare two EDIDs for equality (including extensions)
> + *
> + * Return: True if the EDIDs are equal, false otherwise.
> + */
> +bool drm_edid_equal(const struct drm_edid *drm_edid_a, const struct drm_=
edid *drm_edid_b)
> +{
> +	if (!drm_edid_b)
> +		return !drm_edid_a;
> +
> +	return drm_edid_eq(drm_edid_a, drm_edid_b->edid, drm_edid_b->size);
> +}
> +EXPORT_SYMBOL(drm_edid_equal);
> +
>  enum edid_block_status {
>  	EDID_BLOCK_OK =3D 0,
>  	EDID_BLOCK_READ_FAIL,
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index a5b377c4a342..35b40a9d3350 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -456,6 +456,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
>  const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
>  void drm_edid_free(const struct drm_edid *drm_edid);
> +bool drm_edid_equal(const struct drm_edid *drm_edid_a, const struct drm_=
edid *drm_edid_b);
>  bool drm_edid_valid(const struct drm_edid *drm_edid);
>  const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
>  const struct drm_edid *drm_edid_read(struct drm_connector *connector);

--=20
Jani Nikula, Intel
