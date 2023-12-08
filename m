Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0780AC05
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 19:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB1B10EAF6;
	Fri,  8 Dec 2023 18:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B910EAF3;
 Fri,  8 Dec 2023 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702059968; x=1733595968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jqFHB0k8ZhUAwFWbMY6IvDe2wVUzWSwqt2KAC2vmses=;
 b=f36xyaQZoJ7oupQYwwXo5jUAG/Xq9XzWHpBdb7TNPlKww3gIcophEjQJ
 8T6bXep06Wl3dO8W0IhMHAm51MROa2iVSdo9t/rRZGJxsOgmw7QT/1IqK
 SE+JVEgGhNvJ4lhRbLQKep/1Zu907pdJzDabDuEIB1ZmpaSWJM5mqr5o2
 nJU2NFQL5TMJ5xZKMLhRvhshuby3b+gb/Y698HAhd72Tp6IiAe4hfSw2V
 kWORTf9xj6wZuWU9bOq8+X87XZRz8RB2X9Xjz788oiJ2SUVNdSLVl2y+K
 GHapl7ikyf6064gjYz5aqjTpk3OCNZayrSf1uvozhc/fKkNz0bz8/0O4r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="394186087"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="394186087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 10:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="765564374"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="765564374"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 08 Dec 2023 10:26:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 20:26:03 +0200
Date: Fri, 8 Dec 2023 20:26:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/edid: also call add modes in EDID
 connector update fallback
Message-ID: <ZXNfu6zcBy3JvbGd@intel.com>
References: <20231207093821.2654267-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207093821.2654267-1-jani.nikula@intel.com>
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
Cc: bbaa <bbaa@bbaa.fun>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 11:38:21AM +0200, Jani Nikula wrote:
> When the separate add modes call was added back in commit c533b5167c7e
> ("drm/edid: add separate drm_edid_connector_add_modes()"), it failed to
> address drm_edid_override_connector_update(). Also call add modes there.
> 
> Reported-by: bbaa <bbaa@bbaa.fun>
> Closes: https://lore.kernel.org/r/930E9B4C7D91FDFF+29b34d89-8658-4910-966a-c772f320ea03@bbaa.fun
> Fixes: c533b5167c7e ("drm/edid: add separate drm_edid_connector_add_modes()")
> Cc: <stable@vger.kernel.org> # v6.3+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index cb4031d5dcbb..69c68804023f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2311,7 +2311,8 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
>  
>  	override = drm_edid_override_get(connector);
>  	if (override) {
> -		num_modes = drm_edid_connector_update(connector, override);
> +		if (drm_edid_connector_update(connector, override) == 0)
> +			num_modes = drm_edid_connector_add_modes(connector);
>  
>  		drm_edid_free(override);
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
