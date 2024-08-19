Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557095656D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6910E1ED;
	Mon, 19 Aug 2024 08:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k68PO4GB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320710E1F1;
 Mon, 19 Aug 2024 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724055692; x=1755591692;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FdmMdPYIoj7W27+BO4QGSsXKhs9rzS4dHO+SdICw1cw=;
 b=k68PO4GB+drr062M1VAHOgk33mnihdR1gnoINaipww+Y4ukvBGv4BEAt
 KzHmTJnwcQ5abvglF/IzFdX0qFC6ACTjx2EJ7ZNvCQ4mxJyM7W+NQ0pzY
 y4nNES2WyBRLiw+lFo3NI68AruwxoMHR62Y4XABDCWIueq680ImEFo8Jv
 tNUwWlZ5W8j8l+tznd+sr6lNpLjpjIfjyrCVwN534GBYNTWU0ymVxAqG4
 gJxqvD/lBvBE4hMey7QAJA5vKKKd4nmZTqSrnrC9LEMAO4Kl+4G+6e02f
 P+KIxFNMVarXQELiS5OKuC45foa5GcSY9CADmBnn9sneJtUD1O0Tb4SEH g==;
X-CSE-ConnectionGUID: bXAXNxmKR82fOMKNgXfdNg==
X-CSE-MsgGUID: CqBtWNJpTx25GWNduBlv9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26047205"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="26047205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:21:32 -0700
X-CSE-ConnectionGUID: VPQE/p4eTreE2cdmfee3Ow==
X-CSE-MsgGUID: tBYwa13lSh2fj5S0e+5eUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60454687"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:21:25 -0700
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
Subject: Re: [PATCH 03/12] drm/edid: constify argument of drm_edid_is_valid()
In-Reply-To: <20240818-amdgpu-drm_edid-v1-3-aea66c1f7cf4@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
 <20240818-amdgpu-drm_edid-v1-3-aea66c1f7cf4@weissschuh.net>
Date: Mon, 19 Aug 2024 11:21:21 +0300
Message-ID: <877ccc7wji.fsf@intel.com>
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
> drm_edid_is_valid() does not modify its argument, so mark it as const.

That's not true.

BR,
Jani.

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  include/drm/drm_edid.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f68a41eeb1fa..69fb11741abd 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2034,7 +2034,7 @@ EXPORT_SYMBOL(drm_edid_block_valid);
>   *
>   * Return: True if the EDID data is valid, false otherwise.
>   */
> -bool drm_edid_is_valid(struct edid *edid)
> +bool drm_edid_is_valid(const struct edid *edid)
>  {
>  	int i;
>=20=20
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 6bdfa254a1c1..a5b377c4a342 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -442,7 +442,7 @@ int drm_add_modes_noedid(struct drm_connector *connec=
tor,
>  int drm_edid_header_is_valid(const void *edid);
>  bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
>  			  bool *edid_corrupt);
> -bool drm_edid_is_valid(struct edid *edid);
> +bool drm_edid_is_valid(const struct edid *edid);
>  void drm_edid_get_monitor_name(const struct edid *edid, char *name,
>  			       int buflen);
>  struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,

--=20
Jani Nikula, Intel
