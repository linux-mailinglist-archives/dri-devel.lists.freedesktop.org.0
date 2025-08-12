Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23AB246D8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAC810E6E1;
	Wed, 13 Aug 2025 10:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EBtlOOjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at gabe;
 Tue, 12 Aug 2025 18:20:41 UTC
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813510E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 18:20:40 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57CIAhtT1896346;
 Tue, 12 Aug 2025 13:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755022243;
 bh=DTRGSr/sFqz08xTFK9XBf9uPAWALzcXmf8DmSzCh0us=;
 h=Date:Subject:From:To:CC:References:In-Reply-To;
 b=EBtlOOjj5xK3wwwMUOSHbhUYClQTKWCZlZlNuSgsm74hVSgN+8Qh0tM1Wx+mcmiE2
 Qr7esoVUrjGZ22kSvHng8LlxowAAtE6h06JA3wfMoxui/8e3CvvKwV9+QYGzMdxV/Q
 CYvOR1aR78/xQBLTVbetN7CLtUYbRT6bzmCh7mtQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57CIAhPi3655268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 12 Aug 2025 13:10:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 12
 Aug 2025 13:10:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 12 Aug 2025 13:10:42 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57CIAZNH1066109;
 Tue, 12 Aug 2025 13:10:36 -0500
Message-ID: <02920114-b86b-47ad-945d-1905b9117518@ti.com>
Date: Tue, 12 Aug 2025 23:40:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
From: Swamil Jain <s-jain1@ti.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, devarsh <devarsht@ti.com>,
 "Jyri Sarha" <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
 <71ef3203-e11d-4244-8d2d-8e47e8ba6140@ti.com>
 <f15779ad-788a-4dc6-b5a6-4187b9a9c986@ti.com>
 <e9df67f0-8fce-4fbf-8fff-c499c4a2efaf@bootlin.com>
 <86cf7d99-1295-42ab-acda-88a8212ec4d4@ti.com>
Content-Language: en-US
In-Reply-To: <86cf7d99-1295-42ab-acda-88a8212ec4d4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/12/25 23:32, Swamil Jain wrote:
> 
> 
> On 8/11/25 15:26, Louis Chauvet wrote:
>>
>>
>> Le 08/08/2025 à 18:26, Swamil Jain a écrit :
>>>
>>>
>>> On 8/8/25 19:16, devarsh wrote:
>>>> Hi Louis,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> On 30/07/25 22:32, Louis Chauvet wrote:
>>>>> As stated in the AM62x Technical Reference Manual (SPRUIV7B), the data
>>>>> sampling edge needs to be configured in two distinct registers: one 
>>>>> in the
>>>>> TIDSS IP and another in the memory-mapped control register modules.
>>>>
>>>> I don't think AM62x is thee only one which requires this and on the
>>>> contrary not all SoCs require this extra setting. We had been 
>>>> waiting on
>>>> confirmations from hardware team and very recently they gave a list of
>>>> SoCs which require this, as per that I think we need to limit this to
>>>> AM62x and AM62A per current supported SoCs.
>>>>
>>>> Swamil,
>>>> Please confirm on this and share if any additional details required 
>>>> here.
>>>>
>>>
>>> Yeah Devarsh, as you mentioned, this is valid for AM62X, AM62A and
>>> AM62P. We would have upstreamed this feature, but there are some
>>> corrections in Technical Reference Manual for these SoCs regarding
>>> programming CTRL_MMR_DPI_CLK_CTRL register fields, we are in loop with
>>> H/W team, waiting for their official confirmation regarding this issue.
>>>
>>> Thanks Louis for working on this patch, but we should wait for H/W
>>> team's confirmation.
>>
>> Hello all,
>>
>> Thanks for the feedback. I was not aware of this current work.
>> Do you plan to send the fix yourself? Should I wait your HW team 
>> feedback and send a v2?
>>
> Hi Louis, H/W team confirmed that, CTRL_MMR_DPI0_CLK_CTRL.bit[8] should 
> be programmed same as DSS_VP1_POL_FREQ.bit[14](IPC) and 
> CTRL_MMR_DPI0_CLK_CTRL.bit[9] should be programmed same as 
> DSS_VP1_POL_FREQ.bit[16](RF). Please continue with you patches.
> 
Please go ahead and send v2.
We are working with the documentation team to get the Technical 
Reference Manual updated in parallel.

Regards,
Swamil.

>> I also have a very similar patch ready for u-boot (depending on the 
>> same DT modifications), do you plan to fix u-boot too?
>>
> Please fix u-boot also.
> 
> Thanks and regards,
> Swamil.
> 
>> Thanks,
>> Louis Chauvet
>>
>>
>>> Regards,
>>> Swamil.
>>>
>>>> Regards
>>>> Devarsh
>>>>
>>>>    Since
>>>>> the latter is not within the same address range, a phandle to a syscon
>>>>> device is used to access the regmap.
>>>>>
>>>>> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone 
>>>>> platform Display SubSystem")
>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> ---
>>>>>    drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> index 
>>>>> c0277fa36425ee1f966dccecf2b69a2d01794899..65ca7629a2e75437023bf58f8a1bddc24db5e3da 100644
>>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> @@ -498,6 +498,7 @@ struct dispc_device {
>>>>>        const struct dispc_features *feat;
>>>>>        struct clk *fclk;
>>>>> +    struct regmap *clk_ctrl;
>>>>>        bool is_enabled;
>>>>> @@ -1267,6 +1268,11 @@ void dispc_vp_enable(struct dispc_device 
>>>>> *dispc, u32 hw_videoport,
>>>>>                   FLD_VAL(mode->vdisplay - 1, 27, 16));
>>>>>        VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
>>>>> +
>>>>> +    if (dispc->clk_ctrl) {
>>>>> +        regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 
>>>>> : 0x000);
>>>>> +        regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 
>>>>> 0x000);
>>>>> +    }
>>>>>    }
>>>>>    void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
>>>>> @@ -3012,6 +3018,14 @@ int dispc_init(struct tidss_device *tidss)
>>>>>        dispc_init_errata(dispc);
>>>>> +    dispc->clk_ctrl = 
>>>>> syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
>>>>> +                                   "ti,clk-ctrl");
>>>>> +    if (IS_ERR(dispc->clk_ctrl)) {
>>>>> +        r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
>>>>> +                  "DISPC: syscon_regmap_lookup_by_phandle 
>>>>> failed.\n");
>>>>> +        return r;
>>>>> +    }
>>>>> +
>>>>>        dispc->fourccs = devm_kcalloc(dev, 
>>>>> ARRAY_SIZE(dispc_color_formats),
>>>>>                          sizeof(*dispc->fourccs), GFP_KERNEL);
>>>>>        if (!dispc->fourccs)
>>>>>
>>>>
>>
> 
