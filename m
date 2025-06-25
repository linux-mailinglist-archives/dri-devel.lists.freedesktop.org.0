Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383BAE819F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395F510E217;
	Wed, 25 Jun 2025 11:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xq9nlzeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2786E10E217
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:41:13 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 576CF6F3;
 Wed, 25 Jun 2025 13:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750851645;
 bh=d070qAEZgxidwjedTmRNJ8GWUf+wa/RxGhJfYnWxxb4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xq9nlzeS7ucVFlbYAnNuo7hsLhte9e4I0SAoOn+pG2UkaxnQUl3oB4QQTYSS4TyCn
 naAkLIGYfA0+yswT2KKXDwD2TcO4aGnB8iFnHDUns7eCoQwWWUSH+8y87CDjq3i8jg
 JO046JREbDyXj60F6hBYdbMpXfbnFHBOqLc35jUE=
Message-ID: <d0baec54-26cd-45bf-b4dc-fbd4131e0462@ideasonboard.com>
Date: Wed, 25 Jun 2025 14:41:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tidss: Decouple max_pclk from tidss feats to
 remove clock dependency
To: Jayesh Choudhary <j-choudhary@ti.com>, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org, devarsht@ti.com, mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
References: <20250618100509.20386-1-j-choudhary@ti.com>
 <5337fc13-f7e3-4252-84db-e1129cc31e32@ideasonboard.com>
 <a6c0b929-383f-4541-b4f1-c2e54f547de4@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <a6c0b929-383f-4541-b4f1-c2e54f547de4@ti.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25/06/2025 14:15, Jayesh Choudhary wrote:
