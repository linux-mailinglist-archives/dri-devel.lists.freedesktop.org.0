Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3B4BD126
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 20:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CC10E211;
	Sun, 20 Feb 2022 19:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7310E211
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 19:57:15 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 56791c69-9287-11ec-b2df-0050568cd888;
 Sun, 20 Feb 2022 19:57:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4FE42194B40;
 Sun, 20 Feb 2022 20:57:11 +0100 (CET)
Date: Sun, 20 Feb 2022 20:57:06 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 3/3] drm/tiny: Add MIPI DBI compatible SPI driver
Message-ID: <YhKdEuU3qoY/x/ie@ravnborg.org>
References: <35cd42a3-5183-2f21-8728-ee9d65dd1740@tronnes.org>
 <388f7dc3-afcd-e4c3-592f-8e8401819371@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <388f7dc3-afcd-e4c3-592f-8e8401819371@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf.

On Sun, Feb 20, 2022 at 07:11:14PM +0100, Noralf Trønnes wrote:
> > Den 20.02.2022 11.04, skrev Sam Ravnborg:
> > > Hi Noralf,
> > >
> > >>> +static int panel_mipi_dbi_get_mode(struct mipi_dbi_dev *dbidev,
> struct drm_display_mode *mode)
> > >>> +{
> > >>> +	struct device *dev = dbidev->drm.dev;
> > >>> +	u32 width_mm = 0, height_mm = 0;
> > >>> +	struct display_timing timing;
> > >>> +	struct videomode vm;
> > >>> +	int ret;
> > >>> +
> > >>> +	ret = of_get_display_timing(dev->of_node, "panel-timing", &timing);
> > >>> +	if (ret) {
> > >>> +		dev_err(dev, "%pOF: failed to get panel-timing (error=%d)\n",
> dev->of_node, ret);
> > >>> +		return ret;
> > >>> +	}
> > >>> +
> > >>> +	videomode_from_timing(&timing, &vm);
> > >>> +
> > >>> +	if (!vm.hactive || vm.hfront_porch || vm.hsync_len ||
> > >>> +	    (vm.hback_porch + vm.hactive) > 0xffff ||
> > >>> +	    !vm.vactive || vm.vfront_porch || vm.vsync_len ||
> > >>> +	    (vm.vback_porch + vm.vactive) > 0xffff ||
> > >>> +	    vm.flags) {
> > >>> +		dev_err(dev, "%pOF: panel-timing out of bounds\n", dev->of_node);
> > >>> +		return -EINVAL;
> > >>> +	}
> > >> We should have a helper that implements this. Maybe the display_timing
> > >> => display_mode helper could do it.
> > >
> > > It would be nice with a drm_display_timing_to_mode() but that can come
> > > later - the comment above should not be understood that I consider it
> > > mandatory for this driver.
> > >
> >
> > I did consider adding an of_get_drm_panel_mode() fashioned after
> > of_get_drm_display_mode() but I didn't find any other driver that would
> > actually be able to use it and I would have to do some substraction to
> > get back the {h,v}front_porch values that I need and the optional pixel
> > clock calculation becomes more complex acting from a drm_display_mode so
> > I decided against it.
> >
> > Looking at it now, what I could do is add a function like what
> > of_get_videomode() does for "display-timings":
> >
> > /**
> >  * of_get_panel_videomode - get the panel-timing videomode from devicetree
> >  * @np: devicenode containing the panel-timing subnode
> >  * @vm: returns the videomode
> >  *
> >  * Returns:
> >  * Zero on success, negative error code on failure.
> >  **/
> > int of_get_panel_videomode(struct device_node *np, struct videomode *vm)
> > {
> > 	struct display_timing timing;
> > 	int ret;
> >
> > 	ret = of_get_display_timing(np, "panel-timing", &timing);
> > 	if (ret)
> > 		return ret;
> >
> > 	videomode_from_timing(&timing, vm);
> >
> > 	return 0;
> > }
> >
> > This could also be used by panel-lvds and 2 fbdev drivers, the other
> > panel-timing users need/use the display_timing itself, some for bounds
> > checking.
> 
> Scratch that, since videomode is to be avoided I tried adding a
> drm_display_mode function and it didn't complicate matter as I though it
> would so I'll do that instead:

I like, but would like to get rid of video_mode entirely.

> 
> static int panel_mipi_dbi_get_mode(struct mipi_dbi_dev *dbidev, struct
> drm_display_mode *mode)
> {
> 	struct device *dev = dbidev->drm.dev;
> 	u32 width_mm = 0, height_mm = 0;
> 	u16 hback_porch, vback_porch;
> 	struct videomode vm;
> 	int ret;
> 
> 	ret = of_get_drm_panel_display_mode(dev->of_node, mode, NULL);
> 	if (ret) {
> 		dev_err(dev, "%pOF: failed to get panel-timing (error=%d)\n",
> dev->of_node, ret);
> 		return ret;
> 	}
> 
> 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> 
> 	hback_porch = mode->htotal - mode->hsync_end;
> 	vback_porch = mode->vtotal - mode->vsync_end;
The accesss functions I posed below could be used here - so we avoid
typing these (trivial) calculations in many places.

> 
> 	if (mode->hsync_end > mode->hdisplay || (hback_porch + mode->hdisplay)
> > 0xffff ||
> 	    mode->vsync_end > mode->vdisplay || (vback_porch + mode->vdisplay)
> > 0xffff ||
> 	    mode->flags) {
> 		dev_err(dev, "%pOF: panel-timing out of bounds\n", dev->of_node);
> 		return -EINVAL;
> 	}
With the display_timing => drm_display_mode I think the above is no
longer required.

> 
> 	/* The driver doesn't use the pixel clock but it is mandatory so fake
> one if not set */
> 	if (!mode->pixelclock)
> 		mode->pixelclock = mode->htotal * mode->vtotal * 60 / 1000;
> 
> 	dbidev->top_offset = vback_porch;
> 	dbidev->left_offset = hback_porch;
> 
> 	return 0;
> }
> 
> 
> int of_get_drm_panel_display_mode(struct device_node *np,
> 				  struct drm_display_mode *dmode, u32 *bus_flags)
> {
Not sure about the bus_flags argument here - seems misplaced.

> 	u32 width_mm = 0, height_mm = 0;
> 	struct display_timing timing;
> 	struct videomode vm;
> 	int ret;
> 
> 	ret = of_get_display_timing(np, "panel-timing", &timing);
> 	if (ret)
> 		return ret;
> 
> 	videomode_from_timing(&timing, vm);
> 
> 	memset(dmode, 0, sizeof(*dmode));
> 	drm_display_mode_from_videomode(&vm, dmode);
> 	if (bus_flags)
> 		drm_bus_flags_from_videomode(&vm, bus_flags);

This does a:
display_timing => video_mode => drm_display_display_mode

We could do a:
display_timing => drm_display_mode.

Sample implementation could look like this:
void drm_mode_from_display_timing(struct drm_display_mode *mode,
                                  const struct display_timing *dt)
{
	mode->hdisplay = dt->hactive.typ;
        mode->hsync_start = dt->hactive.typ + dt->hfront_porch.typ;
        mode->hsync_end = dt->hactive.typ + dt->hfront_porch.typ + dt->hsync_len.typ;
        mode->htotal = dt->hactive.typ + dt->hfront_porch.typ + dt->hsync_len.typ + dt->hback_porch.typ;

        mode->vdisplay = dt->vactive.typ;
        mode->vsync_start = dt->vactive.typ + dt->vfront_porch.typ;
        mode->vsync_end = dt->vactive.typ + dt->vfront_porch.typ + dt->vsync_len.typ;
        mode->vtotal = dt->vactive.typ + dt->vfront_porch.typ + dt->vsync_len.typ + dt->vback_porch.typ;

        mode->clock = dt->pixelclock.typ / 1000;

        mode->flags = 0;
        if (dt->flags & DISPLAY_FLAGS_HSYNC_HIGH)
                mode->flags |= DRM_MODE_FLAG_PHSYNC;
        else if (dt->flags & DISPLAY_FLAGS_HSYNC_LOW)
                mode->flags |= DRM_MODE_FLAG_NHSYNC;
        if (dt->flags & DISPLAY_FLAGS_VSYNC_HIGH)
                mode->flags |= DRM_MODE_FLAG_PVSYNC;
        else if (dt->flags & DISPLAY_FLAGS_VSYNC_LOW)
                mode->flags |= DRM_MODE_FLAG_NVSYNC;
        if (dt->flags & DISPLAY_FLAGS_INTERLACED)
                mode->flags |= DRM_MODE_FLAG_INTERLACE;
        if (dt->flags & DISPLAY_FLAGS_DOUBLESCAN)
                mode->flags |= DRM_MODE_FLAG_DBLSCAN;
        if (dt->flags & DISPLAY_FLAGS_DOUBLECLK)
                mode->flags |= DRM_MODE_FLAG_DBLCLK;
        drm_mode_set_name(mode);
}
EXPORT_SYMBOL_GPL(drm_mode_from_display_timing);

If we then on top of this would like easy access to the names we know we
could add a few access functions:

static inline u32 drm_mode_hactive(const struct drm_display_mode *mode)
{
        mode->hdisplay;
}

static inline u32 drm_mode_hfront_porch(const struct drm_display_mode *mode)
{
        mode->hsync_start - mode->hdisplay;
}

static inline u32 drm_mode_hback_porch(const struct drm_display_mode *mode)
{
        mode->htotal - mode->hsync_start;
}

static inline u32 drm_mode_hsync_len(const struct drm_display_mode *mode)
{
        return mode->hsync_end - mode->hsync_start;
}

static inline u32 drm_mode_vactive(const struct drm_display_mode *mode)
{
        return mode->vdisplay;
}

static inline u32 drm_mode_vfront_porch(const struct drm_display_mode *mode)
{
        return mode->vsync_start - mode->vdisplay;
}

static inline u32 drm_mode_vsync_len(const struct drm_display_mode *mode)
{
        return mode->vsync_end - mode->vsync_start;
}

static inline u32 drm_mode_vback_porch(const struct drm_display_mode *mode)
{
        return mode->vtotal - mode->vsync_end;
}


The above was something I just quickly typed. This was the easy part.
Writing kernel-.doc and fix it so it works is the time consuming part..

	Sam
