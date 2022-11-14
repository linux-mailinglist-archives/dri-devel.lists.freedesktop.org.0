Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D604D627D96
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DD010E0A8;
	Mon, 14 Nov 2022 12:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79D210E095;
 Mon, 14 Nov 2022 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668428452; x=1699964452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rvPmNzCoa8n8SixsXezw6M9E+Ll3YuySZ4TJDTq+LLk=;
 b=EOKVVRvIhiBJ/bfxnSypH2N5XJVuchVpPD+pRE2t3VM/+fLNXGz+qzeb
 KnVagiHooadFxDghXfYmPGLE60fQPf6DO/3rOb1giWjcb3rT7EVFYx8NT
 VqcwI/g2BvrktaqaSNOwbSuAM8SaGh8sN97SZoaz0P7Jkw5Y92+dcVWXu
 5B+Z/03GR1rPBX+Q7kqR8kvNxVrq5w5R7nw4qAputiIP9lqZgtICzJMNr
 zK3XqnC3JmgxK6kQbXfPAoVFzFEubKgGy0GXhNJIW5BFktjZm1fKcWFkw
 kAhYbtiYps98wQilrZpF6v+OTVftQdxL+rFvfilajSlmynv0EEg+HrvL4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313758172"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313758172"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="616291804"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="616291804"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 14 Nov 2022 04:20:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Nov 2022 14:20:45 +0200
Date: Mon, 14 Nov 2022 14:20:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm: mark drm.debug-on-dyndbg as BROKEN
 for now
Message-ID: <Y3IynYl3Ejb6NTAd@intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
 <20221111221715.563020-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111221715.563020-2-jim.cromie@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 03:17:09PM -0700, Jim Cromie wrote:
> drm.debug-on-dyndbg has a regression, due to a chicken-egg
> initialization problem:
> 
> 1- modprobe i915
>    i915 needs drm.ko, which is loaded 1st
> 
> 2- "modprobe drm drm.debug=0x1ff" (virtual/implied)
>    drm.debug is set post-initialization, from boot-args etc
> 
> 3- `modprobe i915` finishes
> 
> W/O drm.debug-on-dyndbg that just works, because all drm_dbg*
> callsites use drm_debug_enabled() to check __drm_debug & DEM_UT_<CAT>
> before printing.
> 
> But the whole point of drm.debug-on-dyndbg is to avoid that runtime
> test, by enabling (at post-modinit) a static-key at each callsite in
> the just-loaded module.
> 
> And since drm.ko is loaded before all dependent modules, none are
> "just-loaded", and no drm.debug callsites are present yet, except
> those in drm.ko itself.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 34f5a092c99e..0d1e59e6bb7e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -54,6 +54,7 @@ config DRM_DEBUG_MM
>  config DRM_USE_DYNAMIC_DEBUG
>  	bool "use dynamic debug to implement drm.debug"
>  	default y

Could you switch to 'default n' as well? i915 CI actually enables
BROKEN so that we can test some more experimental stuff which is
hidden behind BROKEN for normal users.

> +	depends on BROKEN	# chicken-egg initial enable problem
>  	depends on DRM
>  	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>  	depends on JUMP_LABEL
> -- 
> 2.38.1

-- 
Ville Syrjälä
Intel
