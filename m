Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19B62B9F8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B017510E469;
	Wed, 16 Nov 2022 10:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F99110E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 10:49:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CA181849CD;
 Wed, 16 Nov 2022 11:49:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668595750;
 bh=sibu3ZcbuUqrJzBypYt6NUSckTBHKUd106eG2tssPso=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KdPR/f+oN6pSojybMhlrN/yr6kW6QjdgDsAGRD3zaI05KTriTjaXnLiMUVGFj4KWh
 wJ4K86Pf1kSleI3EbOWHwEkZfJ0hsaoCsUq4OC6h2Pfy6bj9WMB1v2oA7JqZX4qWG1
 ld9GNWzbgcydm6Ml7RnImKqZDFZAn4juOiMKisKeqwmOviNJHGXOQt0XpR7ZhxOWQW
 JL0oZAkkAeJH0gLjVhXC2hBf6pRXK8O73+U2LuFWcJTI3p6s2YQT09Ky3soiHt2jIT
 ar7kFDwGiwFMuXAD5cRmjXQ0R8PTrUcDwFk27jOqd6tYbV3PFT+n7Mf/xiXxi/lTxW
 TVoKex7FUkOBQ==
Message-ID: <7635358a-fc32-5a78-6130-7c5f4dd2d81b@denx.de>
Date: Wed, 16 Nov 2022 11:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
 <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
 <CGME20221115120119eucas1p1c57ca32b0a372d00cfb7b6dfb86cc1a7@eucas1p1.samsung.com>
 <35a96ba1-1022-5f7a-ffb6-b3400279e244@denx.de>
 <60729cf5-04b1-b9aa-fb0f-60efacde285d@samsung.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <60729cf5-04b1-b9aa-fb0f-60efacde285d@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 09:07, Marek Szyprowski wrote:
> On 15.11.2022 13:00, Marek Vasut wrote:
>> On 11/14/22 08:49, Jagan Teki wrote:
>>> On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>> Finding the right input bus format throughout the pipeline is hard
>>>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>>>> proper input format from list of supported output formats.
>>>>>
>>>>> This format can be used in pipeline for negotiating bus format between
>>>>> the DSI-end of this bridge and the other component closer to pipeline
>>>>> components.
>>>>>
>>>>> List of Pixel formats are taken from,
>>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>> 3.7.4 Pixel formats
>>>>> Table 14. DSI pixel packing formats
>>>>>
>>>>> v8:
>>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI
>>>>> DSI/CSI-2
>>>>>
>>>>> v7, v6, v5, v4:
>>>>> * none
>>>>>
>>>>> v3:
>>>>> * include media-bus-format.h
>>>>>
>>>>> v2:
>>>>> * none
>>>>>
>>>>> v1:
>>>>> * new patch
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 53
>>>>> +++++++++++++++++++++++++++
>>>>>     1 file changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -15,6 +15,7 @@
>>>>>     #include <linux/clk.h>
>>>>>     #include <linux/delay.h>
>>>>>     #include <linux/irq.h>
>>>>> +#include <linux/media-bus-format.h>
>>>>>     #include <linux/of_device.h>
>>>>>     #include <linux/phy/phy.h>
>>>>>
>>>>> @@ -1321,6 +1322,57 @@ static void
>>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>     }
>>>>>
>>>>> +/*
>>>>> + * This pixel output formats list referenced from,
>>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>> + * 3.7.4 Pixel formats
>>>>> + * Table 14. DSI pixel packing formats
>>>>> + */
>>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>>
>>>> You can also add :
>>>>
>>>> MEDIA_BUS_FMT_YUYV10_1X20
>>>>
>>>> MEDIA_BUS_FMT_YUYV12_1X24
>>>
>>> Are these for the below formats?
>>>
>>> "Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>>>    Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
>>>>
>>>>> +     MEDIA_BUS_FMT_UYVY8_1X16,
>>>>> +     MEDIA_BUS_FMT_RGB101010_1X30,
>>>>> +     MEDIA_BUS_FMT_RGB121212_1X36,
>>>>> +     MEDIA_BUS_FMT_RGB565_1X16,
>>>>> +     MEDIA_BUS_FMT_RGB666_1X18,
>>>>> +     MEDIA_BUS_FMT_RGB888_1X24,
>>>>> +};
>>>>> +
>>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>>> +{
>>>>> +     int i;
>>>>> +
>>>>> +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts);
>>>>> i++) {
>>>>> +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>>> +                     return true;
>>>>> +     }
>>>>> +
>>>>> +     return false;
>>>>> +}
>>>>> +
>>>>> +static u32 *
>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>> +                                    struct drm_bridge_state
>>>>> *bridge_state,
>>>>> +                                    struct drm_crtc_state
>>>>> *crtc_state,
>>>>> +                                    struct drm_connector_state
>>>>> *conn_state,
>>>>> +                                    u32 output_fmt,
>>>>> +                                    unsigned int *num_input_fmts)
>>>>> +{
>>>>> +     u32 *input_fmts;
>>>>> +
>>>>> +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>>> +             return NULL;
>>>>> +
>>>>> +     *num_input_fmts = 1;
>>>>
>>>> Shouldn't this be 6 ?
>>>>
>>>>> +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>>>>> +     if (!input_fmts)
>>>>> +             return NULL;
>>>>> +
>>>>> +     input_fmts[0] = output_fmt;
>>>>
>>>> Shouldn't this be a list of all 6 supported pixel formats ?
>>>
>>> Negotiation would settle to return one input_fmt from the list of
>>> supporting output_fmts. so the num_input_fmts would be 1 rather than
>>> the number of fmts in the supporting list. This is what I understood
>>> from the atomic_get_input_bus_fmts API. let me know if I miss
>>> something here.
>>
>> How does the negotiation work for this kind of pipeline:
>>
>> LCDIFv3<->DSIM<->HDMI bridge<->HDMI connector
>>
>> where all elements (LCDIFv3, DSIM, HDMI bridge) can support either
>> RGB888 or packed YUV422 ?
>>
>> Who decides the format used by such pipeline ?
>>
>> Why should it be the DSIM bridge and not e.g. the HDMI bridge or the
>> LCDIFv3 ?
> 
> 
> If I got it right, the drivers reports their preference for the returned
> formats. The format that is first in the reported array is the most
> preferred one. This probably means that in your case the HDMI bridge
> decides by reporting RGB or YUV first (if all elements supports both).

But in that case, we need to list input_fmts[0]...input_fmts[n-1] in 
samsung_dsim_atomic_get_input_bus_fmts() and also set *num_input_fmts = 
n, correct ?
