Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F05A67F4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 18:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62FF10E188;
	Tue, 30 Aug 2022 16:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717EA10E188
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 16:11:57 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA028481;
 Tue, 30 Aug 2022 18:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661875915;
 bh=8AmOQLTAOPZMzmu3wDqTKczAi5JdyuB8auYYN0VTs6g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UD/qN+iV5W7fuIJ3q27lDK4zTCMKT/Zwx1qDoB4RPTpgV6L5pVdKWoI7md2zg7y9h
 qP6NfzvpA7aHACLHR+E0G9Y48dIIJHNUeOu5esjfGEkWe1vbcQTdUt8CRYyRD0DXcs
 9wYFK1RaC2gCgdcjmW6qBrJ0nJ1J81RXstnx9VSs=
Message-ID: <61274dc0-1377-9330-67b6-0d8abff6e21b@ideasonboard.com>
Date: Tue, 30 Aug 2022 19:11:51 +0300
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
 <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com>
 <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
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

On 30/08/2022 17:55, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 30, 2022 at 2:00 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Hi,
>>
>> On 29/08/2022 20:38, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>
>>>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>
>>>> Implement the bridge connector-related .get_edid() and .detect()
>>>> operations, and report the related bridge capabilities and type.
>>>>
>>>> These ops are only added for DP mode. They should also be used for eDP
>>>> mode, but the driver seems to be mostly used for eDP and, according to
>>>> the comments, they've had issues with eDP panels and HPD. So better be
>>>> safe and only enable them for DP for now.
>>>
>>> Just to be clear: the "They should also be used for eDP" is not correct.
>>>
>>> * The detect() function should be returning whether the display is
>>> physically there. For eDP it is _always_ physically there. Thus for
>>
>> Really? I thought detect() is the polling counter-part of HPD interrupt.
>> What is the point of returning true from detect() if the display is
>> there, but cannot be used?
> 
> The critical thing to realize is that for eDP the "HPD" signal does
> not mean "hot plug detect". Worst. Name. Ever. The HPD signal in eDP
> should be read as "panel IRQ" or "panel ready" or "panel attention" or
> something. Anything but "hot plug detect". eDP is not hot plugged. You
> can't take your laptop and, while it's on, pop the panel out and put
> in another. It's simply not designed for it.

Well, I have to agree that the name is not the best possible. But the 
name is understandable, because of legacy, and in any case I don't 
really see it matters. Unless you go hot-plugging your eDP panel because 
it has HPD ;).

DP has IRQ HPD pulses and "real" HPD pulses. I think we can ignore the 
IRQ pulses in this discussion. The source should have the means to 
distinguish those two.

> Specifically, eDP is _designed_ such that when the panel is turned off
> the system should remove power to the panel. ...and when you remove
> power to the panel then HPD goes low. Yet the panel is still there.
> How do you know? You simply assume that since this is an eDP port that
> it has a panel attached to it. You power it on and you use the "HPD"
> signal (AKA "panel ready") to tell when it's finished powering on.

Yes, I agree.

