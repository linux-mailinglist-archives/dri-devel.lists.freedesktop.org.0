Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED9873416
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 11:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C831810E1CA;
	Wed,  6 Mar 2024 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQUJ6b0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F3010E1CA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709720738; x=1741256738;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=El+OOs5pi7lzmVrizlMxTEsWscK7ZxT9Eu6oAzyd4V4=;
 b=DQUJ6b0XCYSs1v9ehONBqixV7N3fprq+YbZxeM9C58Qb4flDl7ToFfTx
 z0AaJVpHKlG2L7Ylxm8GAWACnSEO0sBD8lyYhiL8hly09KUHQMK7YG6i9
 fYfxazXIDAZxsFB0DQZ3AX/wtHk8r19hnTQl5KQkb1ENpcmBRjt4AUSVX
 WE/4vLHmhz5NZH8p2Jk2Z5U5+oZuX2xxE+n+qJnTNlZKfAc+AlskrFrEo
 O5O5aCypsKQD83L/AthZHmpNHoXlja/m0v3ZndgnIi9sAAzJV23uuy2rW
 61cTuC5Ky4jDkmhBx+A5vPgTTrzQa7eJ8ch0U3i7i6UsHhq0fJw+emaSf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21778850"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="21778850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9587507"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:25:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Hsin-Te
 Yuan <yuanhsinte@chromium.org>
Subject: Re: [PATCH v3] drm/bridge: anx7625: Update audio status while
 detecting
In-Reply-To: <20240306-anx7625-v3-1-9034263bf530@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306-anx7625-v3-1-9034263bf530@chromium.org>
Date: Wed, 06 Mar 2024 12:25:30 +0200
Message-ID: <87frx3zmg5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 06 Mar 2024, Hsin-Te Yuan <yuanhsinte@chromium.org> wrote:
> Previously, the audio status was not updated during detection, leading
> to a persistent audio despite hot plugging events. To resolve this
> issue, update the audio status during detection.
>
> Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v3:
> - Add Fixes tag. 

You don't need to send another version just to update commit message
trailers. They can either be added while applying, or when you need to
update the patch anyway.

Or, if b4 is used to apply the patches, it can automagically pick up the
trailers from replies to the patch with the Fixes: trailer.

> - Link to v2: https://lore.kernel.org/r/20240306-anx7625-v2-1-7138e00b25bf@chromium.org
>
> Changes in v2:
> - Add a space after the colons in the subject line.
> - Link to v1: https://lore.kernel.org/r/20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 29d91493b101a..9f0d0c5b8ebf5 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2481,15 +2481,22 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
>  	mutex_unlock(&ctx->aux_lock);
>  }
>  
> +static void
> +anx7625_audio_update_connector_status(struct anx7625_data *ctx,
> +				      enum drm_connector_status status);
> +
>  static enum drm_connector_status
>  anx7625_bridge_detect(struct drm_bridge *bridge)
>  {
>  	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>  	struct device *dev = ctx->dev;
> +	enum drm_connector_status status;
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
>  
> -	return anx7625_sink_detect(ctx);
> +	status = anx7625_sink_detect(ctx);
> +	anx7625_audio_update_connector_status(ctx, status);
> +	return status;
>  }
>  
>  static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,

I guess this could be applied with less context (-C 2) but the baseline
is old. In drm-misc-next, all of drm/bridge has moved on to struct
drm_edid.

BR,
Jani.


>
> ---
> base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
> change-id: 20240305-anx7625-fe16d3a9d37d
>
> Best regards,

-- 
Jani Nikula, Intel
