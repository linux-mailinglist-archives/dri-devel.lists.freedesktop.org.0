Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMXBJWk+oGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:36:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05BA1A5C58
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448610E915;
	Thu, 26 Feb 2026 12:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaY01Kfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0052310E915;
 Thu, 26 Feb 2026 12:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772109415; x=1803645415;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WP8VCsqArkYGDsNuzpr/+FPOUUhNlmFOAI0kMtwHVLw=;
 b=VaY01KfjBbu3+nyvKJHgMWgDLyhvni/IfvaAqlxi+zKCIxq5hyzGEGWV
 1i9jPNvarZlceQsubPgCoF95ctE+tOaq5jJi0fHjy2jXw1Wgw2VsjTRqf
 6wQ+oXaS+/QiVt7PfNP3krT5a38ShYUmhGgbV9ZDp3RHASdP+/rOlpRXq
 J//KbRNWD3YskZagZi3rHWH6qs5+Ky9GYRVTqpJhm82wKHnKx+15IKw6c
 gcho9DmH4ns6BW/H2iSw6kMENjvU5PZiOWg6N0ysHhyxzAle9cW1uHeWK
 KHX2GKuUG0c6ubaelY1z66P28T/FfLJlBDYQl4GcqfuYYROAYV3S/Rocb A==;
X-CSE-ConnectionGUID: nHcs1BB1SISWndvCuQIaAg==
X-CSE-MsgGUID: XruaG1jSRA6WMReXm0TMAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73142148"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73142148"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:36:54 -0800
X-CSE-ConnectionGUID: /YwBkTyxQI+vCWK6997RDQ==
X-CSE-MsgGUID: zOx4elIAQtqe/PvVQDGGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214106975"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:36:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tomasz.pakula.oficjalny@gmail.com, bernhard.berger@gmail.com,
 michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: Re: [PATCH v4 07/27] drm/amd/display: Use bigger VRR range if found
 in AMD vsdb
In-Reply-To: <20260216164516.36803-8-tomasz.pakula.oficjalny@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
 <20260216164516.36803-8-tomasz.pakula.oficjalny@gmail.com>
Date: Thu, 26 Feb 2026 14:36:44 +0200
Message-ID: <7da80c4be3e20c126017646f783b80136bb0700e@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B05BA1A5C58
X-Rspamd-Action: no action

On Mon, 16 Feb 2026, Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>=
 wrote:
> [Why]
> Some monitors only expose their full VRR range in AMD vsdb for some
> reason.
>
> [How]
> Compare exposed ranges and use the bigger one.
> Only adjust lower limit if it doesn't support LFC
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4177
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b3bf5e0c19a5..f36059bb0324 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13269,6 +13269,34 @@ static bool copy_range_to_amdgpu_connector(struc=
t drm_connector *conn)
>  	return is_freesync_capable(range);
>  }
>=20=20
> +static void extend_range_from_vsdb(struct drm_display_info *display,
> +				   const struct amdgpu_hdmi_vsdb_info *vsdb)
> +{
> +	u16 vrr_min =3D display->monitor_range.min_vfreq;
> +	u16 vrr_max =3D display->monitor_range.max_vfreq;
> +
> +	/* Always extend upper limit */
> +	if (vsdb->max_refresh_rate_hz > vrr_max)
> +		vrr_max =3D vsdb->max_refresh_rate_hz;
> +
> +	/*
> +	 * Only extend lower limit if current one disables LFC.
> +
> +	 * During widespread testing, we found that some manufacturers probably
> +	 * had issues with their monitors' lower VRR boundaries and adjusted
> +	 * them up (Gigabyte X34GS with official range 48 - 180, AMD vsdb 48 -
> +	 * 180 yet Monitor Ranges 55 - 180). After setting the lower boundary
> +	 * from AMD vsdb, such monitors start having blanking issues.
> +	 *
> +	 * Work around that by not touching VRR min if it still supports LFC.
> +	 */
> +	if (vsdb->min_refresh_rate_hz < vrr_min && (vrr_min * 2 >=3D vrr_max))
> +		vrr_min =3D vsdb->min_refresh_rate_hz;
> +
> +	display->monitor_range.min_vfreq =3D vrr_min;
> +	display->monitor_range.max_vfreq =3D vrr_max;

Random driver code should *not* modify struct drm_display_info,
especially the fields that drm_edid.c parses. Drivers should cease to
parse EDID and DisplayID altogether.

I'm on the verge of NAKing, to the extent that I have control over this,
any further improvements on driver EDID/DisplayID parsing, with the
expectation that everything's moved to shared EDID parser in drm_edid.c
first, and improved there.

BR,
Jani.


> +}
> +
>  /**
>   * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
>   *
> @@ -13339,6 +13367,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_co=
nnector *connector,
>  		if (is_monitor_range_invalid(connector))
>  			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
>=20=20
> +		/* Try extending range if found in AMD vsdb */
> +		extend_range_from_vsdb(&connector->display_info, &vsdb_info);
> +
>  		if (dpcd_caps.allow_invalid_MSA_timing_param)
>  			freesync_capable =3D copy_range_to_amdgpu_connector(connector);

--=20
Jani Nikula, Intel
