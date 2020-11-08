Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5352AAA20
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 09:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5510B6E2DF;
	Sun,  8 Nov 2020 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CB96E083
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 08:47:58 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 94A2280522;
 Sun,  8 Nov 2020 09:47:55 +0100 (CET)
Date: Sun, 8 Nov 2020 09:47:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/3] drm: panel: simple: Allow timing constraints, not
 fixed delays
Message-ID: <20201108084754.GA1119120@ravnborg.org>
References: <20201105135639.v3.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105135639.v3.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8
 a=wPsJ2gbrx_q22NF4ILYA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas.

On Thu, Nov 05, 2020 at 01:57:39PM -0800, Douglas Anderson wrote:
> The simple panel code currently allows panels to define fixed delays
> at certain stages of initialization.  These work OK, but they don't
> really map all that clearly to the requirements presented in many
> panel datasheets.  Instead of defining a fixed delay, those datasheets
> provide a timing diagram and specify a minimum amount of time that
> needs to pass from event A to event B.
> 
> Because of the way things are currently defined, most panels end up
> over-delaying.  One prime example here is that a number of panels I've
> looked at define the amount of time that must pass between turning a
> panel off and turning it back on again.  Since there is no way to
> specify this, many developers have listed this as the "unprepare"
> delay.  However, if nobody ever tried to turn the panel on again in
> the next 500 ms (or whatever the delay was) then this delay was
> pointless.  It's better to do the delay only in the case that someone
> tried to turn the panel on too quickly.
> 
> Let's support specifying delays as constraints.  We'll start with the
> one above and also a second one: the minimum time between prepare
> being done and doing the enable.  On the panel I'm looking at, there's
> an 80 ms minimum time between HPD being asserted by the panel and
> setting the backlight enable GPIO.  By specifying as a constraint we
> can enforce this without over-delaying.  Specifically the link
> training is allowed to happen in parallel with this delay so adding a
> fixed 80 ms delay isn't ideal.
Nice and detaild explanation - thanks.

Reading through this a few times it seems that a simpler approach would
be to change the semantics of the dealys we already have a little and
only add one new field:

       struct {
                unsigned int prepare;
                unsigned int hpd_absent_delay;
		unsigned int prepare_to_enable;
                unsigned int enable;
                unsigned int disable;
                unsigned int unprepare;
        } delay;

The lines marked "//*" are new or changed:

prepare()
//*enforce unprepare time
// enable regulator
// set enable gpio
// do fixed prepare delay (this is time until we can trust hpd)
// wait for HPD GPIO if applicable, otherwise do fixed hpd_absent_delay
//*start counting for prepare_to_enable

enable()
//*enforce prepare_to_enable min time
// enable backlight if applicable

panel shows nice pictures of kitties

disable()
// disable backlight is applicable
// fixed disable delay

unprepare()
// unset enable gpio
// disable regulator
//*start counting for unprepare delay


This should not break any exisitng panels - and we avoid that we have
two delays that are almost the same.

Would that work for you?

Note that no new struct was introduced - this is all dealys so keep it in
the same struct.

A dew details in the following.

	Sam

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Fixed totally backwards "if" tests.  :(
> 
> Changes in v2:
> - Inline the kernel doc for the two new members.
A nice follow-up patch would be to move the remaining fields as inline
doc. But let us settle on this first.

>  struct panel_simple {
>  	struct drm_panel base;
> -	bool prepared;
>  	bool enabled;
>  	bool no_hpd;
>  
> +	ktime_t prepared_time;
> +	ktime_t unprepared_time;
> +
>  	const struct panel_desc *desc;
>  
>  	struct regulator *supply;
> @@ -230,6 +294,20 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
>  	return num;
>  }
>  
> +static void panel_simple_wait_min_time(ktime_t start_ktime, unsigned int min_ms)
> +{
> +	ktime_t now_ktime, min_ktime;
> +
> +	if (!min_ms)
> +		return;
> +
> +	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
> +	now_ktime = ktime_get();
> +
> +	if (ktime_before(now_ktime, min_ktime))
> +		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
> +}
panel_simple_wait()?


> +
>  static int panel_simple_disable(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
> @@ -249,18 +327,19 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
>  
> -	if (!p->prepared)
> +	if (p->prepared_time == 0)
>  		return 0;
>  
>  	gpiod_set_value_cansleep(p->enable_gpio, 0);
>  
>  	regulator_disable(p->supply);
>  
> +	p->prepared_time = 0;
> +	p->unprepared_time = ktime_get();
> +
>  	if (p->desc->delay.unprepare)
>  		msleep(p->desc->delay.unprepare);
>  
> -	p->prepared = false;
> -
>  	return 0;
>  }
>  
> @@ -296,9 +375,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  	int err;
>  	int hpd_asserted;
>  
> -	if (p->prepared)
> +	if (p->prepared_time != 0)
>  		return 0;
>  
> +	panel_simple_wait_min_time(p->unprepared_time,
> +				   p->desc->min_times.unprepare_to_prepare);
> +
>  	err = regulator_enable(p->supply);
>  	if (err < 0) {
>  		dev_err(panel->dev, "failed to enable supply: %d\n", err);
> @@ -333,7 +415,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  		}
>  	}
>  
> -	p->prepared = true;
> +	p->prepared_time = ktime_get();
>  
>  	return 0;
>  }
> @@ -348,6 +430,9 @@ static int panel_simple_enable(struct drm_panel *panel)
>  	if (p->desc->delay.enable)
>  		msleep(p->desc->delay.enable);
>  
> +	panel_simple_wait_min_time(p->prepared_time,
> +				   p->desc->min_times.prepare_to_enable);
> +
>  	p->enabled = true;
>  
>  	return 0;
> @@ -514,7 +599,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		return -ENOMEM;
>  
>  	panel->enabled = false;
> -	panel->prepared = false;
> +	panel->prepared_time = 0;
>  	panel->desc = desc;
>  
>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
