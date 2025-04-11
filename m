Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2DA854E0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA8A10EB01;
	Fri, 11 Apr 2025 07:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NspSH7k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23D510EAE4;
 Fri, 11 Apr 2025 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744354922; x=1775890922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ce50Klw8qTMBvZ13mLURazDTyliGqDfo02M5DDg2NjM=;
 b=NspSH7k8C+C7eZuGFyk3xjaHstWrGrDvGmUeq+D13qZW4MLKJ5Mz2uW0
 4VZ4J0j2JN85Ji8C7IT0tYWWsWzMi9oVU7vUrTcmkmrCkGqjaQZn3h/7Z
 c4veaF4uUOjzEJKFY0NzmXEQROP+g+S3hF5Ln3qLG4AIocqlhDyl8Hac5
 jrtGowtEZSkg/AL/86CQr1oSFWTtOYI4oNjcFujjKIbzIsfv9wxut/fik
 17cki0TRWPD6Q52Zh35UFajazg5+mNvKF5kawMwwx+aAZBE/io9zpErCq
 THOsx7G8si0CGQKzxPvJwavOwJrSTo5q6hrLAhAf6u//5Y4AB4OrkRnig w==;
X-CSE-ConnectionGUID: nvZ3vhkMQYGhOFVRt12qyg==
X-CSE-MsgGUID: zraVgs1LQHC40aZ+6WX0Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45786110"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45786110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:02:01 -0700
X-CSE-ConnectionGUID: AAL89XJnTEGFjCvoBevqLg==
X-CSE-MsgGUID: BnfnqPpHSeGxygHvhiY2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="134279582"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 11 Apr 2025 00:01:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 10:01:58 +0300
Date: Fri, 11 Apr 2025 10:01:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/19] drm: Look up the format info earlier
Message-ID: <Z_i-Zniclef5dkUD@intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-4-ville.syrjala@linux.intel.com>
 <20250410193302.GC27834@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410193302.GC27834@pendragon.ideasonboard.com>
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

On Thu, Apr 10, 2025 at 10:33:02PM +0300, Laurent Pinchart wrote:
> Hi Ville,
> 
> Thank you for the patch.
> 
> On Thu, Apr 10, 2025 at 07:32:02PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Looks up the format info in already drm_internal_framebuffer_create()
> > so that we can later pass it along to .fb_create(). Currently various
> > drivers are doing additional lookups in their .fb_create()
> > implementations, and these lookups are rather expensive now (given
> > how many different pixel formats we have).
> 
> That's a separate issue, but would it be worth using a data structure
> that supports more efficient lookup ?

I think the obvious solution would be to to just sort the array
and use a binary search. Ideally we'd get the compiler to do that
for us at build time and then get rid of the unsorted array entirely,
but sadly we can't do that in C. The alternative of keeping the array
sorted by hand sounds very annoying (at least without having a way
to validate that it is correctly sorted at build time).

> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > ---
> >  drivers/gpu/drm/drm_framebuffer.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > index 18a0267e374e..ae09ef6977b2 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -153,18 +153,11 @@ int drm_mode_addfb_ioctl(struct drm_device *dev,
> >  }
> >  
> >  static int framebuffer_check(struct drm_device *dev,
> > +			     const struct drm_format_info *info,
> >  			     const struct drm_mode_fb_cmd2 *r)
> >  {
> > -	const struct drm_format_info *info;
> >  	int i;
> >  
> > -	/* check if the format is supported at all */
> > -	if (!__drm_format_info(r->pixel_format)) {
> > -		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> > -			    &r->pixel_format);
> > -		return -EINVAL;
> > -	}
> > -
> >  	if (r->width == 0) {
> >  		drm_dbg_kms(dev, "bad framebuffer width %u\n", r->width);
> >  		return -EINVAL;
> > @@ -175,9 +168,6 @@ static int framebuffer_check(struct drm_device *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > -	/* now let the driver pick its own format info */
> > -	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> > -
> >  	for (i = 0; i < info->num_planes; i++) {
> >  		unsigned int width = drm_format_info_plane_width(info, r->width, i);
> >  		unsigned int height = drm_format_info_plane_height(info, r->height, i);
> > @@ -272,6 +262,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
> >  				struct drm_file *file_priv)
> >  {
> >  	struct drm_mode_config *config = &dev->mode_config;
> > +	const struct drm_format_info *info;
> >  	struct drm_framebuffer *fb;
> >  	int ret;
> >  
> > @@ -297,7 +288,17 @@ drm_internal_framebuffer_create(struct drm_device *dev,
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	ret = framebuffer_check(dev, r);
> > +	/* check if the format is supported at all */
> > +	if (!__drm_format_info(r->pixel_format)) {
> > +		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> > +			    &r->pixel_format);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	/* now let the driver pick its own format info */
> > +	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> > +
> > +	ret = framebuffer_check(dev, info, r);
> >  	if (ret)
> >  		return ERR_PTR(ret);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Ville Syrjälä
Intel
