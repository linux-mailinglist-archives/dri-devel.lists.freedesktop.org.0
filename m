Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCF78D5C3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A03110E511;
	Wed, 30 Aug 2023 12:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C510E511;
 Wed, 30 Aug 2023 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397200; x=1724933200;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ydRV2HSjaM4ocjlXKYS0Upb3ZnKvUWOWDFBUa6QJngY=;
 b=ZA2tiew7ZYY4A3FINRd34KVbtxM6IYM9FLUoabKHUsy2VehD5wfKEfL1
 z7KA4QxqHv5a1GHpH6FfSTbKmCpRxp5WNgm3kmAx3cWPl9wihTtG5yN++
 LI4+QTp4ITVGE8gXrOTqZtH76sNx+iA9CWBQ56uXXpscYg7+++tiy9zyS
 5oHFWyzconwcBm5DkZ1Pm+gOxDWYSOAm+BHHBr75jFNDBKbgz/zca5oms
 //gmw0dxAKzzJPScwqdVlN2UrFccsxiJeX6CDXNXp6Lo2BgCljkGqKkKB
 jX/cQOEkdv/UwPm7AuVxY1UedhrxTeYdtBuNZfjLZK90TLZGdarO/vVYs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379373717"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379373717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882731488"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:06:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 06/12] drm/i915/dvo: Populate connector->ddc
In-Reply-To: <20230829113920.13713-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-7-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:06:35 +0300
Message-ID: <87jztczqd0.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Populate connector->ddc, and thus create the "ddc" symlink
> in sysfs for DVO connectors.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dvo.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i=
915/display/intel_dvo.c
> index b386894c3a6d..d9f427856fb8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_dvo.c
> @@ -328,7 +328,6 @@ intel_dvo_detect(struct drm_connector *_connector, bo=
ol force)
>  static int intel_dvo_get_modes(struct drm_connector *_connector)
>  {
>  	struct intel_connector *connector =3D to_intel_connector(_connector);
> -	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
>  	int num_modes;
>=20=20
>  	/*
> @@ -337,8 +336,7 @@ static int intel_dvo_get_modes(struct drm_connector *=
_connector)
>  	 * (TV-out, for example), but for now with just TMDS and LVDS,
>  	 * that's not the case.
>  	 */
> -	num_modes =3D intel_ddc_get_modes(&connector->base,
> -					intel_gmbus_get_adapter(i915, GMBUS_PIN_DPC));
> +	num_modes =3D intel_ddc_get_modes(&connector->base, connector->base.ddc=
);
>  	if (num_modes)
>  		return num_modes;
>=20=20
> @@ -533,9 +531,10 @@ void intel_dvo_init(struct drm_i915_private *i915)
>  		connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
>  			DRM_CONNECTOR_POLL_DISCONNECT;
>=20=20
> -	drm_connector_init(&i915->drm, &connector->base,
> -			   &intel_dvo_connector_funcs,
> -			   intel_dvo_connector_type(&intel_dvo->dev));
> +	drm_connector_init_with_ddc(&i915->drm, &connector->base,
> +				    &intel_dvo_connector_funcs,
> +				    intel_dvo_connector_type(&intel_dvo->dev),
> +				    intel_gmbus_get_adapter(i915, GMBUS_PIN_DPC));
>=20=20
>  	drm_connector_helper_add(&connector->base,
>  				 &intel_dvo_connector_helper_funcs);

--=20
Jani Nikula, Intel Open Source Graphics Center