> This is like every other non-hot-pluggable device in your system. If
> your board has an audio codec then you just know it's there. You power
> it on, wait a fixed amount of time for it to boot (or maybe wait until
> it asserts a GPIO that says it's ready) and then you use it. That
> i2c-controlled trackpad? Same thing. Your eMMC chip? You assume it's
> there and power it up.

Yep.

> 
>>> eDP the _correct_ implementation for detect is to always return true.
>>> Yes, there is a line called HPD for eDP and yes that line is used for
>>> full DisplayPort for detecting a display. For eDP, though, HPD does
>>> not detect the presence of a display. A display is always there.
>>
>> But for eDP it still signals the actual availability of the display,
>> similarly to DP, doesn't it? You can't communicate with the monitor or
>> read the EDID until you get the HPD.
> 
> It signals that the display has finished booting, _not_ whether the
> display is there. The display is always there.
> 
> There are simply two concepts:
> 1. Is a display there?
> 2. Can I talk to the display?
> 
> I assert that the way that "detect" is used in the DRM core is for #1.

Why is that? Can you point to any specific piece of code?

I didn't look it closely, but I believe in my testing I saw that the 
framework expects to be able to read EDID after detect() reports that 
the display is connected. And if EDID read fails, then you get only the 
default modes, even if the display was ready very soon afterwards. If so 
that hints more towards 2.

> In theory one could try to conflate the two. Everyone keeps trying

I agree here, they are not the same.

> until they think about it more. Probably because the signal is named
> HPD and everyone reads that as "hot plug detect". Worst. Name. Ever.
> In any case, here lies dragons. Specifically if you conflate these two
> concepts then when do you know to provide power to the display?
> Remember, you can't detect the display until it's powered. ...but why
> would you power it if you thought it wasn't there? You could power it
> once at bootup, but then if someone turns the display off how will you
> ever know that you can power it back on? It'll look like the display
> was removed...

But here's my question: if detect() tells whether the display is 
physically there, why do we need it?

If the display is not hot-pluggable, then, as you say, it's always 
there, and detect() is unnecessary. The panel driver always assumes the 
panel is there and will power it up. So detect is not really needed.

If the display is hot-pluggable, then we don't need to know if the 
display is physically there, but not ready. We need to know if it's 
ready. So detect is not needed, or rather, it doesn't do what is needed.

The above system feels a bit broken in my opinion. If, on the other 
hand, detect() is the polling counter-part of HPD, i.e. it tells if the 
display is ready, those two different cases converge. For not 
hot-pluggable displays the panel driver knows the panel is always there 
(without detect()), and will power it up. For hot-pluggable devices the 
user must connect the display and press the power button. In both cases 
HPD will then go high and detect() tells that the display is ready.

Of course, for eDP the HPD is optional, so without HPD the panel driver 
just needs to wait a known amount of time until reporting that the panel 
is ready (after maybe doing an AUX read).

>>> * For eDP implementing get_edid() is done in the panel so that power
>>> sequencing can be done properly. While it could have been designed
>>> other ways, that's how we ended up in the end. Thus eDP controllers
>>> don't implement get_edid().
>>
>> Ok. I guess eDP panels do what they want and the drivers cannot rely on
>> the HPD.
>>
>> Or is the whole point here that because eDP panel drivers deal with the
>> panel quirks, the get_edid() and also detect (if any) is handled by the
>> eDP panel driver, and thus the bridge should not implement get_edid()
>> nor detect() for eDP?
> 
> It gets down to making sure things are powered. If the eDP controller
> implements get_edid() then the eDP controller needs to know how to
> power on the panel in response to that get_edid(). Remember, this is
> eDP and we have to _always_ say the panel is there even when HPD
> hasn't been asserted. See the above rant^H^H^H^H explanation. While
> it's possible to have the eDP controller call down the bridge chain to
> power the panel temporarily for get_edid() (early patches of mine did
> that), in the end we decided it made more sense to have this driven by
> the panel driver.

I agree here, the panel driver has to drive the process. That's actually 
how I designed the old omapfb display subsystem (well, DP didn't exist 
then), everything originated from the display driver, not the crtc side.

However, my argument is that someone, be it the display or the source 
driver, should offer detect() and get_edid(), and afaics it makes sense 
for detect() to report whether the display is ready or not (usually HPD 
if it is connected, but could be via some other means).

However, I have to say this is perhaps sidetracking this patch =). I can 
drop the comment in question from the description as it's somewhat 
irrelevant wrt. this patch.

>>>> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>>>           pm_runtime_put_sync(pdata->dev);
>>>>    }
>>>>
>>>> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>>>> +{
>>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>> +       int val = 0;
>>>> +
>>>> +       pm_runtime_get_sync(pdata->dev);
>>>> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>>>> +       pm_runtime_put_autosuspend(pdata->dev);
>>>> +
>>>> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>>>> +                                        : connector_status_disconnected;
>>>> +}
>>>
>>> I thought in the end we decided that you _could_ get a hot plug detect
>>> interrupt if you just did a pm_runtime_get_sync() sometime earlier in
>>> the case of DP. Basically you're just saying that if you're DP that
>>> you always powered up. Doing some searches makes me find some
>>> discussion at:
>>>
>>> https://lore.kernel.org/r/20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com
>>>
>>> Specifically, the right answer is: "In general the pm_runtime_get
>>> reference need to go with the IRQ enabling"
>>>
>>> In any case, if we want to start with just implementing "detect"
>>> that's OK with me...
>>
>> Yes, I have the HPD interrupt working in my branch, kind of. The problem
>> is that with the HPD interrupt I encountered issues (even if the monitor
>> was always connected): every now and then the dsi86 does not display
>> anything and I get a spam of LOSS_OF_DP_SYNC_LOCK_ERR errors, and I
>> couldn't figure out the problem. All the registers on the DSI source and
>> DSI sink side looked identical, so it hints to some kind of race issue,
>> which might well be there even with polling, but just doesn't seem to
>> trigger.
>>
>> To make things worse, the board in question is a remote board and I
>> can't actually test the HPD, i.e. plugging in and out the cable,
>> changing the monitors, powering up/down the monitors, etc.
>>
>> On top of that, a few years back I had a lot of problems working on
>> Cadence DP controller, dealing with all kinds of corner case race issues
>> with DP HPD and trying to comply with the DP spec, which made me realize
>> that DP is just really complex.
>>
>> So, I thought it's better if I just try to get a minimum version working
>> so that we can have a picture on a monitor, without even trying to claim
>> real HPD support.
> 
> Weird. OK. I guess we can see if someone later comes along and tries
> to implement interrupt support. :-)

I could actually add the HPD IRQ patch on top, as an RFC, for that 
future "someone". Or perhaps someone notices a similar stupid mistake in 
that patch as I made in this series and the problem gets solved =).

  Tomi
