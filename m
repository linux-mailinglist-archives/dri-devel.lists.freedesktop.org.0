Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19798FFD5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379AB10E298;
	Fri,  4 Oct 2024 09:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUdMGzcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC2C10E292;
 Fri,  4 Oct 2024 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034523; x=1759570523;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UQxt7P3rJbVv3nJmizgjQW+tNdKSX/yyh7YNv4PHuRA=;
 b=UUdMGzcFGYIGJvLKDaE7IW47dpA/quS7NN9jLGRVzP+zTptl3gOcAyoR
 wX8FD8xD2Z0p1pOhnxF6lTGDxBaze5UpeSl4mUwGG+5DRimEVzLbIJQ3J
 5SbHW/n7J5mxfH9iL0C4aAXWvnIkv3u59CrlTjGd+zBInrOgxK9ZEOtIb
 ybu2wB4D+/c01ZCndakH7XYR6LIs8is3chsEa+uQIgzi+8e24174MEoJl
 sgGJGvM6NlEvEhtSOww/uXXNKqGyGzVH+Ze5pqRriGu/20gB5OC6j4KJf
 IDuEUz4Z2CLrxv2CSUBXNgWhxQcQdm6Zj6sFegUytmH2C5VRjEfu9aM2w w==;
X-CSE-ConnectionGUID: lM4fPvuXRyyzFdTdKE2qLw==
X-CSE-MsgGUID: 6yPsi9EQRdSwxND+cTZstA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26719588"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="26719588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:35:21 -0700
X-CSE-ConnectionGUID: 9qP1XI4tTc6Zuy+qvAB0Ig==
X-CSE-MsgGUID: KQ5uu+XfSyipBbo8HVA2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="79493790"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:35:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Remove kstrdup_const() and
 kfree_const() usage
In-Reply-To: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
Date: Fri, 04 Oct 2024 12:35:13 +0300
Message-ID: <87h69srz1q.fsf@intel.com>
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

On Thu, 03 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> kstrdup_const() and kfree_const() can be confusing in code built as a
> module. In such a case, it does not do what one could expect from the name
> of the functions.
>
> The code is not wrong by itself, but in such a case, it is equivalent to
> kstrdup() and kfree().
>
> So, keep thinks simple and straightforward.
>
> This reverts commit 379b63e7e682 ("drm/i915/display: Save a few bytes of
> memory in intel_backlight_device_register()")

Sorry, I guess I'm confused here. Or I just didn't read the commit
message to [1] properly. Or both.

So the whole point of [1] was that the _const versions can be confusing
if i915 is builtin? But not wrong?

BR,
Jani.


[1] https://lore.kernel.org/r/3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr



>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 9e05745d797d..3f81a726cc7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -949,7 +949,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  	else
>  		props.power = BACKLIGHT_POWER_OFF;
>  
> -	name = kstrdup_const("intel_backlight", GFP_KERNEL);
> +	name = kstrdup("intel_backlight", GFP_KERNEL);
>  	if (!name)
>  		return -ENOMEM;
>  
> @@ -963,7 +963,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  		 * compatibility. Use unique names for subsequent backlight devices as a
>  		 * fallback when the default name already exists.
>  		 */
> -		kfree_const(name);
> +		kfree(name);
>  		name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>  				 i915->drm.primary->index, connector->base.name);
>  		if (!name)
> @@ -987,7 +987,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  		    connector->base.base.id, connector->base.name, name);
>  
>  out:
> -	kfree_const(name);
> +	kfree(name);
>  
>  	return ret;
>  }

-- 
Jani Nikula, Intel
