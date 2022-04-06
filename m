Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CD4F6EE9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 02:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C8410E04F;
	Thu,  7 Apr 2022 00:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C997C10E04F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 00:00:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1237983E1E;
 Thu,  7 Apr 2022 02:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649289605;
 bh=txF5rAJLPO9Bn7UjkzPzYmyUX9Go7Z3fUPoeU4GEFeE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xdRzMMYFFKcdvo4t/ruim8+0Rp7hd/ioyoXC0Uu4fhjbDzUpDCo5eXg2vkbOF4xwE
 8lwj9JGinDBP0mYiSSSYJB06eoSo9WsCvxHP9JoNk+lSWYrq7xie5/idubcMsiTNw0
 2dReyzd7yQgl7ob7L17rJQPpMLOUkgjacINB2YUbLFkfJQ7b8YU58lEAvV5ebAwDhc
 7L4x4RLsvBhswSeG9KoaT4xV/OVGrH7aFZmAolqXTTnPf3aEJVvy/JhChCvOAVO2Dt
 OFRyM7cvlHwWsf0c5RqYfwzVvdj30gF25mX5f2ne6bXRn7xF7PBdcTVNsq5+nME/0a
 krfhjx19lr1Sw==
Message-ID: <893aa689-d6f3-234f-693d-d31872697d92@denx.de>
Date: Wed, 6 Apr 2022 23:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/7] drm: mxsfb: Simplify LCDIF clock handling
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <fe732f785a4c58f6225f72f5c420d4abc611553c.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <fe732f785a4c58f6225f72f5c420d4abc611553c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 21:32, Lucas Stach wrote:
> Hi Marek,

Hi,

> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>> The current clock handling in the LCDIF driver is a convoluted mess.
> 
> Here we agree...
> 
>> Implement runtime PM ops which turn the clock ON and OFF and let the
>> pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
>> and .atomic_disable callbacks turn the clock ON and OFF at the right
>> time.
>>
>> This requires slight reordering in mxsfb_crtc_atomic_enable() and
>> mxsfb_crtc_atomic_disable(), since all the register accesses must
>> happen only with clock enabled and clock frequency configuration
>> must happen with clock disabled.
>>
> ... on that one I don't. Please don't move the pixel clock into the RPM
> calls. We have a very well defined point between atomic enable/disable
> where the pixel clock is actually needed. All the other configuration
> accesses don't need the pixel clock to be active.

On the other hand, "all the other" configuration happens during probe, 
at which point all the clock are enabled anyway. And then during 
runtime, the pixel clock of this IP are either enabled or this IP is 
completely shut down.

So, where exactly does this patch make the clock handling any worse than 
it currently is ?

[...]

>> @@ -274,44 +256,37 @@ static int mxsfb_load(struct drm_device *drm,
>>   
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>> -		goto err_vblank;
>> +		return ret;
>>   	mxsfb->irq = ret;
>>   
>> -	pm_runtime_get_sync(drm->dev);
>>   	ret = mxsfb_irq_install(drm, mxsfb->irq);
>> -	pm_runtime_put_sync(drm->dev);
>> -
> Here you do a bunch of stuff resulting in register access without
> enabling the clocks. I don't really see how this works, maybe because
> the clocks are still on when you run the probe?

Right

> Better enable the register access clocks here and then tell RPM about
> the fact that the device is running by calling pm_runtime_set_active
> before pm_runtime_enable. This way theoretically allows to build a
> kernel without CONFIG_PM and things still work, even if the RPM calls
> are stubs.

I would much rather move this driver to RPM and have RPM handle the 
clock altogether in one place.

[...]

>> @@ -411,9 +405,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>>   	}
>>   	spin_unlock_irq(&drm->event_lock);
>>   
>> -	drm_crtc_vblank_off(crtc);
>> -
>> -	mxsfb_disable_axi_clk(mxsfb);
>>   	pm_runtime_put_sync(drm->dev);
>>
> Not the fault of your patch, but why is this a _sync call?

See 4201f4e848450 ("drm/mxsfb: Add pm_runtime calls to 
pipe_enable/disable"), likely the intention was for this call to 
complete before existing the atomic_disable.
