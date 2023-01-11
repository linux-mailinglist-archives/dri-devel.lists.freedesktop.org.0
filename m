Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62663665FFE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C610E795;
	Wed, 11 Jan 2023 16:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A2B10E787;
 Wed, 11 Jan 2023 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673453153; x=1704989153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yS1Tx9MBv2MTrnHDrpfFP/1IYvWDkXEmBZQT9Uxwuqg=;
 b=jCyjK+8TJID2nkW+w4hMSPExvK0TNwRgKmUds9P7DMFD7Vv2O48iBW1g
 nk877iid91UkneusAJFBamJ/TSQoG7mwbgC6Jugd32OwquVnr3luWdEob
 uBN/bmnx0RIzspof2l1e3sHIgSDG/IocSdPnm2j7WVtri8PB2hKDJqsTT
 S6WGjX7oL5RQry26u5nUdQk++ijzbLFR9Wbmhblsg0EVgrvCyKS8utHaQ
 cVjjRp2YEBp7l80y/9qJCeFLYVvNHNPOXDBvi3jmnPO7mManGPd4rKfZ6
 l1PbdNBymqWWJuXJ+xYXRcG7vBDlD8+j27rf/UIRWUiYfNcxZxgJbG3Vo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="387919018"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="387919018"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:03:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="720769406"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="720769406"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 11 Jan 2023 08:03:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 18:03:31 +0200
Date: Wed, 11 Jan 2023 18:03:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/10] drm: Don't include <linux/fb.h> in
 drm_crtc_helper.h
Message-ID: <Y77d0x9ZV5ZZyT/0@intel.com>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111130206.29974-4-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, liviu.dudau@arm.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 02:01:59PM +0100, Thomas Zimmermann wrote:
> Including <linux/fb.h> in drm_crtc_helper.h is not required. Remove
> the include statement and avoid rebuilding DRM whenever the fbdev
> header changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/drm/drm_crtc_helper.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
> index 1840db247f69..072bc4f90349 100644
> --- a/include/drm/drm_crtc_helper.h
> +++ b/include/drm/drm_crtc_helper.h
> @@ -37,8 +37,6 @@
>  #include <linux/types.h>
>  #include <linux/idr.h>

^ bunch of other unnecessary headers there as well.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
> -#include <linux/fb.h>
> -
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_modeset_helper.h>
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
