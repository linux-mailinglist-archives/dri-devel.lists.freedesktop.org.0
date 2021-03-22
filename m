Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57F343DD5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCBB89E2B;
	Mon, 22 Mar 2021 10:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DE589E1D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:29:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F3rMR6z02z1s1Jn;
 Mon, 22 Mar 2021 11:29:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F3rMR136vz1qv9k;
 Mon, 22 Mar 2021 11:29:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LMI6HZNx46EO; Mon, 22 Mar 2021 11:29:05 +0100 (CET)
X-Auth-Info: OdWZttE73T3wEDb4s/kUALOAD3JZlDfgmD+lEgdjvh0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Mar 2021 11:29:05 +0100 (CET)
Subject: Re: [PATCH V2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201224061832.92010-1-marex@denx.de>
 <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Date: Mon, 22 Mar 2021 11:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/21 2:14 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

[...]

>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> index e5e3c72630cf..399a6528780a 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> @@ -74,6 +74,13 @@ properties:
>>   
>>       additionalProperties: false
>>   
>> +  pixelclk-active:
>> +    description: |
>> +      Data sampling on rising or falling edge.
>> +      Use 0 to sample pixel data on rising edge and
>> +      Use 1 to sample pixel data on falling edge and
>> +    enum: [0, 1]
> 
> The idea is good, but instead of adding a custom property, how about
> reusing the pclk-sample property defined in
> ../../media/video-interfaces.yaml ?

Repeating myself from V1 discussion ... Either is fine by me, but I 
think pixelclk-active, which comes from panel-timings.yaml is closer to 
the video than multimedia bindings.

> The property is only valid for encoders, so I would at least mention
> that in the description, or, better, handle this based on the compatible
> string to allow validation.

How does that work in the Yaml file ?

>> +
>>     powerdown-gpios:
>>       description:
>>         The GPIO used to control the power down line of this device.
>> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
>> index dcf579a4cf83..cab81ccd895d 100644
>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c

[...]

>> @@ -126,6 +146,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>>   	 */
>>   	lvds_codec->bridge.of_node = dev->of_node;
>>   	lvds_codec->bridge.funcs = &funcs;
>> +	lvds_codec->bridge.timings = &lvds_codec->timings;
>>   	drm_bridge_add(&lvds_codec->bridge);
>>   
>>   	platform_set_drvdata(pdev, lvds_codec);
>> @@ -142,19 +163,20 @@ static int lvds_codec_remove(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static const struct lvds_codec_data decoder_data = {
>> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>> +	.is_encoder = false,
> 
> The two fields are a bit redundant, as the decoder is always
> LVDS-to-DPI, and the encoder DPI-to-LVDS. I don't mind too much, but
> maybe we could drop the connector_type field, and derive the connector
> type from is_encoder ?

Or the other way around instead ? That is, if the connector_type is 
LVDS, then it is encoder , otherwise its decoder ?

> One may then say that we could drop the lvds_codec_data structure as it
> contains a single field, but I foresee a need to have device-specific
> timings at some point, so I think it's a good addition.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
