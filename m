Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AB36D964
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E256EB4A;
	Wed, 28 Apr 2021 14:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9876EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:16:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B330282CAE;
 Wed, 28 Apr 2021 16:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619619382;
 bh=+3g3JkWmBA3GIPh/Isd/nbPejEz640mfCrRr6l6osIA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=csQKNoxCjIfBTk9hEx4bN5t5qCaK1ahZ78rEFW3JvhkJBo45wAMZZxSd8XTKrdVEo
 vuhhaWYZv7qw1RLsiewmBxhVbwUcjDSlQWCKFqK3C54gtNwfv/Io+0zK0PhNQhsaBq
 VHkXRVkywub0DnWVszPQ/QySC0aWrsksCg0CQRJNo2Sbeh3Ok4KXLbKK8PwWwfAmF8
 k9lIk8yKSfIjft7zUhJeYRYyD9YzseMN7oGz+Wx7zzLEj86chlaLl0BCjAqk8s4ouo
 Tyzn9P2SHcPJwpJVhwZ3Wsxm5Ha44CRqJD/iBNwoUS2PEuGWHSmfTOGSaeGD2lA9O8
 THzV0r2/nGz4Q==
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Neil Armstrong <narmstrong@baylibre.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
 <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
 <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a91a379a-2d3a-fe31-98b5-194bf648bc44@denx.de>
Date: Wed, 28 Apr 2021 16:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: ch@denx.de, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/21 11:24 AM, Neil Armstrong wrote:
[...]

>>>>> +static int sn65dsi83_probe(struct i2c_client *client,
>>>>> +               const struct i2c_device_id *id)
>>>>> +{
>>>>> +    struct device *dev = &client->dev;
>>>>> +    enum sn65dsi83_model model;
>>>>> +    struct sn65dsi83 *ctx;
>>>>> +    int ret;
>>>>> +
>>>>> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>> +    if (!ctx)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    ctx->dev = dev;
>>>>> +
>>>>> +    if (dev->of_node)
>>>>> +        model = (enum sn65dsi83_model)of_device_get_match_data(dev);
>>>>> +    else
>>>>> +        model = id->driver_data;
>>>>> +
>>>>> +    /* Default to dual-link LVDS on all but DSI83. */
>>>>> +    if (model != MODEL_SN65DSI83)
>>>>> +        ctx->lvds_dual_link = true;
>>>>
>>>> What if I use the DSI84 with a single link LVDS? I can't see any way to
>>>> configure that right now.
>>
>> I assume the simplest way would be to use the "ti,sn65dsi83"
>> compatible string in your dts, since the way you wired it is
>> 'compatible' with sn65dsi83, right?
> 
> No this isn't the right way to to, if sn65dsi84 is supported and the bindings only support single lvds link,
> the driver must only support single link on sn65dsi84, or add the dual link lvds in the bindings only for sn65dsi84.

The driver has a comment about what is supported and tested, as Frieder 
already pointed out:

Currently supported:
- SN65DSI83
   = 1x Single-link DSI ~ 1x Single-link LVDS
   - Supported
   - Single-link LVDS mode tested
- SN65DSI84
   = 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
   - Supported
   - Dual-link LVDS mode tested
   - 2x Single-link LVDS mode unsupported
     (should be easy to add by someone who has the HW)
- SN65DSI85
   = 2x Single-link or 1x Dual-link DSI ~ 2x Single-link or 1x Dual-link 
LVDS
   - Unsupported
     (should be easy to add by someone who has the HW)

So,
DSI83 is always single-link DSI, single-link LVDS.
DSI84 is always single-link DSI, and currently always dual-link LVDS.

The DSI83 can do one thing on the LVDS end:
- 1x single link lVDS

The DSI84 can do two things on the LVDS end:
- 1x single link lVDS
- 1x dual link LVDS

There is also some sort of mention in the DSI84 datasheet about 2x 
single link LVDS, but I suspect that might be copied from DSI85 
datasheet instead, which would make sense. The other option is that it 
behaves as a mirror (i.e. same pixels are scanned out of LVDS channel A 
and B). Either option can be added by either adding a DT property which 
would enable the mirror mode, or new port linking the LVDS endpoint to 
the same panel twice, and/or two new ports for DSI85, so there is no 
problem to extend the bindings without breaking them. So for now I would 
ignore this mode.

So ultimately, what we have to sort out is the 1x single / 1x dual link 
LVDS mode setting on DSI84. Frieder already pointed out how the driver 
can be tweaked to support the single-link mode on DSI84, so now we need 
to tie it into DT bindings.

Currently, neither the LVDS panels in upstream in panel-simple nor 
lvds.yaml provide any indication that the panel is single-link or 
dual-link. Those dual-link LVDS panels seem to always set 2x pixel clock 
and let the bridge somehow sort it out.

Maybe that isn't always the best approach, maybe we should add a new 
DRM_BUS_FLAG for those panels and handle the flag in the bridge driver ? 
Such a new flag could be added over time to panels where applicable, so 
old setups won't be broken by that either, they will just ignore the new 
flag and work as before.

>>> I just saw the note in the header of the driver that says that single
>>> link mode is unsupported for the DSI84.
>>>
>>> I have hardware with a single link display and if I set
>>> ctx->lvds_dual_link = false it works just fine.
>>>
>>> How is this supposed to be selected? Does it need an extra devicetree
>>> property? And would you mind adding single-link support in the next
>>> version or do you prefer adding it in a follow-up patch?
>>
>> If this has to be supported I think the proper way would be to support
>> two output ports in the dts (e.g. lvds0_out, lvds1_out), in the same
>> way as supported by the 'advantech,idk-2121wr' panel.
> 
> Yes, this is why I asked to have the dual-link lvds in the bindings.

Maybe it shouldn't really be in the bindings, see above.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
