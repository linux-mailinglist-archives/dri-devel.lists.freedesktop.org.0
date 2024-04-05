Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48008997C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52367113A5B;
	Fri,  5 Apr 2024 08:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MI4QinSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA82113A58;
 Fri,  5 Apr 2024 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305619; x=1743841619;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wMScudArYXBxbhNnw6t/ypNfdIQOnR8G5F+GW7oAYBM=;
 b=MI4QinSg/CFbV5Qg050F3mWxhtH7oiTQZYY9Y197YgjdlImjnuTSt92h
 6dvFLli65Gv4bvC6PFAYsfXCCcxDNODsE/JN7g7UUyH2Q2KcLEjJki9lx
 00KeOFiQTC1iJwIVLmb2qZTQn5GRn4yjOH/MFRP4R5giW1E5PsDWaHXkZ
 NngTP5tQ7wIi5PqyqOvppeup+KzlwBUzWe95sQhRiTPndlkXhmc24C846
 UGPl3KvyQQi2ISFf5XpJyIPN9kNzZSpmq6kd+8s5DTvFa8pV7OimdorNj
 hYkf/F1fjrAHGkoT1Ed5G5WR0NAJ1VnEkZsYHd6p5jA2PWK8ha7/Je0Ig A==;
X-CSE-ConnectionGUID: /8Xc1dGGRDuN7lCETX5t/Q==
X-CSE-MsgGUID: iBnhTawtTridc2KawI6sBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7752577"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7752577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:26:58 -0700
X-CSE-ConnectionGUID: e5EmnS3iT+iYPGCyqffw1w==
X-CSE-MsgGUID: PQPEg2zhTJ+DrNu/Gmw8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19092710"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:26:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 08/12] drm/client: Extract drm_connector_first_mode()
In-Reply-To: <20240404203336.10454-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-9-ville.syrjala@linux.intel.com>
Date: Fri, 05 Apr 2024 11:26:53 +0300
Message-ID: <874jcgcj02.fsf@intel.com>
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

On Thu, 04 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use a consistent method for picking the first mode from the
> connnector's mode list.

Patches 1-8 inclusive are

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 08fc896885dd..1fba6cd8d761 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -159,6 +159,13 @@ drm_connector_preferred_mode(struct drm_connector *c=
onnector, int width, int hei
>  	return NULL;
>  }
>=20=20
> +static const struct drm_display_mode *
> +drm_connector_first_mode(struct drm_connector *connector)
> +{
> +	return list_first_entry_or_null(&connector->modes,
> +					struct drm_display_mode, head);
> +}
> +
>  static const struct drm_display_mode *
>  drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>  {
> @@ -439,10 +446,8 @@ static bool drm_client_target_preferred(struct drm_c=
onnector *connectors[],
>  			modes[i] =3D drm_connector_preferred_mode(connector, width, height);
>  		}
>  		/* No preferred modes, pick one off the list */
> -		if (!modes[i] && !list_empty(&connector->modes)) {
> -			list_for_each_entry(modes[i], &connector->modes, head)
> -				break;
> -		}
> +		if (!modes[i])
> +			modes[i] =3D drm_connector_first_mode(connector);
>  		/*
>  		 * In case of tiled mode if all tiles not present fallback to
>  		 * first available non tiled mode.
> @@ -684,9 +689,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  		if (!modes[i] && !list_empty(&connector->modes)) {
>  			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
>  				      connector->name);
> -			modes[i] =3D list_first_entry(&connector->modes,
> -						    struct drm_display_mode,
> -						    head);
> +			modes[i] =3D drm_connector_first_mode(connector);
>  		}
>=20=20
>  		/* last resort: use current mode */

--=20
Jani Nikula, Intel
