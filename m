Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778219EE3CF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA19210E10E;
	Thu, 12 Dec 2024 10:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYMn6af1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708C10E0D8;
 Thu, 12 Dec 2024 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998263; x=1765534263;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uKg15D5ltPyGSN1T+RiEwm030Ke7W5WL/AQIsUHs7b0=;
 b=ZYMn6af137EMqTWnvQVomi0iG+atYffqw9xchozHcR4wOx0IKZvDUNwC
 zfGNO/s/N8o5DhZdvAXRUqFbYkmvQKUSpBPeLE10HSVedeBo6YwwUZ5oi
 hwIYjzQTyF3LEEbA9RcQuQEl9zDqOlmlVdlU03vc2nP6HA+UqCiCNwUqy
 /89Y4URWk7jEFXA/dhUI5GrZ+qAmoaPXjHQTBXLqfyGLvfV0OBWMOeN1d
 gSmLhyt3KB2mvw2BiK5EiURkkiZXKbwrAFTI91W0g2TjS2swuQjwmdUVe
 OWS2aBbxSzZi5myANibrLVyD9CYUkq6S/vf2MZj+bxMeyk01iv7OLRgGj A==;
X-CSE-ConnectionGUID: O+cT3l1dTH2qmnej/LTD1A==
X-CSE-MsgGUID: RtfsocHGRZChPJAviNMcng==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51823685"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="51823685"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:11:03 -0800
X-CSE-ConnectionGUID: Hpy6+CWqT/6bgA/46y26Pg==
X-CSE-MsgGUID: 6PyPmMaTS4aR9HURG0s5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="101042684"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:11:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 03/11] drm/connector: Add deprication notes for
 drm_connector_register/unregister
In-Reply-To: <20241211230328.4012496-4-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-4-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:10:58 +0200
Message-ID: <87ed2dxlcd.fsf@intel.com>
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

On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> Drivers should register/unregister only dynamic (MST) connectors
> manually using drm_connector_dynamic_register()/unregister().
> Static connectors are registered/unregistered by the DRM core
> automatically. Some drivers still call drm_connector_register()/
> unregister() for static connectors, both of which should be a nop
> for them and hence are scheduled to be removed. Update the function
> documentation for these functions accordingly.

Typo *deprecation in subject, nitpick inline,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a53e5629ba6c1..c322dbf6e3161 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -767,14 +767,17 @@ EXPORT_SYMBOL(drm_connector_cleanup);
>   * drm_connector_register - register a connector
>   * @connector: the connector to register
>   *
> - * Register userspace interfaces for a connector. Only call this for connectors
> - * which can be hotplugged after drm_dev_register() has been called already,
> - * e.g. DP MST connectors. All other connectors will be registered automatically
> - * when calling drm_dev_register().
> + * Register userspace interfaces for a connector. Drivers shouldn't call this
> + * function. Static connectors will be registered automatically by DRM core
> + * from drm_dev_register(), dynamic connectors (MST) should be registered by
> + * drivers calling drm_connector_dynamic_register().
>   *
>   * When the connector is no longer available, callers must call
>   * drm_connector_unregister().
>   *
> + * Note: Existing uses of this function in drivers should be a nop already and
> + * are scheduled to be removed.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> @@ -863,9 +866,14 @@ EXPORT_SYMBOL(drm_connector_dynamic_register);
>   * drm_connector_unregister - unregister a connector
>   * @connector: the connector to unregister
>   *
> - * Unregister userspace interfaces for a connector. Only call this for
> - * connectors which have been registered explicitly by calling
> - * drm_connector_register().
> + * Unregister userspace interfaces for a connector. Drivers should call this
> + * for dynamic connectors (MST) only, which were registered explicitly by
> + * calling drm_connector_dynamic_register(). All other - static - connectors
> + * will be unregistered automatically by DRM core and drivers shouldn't call
> + * this function for those.

This kind of supports my point about a single
drm_connector_register(). There's no
drm_connector_dynamic_unregister(). After all the
drm_connector_register() calls have been removed, we're left with the
asymmetric pair:

- drm_connector_dynamic_register()
- drm_connector_unregister()

Then again, all of these should become internal and not for drivers?

> + *
> + * Note: Existing uses of this function in drivers for static connectors
> + * should be a nop already and are scheduled to be removed.
>   */
>  void drm_connector_unregister(struct drm_connector *connector)
>  {

-- 
Jani Nikula, Intel
