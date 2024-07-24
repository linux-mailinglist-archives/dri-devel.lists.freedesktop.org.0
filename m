Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468D93AE5D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6FB89C46;
	Wed, 24 Jul 2024 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlySR6am";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244FA89C46
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721812285; x=1753348285;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v7lWae4MKXSyR/ZlzyM8ha8K/WcFnzmB9NS7KcHEi3w=;
 b=XlySR6am58/SSmOQzCSwC7/NHp9abrxgKNEVTbZ1zV/09K3/0GfvH67f
 55CfDvRAyXJA0jGwxIM777bHx0K8hIkZNbibPIXP8D3Twhuvz26+SmiOC
 VSox6lH/y3Dh2MMeJxkhgB1OiDjc0ae5WyBmiY6XEUhcNPnrG3n5L+8ys
 GiQNVLNA0Q6uyEKxkMoXaRboC74DZtkZ1EOv8s1IAVU9QsV2btHUMeptq
 jOSVcgV0P2LdEDjN+C+hmQuLsKqk5VpipcBFhku0NgS1q73TA22E+iM3g
 6udLzqqIIDos2OoAf+2qLdTWjC54oBqkP47Wt+NNv2GXh6dwsH1tUaI6X A==;
X-CSE-ConnectionGUID: pN0qJpJYTKOPayFoIOUUgw==
X-CSE-MsgGUID: 5mhA/izLQbKvcB2Z+B/K/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19287635"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19287635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:11:24 -0700
X-CSE-ConnectionGUID: M+bHBMbRRZmCCd16bwltcw==
X-CSE-MsgGUID: PAErH09yRPCJKgGJJ7Ye+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="56839751"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:11:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ma Ke
 <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] drm/client: fix null pointer dereference in
 drm_client_modeset_probe
In-Reply-To: <20240724065155.1491111-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240724065155.1491111-1-make24@iscas.ac.cn>
Date: Wed, 24 Jul 2024 12:11:15 +0300
Message-ID: <87o76nf93g.fsf@intel.com>
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
> Changes in v2:
> - added the recipient's email address, due to the prolonged absence of a 
> response from the recipients.
> - added Cc stable.
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 31af5cf37a09..cca37b225385 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -880,6 +880,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  
>  			kfree(modeset->mode);
>  			modeset->mode = drm_mode_duplicate(dev, mode);
> +			if (!modeset->mode)
> +				continue;
> +

Why would you continue in this case?

BR,
Jani.

>  			drm_connector_get(connector);
>  			modeset->connectors[modeset->num_connectors++] = connector;
>  			modeset->x = offset->x;

-- 
Jani Nikula, Intel
