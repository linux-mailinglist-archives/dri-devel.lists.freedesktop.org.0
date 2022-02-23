Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7674C1489
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE4310F639;
	Wed, 23 Feb 2022 13:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D29B10F623
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 13:45:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BD16183A86;
 Wed, 23 Feb 2022 14:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645623931;
 bh=zYVFzquWo0ZnrAIKq4iBaHHU/QV8Vu3hFGEDpo/EJ98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K4U6Fk09ixsyLR+2TcaViAAnMrRhl63Gc9zmNoPyAm/Sw9tIu+Aztu9pDBbybSAST
 n1noCI+ndWHtGBBxi/0cqAatyQc6jHuOV3ww8UAAChW7RBangVNZGgduJrFBJsmB23
 HfJSWaSvQ+g/uFiP7aPzXMvc7jDPzbFFJDqE9JMWWPyRhYQ5f9poFvd1TcT2tsGJh3
 jUlkY58NUFrxUvdoHUkPebzDDpm8DqsXg8SGYzXI66/o9O7kp9HKqLlzbc0Eb4TDJo
 Yw2Moq0ZiBn8pUbwDisgY9wfgjSoH9FXJdnrMV4fmZqK0vscnC3eZCtcdLz80ltPvE
 87/NPlgNdmkAA==
Message-ID: <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
Date: Wed, 23 Feb 2022 14:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Max Krummenacher <max.oss.09@gmail.com>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220223134154.oo7xhf37bgtvm3ai@houat>
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 14:41, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
>> Use the new property bus-format to set the enum bus_format and bpc.
>> Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> ---
>>
>>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> Relates to the discussion: https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
>>
>> Max
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index c5f133667a2d..5c07260de71c 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>>   	struct panel_desc *desc;
>>   	unsigned int bus_flags;
>>   	struct videomode vm;
>> +	const char *format = "";
>>   	int ret;
>>   
>>   	np = dev->of_node;
>> @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
>>   	of_property_read_u32(np, "width-mm", &desc->size.width);
>>   	of_property_read_u32(np, "height-mm", &desc->size.height);
>>   
>> +	of_property_read_string(np, "bus-format", &format);
>> +	if (!strcmp(format, "BGR888_1X24")) {
>> +		desc->bpc = 8;
>> +		desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
>> +	} else if (!strcmp(format, "GBR888_1X24")) {
>> +		desc->bpc = 8;
>> +		desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
>> +	} else if (!strcmp(format, "RBG888_1X24")) {
>> +		desc->bpc = 8;
>> +		desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
>> +	} else if (!strcmp(format, "RGB444_1X12")) {
>> +		desc->bpc = 6;
>> +		desc->bus_format = MEDIA_BUS_FMT_RGB444_1X12;
>> +	} else if (!strcmp(format, "RGB565_1X16")) {
>> +		desc->bpc = 6;
>> +		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
>> +	} else if (!strcmp(format, "RGB666_1X18")) {
>> +		desc->bpc = 6;
>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
>> +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
>> +		desc->bpc = 6;
>> +		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
>> +	} else if (!strcmp(format, "RGB888_1X24")) {
>> +		desc->bpc = 8;
>> +		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>> +	} else {
>> +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
>> +			np);
>> +		return -EINVAL;
>> +	}
>> +
> 
> It doesn't seem right, really. We can't the bus format / bpc be inferred
> from the compatible? I'd expect two panels that don't have the same bus
> format to not be claimed as compatible.

Which compatible ?

Note that this is for panel-dpi compatible, i.e. the panel which has 
timings specified in DT (and needs bus format specified there too).

I agree this doesn't look right however, some more generic color channel 
width/shift/mapping might be better.
