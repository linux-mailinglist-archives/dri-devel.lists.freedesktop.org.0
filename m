Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507933843A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 03:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C546E0C5;
	Fri, 12 Mar 2021 02:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FED36E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 02:59:33 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 i25-20020a4aa1190000b02901bbd9429832so838381ool.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 18:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AOZfRHTZA4eo+TGnzhfbKWVk373laM+Ku7vcP0S8+S4=;
 b=pWQmG+kgKM1fb8GidoMReB2gsGUFIdBzDtt/2ULKljjVTHvEDshYex/542zt/ZPWVG
 Gq2N82KYcLSZDrlJHIWbkSaCr7odlUhuq0jjbSxk6/lmlWJ+N/KywQKTPCYWyoquyMuQ
 QKo/JiKzT8KOjQgtIKgzmopdHPawiKaE3a/NANvDAwH0VYBBTA9Iq65OQK/hpHr1Xjl+
 ax6PYoz5bUu048Ug9SSxuAuhSo94uPZzbyQJ1yd9WMFAzq2Lp1vlQzUA9JkkNtsgpmB0
 sHl+biA5/BmwryGZxzd36TqrgMzIjwi0PO0docpyPWYvoQStx9mNwIN1EcZSjmY1uK7J
 sIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AOZfRHTZA4eo+TGnzhfbKWVk373laM+Ku7vcP0S8+S4=;
 b=bDNXw2P1kGE2Fb3MML/DJ5TNa1EhrHF/M4VueX7VdAydda9GteaKQAyIHri3x3e3z+
 Jn1ZY90YGLrdbEZwST22Ufu6HMX03sJqRCSRaY/0LMVvRTcN6nULETbniN7gga15NASx
 C1zl/z2MjnpE/YfV2BV976jbNkturu28Z3SGML1oZ/PrGR87uwlpsfIPuhwxuXCCblxG
 BPpc8WHV93y1xl/TESg2167jxsdeFM7I0rvH+EXGW2w6yu43GPJCHAV0ckaPBCbI/k5v
 V39NY9WSde9wpJXoS5sSwckkw12LLlpLiAnhRIvY78o5jbFRmUJPReu/95mqdiB0sVGp
 ld3g==
X-Gm-Message-State: AOAM5333UOyrivqM/0zPJfC8ejnziepKn3pR2tjI+G1uvQMM+WFvlCP5
 fRutaJlhxaYPU9QbtLAEJrFZEg==
X-Google-Smtp-Source: ABdhPJzZl91FfozKsG2jWTRzbtxlWXSgEqDolc8Z5E+AR0iudJ9QnFMocK2GptPSlB6KW2Gwo2vecQ==
X-Received: by 2002:a4a:d2cc:: with SMTP id j12mr1652983oos.56.1615517972281; 
 Thu, 11 Mar 2021 18:59:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x17sm25916oie.5.2021.03.11.18.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 18:59:31 -0800 (PST)
Date: Thu, 11 Mar 2021 20:59:30 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
Message-ID: <YErZEv2BxLbo6eWp@builder.lan>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 04 Mar 17:52 CST 2021, Douglas Anderson wrote:

