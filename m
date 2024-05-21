Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E08CB411
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 21:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB28110F0A9;
	Tue, 21 May 2024 19:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6oZePdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34D310ED97;
 Tue, 21 May 2024 19:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716318579; x=1747854579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HM5M9rwn7lRqywWH1h3KoZ/hzMZhjbpsLLVcCiHSDaM=;
 b=k6oZePdYVafpx3whcpWbcfwAG6fM6BT+sQMi3Rg6WEC+13eC4abR3ZCf
 TdvucOeRnRO2mGegtRotneBq4HfJHZM1kIxGzhgD487g4ju5zZfuR8qPy
 kABBNZmuBhI4gh6Jbm74Y/AEfO3UbUyyAofwq/KJtfFN7yEYZCjvJgfgE
 ZQhNON64IIFEglTUOwaSXi4vrhHO5/EdhpzkPkplHhesegznDxcSmeB4F
 HTgK8DqqIl3Qahyu/PStVWxewyBepokR6xS+1CU9czjVBSEBiWNIktCSU
 RoDa4K3LAAUu1aVrvh++OGaCldNZnuGrMFMrzAx+kl/DjGQSsuxFWmIuA g==;
X-CSE-ConnectionGUID: 3QJWevmmR9GO46meNGmwyw==
X-CSE-MsgGUID: 1offdBjpRMm+rZRm9f9Jfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16375479"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="16375479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:09:38 -0700
X-CSE-ConnectionGUID: xAeZxi50QTqLSkuurvcbGw==
X-CSE-MsgGUID: llWMDmoOQJmbqMJBeW3C5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33005396"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 21 May 2024 12:09:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 May 2024 22:09:35 +0300
Date: Tue, 21 May 2024 22:09:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/probe-helper: Call drm_mode_validate_ycbcr420()
 before connector->mode_valid()
Message-ID: <Zkzxb9QsHTveWe1-@intel.com>
References: <20240516173324.18149-1-ville.syrjala@linux.intel.com>
 <ZkyO7ybX-pdDiWMR@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkyO7ybX-pdDiWMR@phenom.ffwll.local>
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

On Tue, May 21, 2024 at 02:09:19PM +0200, Daniel Vetter wrote:
> On Thu, May 16, 2024 at 08:33:24PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Make life easier for drivers by filtering out unwanted YCbCr 4:2:0
> > only modes prior to calling the connector->mode_valid() hook.
> > Currently drivers will still see YCbCr 4:2:0 only modes in said
> > hook, which will likely come as a suprise when the driver has
> > declared no support for such modes (via setting
> > connector->ycbcr_420_allowed to false).
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10992
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Sounds reasonable.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks. Pushed to drm-misc-next.

> 
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index 4f75a1cfd820..249c8c2cb319 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -474,6 +474,10 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
> >  		if (mode->status != MODE_OK)
> >  			continue;
> >  
> > +		mode->status = drm_mode_validate_ycbcr420(mode, connector);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> > +
> >  		ret = drm_mode_validate_pipeline(mode, connector, ctx,
> >  						 &mode->status);
> >  		if (ret) {
> > @@ -486,10 +490,6 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
> >  			else
> >  				return -EDEADLK;
> >  		}
> > -
> > -		if (mode->status != MODE_OK)
> > -			continue;
> > -		mode->status = drm_mode_validate_ycbcr420(mode, connector);
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.44.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Ville Syrjälä
Intel
