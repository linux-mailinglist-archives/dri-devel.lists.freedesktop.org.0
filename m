Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046B5A5ECA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA59710ED68;
	Tue, 30 Aug 2022 09:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01DC10ED68
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:00:17 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 557A4481;
 Tue, 30 Aug 2022 11:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661850015;
 bh=13U3J7Z6tmsyRvv1tAhEkWsgbcllLRwexO7xNIX81X4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T84QAoY0PN6tqlzn4JjSyGb5xvpMeFMYAxN0vDxN9eqthBDUHQDt16SbMDb4F5+nR
 7oPDKCzkoXhxR2z6xAOG873v8wu+JeV9HoKwmz4Ladqqp9TKRT/JvpjpLmeyBQLL69
 OwtpegtVXX91laQpLohNyPzSmEMqc/4u4DVsR0ss=
Message-ID: <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com>
Date: Tue, 30 Aug 2022 12:00:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 29/08/2022 20:38, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Implement the bridge connector-related .get_edid() and .detect()
>> operations, and report the related bridge capabilities and type.
>>
>> These ops are only added for DP mode. They should also be used for eDP
>> mode, but the driver seems to be mostly used for eDP and, according to
>> the comments, they've had issues with eDP panels and HPD. So better be
>> safe and only enable them for DP for now.
> 
> Just to be clear: the "They should also be used for eDP" is not correct.
> 
> * The detect() function should be returning whether the display is
> physically there. For eDP it is _always_ physically there. Thus for

Really? I thought detect() is the polling counter-part of HPD interrupt. 
What is the point of returning true from detect() if the display is 
there, but cannot be used?

> eDP the _correct_ implementation for detect is to always return true.
> Yes, there is a line called HPD for eDP and yes that line is used for
> full DisplayPort for detecting a display. For eDP, though, HPD does
> not detect the presence of a display. A display is always there.

But for eDP it still signals the actual availability of the display, 
similarly to DP, doesn't it? You can't communicate with the monitor or 
read the EDID until you get the HPD.

> * For eDP implementing get_edid() is done in the panel so that power
> sequencing can be done properly. While it could have been designed
> other ways, that's how we ended up in the end. Thus eDP controllers
> don't implement get_edid().

Ok. I guess eDP panels do what they want and the drivers cannot rely on 
the HPD.

Or is the whole point here that because eDP panel drivers deal with the 
panel quirks, the get_edid() and also detect (if any) is handled by the 
eDP panel driver, and thus the bridge should not implement get_edid() 
nor detect() for eDP?

>> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>          pm_runtime_put_sync(pdata->dev);
>>   }
>>
>> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>> +{
>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>> +       int val = 0;
>> +
>> +       pm_runtime_get_sync(pdata->dev);
>> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>> +       pm_runtime_put_autosuspend(pdata->dev);
>> +
>> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>> +                                        : connector_status_disconnected;
>> +}
> 
> I thought in the end we decided that you _could_ get a hot plug detect
> interrupt if you just did a pm_runtime_get_sync() sometime earlier in
> the case of DP. Basically you're just saying that if you're DP that
> you always powered up. Doing some searches makes me find some
> discussion at:
> 
> https://lore.kernel.org/r/20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com
> 
> Specifically, the right answer is: "In general the pm_runtime_get
> reference need to go with the IRQ enabling"
> 
> In any case, if we want to start with just implementing "detect"
> that's OK with me...

Yes, I have the HPD interrupt working in my branch, kind of. The problem 
is that with the HPD interrupt I encountered issues (even if the monitor 
was always connected): every now and then the dsi86 does not display 
anything and I get a spam of LOSS_OF_DP_SYNC_LOCK_ERR errors, and I 
couldn't figure out the problem. All the registers on the DSI source and 
DSI sink side looked identical, so it hints to some kind of race issue, 
which might well be there even with polling, but just doesn't seem to 
trigger.

To make things worse, the board in question is a remote board and I 
can't actually test the HPD, i.e. plugging in and out the cable, 
changing the monitors, powering up/down the monitors, etc.

On top of that, a few years back I had a lot of problems working on 
Cadence DP controller, dealing with all kinds of corner case race issues 
with DP HPD and trying to comply with the DP spec, which made me realize 
that DP is just really complex.

So, I thought it's better if I just try to get a minimum version working 
so that we can have a picture on a monitor, without even trying to claim 
real HPD support.

  Tomi
