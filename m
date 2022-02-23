Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E64C192B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD6710F1BF;
	Wed, 23 Feb 2022 16:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEA010F1BF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:57:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3EDFA83CA0;
 Wed, 23 Feb 2022 17:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645635457;
 bh=6RNnxFry+EgzWhSv2OUCDvWAJ7ot/hbdOI28iSxKcJU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g5QTKwgLA6VEINSzj3IjkjmC/0f158foiTe59tKknQKbbLE0nPbKSM+/nvRri7fkL
 WrHWYj6ArDm8lw/DhCdM4zJMZVFO08bKvTqBd7bJoZFpxDTex6mxCEXNykTMgDf0iy
 eJ90IF5FWQbDxvgd2/rIU7djiB+tK7RthWG/s35kBqT+DLyZw3QQ222jmullQOBo89
 UnnNVWdEksRSD2T9PhsWRyNOuIMemVR6LmrTKPdCNdouI4VIcaJwULVeApKdn1uIJE
 iu8mEYb62NcJzDcnC7dnjT3wuVAGckueTPExnISxH0sBNDbx6WzntkWuVcYWqvHw5w
 KDHW6fw2kM1AA==
Message-ID: <b603555c-874c-c216-06ec-a57736735565@denx.de>
Date: Wed, 23 Feb 2022 17:57:35 +0100
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
 <bdb7884f-4c66-44ab-72e3-003b50364457@denx.de>
 <20220223163930.wk3twgz6hranicv6@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220223163930.wk3twgz6hranicv6@houat>
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

On 2/23/22 17:39, Maxime Ripard wrote:
> On Wed, Feb 23, 2022 at 03:38:20PM +0100, Marek Vasut wrote:
>> On 2/23/22 15:37, Maxime Ripard wrote:
>>> On Wed, Feb 23, 2022 at 03:09:08PM +0100, Marek Vasut wrote:
>>>> On 2/23/22 14:47, Maxime Ripard wrote:
>>>>> On Wed, Feb 23, 2022 at 02:45:30PM +0100, Marek Vasut wrote:
>>>>>> On 2/23/22 14:41, Maxime Ripard wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
>>>>>>>> Use the new property bus-format to set the enum bus_format and bpc.
>>>>>>>> Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
>>>>>>>>
>>>>>>>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 32 insertions(+)
>>>>>>>>
>>>>>>>> Relates to the discussion: https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
>>>>>>>>
>>>>>>>> Max
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>>>>>>> index c5f133667a2d..5c07260de71c 100644
>>>>>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>>>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>>>>>> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>>>>>>>>      	struct panel_desc *desc;
>>>>>>>>      	unsigned int bus_flags;
>>>>>>>>      	struct videomode vm;
>>>>>>>> +	const char *format = "";
>>>>>>>>      	int ret;
>>>>>>>>      	np = dev->of_node;
>>>>>>>> @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
>>>>>>>>      	of_property_read_u32(np, "width-mm", &desc->size.width);
>>>>>>>>      	of_property_read_u32(np, "height-mm", &desc->size.height);
>>>>>>>> +	of_property_read_string(np, "bus-format", &format);
>>>>>>>> +	if (!strcmp(format, "BGR888_1X24")) {
>>>>>>>> +		desc->bpc = 8;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
>>>>>>>> +	} else if (!strcmp(format, "GBR888_1X24")) {
>>>>>>>> +		desc->bpc = 8;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
>>>>>>>> +	} else if (!strcmp(format, "RBG888_1X24")) {
>>>>>>>> +		desc->bpc = 8;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
>>>>>>>> +	} else if (!strcmp(format, "RGB444_1X12")) {
>>>>>>>> +		desc->bpc = 6;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB444_1X12;
>>>>>>>> +	} else if (!strcmp(format, "RGB565_1X16")) {
>>>>>>>> +		desc->bpc = 6;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
>>>>>>>> +	} else if (!strcmp(format, "RGB666_1X18")) {
>>>>>>>> +		desc->bpc = 6;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
>>>>>>>> +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
>>>>>>>> +		desc->bpc = 6;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
>>>>>>>> +	} else if (!strcmp(format, "RGB888_1X24")) {
>>>>>>>> +		desc->bpc = 8;
>>>>>>>> +		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>>>>>>> +	} else {
>>>>>>>> +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
>>>>>>>> +			np);
>>>>>>>> +		return -EINVAL;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>
>>>>>>> It doesn't seem right, really. We can't the bus format / bpc be inferred
>>>>>>> from the compatible? I'd expect two panels that don't have the same bus
>>>>>>> format to not be claimed as compatible.
>>>>>>
>>>>>> Which compatible ?
>>>>>>
>>>>>> Note that this is for panel-dpi compatible, i.e. the panel which has timings
>>>>>> specified in DT (and needs bus format specified there too).
>>>>>
>>>>> panel-dpi is supposed to have two compatibles, the panel-specific one
>>>>> and panel-dpi. This would obviously be tied to the panel-specific one.
>>>>
>>>> This whole discussion is about the one which only has 'panel-dpi' compatible
>>>> and describes the panel in DT completely. The specific compatible is not
>>>> present in DT when this patch is needed.
>>>
>>>   From the panel-dpi DT binding:
>>>
>>> properties:
>>>     compatible:
>>>       description:
>>>         Shall contain a panel specific compatible and "panel-dpi"
>>>         in that order.
>>>       items:
>>>         - {}
>>>         - const: panel-dpi
>>>
>>> The panel-specific compatible is mandatory, whether you like it or not.
>>
>> It doesn't seem to me that's the intended use per panel-simple.c , so maybe
>> the bindings need to be fixed too ?
> 
> It's not clear to me why this has anything to do with panel-simple, but
> the binding is correct, and that requirement is fairly standard. We have
> the same thing with panel-lvds for example.

I think this patch is related to this patch, which was not mentioned in 
the commit message:

[RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping property"

(unless I am confused)

With LVDS the situation is simpler, you have three formats and that's it 
(18bpp and 2 24bpp), with DPI it is more complex, since you need to deal 
with color channel width (888, 666 and even 565 and other oddities), 
then with mapping (RGB, BGR, etc), and then you can have panels with 
only 18bpp inputs wired to 24bpp DPI bus and vice versa which you also 
have to somehow describe.
