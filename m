Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D992612356E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 20:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF786EA31;
	Tue, 17 Dec 2019 19:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8FC6E1BC;
 Tue, 17 Dec 2019 19:10:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 98ACC80510;
 Tue, 17 Dec 2019 20:10:04 +0100 (CET)
Date: Tue, 17 Dec 2019 20:10:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 5/8] drm/mipi-dbi: convert to drm device based logging
Message-ID: <20191217191003.GA28782@ravnborg.org>
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <20191210123050.8799-5-jani.nikula@intel.com>
 <20191217190011.GD30809@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217190011.GD30809@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=wcju3iwnBbe9ghA5nx0A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 08:00:11PM +0100, Sam Ravnborg wrote:
> On Tue, Dec 10, 2019 at 02:30:47PM +0200, Jani Nikula wrote:
> > Prefer drm device based logging where possible.
> > 
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dbi.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> > index e34058c721be..86d98e7fc30a 100644
> > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > @@ -225,7 +225,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
> >  		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
> >  		break;
> >  	default:
> > -		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
> > +		drm_err_once(fb->dev, "Format is not supported: %s\n",
> >  			     drm_get_format_name(fb->format->format,
> >  						 &format_name));
> >  		return -EINVAL;
> > @@ -242,7 +242,8 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> >  {
> >  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
> >  	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
> > -	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
> > +	struct drm_device *dev = fb->dev;
> 
> In this file the pattern is to use the variable name "drm" for a
> drm_device *. Your changes should follow the same pattern.
With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> 
> 	Sam
> 
> > +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(dev);
> >  	unsigned int height = rect->y2 - rect->y1;
> >  	unsigned int width = rect->x2 - rect->x1;
> >  	struct mipi_dbi *dbi = &dbidev->dbi;
> > @@ -259,7 +260,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> >  
> >  	full = width == fb->width && height == fb->height;
> >  
> > -	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
> > +	drm_dbg_kms(dev, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
> >  
> >  	if (!dbi->dc || !full || swap ||
> >  	    fb->format->format == DRM_FORMAT_XRGB8888) {
> > @@ -282,7 +283,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> >  				   width * height * 2);
> >  err_msg:
> >  	if (ret)
> > -		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
> > +		drm_err_once(dev, "Failed to update display %d\n", ret);
> >  
> >  	drm_dev_exit(idx);
> >  }
> > @@ -649,14 +650,14 @@ EXPORT_SYMBOL(mipi_dbi_display_is_on);
> >  
> >  static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool cond)
> >  {
> > -	struct device *dev = dbidev->drm.dev;
> > +	struct drm_device *dev = &dbidev->drm;
> >  	struct mipi_dbi *dbi = &dbidev->dbi;
> >  	int ret;
> >  
> >  	if (dbidev->regulator) {
> >  		ret = regulator_enable(dbidev->regulator);
> >  		if (ret) {
> > -			DRM_DEV_ERROR(dev, "Failed to enable regulator (%d)\n", ret);
> > +			drm_err(dev, "Failed to enable regulator (%d)\n", ret);
> >  			return ret;
> >  		}
> >  	}
> > @@ -667,7 +668,7 @@ static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
> >  	mipi_dbi_hw_reset(dbi);
> >  	ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> >  	if (ret) {
> > -		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
> > +		drm_err(dev, "Failed to send reset command (%d)\n", ret);
> >  		if (dbidev->regulator)
> >  			regulator_disable(dbidev->regulator);
> >  		return ret;
> > -- 
> > 2.20.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
