Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09B89A465
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8234C10E605;
	Fri,  5 Apr 2024 18:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSjdyWw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866210E605;
 Fri,  5 Apr 2024 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712342756; x=1743878756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=flxZxA0X7GWBi74qPpdlRrbph7KZWrQDcITyvFz4TeM=;
 b=NSjdyWw+0zbhLG2YWRGh37JTm2qo3sJD5LcSFGiOrs1jgB9R2FY3YmR8
 K0T3KTbuqCm9zvTfjxV7RFQ88nTvB7GjsjxvM++EaOhHEGNxPWKx+vGIc
 iemVH7pWkmj8nJXpyWNXwYCDjr5pJZD/fZQUR3yWN3n0cRcxM1mQ1bULl
 k2Z/DKGF30yg3yPz558t1/FV9DEdApS4XeuIIG3SApE0YSuESg2PfAYZ1
 TJPugkqMRqg0+ZbWgQU6zqY+g6A/3xD3wo3AOElFx3c3XfyMArT7ihYHR
 y7bzavrFVQxWQmTiQhoUZ1HqihFWbiM/YXXPUYMYUQtzPjGCvSv8DvPjv g==;
X-CSE-ConnectionGUID: RBAUpPSgR0+OgFWggsnX1g==
X-CSE-MsgGUID: 0sG+dtOpTka4rEBaL9eyqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25190931"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25190931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827790985"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="827790985"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 11:45:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 21:45:51 +0300
Date: Fri, 5 Apr 2024 21:45:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/modes: add drm_mode_print() to dump mode in
 drm_printer
Message-ID: <ZhBG36AFIbFQ3dYk@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
 <54199d36993bfb00e29cc059ab9a215495405a99.1709843865.git.jani.nikula@intel.com>
 <375332cc-5d12-4afb-b00f-a9ef08209038@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <375332cc-5d12-4afb-b00f-a9ef08209038@suse.de>
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

On Fri, Apr 05, 2024 at 10:45:42AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.03.24 um 21:39 schrieb Jani Nikula:
> > Add a printer based function for dumping the modeline, so it's not
> > limited to KMS debug.
> >
> > Note: The printed output intentionally does not have the "Modeline"
> > prefix. Prefix, if any, is for the caller to decide when initializing
> > drm_printer.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   drivers/gpu/drm/drm_modes.c | 13 +++++++++++++
> >   include/drm/drm_modes.h     |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index c4f88c3a93b7..711750ab57c7 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -49,6 +49,19 @@
> >   
> >   #include "drm_crtc_internal.h"
> >   
> > +/**
> > + * drm_mode_print - print a mode to drm printer
> > + * @p: drm printer
> > + * @mode: mode to print
> > + *
> > + * Write @mode description to struct drm_printer @p.
> > + */
> > +void drm_mode_print(struct drm_printer *p, const struct drm_display_mode *mode)
> 
> Could this be a printf function with a trailing format string as final 
> argument? The printed mode could then be part of another string instead 
> of just at the end of it.

All this seems pretty much redundant. We already have
DRM_MODE_FMT/ARGS so people can include the mode in any
kind of format string they want.

I would just nuke drm_mode_print() and all its ilk and
let people format things themselves.

-- 
Ville Syrjälä
Intel
