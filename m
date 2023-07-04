Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD074777B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 19:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43210E2FE;
	Tue,  4 Jul 2023 17:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54010E2FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=R1ftX/nJ28RCUlvCxqfDZHT0ym06Es3SsEj3om09Vrs=;
 b=mFMBx5NkiSByK1HMjoIkzQWNmb/ecgu4OOhkDtUvQth7NKdDRhm3aIp5s8eso3WdLAB+9xiBPbmSt
 PA3WhzFS9ZgVq2RloHgeFfgZ/NFVjPtgR+YEMQeC/6OM40w1LuQTKek+MlpIRwyDxL6tWPQAs6ZJgE
 VPloanifqZ0Kpn16QDQRettF7Yffput5jWae6HWTFbdQJ0O7HJCiR9EAWZAg2OvcA0CJtCElPD/h2c
 IEuuVxok7/fSaC2Krc7/yMkaLKGY5KaKVOIdBcI2Qckntdn8h5ZUiZFJLdCzZxdE9fXzXeToS5HZt1
 2A8rIjpoUk4iTafFGT1fxcFbgp045ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=R1ftX/nJ28RCUlvCxqfDZHT0ym06Es3SsEj3om09Vrs=;
 b=toRiw7qMpH7Z7h0WvXiLqGcMRtSWVEuTV0dLMJp/Y5OSdD/HkZxSQEK+aO01h63/4SliBFN0BR4Ib
 6F8dl2YAw==
X-HalOne-ID: 428b86cc-1a8d-11ee-8bd0-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 428b86cc-1a8d-11ee-8bd0-b90637070a9d;
 Tue, 04 Jul 2023 17:07:32 +0000 (UTC)
Date: Tue, 4 Jul 2023 19:07:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230704170731.GB940443@ravnborg.org>
References: <20230704140750.25799-1-mans@mansr.com>
 <20230704150310.GA385243@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704150310.GA385243@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Mans Rullgard <mans@mansr.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

> > @@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
> >  	props.type = BACKLIGHT_RAW;
> >  	props.max_brightness = priv->max_brightness;
> >  	props.brightness = priv->default_brightness;
> > -	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> > -		      FB_BLANK_UNBLANK;
> > +	props.power = (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
> > +		      FB_BLANK_POWERDOWN;
> 
> The logic was wrong before but I think will still be wrong after the
> change too (e.g. the bogus logic is probably avoiding backlight flicker
> in some use cases).
> 
> The logic here needs to be similar to what pwm_bl.c implements in
> pwm_backlight_initial_power_state(). Whilst it might be better
> to implement this in led_bl_get_leds() let me show what I mean
> in code that fits in the current line:
> 
> 	/*
> 	 * Activate the backlight if the LEDs are already lit *or*
> 	 * there is no phandle link (meaning the backlight power
> 	 * state cannot be synced with the display state).
> 	 */
> 	props.power = (active_at_boot || !dev->node->phandle) ?
> 			FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> 
The following code does the same using helpers:

	if (active_at_boot || !dev->node->phandle))
		backlight_enable(bd);
	else
		backlight_disable(bd);

The code needs to execute after backlight_device_register() so maybe not
so great an idea?!?

	Sam
