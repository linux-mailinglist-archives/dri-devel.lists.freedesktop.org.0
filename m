Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48E58D6EE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD592873;
	Tue,  9 Aug 2022 09:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71191553
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 09:57:45 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C923F481;
 Tue,  9 Aug 2022 11:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660039064;
 bh=AYFA8tcMi2LZnHlEWUX2E2FwrgpZvIPMpJivPfDx1w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VBuKNFMmyEAuVVY9DB8royWh4lugtGmv68yVKG3LrfilA3Sgubko5ywXENMQtaTIZ
 ftiZvXnvkl19Mtu8a0UUFi3tFLm+kz7byZYcrVoWoMCnbC8BJcP5WqVBfr0WmJNRNN
 072mBPUw/5Qrb5DfoKqu2wgCK5PnYLhIS7h+Mzs0=
Message-ID: <54c62926-d501-35f8-f135-477216bf3444@ideasonboard.com>
Date: Tue, 9 Aug 2022 12:57:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>
References: <20220627151200.4693-1-a-bhatia1@ti.com>
 <20220627151200.4693-3-a-bhatia1@ti.com>
 <4382b760-418f-4033-97f2-47e082a30232@ideasonboard.com>
 <cb9ada9f-9673-2039-c22b-fa0d3345fe41@ti.com>
 <1a394a4d-1099-400f-2b52-e7a02e379cba@ideasonboard.com>
 <52edcdda-35ee-ae04-4991-0978b7d06c21@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <52edcdda-35ee-ae04-4991-0978b7d06c21@ti.com>
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
 Devarsh Thakkar <devarsht@ti.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2022 12:21, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 09-Aug-22 12:01, Tomi Valkeinen wrote:
>> On 09/08/2022 09:08, Aradhya Bhatia wrote:
>>> Hi Tomi,
>>>
>>> On 28-Jul-22 17:34, Tomi Valkeinen wrote:
>>>> On 27/06/2022 18:12, Aradhya Bhatia wrote:
>>>>> Add support for the DSS IP on TI's new AM625 SoC in the tidss driver.
>>>>>
>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> Reviewed-by: Rahul T R <r-ravikumar@ti.com>
>>>>> ---
>>>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 56 
>>>>> ++++++++++++++++++++++++++++-
>>>>>   drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>>>>>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>>>>>   3 files changed, 58 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> index dae47853b728..f084f0688a54 100644
>>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> @@ -272,6 +272,55 @@ const struct dispc_features dispc_j721e_feats = {
>>>>>       .vid_order = { 1, 3, 0, 2 },
>>>>>   };
>>>>> +const struct dispc_features dispc_am625_feats = {
>>>>> +    .max_pclk_khz = {
>>>>> +        [DISPC_VP_DPI] = 165000,
>>>>> +        [DISPC_VP_OLDI] = 165000,
>>>>> +    },
>>>>> +
>>>>> +    .scaling = {
>>>>> +        .in_width_max_5tap_rgb = 1280,
>>>>> +        .in_width_max_3tap_rgb = 2560,
>>>>> +        .in_width_max_5tap_yuv = 2560,
>>>>> +        .in_width_max_3tap_yuv = 4096,
>>>>> +        .upscale_limit = 16,
>>>>> +        .downscale_limit_5tap = 4,
>>>>> +        .downscale_limit_3tap = 2,
>>>>> +        /*
>>>>> +         * The max supported pixel inc value is 255. The value
>>>>> +         * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
>>>>> +         * The maximum bpp of all formats supported by the HW
>>>>> +         * is 8. So the maximum supported xinc value is 32,
>>>>> +         * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
>>>>> +         */
>>>>> +        .xinc_max = 32,
>>>>> +    },
>>>>> +
>>>>> +    .subrev = DISPC_AM625,
>>>>> +
>>>>> +    .common = "common",
>>>>> +    .common_regs = tidss_am65x_common_regs,
>>>>> +
>>>>> +    .num_vps = 2,
>>>>> +    .vp_name = { "vp1", "vp2" },
>>>>> +    .ovr_name = { "ovr1", "ovr2" },
>>>>> +    .vpclk_name =  { "vp1", "vp2" },
>>>>> +    .vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
>>>>
>>>> This looks correct, but with the two OLDI TXes, I think there will 
>>>> be some interesting issues.
>>>>
>>>> The tidss_kms.c associates a DSS VP and a DT port, but that's no 
>>>> longer true if you add the ports for both OLDI TXes, as they both 
>>>> use the same VP. I think fixing that won't affect this patch, 
>>>> though, and merging this patch will, afaik, enable similar DSS 
>>>> functionality as we have for AM65x.
>>>>
>>>> So, I think these two patches could be merged, or we could wait a 
>>>> bit until the OLDI situation becomes more clear. Up to you. In any 
>>>> case, for both patches:
>>>>
>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>\
>>>
>>> Thank you for the review!
>>>
>>> This patch set is required for the dss DT patches to be upstreamed for
>>> the AM625-SK, so I would like them to get merged.
>>>
>>> Since these were posted in the previous merge window, I will re-send 
>>> with your tag.
>>
>> I'd like to understand better the dual OLDI TX case before merging any 
>> AM625 dss changes.
>>
>> At the moment you have only one port in the DT for the OLDI TX for 
>> AM625, right? I don't see how that is supposed to work as there are 
>> two OLDI outputs. 
> The OLDI node doesn't have node of its own at all. Its the dss port that
> gets directly connected to the panel ports.
> 
>> And if we do add a new port, it perhaps makes sense to have two OLDI 
>> TX ports as ports 0 and 1, and the DPI as port 2, which is then 
>> different from AM65x.
> The DSS still has a single (DPI) VP for the OLDI outputs. Both the OLDI 
> TXes receive the same input from the DSS VP.

Yes, but don't mix the DSS VP and the DT port. They are not the same thing.

> Wouldn't having them modeled as videp ports 0 and 1 would mean that the
> DSS is capable of driving 2 different OLDI displays? (which is not the
> case here).

If you use the OLDI cloning, the AM625 is driving two OLDI displays, no? 
In theory the panels could be of different model, as long as they both 
support the same video mode, and they could be managed by different 
drivers. This requires two ports so that you can connect the panels in 
the DT.

But let's continue this discussion in the "[PATCH 4/8] drm/tidss: Add 
support for Dual Link LVDS Bus Format" thread, no need to discuss the 
same things in two threads =).

  Tomi
