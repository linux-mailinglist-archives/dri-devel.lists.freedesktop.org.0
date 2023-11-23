Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA37F579A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 06:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370FF10E02A;
	Thu, 23 Nov 2023 05:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27A010E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 05:05:48 +0000 (UTC)
Message-ID: <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700715946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYugOfv/P6L+RRuYh1gmFLfa9vIesmr+A5QNGJYDaUw=;
 b=g9HRLzUmkpHagDxdI/TLY5lo/hr/4l8WGA7Om5EAhUY/EiO8RFMJwt27+WcntqXP+XwE0v
 A/VgdsREGxxAnj867ICcdgARbvFY1OzFpRkkBjZ9l8aGuMxTmotJJad0NrF7nmmlBRDIv0
 6HHFFFvkqDPdgbBsyIBaNqsUkfUnCHU=
Date: Thu, 23 Nov 2023 13:05:28 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/16 19:19, Dmitry Baryshkov wrote:
> On Thu, 16 Nov 2023 at 12:13, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>>
>> On 2023/11/16 17:30, Dmitry Baryshkov wrote:
>>> On Thu, 16 Nov 2023 at 11:14, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>> Hi,
>>>>
>>>> Thanks a lot for reviewing!
>>>>
>>>>
>>>> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
>>>>> On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>
>>>>>> The it66121_create_bridge() and it66121_destroy_bridge() are added to
>>>>>> export the core functionalities. Create a connector manually by using
>>>>>> bridge connector helpers when link as a lib.
>>>>>>
>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> ---
>>>>>>     drivers/gpu/drm/bridge/ite-it66121.c | 134 +++++++++++++++++++--------
>>>>>>     include/drm/bridge/ite-it66121.h     |  17 ++++
>>>>>>     2 files changed, 113 insertions(+), 38 deletions(-)
>>>>>>     create mode 100644 include/drm/bridge/ite-it66121.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>> index 8971414a2a60..f5968b679c5d 100644
>>>>>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>> @@ -22,6 +22,7 @@
>>>>>>
>>>>>>     #include <drm/drm_atomic_helper.h>
>>>>>>     #include <drm/drm_bridge.h>
>>>>>> +#include <drm/drm_bridge_connector.h>
>>>>>>     #include <drm/drm_edid.h>
>>>>>>     #include <drm/drm_modes.h>
>>>>>>     #include <drm/drm_print.h>
>>>>>> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>>>>>>                                     enum drm_bridge_attach_flags flags)
>>>>>>     {
>>>>>>            struct it66121_ctx *ctx = bridge_to_it66121(bridge);
>>>>>> +       struct drm_bridge *next_bridge = ctx->next_bridge;
>>>>>> +       struct drm_encoder *encoder = bridge->encoder;
>>>>>>            int ret;
>>>>>>
>>>>>> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>>>>>> -               return -EINVAL;
>>>>>> +       if (next_bridge) {
>>>>>> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>>>>>> +                       WARN_ON(1);
>>>>> Why? At least use WARN() instead
>>>> Originally I want to
>>>>
>>>>
>>>>
>>>>
>>>>>> +                       flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>>>>>> +               }
>>>>>> +               ret = drm_bridge_attach(encoder, next_bridge, bridge, flags);
>>>>>> +               if (ret)
>>>>>> +                       return ret;
>>>>>> +       } else {
>>>>>> +               struct drm_connector *connector;
>>>>>>
>>>>>> -       ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
>>>>>> -       if (ret)
>>>>>> -               return ret;
>>>>>> +               if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>> +                       WARN_ON(1);
>>>>> No. It is perfectly fine to create attach a bridge with no next_bridge
>>>>> and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>>>
>>>> The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
>>>> the bridge shall not create a drm_connector. So I think if a display
>>>> bridge driver don't have a next bridge attached (Currently, this is
>>>> told by the DT), it says that this is a non-DT environment. On such
>>>> a case, this display bridge driver(it66121.ko) should behavior like
>>>> a *agent*. Because the upstream port of it66121 is the DVO port of
>>>> the display controller, the downstream port of it66121 is the HDMI
>>>> connector. it66121 is on the middle. So I think the it66121.ko should
>>>> handle all of troubles on behalf of the display controller drivers.
>>> No. Don't make decisions for the other drivers. They might have different needs.
>> [...]
>>
>>
>>>> Therefore (when in non-DT use case), the display controller drivers
>>>> side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
>>>> Which is to hint that the it66121 should totally in charge of those
>>>> tasks (either by using bridge connector helper or create a connector
>>>> manually). I don't understand on such a case, why bother display
>>>> controller drivers anymore.
>>> This is the reason why we had introduced this flag. It allows the
>>> driver to customise the connector. It even allows the driver to
>>> implement a connector on its own, completely ignoring the
>>> drm_bridge_connector.
>>
>> I know what you said is right in the sense of the universe cases,
>> but I think the most frequent(majority) use case is that there is
>> only one display bridge on the middle. Therefore, I don't want to
>> movethe connector things into device driver if there is only one display
>> bridge(say it66121) in the middle. After all, there is no *direct
>> physical connection* from the perspective of the hardware. I means that
>> there is no hardware wires connectthe HDMI connector and the DVO port. So display controller drivers
>> should not interact with anything related with the connector on a
>> perfect abstract on the software side. Especially for such a simple use
>> case. It probably make senses to make a  decision for themost frequently use case, please also note
>> that this patch didn't introduce any-restriction for the more advance
>> uses cases(multiple bridges in the middle).
> So, for the sake of not having the connector in the display driver,
> you want to add boilerplate code basically to each and every bridge
> driver. In the end, they should all behave in the same way.
>
> Moreover, there is no way this implementation can work without a
> warning if there are two bridges in a chain and the it66121 is the
> second (the last) one. The host can not specify the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>> +                       WARN_ON(1);
>>>>> No. It is perfectly fine to create attach a bridge with no next_bridge
>>>>> and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>>>
>>>> The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
>>>> the bridge shall not create a drm_connector. So I think if a display
>>>> bridge driver don't have a next bridge attached (Currently, this is
>>>> told by the DT), it says that this is a non-DT environment. On such
>>>> a case, this display bridge driver(it66121.ko) should behavior like
>>>> a *agent*. Because the upstream port of it66121 is the DVO port of
>>>> the display controller, the downstream port of it66121 is the HDMI
>>>> connector. it66121 is on the middle. So I think the it66121.ko should
>>>> handle all of troubles on behalf of the display controller drivers.
>>> No. Don't make decisions for the other drivers. They might have different needs.
>> [...]
>>
>>
>>>> Therefore (when in non-DT use case), the display controller drivers
>>>> side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
>>>> Which is to hint that the it66121 should totally in charge of those
>>>> tasks (either by using bridge connector helper or create a connector
>>>> manually). I don't understand on such a case, why bother display
>>>> controller drivers anymore.
>>> This is the reason why we had introduced this flag. It allows the
>>> driver to customise the connector. It even allows the driver to
>>> implement a connector on its own, completely ignoring the
>>> drm_bridge_connector.
>>
>> I know what you said is right in the sense of the universe cases,
>> but I think the most frequent(majority) use case is that there is
>> only one display bridge on the middle. Therefore, I don't want to
>> movethe connector things into device driver if there is only one display
>> bridge(say it66121) in the middle. After all, there is no *direct
>> physical connection* from the perspective of the hardware. I means that
>> there is no hardware wires connectthe HDMI connector and the DVO port. So display controller drivers
>> should not interact with anything related with the connector on a
>> perfect abstract on the software side. Especially for such a simple use
>> case. It probably make senses to make a  decision for themost frequently use case, please also note
>> that this patch didn't introduce any-restriction for the more advance
>> uses cases(multiple bridges in the middle).
> So, for the sake of not having the connector in the display driver,
> you want to add boilerplate code basically to each and every bridge
> driver. In the end, they should all behave in the same way.

