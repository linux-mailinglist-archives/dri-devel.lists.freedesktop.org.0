Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B193AF8B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00ED10E095;
	Wed, 24 Jul 2024 10:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNjFB1sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E218010E095
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721815411; x=1753351411;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=r3nR0REmG7kZooPJAnuqkwEZtqjXLXvOL4nx11JK9vc=;
 b=JNjFB1sLpnsh2cIyc6d0H8G+huYlfWUWZIr3KhtcOY2aLRxHVkyoo4D7
 7AxZcnAOaO1Pe43OJHkxLVjFAEWGMtrUsQogE4q4Fuw7Lyncmrsgn3K5g
 eHlxp/mlQX8iF35FcO7ABrqk0ujB6OcyCkU17WQ3vVYrM+LjLYPwzwEeu
 07d3MfosaBVqq6SIeucwNuQgz0EuQubBYOhdwcHFQAU6SZB2KMH/ntjPj
 LBXitw09GJn6KvSUvv9zNM3R5qFIOPhsU6X0YbEsk4uL84l9y7OczCovE
 PYQ2K4zlDiC2AnbStuxB0oU8L8Yer2aw9KhLKPEnzJw0HjBcwCe9bEQiP w==;
X-CSE-ConnectionGUID: HhsRRLUlS56ZRvzmE1kzOA==
X-CSE-MsgGUID: +xpET6kmSJ6HUfQCNWrSVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="12685360"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="12685360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 03:03:30 -0700
X-CSE-ConnectionGUID: IiEjLHfJSbe1p3AJwHagfg==
X-CSE-MsgGUID: byMzT0Y5QOaj0BWYkyeRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="83543849"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 03:03:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ma Ke
 <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/client: fix null pointer dereference in
 drm_client_modeset_probe
In-Reply-To: <20240724094505.1514854-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240724094505.1514854-1-make24@iscas.ac.cn>
Date: Wed, 24 Jul 2024 13:03:22 +0300
Message-ID: <87ikwvf6ol.fsf@intel.com>
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

On Wed, 24 Jul 2024, Ma Ke <make24@iscas.ac.cn> wrote:
> In drm_client_modeset_probe(), the return value of drm_mode_duplicate() is
> assigned to modeset->mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Add a check to avoid npd.
>
> Cc: stable@vger.kernel.org
> Fixes: cf13909aee05 ("drm/fb-helper: Move out modeset config code")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v3:
> - modified patch as suggestions, returned error directly when failing to 
> get modeset->mode.

This is not what I suggested, and you can't just return here either.

BR,
Jani.


> Changes in v2:
> - added the recipient's email address, due to the prolonged absence of a 
> response from the recipients.
> - added Cc stable.
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 31af5cf37a09..750b8dce0f90 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -880,6 +880,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  
>  			kfree(modeset->mode);
>  			modeset->mode = drm_mode_duplicate(dev, mode);
> +			if (!modeset->mode)
> +				return 0;
> +
>  			drm_connector_get(connector);
>  			modeset->connectors[modeset->num_connectors++] = connector;
>  			modeset->x = offset->x;

-- 
Jani Nikula, Intel