> In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> EDID from the panel. That commit kinda worked but it had some serious
> problems.
> 
> The problems all stem from the fact that userspace wants to be able to
> read the EDID before it explicitly enables the panel. For eDP panels,
> though, we don't actually power the panel up until the pre-enable
> stage and the pre-enable call happens right before the enable call
> with no way to interject in-between. For eDP panels, you can't read
> the EDID until you power the panel. The result was that
> ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> (falling back to what drm_panel_get_modes() returned) until _after_
> the EDID was needed.
> 
> To make it concrete, on my system I saw this happen:
> 1. We'd attach the bridge.
> 2. Userspace would ask for the EDID (several times). We'd try but fail
>    to read the EDID over and over again and fall back to the hardcoded
>    modes.
> 3. Userspace would decide on a mode based only on the hardcoded modes.
> 4. Userspace would ask to turn the panel on.
> 5. Userspace would (eventually) check the modes again (in Chrome OS
>    this happens on the handoff from the boot splash screen to the
>    browser). Now we'd read them properly and, if they were different,
>    userspace would request to change the mode.
> 
> The fact that userspace would always end up using the hardcoded modes
> at first significantly decreases the benefit of the EDID
> reading. Also: if the modes were even a tiny bit different we'd end up
> doing a wasteful modeset and at boot.
> 
> As a side note: at least early EDID read failures were relatively
> fast. Though the old ti_sn_bridge_connector_get_modes() did call
> pm_runtime_get_sync() it didn't program the important "HPD_DISABLE"
> bit. That meant that all the AUX transfers failed pretty quickly.
> 
> In any case, enough about the problem. How are we fixing it? Obviously
> we need to power the panel on _before_ reading the EDID, but how? It
> turns out that there's really no problem with just doing all the work
> of our pre_enable() function right at attach time and reading the EDID
> right away. We'll do that. It's not as easy as it sounds, though,
> because:
> 
> 1. Powering the panel up and down is a pretty expensive operation. Not
>    only do we need to wait for the HPD line which seems to take up to
>    200 ms on most panels, but also most panels say that once you power
>    them off you need to wait at least 500 ms before powering them on
>    again. We really don't want to incur 700 ms of time here.
> 
> 2. If we happen not to have a fixed "refclk" we've got a
>    chicken-and-egg problem. We seem to need the clock setup to read
>    the EDID. Without a fixed "refclk", though, the bridge runs with
>    the MIPI pixel clock which means you've got to use a hardcoded mode
>    for the MIPI pixel clock.
> 
> We'll solve problem #1 above by leaving the panel powered on for a
> little while after we read the EDID. If enough time passes and nobody
> turns the panel on then we'll undo our work. NOTE: there are no
> functional problems if someone turns the panel on after a long delay,
> it just might take a little longer to turn on.
> 
> We'll solve problem #2 by simply _always_ using a hardcoded mode (not
> reading the EDID) if a "refclk" wasn't provided. While it might be
> possible to fudge something together to support this, it's my belief
> that nobody is using this mode in real life since it's really
> inflexible. I saw it used for some really early prototype hardware
> that was thrown in the e-waste bin years ago when we realized how
> inflexible it was. In any case, if someone is using this they're in no
> worse shape than they were before the (fairly recent) commit
> 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").
> 
> NOTE: while this patch feels a bit hackish, I'm not sure there's much
> we can do better without a more fundamental DRM API change. After
> looking at it a bunch, it also doesn't feel as hacky to me as I first
> thought. The things that pre-enable does are well defined and well
> understood and there should be no problems with doing them early nor
> with doing them before userspace requests anything.
> 
> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 98 ++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 491c9c4f32d1..af3fb4657af6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
>  
>  #include <asm/unaligned.h>
>  
> @@ -130,6 +131,12 @@
>   * @ln_assign:    Value to program to the LN_ASSIGN register.
>   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
>   *
> + * @pre_enabled_early: If true we did an early pre_enable at attach.
> + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> + *                           if a normal pre_enable never came.
> + * @pre_enable_mutex: Lock to synchronize between the pre_enable_timeout_work
> + *                    and normal mechanisms.
> + *
>   * @gchip:        If we expose our GPIOs, this is used.
>   * @gchip_output: A cache of whether we've set GPIOs to output.  This
>   *                serves double-duty of keeping track of the direction and
> @@ -158,6 +165,10 @@ struct ti_sn_bridge {
>  	u8				ln_assign;
>  	u8				ln_polrs;
>  
> +	bool				pre_enabled_early;
> +	struct delayed_work		pre_enable_timeout_work;
> +	struct mutex			pre_enable_mutex;
> +
>  #if defined(CONFIG_OF_GPIO)
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> @@ -272,12 +283,6 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	struct edid *edid = pdata->edid;
>  	int num, ret;
>  
> -	if (!edid) {
> -		pm_runtime_get_sync(pdata->dev);
> -		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put(pdata->dev);
> -	}
> -
>  	if (edid && drm_edid_is_valid(edid)) {
>  		ret = drm_connector_update_edid_property(connector, edid);
>  		if (!ret) {
> @@ -412,10 +417,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  	pm_runtime_put_sync(pdata->dev);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void __ti_sn_bridge_pre_enable(struct ti_sn_bridge *pdata)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
>  	pm_runtime_get_sync(pdata->dev);
>  
>  	/* configure bridge ref_clk */
> @@ -443,6 +446,38 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	drm_panel_prepare(pdata->panel);
>  }
>  
> +static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	mutex_lock(&pdata->pre_enable_mutex);
> +	if (pdata->pre_enabled_early)
> +		/* Already done! Just mark that normal pre_enable happened */
> +		pdata->pre_enabled_early = false;
> +	else
> +		__ti_sn_bridge_pre_enable(pdata);
> +	mutex_unlock(&pdata->pre_enable_mutex);
> +}
> +
> +static void ti_sn_bridge_cancel_early_pre_enable(struct ti_sn_bridge *pdata)
> +{
> +	mutex_lock(&pdata->pre_enable_mutex);
> +	if (pdata->pre_enabled_early) {
> +		pdata->pre_enabled_early = false;
> +		ti_sn_bridge_post_disable(&pdata->bridge);
> +	}
> +	mutex_unlock(&pdata->pre_enable_mutex);
> +}
> +
> +static void ti_sn_bridge_pre_enable_timeout(struct work_struct *work)
> +{
> +	struct delayed_work *dwork = to_delayed_work(work);
> +	struct ti_sn_bridge *pdata = container_of(dwork, struct ti_sn_bridge,
> +						  pre_enable_timeout_work);
> +
> +	ti_sn_bridge_cancel_early_pre_enable(pdata);
> +}
> +
>  static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
> @@ -516,6 +551,34 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	}
>  	pdata->dsi = dsi;
>  
> +	/*
> +	 * If we have a refclk then we can support dynamic EDID.
> +	 *
> +	 * A few notes:
> +	 * - From trial and error it appears that we need our clock setup in
> +	 *   order to read the EDID. If we don't have refclk then we
> +	 *   (presumably) need the MIPI clock on, but turning that on implies
> +	 *   knowing the pixel clock / not needing the EDID. Maybe we could
> +	 *   futz this if necessary, but for now we won't.
> +	 * - In order to read the EDID we need power on to the bridge and
> +	 *   the panel (and it has to finish booting up / assert HPD). This
> +	 *   is slow so we leave the panel powered when we're done but setup a
> +	 *   timeout so we don't leave it on forever.
> +	 * - The rest of Linux assumes that it can read the EDID without
> +	 *   (explicitly) enabling the power which is why this somewhat awkward
> +	 *   step is needed.
> +	 */
> +	if (pdata->refclk) {
> +		mutex_lock(&pdata->pre_enable_mutex);
> +
> +		pdata->pre_enabled_early = true;
> +		__ti_sn_bridge_pre_enable(pdata);
> +		pdata->edid = drm_get_edid(&pdata->connector, &pdata->aux.ddc);
> +		schedule_delayed_work(&pdata->pre_enable_timeout_work, 30 * HZ);
> +
> +		mutex_unlock(&pdata->pre_enable_mutex);
> +	}
> +
>  	return 0;
>  
>  err_dsi_attach:
> @@ -525,6 +588,17 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> +static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	cancel_delayed_work_sync(&pdata->pre_enable_timeout_work);
> +	ti_sn_bridge_cancel_early_pre_enable(pdata);
> +
> +	kfree(pdata->edid);
> +	pdata->edid = NULL;
> +}
> +
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> @@ -863,6 +937,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
> +	.detach = ti_sn_bridge_detach,
>  	.pre_enable = ti_sn_bridge_pre_enable,
>  	.enable = ti_sn_bridge_enable,
>  	.disable = ti_sn_bridge_disable,
> @@ -1227,6 +1302,10 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  	if (!pdata)
>  		return -ENOMEM;
>  
> +	mutex_init(&pdata->pre_enable_mutex);
> +	INIT_DELAYED_WORK(&pdata->pre_enable_timeout_work,
> +			  ti_sn_bridge_pre_enable_timeout);
> +
>  	pdata->regmap = devm_regmap_init_i2c(client,
>  					     &ti_sn_bridge_regmap_config);
>  	if (IS_ERR(pdata->regmap)) {
> @@ -1301,7 +1380,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	kfree(pdata->edid);
>  	ti_sn_debugfs_remove(pdata);
>  
>  	of_node_put(pdata->host_node);
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