No, I'm only intend to modify the one when there has a user emerged.
If we have the connector related code in the KMS display driver side,
then I think we don't honor the meaning of the word *bridge*. I was
told drm_bridge is a modern design, if we still need the DC side
worry about something do not have a physical connection, then it will
not be modern anymore, it is not a good bridge.


> Moreover, there is no way this implementation can work without a
> warning if there are two bridges in a chain and the it66121 is the
> second (the last) one.

Yes and no!

If one of them are transparent, then thisimplementation still can works. It is just that this will not be a good 
abstract anymore.I do have seen such design on some notebook hardware.  But from my programming experiences,
using two bridges are typically a bad practice in engineering. As it tend
to increase the PCB board area and increase entire cost. As you need buy
one more TX encoder chip. Please also consider that the embedded world focus
on low cost and low power consume.

I think, multiple display bridges case should be avoided for middle/low end
application. Or allow us to handle the two and/or more bridges cases in the
future. When there has at least one user emerged, we will introduce new
approach to handle then.

Do you find any product level boards that using two external display bridge and
one of them is it66121? If we can not even find a user, we are not even have a
board to test if current design (state of art) works. Does it suffer from module
loading order problems? what if their i2c slave address is same? Does such a use
case will past the S3/S4 test? All of those concerns are imposed to every display
bridges programmer from the very beginning.

I'm agree with the idea that drm bridges drivers involved toward to a direction
that support more complex design, but I think we should also leave a way for the
most frequent use case. Make it straight-forward as a canonical design.

> The host can not specify the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, it will cause a warning here. And
> it can not omit the flag (as otherwise the first bridge will create a
> connector, without consulting the second bridge).

The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flagare implement-defined, for our case, I could just ignore it if their 
don't have a signal(DT or ACPI) tell me that there are multiple bridges 
in the chain. This depend on community's attitude.

For it66121 with a canonical design, the host should not need to specify this flag.
Because at the time of when the device driver(it66121.ko) get loaded, the it66121
driver could parse the DT by itself, and detect if there has a next bridge, is it a
connector or is it yet another display bridges. The DT speak everything about the
topology. The flag is there just for the KMS display controller driver to explicit
control, use it and make it more useful is the right way, is it?


>>
>>>>>> +
>>>>>> +               connector = drm_bridge_connector_init(bridge->dev, encoder);
>>>>>> +               if (IS_ERR(connector))
>>>>>> +                       return PTR_ERR(connector);
>>>>>> +
>>>>>> +               drm_connector_attach_encoder(connector, encoder);
>>>>> This goes into your device driver.
>>>>>
>>>>>> +
>>>>>> +               ctx->connector = connector;
>>>>>> +       }
>>>>>>
>>>>>>            if (ctx->info->id == ID_IT66121) {
>>>>>>                    ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>>>>>> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
>>>>>>            "vcn33", "vcn18", "vrf12"
>>>>>>     };
>>>
>
>
