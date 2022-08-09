Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0858D3C1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 08:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CC18B613;
	Tue,  9 Aug 2022 06:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD048D973
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 06:28:37 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 222773F1;
 Tue,  9 Aug 2022 08:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660026515;
 bh=SQ31brOwN9LndgZkTVvStpPTpGc9AXKb4M0uJCt5md0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WdgxszXaAqVrtvzCeePrP18gJaZDUun+Eaux0TDcLieRc+BYzb15/5PxfLn5KIoHK
 SgpPUs8pozlUrmFryRt+WMnAGBcoSkUTc6Dg9IgK66ee/fOYkV230m4b8456Lz0m7f
 42WaIF95gN5YxMdNS1f/Jruy7LAma3AWTUIVtga0=
Message-ID: <b8fd1719-b0ec-495b-54f9-1d591ff8af9e@ideasonboard.com>
Date: Tue, 9 Aug 2022 09:28:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/8] drm/tidss: Add support for Dual Link LVDS Bus Format
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-5-a-bhatia1@ti.com>
 <f2909af1-be23-009b-ba71-34206f099473@ideasonboard.com>
 <ec8dce9b-51d6-a566-67bb-b76f6f3458d7@ideasonboard.com>
 <1f9de2d8-7507-bdc2-93c1-470c8e060586@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1f9de2d8-7507-bdc2-93c1-470c8e060586@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 09/08/2022 08:58, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 28-Jul-22 17:15, Tomi Valkeinen wrote:
>> On 28/07/2022 14:03, Tomi Valkeinen wrote:
>>> On 19/07/2022 11:08, Aradhya Bhatia wrote:
>>>> The 2 OLDI TXes in the AM625 SoC can be synced together to output a 2K
>>>> resolution video.
>>>>
>>>> Add support in the driver for the discovery of such a dual mode
>>>> connection on the OLDI video port, using the values of "ti,oldi-mode"
>>>> property.
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 39 
>>>> +++++++++++++++++++++--------
>>>>   1 file changed, 28 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> index add725fa682b..fb1fdecfc83a 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> @@ -853,25 +853,36 @@ void dispc_set_irqenable(struct dispc_device 
>>>> *dispc, dispc_irq_t mask)
>>>>       }
>>>>   }
>>>> -enum dispc_oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 
>>>> 2 };
>>>> +enum dispc_oldi_mode_reg_val {
>>>> +    SPWG_18        = 0,
>>>> +    JEIDA_24    = 1,
>>>> +    SPWG_24        = 2,
>>>> +    DL_SPWG_18    = 4,
>>>> +    DL_JEIDA_24    = 5,
>>>> +    DL_SPWG_24    = 6,
>>>> +};
>>>>   struct dispc_bus_format {
>>>>       u32 bus_fmt;
>>>>       u32 data_width;
>>>>       bool is_oldi_fmt;
>>>> +    bool is_dual_link;
>>>>       enum dispc_oldi_mode_reg_val oldi_mode_reg_val;
>>>>   };
>>>>   static const struct dispc_bus_format dispc_bus_formats[] = {
>>>> -    { MEDIA_BUS_FMT_RGB444_1X12,        12, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB565_1X16,        16, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB666_1X18,        18, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB888_1X24,        24, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB101010_1X30,        30, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB121212_1X36,        36, false, 0 },
>>>> -    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, SPWG_18 },
>>>> -    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, SPWG_24 },
>>>> -    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, JEIDA_24 },
>>>> +    { MEDIA_BUS_FMT_RGB444_1X12,        12, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB565_1X16,        16, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB666_1X18,        18, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB888_1X24,        24, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB101010_1X30,        30, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB121212_1X36,        36, false, false, 0 },
>>>> +    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, false, SPWG_18 },
>>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, false, SPWG_24 },
>>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, false, 
>>>> JEIDA_24 },
>>>> +    { MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,    18, true, true, 
>>>> DL_SPWG_18 },
>>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,    24, true, true, 
>>>> DL_SPWG_24 },
>>>> +    { MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,    24, true, true, 
>>>> DL_JEIDA_24 },
>>>>   };
>>>
>>> So the dual link sends two pixels per clock, right? Are there panel 
>>> or bridge drivers that support this? My initial thought was that it 
>>> should be a new bus format.
>>
>> Looks like we have drm bridges supporting dual link, and they use the 
>> "normal" bus format. Did you have a look at them? They require two 
>> port nodes for dual link, and use the existence of the second one to 
>> decide if dual link is used or not.
> The above edits were not for adding a new bus format for dual link
> connections. I added them in order to be able to write the correct OLDI
> config values in the register.
> 
>>
>> There are also lvds helpers in drm_of.c. I didn't look closely, but it 
>> looked to me that the helpers can tell you if the ports are connected 
>> to a dual link bridge. If not, you could fall back to cloning. This 
>> way no extra properties are needed. But you will need to add a port 
>> node, which I think you need to add anyway for cloning.
> I have now seen drm_of.c and examples (renesas' rcar lvds) that use the
> apis that drm_of.c is offering. In those cases, the OLDI TXes are being
> modeled as separate devices, which is not the case with the tidss' OLDI
> TXes. Since the only few OLDI registers are in the DSS address space,
> they were just being configured through the tidss driver.

I think it's irrelevant (in the bigger picture) whether the TXes are 
separate devices, single device or part of some other device. Or why do 
you think it matters?

> Even in DT, the dss port (for OLDI) connects to the panel port's
> endpoint directly. Even in cases of dual link or cloning, it's only a
> singular remote-to-endpoint connection between the (OLDI) VP and the
> panel port. Hence the requirement of the properties in the earlier
> patches of the series.

Sorry, I don't follow. If you use cloning, you have two TX outputs, 
going to two panels, right? So you need two panel DT nodes, and those 
would connect to two OLDI TX ports in the DSS.

Afaics the existing dual link bridge/panel drivers also use two ports 
for the connection, so to use the dual link you need two ports in the DSS.

I admit I'm not familiar with LVDS dual link, but it's not clear to me 
how you see the dual OLDI TX being used with other drivers if you have 
only one port. What kind of setups have you tested?

> The use of lvds helper functions does not seem feasible in this case,
> because even they read DT properties to determine the dual link
> connection and those properties need to be a part of a lvds bridge
> device.

Can you elaborate a bit more why the DRM helpers couldn't be used here?

> I have also been considering the idea of implementing a new device
> driver for the OLDI TXes, not unlike the renesas' one. That way the
> driver could have the properties and the lvds helper functions at their
> disposal. I am just slightly unsure if that would allow space for any
> conflicts because of the shared register space.

No, I don't think new devices are needed here.

  Tomi
