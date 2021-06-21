Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6583AF52C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB7289993;
	Mon, 21 Jun 2021 18:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C950C89971
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:38:33 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ea5a0d0d-d2bf-11eb-960d-0050568c148b;
 Mon, 21 Jun 2021 18:38:47 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9E4F3194B05;
 Mon, 21 Jun 2021 20:38:35 +0200 (CEST)
Date: Mon, 21 Jun 2021 20:38:28 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: rajeevny@codeaurora.org
Subject: Re: [v7 1/5] drm/panel: add basic DP AUX backlight support
Message-ID: <20210621183828.GA918146@ravnborg.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
 <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, hoegsberg@chromium.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, devicetree@vger.kernel.org,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, mkrishn@codeaurora.org,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org, robdclark@gmail.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajeev,

On Mon, Jun 21, 2021 at 02:08:17PM +0530, rajeevny@codeaurora.org wrote:
> Hi Sam,
> 
> On 20-06-2021 15:01, Sam Ravnborg wrote:
> > Hi Rajeev
> > 
> > On Sat, Jun 19, 2021 at 04:10:26PM +0530, Rajeev Nandan wrote:
> > > Some panels support backlight control over DP AUX channel using
> > > VESA's standard backlight control interface.
> > > Using new DRM eDP backlight helpers, add support to create and
> > > register a backlight for those panels in drm_panel to simplify
> > > the panel drivers.
> > > 
> > > The panel driver with access to "struct drm_dp_aux" can create and
> > > register a backlight device using following code snippet in its
> > > probe() function:
> > > 
> > > 	err = drm_panel_dp_aux_backlight(panel, aux);
> > > 	if (err)
> > > 		return err;
> > 
> > IT very good to have this supported by drm_panel, so we avoid
> > bolierplate in various drivers.
> > 
> > > 
> > > Then drm_panel will handle backlight_(enable|disable) calls
> > > similar to the case when drm_panel_of_backlight() is used.
> > > 
> > > Currently, we are not supporting one feature where the source
> > > device can combine the backlight brightness levels set through
> > > DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
> > > required for the basic backlight controls, it can be added later.
> > > 
> > > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > > 
> > > (no changes since v6)
> > > 
> > > Changes in v5:
> > > - New
> > > 
> > > Changes in v6:
> > > - Fixed ordering of memory allocation (Douglas)
> > > - Updated word wrapping in a comment (Douglas)
> > > 
> > >  drivers/gpu/drm/drm_panel.c | 108
> > > ++++++++++++++++++++++++++++++++++++++++++++
> > >  include/drm/drm_panel.h     |  15 ++++--
> > >  2 files changed, 119 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index f634371..9e65342 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -26,12 +26,20 @@
> > >  #include <linux/module.h>
> > > 
> > >  #include <drm/drm_crtc.h>
> > > +#include <drm/drm_dp_helper.h>
> > >  #include <drm/drm_panel.h>
> > >  #include <drm/drm_print.h>
> > > 
> > >  static DEFINE_MUTEX(panel_lock);
> > >  static LIST_HEAD(panel_list);
> > > 
> > > +struct dp_aux_backlight {
> > > +	struct backlight_device *base;
> > > +	struct drm_dp_aux *aux;
> > > +	struct drm_edp_backlight_info info;
> > > +	bool enabled;
> > > +};
> > > +
> > >  /**
> > >   * DOC: drm panel
> > >   *
> > > @@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel
> > > *panel)
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_panel_of_backlight);
> > > +
> > > +static int dp_aux_backlight_update_status(struct backlight_device
> > > *bd)
> > > +{
> > > +	struct dp_aux_backlight *bl = bl_get_data(bd);
> > > +	u16 brightness = backlight_get_brightness(bd);
> > backlight_get_brightness() returns an int, so using u16 seems wrong.
> > But then drm_edp_backlight_enable() uses u16 for level - so I guess it
> > is OK.
> > We use unsigned long, int, u16 for brightness. Looks like something one
> > could look at one day, but today is not that day.
> > 
> > > +	int ret = 0;
> > > +
> > > +	if (brightness > 0) {
> > Use backlight_is_blank(bd) here, as this is really what you test for.
> 
> The backlight_get_brightness() used above has the backlight_is_blank() check
> and returns brightness 0 when the backlight_is_blank(bd) is true.
> So, instead of calling backlight_is_blank(bd), we are checking brightness
> value here.
> I took the reference from pwm_backlight_update_status() of the PWM backlight
> driver (drivers/video/backlight/pwm_bl.c)
> 
> Yes, we can change this _if_ condition to use backlight_is_blank(bd), as
> this is an inline function, and is more meaningful.
> With this, there would be one change in the behavior of
> _backlight_update_status function in the following case:
> 
> - Setting brightness=0 when the backlight is not blank:
> In the current case setting brightness=0 is disabling the backlight.
> In the new case, setting brightness=0 will set the brightness to 0 and will
> do nothing to backlight disable.
> 
> I think that should not be a problem?

Reading "ABI/stable/sysfs-class-backlight" does not say anything about
any special bahaviour with brightness == 0. Some panels may not dim back
to dark on brightness == 0, just barely readable. So in such cases doing
something special on the brightness == 0 case is wrong.

I recall that some backlight drivets do not get this so it is easy to
make it wrong. Unless one of the backlight people tell otherwise the
safe choice is to avoid the specail handling of brightness here.

> 
> > 
> > I cannot see why you need the extra check on ->enabled?
> > Would it be sufficient to check backlight_is_blank() only?
> 
> This extra check on bl->enabled flag is added to avoid enabling/disabling
> backlight again if it is already enabled/disabled.
> Using this flag way can know the transition between backlight blank and
> un-blank, and decide when to enable/disable the backlight.

My point is that this should really not be needed, as it would cover up
for some other bug whaere we try to do something twice that is not
needed. But I am less certain here so if you think it is needed, keep
it as is.

	Sam
