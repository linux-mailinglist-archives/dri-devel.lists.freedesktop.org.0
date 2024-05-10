Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C48C2438
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC0E10E217;
	Fri, 10 May 2024 12:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/b3mZv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7A10E217
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715342526; x=1746878526;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4C7DOcXXxUjcar+h6n88HJ2Ag/CZKmZBqGERvtf4SHE=;
 b=Z/b3mZv0F/SXf6iDwMItuI1xlIVjoxHe5waz/pzyjjkvw4IQShi9QUjP
 IlpeyqJqzTWjR2mvSyIcJ940OK7ghFWYWfhAXXMQXLjrHyJ19ooIeXjDj
 5sKocffeDpNJ5nsid9+KGdowD8+00mpNduzUw4ZJZyePiG8YK7h5RRXLA
 wCFGWpf+uXFiFhDPqvdFzlBoPUHnkXNOwcVvL0gEKq70hnd5m7jd3PgZW
 W60lgxxrGsFhUUaskXRRQzPM9GIx9oSFPbm2rvXBDzG8pvhmF6sIYvaju
 oiJK8eCrPnqcafwGMe/V7F1gU6YY9mgjbS+SscSsMdqQTYoxlg2UJZ1IZ g==;
X-CSE-ConnectionGUID: zPmLfT9lR62Uw/acRIwHLQ==
X-CSE-MsgGUID: iW4uQuuoTTyxMYRFmPhwag==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33831124"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="33831124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:01:46 -0700
X-CSE-ConnectionGUID: jNI7gh/hRZCBWO5ZAU9png==
X-CSE-MsgGUID: /Yq529mLQIq8URjE0F0t+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29542616"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:01:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Robert Tarasov <tutankhamen@chromium.org>, Alex
 Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/5] drm/udl: Remove DRM_CONNECTOR_POLL_HPD
In-Reply-To: <20240410120928.26487-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-2-tzimmermann@suse.de>
Date: Fri, 10 May 2024 15:01:39 +0300
Message-ID: <874jb5j2os.fsf@intel.com>
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

On Wed, 10 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> DisplayLink devices do not generate hotplug events. Remove the poll
> flag DRM_CONNECTOR_POLL_HPD, as it may not be specified together with
> DRM_CONNECTOR_POLL_CONNECT or DRM_CONNECTOR_POLL_DISCONNECT.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: afdfc4c6f55f ("drm/udl: Fixed problem with UDL adpater reconnection")
> Cc: Robert Tarasov <tutankhamen@chromium.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.15+

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 7702359c90c22..751da3a294c44 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -527,8 +527,7 @@ struct drm_connector *udl_connector_init(struct drm_device *dev)
>  
>  	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
>  
> -	connector->polled = DRM_CONNECTOR_POLL_HPD |
> -			    DRM_CONNECTOR_POLL_CONNECT |
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>  			    DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return connector;

-- 
Jani Nikula, Intel
