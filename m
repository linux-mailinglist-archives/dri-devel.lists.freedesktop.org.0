Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B838D38EC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650910E2FB;
	Wed, 29 May 2024 14:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRFRYPhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2335710E2FB;
 Wed, 29 May 2024 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716992093; x=1748528093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=91LqUhcqm7aQDNXFER1289HrXrJMi31z3CJTTjdUUdg=;
 b=hRFRYPhZPi7l0/Caa2Kw/Nv9CQF/+KE2j82zvK2YPqR+2Xe3oQs0hGVM
 aBA4XqUGYfFrvlHiZ8J8JpP1dm5vjnqy/GENxJLYQ019Kjayr7bjtqLsA
 yvHXUYBobEEYHLtAheJ+NVh6G1+XgCnvR/QHTD423rRHFvo5W21IqE7+A
 Nhh0+V7KS3C6fWDxo5DhjN9//4QYsvrKxdNPVREq4+OumgfIpYu3i/IUg
 ADbtNQz3Jx9DjIb9CGBe2H74z93zurr+Lrf2hgTMXE175nTWCUxipiIdD
 ab48kS4pctrjnLsYtgKTJkXJTrr8JRcFBoQgGG80hSPt7F/PHm0TxI0OS Q==;
X-CSE-ConnectionGUID: MwmFLn+IRkiatjfj0rBRHQ==
X-CSE-MsgGUID: N0PcugynTMaIjgaKpBzxqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13346250"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13346250"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:14:52 -0700
X-CSE-ConnectionGUID: gfjwUD+ETqqOi74aEUnPvw==
X-CSE-MsgGUID: TKPn6DtTQy2SMKQYEMVB8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35419053"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 29 May 2024 07:14:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 May 2024 17:14:47 +0300
Date: Wed, 29 May 2024 17:14:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Chris Bainbridge <chris.bainbridge@gmail.com>, hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <Zlc4V1goFvU2antl@intel.com>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240528210319.1242-1-mario.limonciello@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 28, 2024 at 04:03:19PM -0500, Mario Limonciello wrote:
> If the lid on a laptop is closed when eDP connectors are populated
> then it remains enabled when the initial framebuffer configuration
> is built.
> 
> When creating the initial framebuffer configuration detect the ACPI
> lid status and if it's closed disable any eDP connectors.
> 
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Cc: hughsient@gmail.com
> v1->v2:
>  * Match LVDS as well
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 31af5cf37a09..0b0411086e76 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include "drm/drm_modeset_lock.h"
> +#include <acpi/button.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>  		enabled[i] = drm_connector_enabled(connectors[i], false);
>  }
>  
> +static void drm_client_match_edp_lid(struct drm_device *dev,
> +				     struct drm_connector **connectors,
> +				     unsigned int connector_count,
> +				     bool *enabled)
> +{
> +	int i;
> +
> +	for (i = 0; i < connector_count; i++) {
> +		struct drm_connector *connector = connectors[i];
> +
> +		switch (connector->connector_type) {
> +		case DRM_MODE_CONNECTOR_LVDS:
> +		case DRM_MODE_CONNECTOR_eDP:
> +			if (!enabled[i])
> +				continue;
> +			break;
> +		default:
> +			continue;
> +		}
> +
> +		if (!acpi_lid_open()) {
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
> +				    connector->base.id, connector->name);
> +			enabled[i] = false;
> +		}
> +	}
> +}

If you don't hook into some lid notify event how is one supposed to get
the display back to life after opening the lid?

> +
>  static bool drm_client_target_cloned(struct drm_device *dev,
>  				     struct drm_connector **connectors,
>  				     unsigned int connector_count,
> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  		memset(crtcs, 0, connector_count * sizeof(*crtcs));
>  		memset(offsets, 0, connector_count * sizeof(*offsets));
>  
> +		drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
>  		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
>  					      offsets, enabled, width, height) &&
>  		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
