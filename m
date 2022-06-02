Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5053BD0C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD910E754;
	Thu,  2 Jun 2022 17:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AD910E317;
 Thu,  2 Jun 2022 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654190066; x=1685726066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XWMNM047abNXRfr5V0aWHpuHxyep69MYxrOYbnVDepY=;
 b=HgWzwQspF6UkMNkJvZyb6CqmWjnrnRMhc6EJe3PAN4QKaZ1lHu+o0Xlg
 /8+sEfh9mdqhK3/kX7hLnMLkj0KiYuykNSOft0V2Un9fOo3oBPidKRXUs
 gn8vBHx+ARvS8vrqL0E/Q5g+BEzh/9lJaXZTavV06d8o3JZlk8MM1O5YB
 ENL7TdkyLcwnBs7r3RLVlssKYd/oZawzORwjoQgOk2+tXmDcGEQduERj9
 gBmzGHbCaonTCmV0x2icD8+YguAE8xtGSY2Fx/5wlaNN9Mdh507htNdFU
 IA/TIV4zy/ewTLNk9vu05V0mRaHpa27TsXUadcKqCZJvis30pv1vy0Ivl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="276024951"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="276024951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="552933798"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga006.jf.intel.com with SMTP; 02 Jun 2022 10:14:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 20:14:06 +0300
Date: Thu, 2 Jun 2022 20:14:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 06/13] drm/probe-helper: make .get_modes() optional,
 add default action
Message-ID: <Ypjv3k6tbHjOtGOB@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a38b2547f43e827a401a4123744edbb402e9f4d7.1653381821.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a38b2547f43e827a401a4123744edbb402e9f4d7.1653381821.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 01:39:28PM +0300, Jani Nikula wrote:
> Add default action when .get_modes() not set. This also defines what a
> .get_modes() hook should do.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c       | 14 +++++++++++++-
>  include/drm/drm_modeset_helper_vtables.h |  4 ++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 836bcd5b4cb6..9df17f0ae225 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -360,7 +360,19 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
>  		connector->helper_private;
>  	int count;
>  
> -	count = connector_funcs->get_modes(connector);
> +	if (connector_funcs->get_modes) {
> +		count = connector_funcs->get_modes(connector);
> +	} else {
> +		const struct drm_edid *drm_edid;
> +
> +		/* Note: This requires connector->ddc is set */
> +		drm_edid = drm_edid_read(connector);
> +
> +		/* Update modes etc. from the EDID */
> +		count = drm_edid_connector_update(connector, drm_edid);
> +
> +		drm_edid_free(drm_edid);
> +	}

Not really a huge fan of this automagic fallback. I think I'd prefer
to keep it mandatory and just provide this as a helper for drivers to
plug into the right spot. Otherwise I'm sure I'll forget how this works
and then I'll be confused when I see a connector withput any apparent
.get_modes() implementation.

>  
>  	/*
>  	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index fafa70ac1337..b4402bc64e57 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -894,6 +894,10 @@ struct drm_connector_helper_funcs {
>  	 * libraries always call this with the &drm_mode_config.connection_mutex
>  	 * held. Because of this it's safe to inspect &drm_connector->state.
>  	 *
> +	 * This callback is optional. By default, it reads the EDID using
> +	 * drm_edid_read() and updates the connector display info, modes, and
> +	 * properties using drm_edid_connector_update().
> +	 *
>  	 * RETURNS:
>  	 *
>  	 * The number of modes added by calling drm_mode_probed_add().
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