> Hello Tomi,
> 
> On 24/06/25 17:29, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 18/06/2025 13:05, Jayesh Choudhary wrote:
>>> TIDSS hardware by itself does not have variable max_pclk for each VP.
>>> Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
>>> devices uses "ultra-light" version where each VP supports a max of
>>> 300MHz whereas J7* devices uses TIDSS where all VP can support a
>>> max pclk of 600MHz.
>>> The limitation that has been modeled till now comes from the clock
>>> (PLL can only be programmed to a particular max value). Due to this
>>> we end up using different compatible for each SoC when the clocking
>>> architecture changes for VPs, even when the hardware is essentially
>>> the same.
>>> max_pclk cannot be entirely removed since the display controller
>>> should tell if a particular mode clock can be supported or not in crtc's
>>> "mode_valid()" call. So remove "max_pclk_khz" from the static display
>>> feat and add it to "tidss_device" structure which would be modified in
>>> runtime. In mode_valid() call, check if a best frequency match for mode
>>> clock can be found or not using "clk_round_rate()". Based on that,
>>> propagate "max_pclk" and check max_clk again only if the requested mode
>>> clock is greater than saved value. (As the preferred display mode is
>>> usually the max resolution, driver ends up checking the maximum clock
>>> the first time itself which is used in subsequent checks)
>>> Since TIDSS display controller provides clock tolerance of 5%, we use
>>> this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
>>> before it is called.
>>
>> An empty line between paragraphs makes the desc easier to read.
> 
> Okay. Will add empty lines here.
> 
>>
>>> This will make the existing compatibles reusable.
>>>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>
>>> Changelog v1->v2:
>>> - Rebase it on linux-next after OLDI support series[0] as all of its
>>>    patches are reviewed and tested and it touches one of the functions
>>>    used.
>>>    v1 patch link:
>>> <https://lore.kernel.org/all/20250618075804.139844-1-j-
>>> choudhary@ti.com/>
>>>
>>> Test log on TI's J784S4 SoC with a couple of downstream patches
>>> to integrate DSI support on one of the video ports:
>>> <https://gist.github.com/Jayesh2000/ad4ab87028740efa60e5eb83fb892097>
>>>
>>>  From the logs, we can see that for CLK ID 218 (DSS), we do not have to
>>> call sci_clk_determine_rate() multiple times. So there is very little
>>> overhead of this call even with multiple mode_valid() called during
>>> display run.
>>>  From weston-simple-egl application, I have seen that there is no frame
>>> drop or performance impact.
>>>
>>> Once this patch gets in, I will send patches for AM62P and J722S DSS
>>> support.
>>>
>>> [0]: https://lore.kernel.org/all/20250528122544.817829-1-
>>> aradhya.bhatia@linux.dev/
> 
> One more observation here. This patch works absolutely fine in the
> current tree (all SOCs that have TIDSS in upstream tree)
> ***This change is fully backward compatible.***
> 
> But after applying some downstream patches for OLDI support on
> J722S/AM62P, I saw that clk_round_rate() causes issue in display
> as the VP clock is not actually being handled by TIDSS, but actually it
> is owned by OLDI and the clock request is for (7 * VP) value to
> accound for the fixed clock divider present in case of OLDI panel.
> 
> In the OLDI support[0], I see that the serial clock is handled properly
> and we also check the value after setting it in the driver. So we should
> avoid performing clock operations for OLDI in TIDSS driver.
> 
> OLDI driver during tidss_oldi_init() stores the parent VP in oldi-
>>parent_vp which can be used to avoid performing clk_round_rate()
> in tidss driver, and in oldi, we can add atomic_check hook to propagate
> max_pclk[] value for OLDI VP.
> 
> I will post next revision on top of [0] soon accounting this as well.
> (Some oldi driver changes)
> 
> [0]: https://lore.kernel.org/all/20250528122544.817829-1-
> aradhya.bhatia@linux.dev/
> 
> 
>>>
>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 74 ++++++++++++-----------------
>>>   drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>>>   drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
>>>   3 files changed, 33 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/
>>> tidss/tidss_dispc.c
>>> index c0277fa36425..ad9ffc3685b4 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> @@ -58,10 +58,6 @@ static const u16
>>> tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   const struct dispc_features dispc_k2g_feats = {
>>>       .min_pclk_khz = 4375,
>>>   -    .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 150000,
>>> -    },
>>> -
>>>       /*
>>>        * XXX According TRM the RGB input buffer width up to 2560 should
>>>        *     work on 3 taps, but in practice it only works up to 1280.
>>> @@ -144,11 +140,6 @@ static const u16
>>> tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   };
>>>     const struct dispc_features dispc_am65x_feats = {
>>> -    .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 165000,
>>> -        [DISPC_VP_OLDI_AM65X] = 165000,
>>> -    },
>>> -
>>>       .scaling = {
>>>           .in_width_max_5tap_rgb = 1280,
>>>           .in_width_max_3tap_rgb = 2560,
>>> @@ -244,11 +235,6 @@ static const u16
>>> tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>   };
>>>     const struct dispc_features dispc_j721e_feats = {
>>> -    .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 170000,
>>> -        [DISPC_VP_INTERNAL] = 600000,
>>> -    },
>>> -
>>>       .scaling = {
>>>           .in_width_max_5tap_rgb = 2048,
>>>           .in_width_max_3tap_rgb = 4096,
>>> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
>>>   };
>>>     const struct dispc_features dispc_am625_feats = {
>>> -    .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 165000,
>>> -        [DISPC_VP_INTERNAL] = 170000,
>>> -    },
>>> -
>>>       .scaling = {
>>>           .in_width_max_5tap_rgb = 1280,
>>>           .in_width_max_3tap_rgb = 2560,
>>> @@ -380,10 +361,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>>        * if the code reaches dispc_mode_valid with VP1,
>>>        * it should return MODE_BAD.
>>>        */
>>> -    .max_pclk_khz = {
>>> -        [DISPC_VP_TIED_OFF] = 0,
>>> -        [DISPC_VP_DPI] = 165000,
>>> -    },
>>>         .scaling = {
>>>           .in_width_max_5tap_rgb = 1280,
>>> @@ -441,10 +418,6 @@ const struct dispc_features dispc_am62a7_feats = {
>>>   };
>>>     const struct dispc_features dispc_am62l_feats = {
>>> -    .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 165000,
>>> -    },
>>> -
>>>       .subrev = DISPC_AM62L,
>>>         .common = "common",
>>> @@ -1347,25 +1320,48 @@ static void dispc_vp_set_default_color(struct
>>> dispc_device *dispc,
>>>               DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>>>   }
>>>   +/*
>>> + * Calculate the percentage difference between the requested pixel
>>> clock rate
>>> + * and the effective rate resulting from calculating the clock
>>> divider value.
>>> + */
>>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long
>>> real_rate)
>>> +{
>>> +    int r = rate / 100, rr = real_rate / 100;
>>> +
>>> +    return (unsigned int)(abs(((rr - r) * 100) / r));
>>> +}
>>> +
>>> +static int check_max_pixel_clock(struct dispc_device *dispc,
>>> +                 u32 hw_videoport, unsigned long clock)
>>> +{
>>> +    if (clock > dispc->tidss->max_pclk[hw_videoport]) {
>>> +        unsigned long round_clock = clk_round_rate(dispc-
>>> >vp_clk[hw_videoport], clock);
>>> +
>>> +        if (dispc_pclk_diff(clock, round_clock) > 5)
>>> +            return -EINVAL;
>>> +
>>> +        dispc->tidss->max_pclk[hw_videoport] = round_clock;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>>                        u32 hw_videoport,
>>>                        const struct drm_display_mode *mode)
>>>   {
>>>       u32 hsw, hfp, hbp, vsw, vfp, vbp;
>>>       enum dispc_vp_bus_type bus_type;
>>> -    int max_pclk;
>>>         bus_type = dispc->feat->vp_bus_type[hw_videoport];
>>>   -    max_pclk = dispc->feat->max_pclk_khz[bus_type];
>>> -
>>> -    if (WARN_ON(max_pclk == 0))
>>> +    if (bus_type == DISPC_VP_TIED_OFF)
>>>           return MODE_BAD;
>>>         if (mode->clock < dispc->feat->min_pclk_khz)
>>>           return MODE_CLOCK_LOW;
>>>   -    if (mode->clock > max_pclk)
>>> +    if (check_max_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>>>           return MODE_CLOCK_HIGH;
>>>         if (mode->hdisplay > 4096)
>>> @@ -1437,17 +1433,6 @@ void dispc_vp_disable_clk(struct dispc_device
>>> *dispc, u32 hw_videoport)
>>>       clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
>>>   }
>>>   -/*
>>> - * Calculate the percentage difference between the requested pixel
>>> clock rate
>>> - * and the effective rate resulting from calculating the clock
>>> divider value.
>>> - */
>>> -unsigned int dispc_pclk_diff(unsigned long rate, unsigned long
>>> real_rate)
>>> -{
>>> -    int r = rate / 100, rr = real_rate / 100;
>>> -
>>> -    return (unsigned int)(abs(((rr - r) * 100) / r));
>>> -}
>>> -
>>>   int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32
>>> hw_videoport,
>>>                 unsigned long rate)
>>>   {
>>> @@ -3087,6 +3072,9 @@ int dispc_init(struct tidss_device *tidss)
>>>       }
>>>       dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
>>>   +    for (i = 0; i < dispc->feat->num_vps; i++)
>>> +        dispc->tidss->max_pclk[i] = 0;
>>
>> I think this is not needed, the struct should be zero initialized at
>> alloc.
> 
> Okay will remove this.
> 
>>
>>>       of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
>>>                    &dispc->memory_bandwidth_limit);
>>>   diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/
>>> tidss/tidss_dispc.h
>>> index b8614f62186c..45b1a8aa9089 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>>> @@ -75,7 +75,6 @@ enum dispc_dss_subrevision {
>>>     struct dispc_features {
>>>       int min_pclk_khz;
>>> -    int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>>>         struct dispc_features_scaling scaling;
>>>   diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/
>>> tidss/tidss_drv.h
>>> index d14d5d28f0a3..59c67ae8e721 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>>> @@ -22,6 +22,8 @@ struct tidss_device {
>>>         const struct dispc_features *feat;
>>>       struct dispc_device *dispc;
>>> +    long max_pclk[TIDSS_MAX_PORTS];
>>> +
>>>         unsigned int num_crtcs;
>>>       struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
>>
>> One thing to keep in mind is that if we ever change the source clk, we
>> need to also clear the max_pclk for that VP.
> 
> So I will clear them (mark as 0) in tidss_remove?

No need. I meant that if we ever change the source clock at runtime
(say, if we have multiple displays and need to switch the clocking based
on which display gets enabled), we also need to clear the max_pclk, so
that the new max gets calculated. So nothing to do in this patch.


>>
>> Shouldn't we still have a check for the DSS internal max pclk somewhere?
> 
> Makes sense. So instead of moving max_pclk_khz from dispc_features to
> tidss_device, I will have it in both. We can have int max_pclk_khz
> similar to min_pclk_khz which would be static for a tidss device.
> 
> And then I will rename max_pclk[] in tidss_device structure to
> max_pclk_vp[].

Right.

 Tomi

