Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5182A97C4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 15:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE726E0D4;
	Fri,  6 Nov 2020 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29D6E0D4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 14:37:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6EbaIq009922;
 Fri, 6 Nov 2020 08:37:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604673456;
 bh=QTqGgN17XskZ+DYeAOQfGwTLyMCVyN7OsFq4NonmOWI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JPWSdE73Y9AqmYndL/8yhfQB3sP3oVpzKjkvVqNC2RbQnt1Vn50Habzlu40vCNSCW
 kD70geU3dTMQQhkaFTkUAgbpKKwE24IgKR9Tx1KLInwzThCqxO1zCSTF91u2SBfMRJ
 OKJShafqHcf40z0pJIE8D20iy/JJHfnExSAOtOUQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6Ebahq088465
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 08:37:36 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 08:37:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 08:37:35 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6EbXkj034166;
 Fri, 6 Nov 2020 08:37:34 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
Date: Fri, 6 Nov 2020 16:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2020 20:56, H. Nikolaus Schaller wrote:
> 
>> Am 05.11.2020 um 19:28 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>
>> On 05/11/2020 20:14, H. Nikolaus Schaller wrote:
>>>
>>>> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>>>
>>>> Hi,
>>>>
>>>> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>>>>
>>>>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
>>>>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
>>>>> I followed the latest existing panel-orisetech-otm8009a.c which uses a
>>>>> similar video mode controller and mipi-dsi.
>>>>>
>>>>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>>>>
>>>>> Unfortunately my panel driver is not even loaded by drm/omap so I can't
>>>>> debug. Does this set of drm/omap drivers need a modification of the device
>>>>> tree? If yes, which one?
>>>>
>>>> omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
>>>> DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
>>>> not loaded at all.
>>>
>>> Well, I use the same device tree that loads the old driver...
>>
>> Yeah, I was mistaken above. With DSI the panel (may be) a child of the DSI host, so it will affect.
>>
>> Can you give pointers to the panel driver source and relevant dts files? BOE BTL507212-W677L?
> 
> Yes. It is (now) 
> 
> drivers/gpu/drm/panel/panel-boe-btl507212-w677l.c
> 
> and
> 
> arch/arm/boot/dts/omap5-letux-cortex15-common.dtsi (for the basic dsi definitions)
> arch/arm/boot/dts/pyra-display.dtsi (for the specific display)
> 
> All this is merged by some arch/arm/boot/dts/omap5-letux-cortex15-v5.3+pyra-v5.2.dts

I took the driver and make my omap4-sdp dts to use it. It probes for me, but stop after that:

[  119.346374] omapdss_dss 58000000.dss: supply vdda_video not found, using dummy regulator
[  119.358398] DSS: OMAP DSS rev 4.0
[  119.680053] panel-dsi-cm 58004000.encoder.0: failed to get video timing, using defaults
[  119.695709] panel-dsi-cm 58004000.encoder.0: supply vpnl not found, using dummy regulator
[  119.711242] panel-dsi-cm 58004000.encoder.0: supply vddi not found, using dummy regulator
[  119.769470] panel-btl507212-w677l 58005000.encoder.0: w677l_probe
[  119.779388] panel-btl507212-w677l 58005000.encoder.0: w677l_probe ok
[  119.846679] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdrm])
[  119.858673] omapdss_dss 58000000.dss: bound 58004000.encoder (ops dsi_component_ops [omapdrm])
[  119.882629] omapdss_dss 58000000.dss: bound 58005000.encoder (ops dsi_component_ops [omapdrm])
[  119.902069] omapdss_dss 58000000.dss: bound 58006000.encoder (ops hdmi4_component_ops [omapdrm])
[  119.962066] dmm 4e000000.dmm: initialized all PAT entries
[  120.014770] panel-btl507212-w677l 58005000.encoder.0: w677l_get_modes

I didn't debug yet where it's hanging. So you're not even getting the probe?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
