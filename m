Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6123C052
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 21:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AC96E2A8;
	Tue,  4 Aug 2020 19:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53EF6E2A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 19:56:05 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7123220023;
 Tue,  4 Aug 2020 21:56:02 +0200 (CEST)
Date: Tue, 4 Aug 2020 21:56:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: daniel@ffwll.ch
Subject: Re: [PATCH v1 03/22] backlight: Add get/set operations for
 brightness/power properties
Message-ID: <20200804195600.GA686651@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-4-sam@ravnborg.org>
 <20200804164330.GL6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804164330.GL6419@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=25-AhOLfAAAA:8 a=e5mUnYsNAAAA:8 a=FjNC6yXzohCYgVPpXcIA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=dnuY3_Gu-P7Vi9ynLKQe:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel et al.
On Tue, Aug 04, 2020 at 06:43:30PM +0200, daniel@ffwll.ch wrote:
> On Sun, Aug 02, 2020 at 01:06:17PM +0200, Sam Ravnborg wrote:
> > Add get and set operations to incapsualte access to backlight properties.
> > 
> > One easy win is that the get/set operatiosn can be used when backlight
> > is not included in the configuration, resulting in simpler code with
> > less ifdef's and thus more readable code.
> > 
> > The set/get methods hides some of the confusing power states, limiting
> > the power state to either ON or OFF for the drivers.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > ---
> >  include/linux/backlight.h | 72 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> > 
> > diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> > index d683c053ec09..882ceea45ace 100644
> > --- a/include/linux/backlight.h
> > +++ b/include/linux/backlight.h
> > @@ -474,6 +474,78 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
> >  		return bd->props.brightness;
> >  }
> >  
> > +/**
> > + * backlight_get_actual_brightness - Returns the actual brightness
> > + *
> > + * On failure a negative error code is returned.
> > + */
> > +static inline int backlight_get_actual_brightness(struct backlight_device *bd)
> > +{
> > +	if (bd && bd->ops && bd->ops->get_brightness)
> > +		return bd->ops->get_brightness(bd);
> > +	else
> > +		return -EINVAL;
> > +}
> > +
> > +/**
> > + * backlight_get_max_brightness - Returns maximum brightness
> > + *
> > + * This helper operation is preferred over direct access to
> > + * &backlight_properties.max_brightness
> > + *
> > + * Returns 0 if backlight_device is NULL
> > + */
> > +
> > +static inline int backlight_get_max_brightness(const struct backlight_device *bd)
> > +{
> > +	if (bd)
> > +		return bd->props.max_brightness;
> > +	else
> > +		return 0;
> > +}
> > +
> > +/**
> > + * backlight_set_brightness - Set the brightness to the specified value
> > + *
> > + * This helper operation is preferred over direct assignment to
> > + * &backlight_properties.brightness.
> > + *
> > + * If backlight_device is NULL then silently exit.
> > + */
> > +static inline void backlight_set_brightness(struct backlight_device *bd, int brightness)
> > +{
> > +	if (bd)
> > +		bd->props.brightness = brightness;
> 
> Looking at the drivers I think including a call to backlight_update_status
> would simplify a lot of code.
> 
> > +}
> > +
> > +/**
> > + * backlight_set_power_on - Set power state to ON.
> > + *
> > + * This helper operation is preferred over direct assignment to
> > + * backlight_properties.power.
> > + *
> > + * If backlight_device is NULL then silently exit.
> > + */
> > +static inline void backlight_set_power_on(struct backlight_device *bd)
> > +{
> > +	if (bd)
> > +		bd->props.power = FB_BLANK_UNBLANK;
> > +}
> > +
> > +/**
> > + * backlight_set_power_off - Set power state to OFF.
> > + *
> > + * This helper operation is preferred over direct assignment to
> > + * backlight_properties.power.
> > + *
> > + * If backlight_device is NULL then silently exit.
> > + */
> > +static inline void backlight_set_power_off(struct backlight_device *bd)
> 
> I'm not clear why we need these two above? I thought the long-term plan is
> only use backlight_enable/disable and then remove the tri-state power
> handling once everyone is converted over?
> 
> Or maybe I'm just confused about the goal here ...

My TODO for v2:
- Check all get_brightness implmentations.
  Using backlight_get_brightness is wrong - find a better way
  Check that they do return the actual brightness and not just the copy
  from the backlight core
- Get rid of all uses of power_on/off - this is just another way to
  disable backlight - so be explicit about it
- Consolidate the backlight_set_brightness(); backlight_update() pattern
  to a helper
- Look into a mipi helper for backlight
- Consider if we can change the backlight core to use an u32 for
  brightness
- Take a look at Daniels rambling about drm_connector and backlight
- Convert some platform backlight drivers to updated interface - to verify
  that they do not add new demends

The above should address feedback from Daniel etc. Thanks!
No promises when I get time to do it - this list was mostly
to help myself so I did not forget.

Note: My ISP blocked my attempt to reply to PATCH 0 - so I replied to
this with the TODO list.

        Sam


> -Daniel
> 
> > +{
> > +	if (bd)
> > +		bd->props.power = FB_BLANK_POWERDOWN;
> > +}
> > +
> >  struct backlight_device *
> >  backlight_device_register(const char *name, struct device *dev, void *devdata,
> >  			  const struct backlight_ops *ops,
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
