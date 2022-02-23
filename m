Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E24C1589
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD6610EA22;
	Wed, 23 Feb 2022 14:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2284310EA22
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:38:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 58B2781109;
 Wed, 23 Feb 2022 15:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645627102;
 bh=hIFXz5v2y46Ri1OO3QKmfqtZSuVyllWu5uYkTc/fKB0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OsnxWgAXWOxc4vaYA0N5CwYNxJWHXG+iRJ4F81rLpuQ99GNfsszc2VL65/ne1Ojvy
 yDgjedmjGgmZO+RpC8FAybnE519Fz6Sfo0VS2HsW9l8GSOf54lbN716wqIyzn86455
 b1cx5briJ1fYFuVuHVpuwcaj8g5BQigcfKAniPyczfPEBLg1eTIUbe5oWR5MXWqpLF
 VlCftfkHHKYimHKtweNGods6Q+cOsg2Lii384STv7CNRvCViRIj4/np/t1w4UTX6IG
 JxelFkYM+PBM51ciav3GMhhwgrri/lff+dCzpI3QMEA+vm5czE+tMIgKzNf3UONEYh
 kT+cdAmdNhrvg==
Message-ID: <bdb7884f-4c66-44ab-72e3-003b50364457@denx.de>
Date: Wed, 23 Feb 2022 15:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <20220223134757.f5upi2iun27op5w5@houat>
 <d9ac0b96-3327-d250-dcdd-f49fc56b922c@denx.de>
 <20220223143703.xi7vpamjg4ytmvqs@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220223143703.xi7vpamjg4ytmvqs@houat>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 15:37, Maxime Ripard wrote:
> On Wed, Feb 23, 2022 at 03:09:08PM +0100, Marek Vasut wrote:
>> On 2/23/22 14:47, Maxime Ripard wrote:
>>> On Wed, Feb 23, 2022 at 02:45:30PM +0100, Marek Vasut wrote:
>>>> On 2/23/22 14:41, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
>>>>>> Use the new property bus-format to set the enum bus_format and bpc.
>>>>>> Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
>>>>>>
>>>>>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>>     drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>>>>>>     1 file changed, 32 insertions(+)
>>>>>>
>>>>>> Relates to the discussion: https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
>>>>>>
>>>>>> Max
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>>>>> index c5f133667a2d..5c07260de71c 100644
>>>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>>>> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>>>>>>     	struct panel_desc *desc;
>>>>>>     	unsigned int bus_flags;
>>>>>>     	struct videomode vm;
>>>>>> +	const char *format = "";
>>>>>>     	int ret;
>>>>>>     	np = dev->of_node;
>>>>>> @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
>>>>>>     	of_property_read_u32(np, "width-mm", &desc->size.width);
>>>>>>     	of_property_read_u32(np, "height-mm", &desc->size.height);
>>>>>> +	of_property_read_string(np, "bus-format", &format);
>>>>>> +	if (!strcmp(format, "BGR888_1X24")) {
>>>>>> +		desc->bpc = 8;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
>>>>>> +	} else if (!strcmp(format, "GBR888_1X24")) {
>>>>>> +		desc->bpc = 8;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
>>>>>> +	} else if (!strcmp(format, "RBG888_1X24")) {
>>>>>> +		desc->bpc = 8;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
>>>>>> +	} else if (!strcmp(format, "RGB444_1X12")) {
>>>>>> +		desc->bpc = 6;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB444_1X12;
>>>>>> +	} else if (!strcmp(format, "RGB565_1X16")) {
>>>>>> +		desc->bpc = 6;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
>>>>>> +	} else if (!strcmp(format, "RGB666_1X18")) {
>>>>>> +		desc->bpc = 6;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
>>>>>> +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
>>>>>> +		desc->bpc = 6;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
>>>>>> +	} else if (!strcmp(format, "RGB888_1X24")) {
>>>>>> +		desc->bpc = 8;
>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>>>>> +	} else {
>>>>>> +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
>>>>>> +			np);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>
>>>>> It doesn't seem right, really. We can't the bus format / bpc be inferred
>>>>> from the compatible? I'd expect two panels that don't have the same bus
>>>>> format to not be claimed as compatible.
>>>>
>>>> Which compatible ?
>>>>
>>>> Note that this is for panel-dpi compatible, i.e. the panel which has timings
>>>> specified in DT (and needs bus format specified there too).
>>>
>>> panel-dpi is supposed to have two compatibles, the panel-specific one
>>> and panel-dpi. This would obviously be tied to the panel-specific one.
>>
>> This whole discussion is about the one which only has 'panel-dpi' compatible
>> and describes the panel in DT completely. The specific compatible is not
>> present in DT when this patch is needed.
> 
>  From the panel-dpi DT binding:
> 
> properties:
>    compatible:
>      description:
>        Shall contain a panel specific compatible and "panel-dpi"
>        in that order.
>      items:
>        - {}
>        - const: panel-dpi
> 
> The panel-specific compatible is mandatory, whether you like it or not.

It doesn't seem to me that's the intended use per panel-simple.c , so 
maybe the bindings need to be fixed too ?
