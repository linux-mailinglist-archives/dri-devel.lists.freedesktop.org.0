Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A94D1474
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52AA10E4C9;
	Tue,  8 Mar 2022 10:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50010E4C9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:11:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6DB75836A3;
 Tue,  8 Mar 2022 11:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646734302;
 bh=7nUaBqP43TAM0QE3aZdIYJDM7hWJwAEEb5LxwDUukWQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=y16lf0VQpZnIvjCtCB3I5EsGmP92zuda42EKHSSEXo923eVUy3lqedjgo659EdJbp
 8I0+w+CcRTydBiVIbSKCfzwBor32r3Su4FSSJgVzmU20gQ/UKzBio/x84Urzw6d5x6
 gbhZZqm2lcchy6c12oRua5C6cpk+J8sZs5ao5E115UblXL8LILmkdq5OwKSJztJ2NX
 i/hmQ85Go8mmlt5I7rx19/LSs+6U+raHzVzWFV0Z3Fz+/2H4xetRmCboax48qL8suI
 GMXwSsnh0B5v1ujoK0CpKEUrYS+WjgcQ5ooio40gHS3hwUAAQhMXe0quV/FxMLPR0q
 2s+hpD+jBbl4w==
Message-ID: <f3ed01e3-b50e-30e3-d131-d6e371800f9f@denx.de>
Date: Tue, 8 Mar 2022 11:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V3 06/13] drm: bridge: icn6211: Add generic DSI-to-DPI PLL
 configuration
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-7-marex@denx.de>
 <CAMty3ZBpb55wB+1PKmmmZoZxjm3epmhhRtrx1p0wHQo_Gm7pnA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBpb55wB+1PKmmmZoZxjm3epmhhRtrx1p0wHQo_Gm7pnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 09:07, Jagan Teki wrote:
> On Fri, Mar 4, 2022 at 5:55 AM Marek Vasut <marex@denx.de> wrote:
>>
>> The chip contains fractional PLL, however the driver currently hard-codes
>> one specific PLL setting. Implement generic PLL parameter calculation code,
>> so any DPI panel with arbitrary pixel clock can be attached to this bridge.
>>
>> The datasheet for this bridge is not available, the PLL behavior has been
>> inferred from [1] and [2] and by analyzing the DPI pixel clock with scope.
>> The PLL limits might be wrong, but at least the calculated values match all
>> the example code available. This is better than one hard-coded pixel clock
>> value anyway.
>>
>> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
>> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>>
>> Acked-by: Maxime Ripard <maxime@cerno.tech>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>> ---
>> V2: Rebase on next-20220214
>> V3: Add AB from Maxime
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 87 +++++++++++++++++++++++-
>>   1 file changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index df8e75a068ad0..71c83a18984fa 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -163,6 +163,87 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
>>                  chipone_dsi_write(icn, d, ARRAY_SIZE(d));       \
>>          }
>>
>> +static void chipone_configure_pll(struct chipone *icn,
>> +                                 const struct drm_display_mode *mode)
>> +{
>> +       unsigned int best_p = 0, best_m = 0, best_s = 0;
>> +       unsigned int delta, min_delta = 0xffffffff;
>> +       unsigned int freq_p, freq_s, freq_out;
>> +       unsigned int p_min, p_max;
>> +       unsigned int p, m, s;
>> +       unsigned int fin;
>> +
>> +       /*
>> +        * DSI clock lane frequency (input into PLL) is calculated as:
>> +        *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
>> +        * the 2 is there because the bus is DDR.
>> +        *
>> +        * DPI pixel clock frequency (output from PLL) is mode clock.
>> +        *
>> +        * The chip contains fractional PLL which works as follows:
>> +        *  DPI_CLK = ((DSI_CLK / P) * M) / S
>> +        * P is pre-divider, register PLL_REF_DIV[3:0] is 2^(n+1) divider
>> +        *                   register PLL_REF_DIV[4] is extra 1:2 divider
>> +        * M is integer multiplier, register PLL_INT(0) is multiplier
>> +        * S is post-divider, register PLL_REF_DIV[7:5] is 2^(n+1) divider
>> +        *
>> +        * It seems the PLL input clock after applying P pre-divider have
>> +        * to be lower than 20 MHz.
>> +        */
>> +       fin = mode->clock * mipi_dsi_pixel_format_to_bpp(icn->dsi->format) /
> 
> no dsi in chipone structure. please preserve format during the probe.
> 
> drivers/gpu/drm/bridge/chipone-icn6211.c:193:61: error: ‘struct
> chipone’ has no member named ‘dsi’
>    193 |         fin = mode->clock *
> mipi_dsi_pixel_format_to_bpp(icn->dsi->format) /

Ah , yes, this was added in
[PATCH V3 11/13] drm: bridge: icn6211: Add I2C configuration support
and needs to be moved here.
