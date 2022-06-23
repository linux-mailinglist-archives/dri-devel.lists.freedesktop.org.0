Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC55575C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7711A3E7;
	Thu, 23 Jun 2022 08:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAC911A3E9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655973890; x=1687509890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DvLQhHKoFljUbzsMiIKGWm3CN2GsPetr2dFQ+RTZVN8=;
 b=n0cTEz/5dM1iXyipigkMJF6gMLv/W5JWOq4401LizprZYSxsTUY3faoZ
 WJkANoFpbZGpEXyr6W6R8BrzdwkGsII8ExnMduGqj7h8Of3lPnZ/S+0wo
 K0rhubGOmzOZhzLyz1f72iFxwVrjZvX2CGc4J3NM6KzGcCL2BWTY3aSX7
 3aA5JunYRTc3nRA3Vp5lfL+8X8WWgdEtYQkIzNz4dbO8LVutJMpGYXIOI
 emNxozdNIcGw9H6fp7x2W5Rtg6mjjz5mFVIpCAlEHFc0EmbKHdUQeN7OP
 wdRFDqLhbky/FpMnCqL9t8FSkWvFA00xQ7/KRjl8DT0PGkWe1hfJvqM6E w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="344653785"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="344653785"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:44:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592607523"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.61.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:44:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/display: Add drm_luminance_range_info
In-Reply-To: <20220620072019.2710652-2-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220620072019.2710652-1-jouni.hogander@intel.com>
 <20220620072019.2710652-2-jouni.hogander@intel.com>
Date: Thu, 23 Jun 2022 11:44:42 +0300
Message-ID: <87h74brcp1.fsf@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Add new data structure to store luminance range calculated using
> data from EDID's static hdr metadata block. Add this new struct
> as a part of drm_display_info struct.
>
> Cc: Roman Li <roman.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

LGTM but I think I'd just fold this into the next patch that actually
uses it.

BR,
Jani.

> ---
>  include/drm/drm_connector.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3ac4bf87f257..7d8eeac6cc68 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -322,6 +322,22 @@ struct drm_monitor_range_info {
>  	u8 max_vfreq;
>  };
>=20=20
> +/**
> + * struct drm_luminance_range_info - Panel's luminance range for
> + * &drm_display_info. Calculated using data in EDID
> + *
> + * This struct is used to store a luminance range supported by panel
> + * as calculated using data from EDID's static hdr metadata.
> + *
> + * @min_luminance: This is the min supported luminance value
> + *
> + * @max_luminance: This is the max supported luminance value
> + */
> +struct drm_luminance_range_info {
> +	u32 min_luminance;
> +	u32 max_luminance;
> +};
> +
>  /**
>   * enum drm_privacy_screen_status - privacy screen status
>   *
> @@ -623,6 +639,11 @@ struct drm_display_info {
>  	 */
>  	struct drm_monitor_range_info monitor_range;
>=20=20
> +	/**
> +	 * @luminance_range: Luminance range supported by panel
> +	 */
> +	struct drm_luminance_range_info luminance_range;
> +
>  	/**
>  	 * @mso_stream_count: eDP Multi-SST Operation (MSO) stream count from
>  	 * the DisplayID VESA vendor block. 0 for conventional Single-Stream

--=20
Jani Nikula, Intel Open Source Graphics Center
