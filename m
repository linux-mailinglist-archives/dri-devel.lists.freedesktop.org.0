Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72D91A39F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7A610E20D;
	Thu, 27 Jun 2024 10:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="BT5QKFDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E2010E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:18:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RAHmaX113964;
 Thu, 27 Jun 2024 05:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1719483468;
 bh=SzoouVbtrW1yRv95L9U4n0f+OgkuK+wXMfh/V67j4N4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=BT5QKFDTd6cQffqdER0DCGDMiJNkPiCz9oTtmSw9Lm4gOWCsbyftTA9IEx7AbL9Le
 JdGoWr2M++KLuyC+OcXfPJuROZAnqztq1yt+tqUFs87kRNwAjfmF8A7vissbjxsV4x
 GgInqQ8zy33E1G5VaXqU+ZUuR+1SIyxsqK5qewQo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RAHmhB018635
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Jun 2024 05:17:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 05:17:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 05:17:47 -0500
Received: from [172.24.227.248]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.248])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RAHgHo030925;
 Thu, 27 Jun 2024 05:17:43 -0500
Message-ID: <7996a20e-2207-4d6f-9572-0eaa9b41e05d@ti.com>
Date: Thu, 27 Jun 2024 15:47:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Add atomic_check hook
 for the bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <linux-kernel@vger.kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <spanda@codeaurora.org>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240618081418.250953-1-j-choudhary@ti.com>
 <20240618081418.250953-2-j-choudhary@ti.com>
 <r5szraxdqfs4v4hnvqgx6tbmc5e5ew5ljyf5xlaobywm55bohy@6kygxenn2tvd>
 <e236648c-e257-42a3-a0a3-a1b88b539459@ti.com>
 <CAA8EJprX0ePM1Xvmo9DahSFAnADRPBuwVo95A423xeffgpr49w@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAA8EJprX0ePM1Xvmo9DahSFAnADRPBuwVo95A423xeffgpr49w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dmitry,

On 18/06/24 15:45, Dmitry Baryshkov wrote:
> On Tue, 18 Jun 2024 at 12:56, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Hello Dmitry,
>>
>> Thanks for the review.
>>
>> On 18/06/24 14:29, Dmitry Baryshkov wrote:
>>> On Tue, Jun 18, 2024 at 01:44:17PM GMT, Jayesh Choudhary wrote:
>>>> Add the atomic_check hook to ensure that the parameters are within the
>>>> valid range.
>>>> As of now, dsi clock freqency is being calculated in bridge_enable but
>>>> this needs to be checked in atomic_check which is called before
>>>> bridge_enable so move this calculation to atomic_check and write the
>>>> register value in bridge_enable as it is.
>>>>
>>>> For now, add mode clock check for the max resolution supported by the
>>>> bridge as mentioned in the SN65DSI86 datasheet[0] and dsi clock range
>>>> check for SN_DSIA_CLK_FREQ_REG.
>>>> According to the datasheet[0], the minimum value for that reg is 0x08
>>>> and the maximum value is 0x96. So add check for that.
>>>>
>>>> [0]: <https://www.ti.com/lit/gpn/sn65dsi86>
>>>>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/ti-sn65dsi86.c | 65 +++++++++++++++++++--------
>>>>    1 file changed, 46 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>>> index 84698a0b27a8..d13b42d7c512 100644
>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>>> @@ -113,6 +113,20 @@
>>>>
>>
>> [...]
>>
>>>>
>>>> +static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
>>>> +                                 struct drm_bridge_state *bridge_state,
>>>> +                                 struct drm_crtc_state *crtc_state,
>>>> +                                 struct drm_connector_state *conn_state)
>>>> +{
>>>> +    struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>> +    struct drm_display_mode *mode = &crtc_state->mode;
>>>> +    unsigned int bit_rate_mhz, clk_freq_mhz;
>>>> +
>>>> +    /* Pixel clock check */
>>>> +    if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
>>>> +            return -EINVAL;
>>>> +
>>>> +    bit_rate_mhz = (mode->clock / 1000) *
>>>> +                    mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
>>>> +    clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
>>>> +
>>>> +    /* for each increment in dsi_clk_range, frequency increases by 5MHz */
>>>> +    pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
>>>> +            (((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
>>>
>>> atomic_check might be called several times, it might be called to test
>>> the state. As such, it should not modify anything outside of the
>>> state variables.
>>>
>>
>> If not in atomic_check, then where should I move this calculation and check?
>> mode_valid with returning MODE_BAD in case of failure?
> 
> I didn't write that it's the wrong place for math. I wrote that you
> should not be modifying global structure.
> 
> So you have to subclass drm_bridge_state for the driver and store the
> value there. Or just add a helper function and call it from
> atomic_check(), mode_valid() and set_dsi_rate(). It really looks like
> a simpler solution here.
> 

Okay, instead of moving the set_dsi_rate, I will rename it to
calc_dsi_rate with integer return value which I would use in both
bridge enable to write the register value and atomic_check to check the
parameters eliminating the need to modify the pdata structure/ adding
new variable to the structure.

(Earlier I was trying to avoid calculation in both calls so I added
another variable to the structure and used that. But I get your point
now!)

I will re-order the patches to have an independent fix patch
addressing your concern in [2/2] patch
https://lore.kernel.org/all/CAA8EJpq2UkMn9ArSNaJcOyw28H4uUcRwvUqfUBBqSCALmozBrg@mail.gmail.com/

Also in the code they have been using 594MHz as mode clock limit.
I was using more relaxed value (600MHz) in atomic check but I will
switch to 594MHz to be in sync with the value that is used in the
driver.

> Note, there is a significant difference between mode_valid() and
> atomic_check(). The former function is used for filtering the modes,
> while the latter one is used for actually checking that the parameters
> passed from the client are correct.

[...]

Warm Regards,
Jayesh
