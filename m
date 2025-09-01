Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9FB3DD50
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AB210E3D5;
	Mon,  1 Sep 2025 08:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ewhl9unN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8143310E3D5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:59:51 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5818xSlH2739412;
 Mon, 1 Sep 2025 03:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756717168;
 bh=BxSo+3XJP4cV+Z8z0wpsWsIoQkxyNNRAdE0TKlbeLjI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Ewhl9unNDhsRQQ6+gwAwkxJ+mc1Zrm2dVXXOj+Vx2DDmX4+wTM92eBmq8Cx89Ay2a
 g/NdX5VDPlcqYDori57uQDf8rRTF6cevHa6czGWcHcTyh6AIPzTs771TKqjTGfVUUI
 siSCTYYMoBWHCWgP/htz+ITEF5zh3mC17bWe2YKw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5818xS3W1991602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 1 Sep 2025 03:59:28 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 03:59:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 03:59:27 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5818xNPk2214454;
 Mon, 1 Sep 2025 03:59:23 -0500
Message-ID: <7f646e70-73fa-43ea-9fab-c9a0cb64dff6@ti.com>
Date: Mon, 1 Sep 2025 14:29:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <aradhya.bhatia@linux.dev>
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <20250819192113.2420396-4-s-jain1@ti.com>
 <837a8381-02bd-4882-bfa4-6d5c34f44119@ideasonboard.com>
 <a23b03a2-86d0-41ff-882f-40c152ff6fb0@ti.com>
 <327d2ef2-d670-4677-ba1f-b19c2f0b4f3f@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <327d2ef2-d670-4677-ba1f-b19c2f0b4f3f@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi,

On 9/1/25 14:22, Tomi Valkeinen wrote:
> Hi,
> 
> On 29/08/2025 06:50, Swamil Jain wrote:
>> Hi Tomi,
>>
>> On 8/27/25 14:35, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 19/08/2025 22:21, Swamil Jain wrote:
>>>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>>>
>>>> Since OLDI consumes DSS VP clock directly as serial clock, certain
>>>> checks cannot be performed in tidss driver which should be checked
>>>
>>> I think this is a bit misleading. The OLDI input clock doesn't come from
>>> DSS, so I wouldn't call it "DSS VP clock". The point here is that the
>>> clock from the PLL is used by both OLDI and DSS, and in the current
>>> architecture the OLDI driver manages the clock, so the DSS driver can't
>>> really do checks, it just has to accept the clock rate. All checks need
>>> to be done in the OLDI driver.
>>>
>>>> in OLDI driver. Add check for mode clock and set max_successful_rate
>>>> and max_attempted_rate field for tidss in case the VP is OLDI.
>>>>
>>>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>>>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>>> ---
>>>>    drivers/gpu/drm/tidss/tidss_oldi.c | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/
>>>> tidss/tidss_oldi.c
>>>> index ef01ecc17a12..2ed2d0666ccb 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>>>> @@ -309,6 +309,30 @@ static u32
>>>> *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>        return input_fmts;
>>>>    }
>>>>    +static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
>>>> +                   struct drm_bridge_state *bridge_state,
>>>> +                   struct drm_crtc_state *crtc_state,
>>>> +                   struct drm_connector_state *conn_state)
>>>> +{
>>>> +    struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
>>>> +    struct drm_display_mode *adjusted_mode;
>>>> +    unsigned long round_clock;
>>>> +
>>>> +    adjusted_mode = &crtc_state->adjusted_mode;
>>>> +
>>>> +    if (adjusted_mode->clock > oldi->tidss-
>>>>> max_successful_rate[oldi->parent_vp]) {
>>>
>>> You can change the above check to <=, and return 0 here early.
>>>
>>>> +        round_clock = clk_round_rate(oldi->serial, adjusted_mode-
>>>>> clock * 7 * 1000);
>>>> +
>>>> +        if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000,
>>>> round_clock) > 5)
>>>> +            return -EINVAL;
>>>> +
>>>> +        oldi->tidss->max_successful_rate[oldi->parent_vp] =
>>>> round_clock;
>>>> +        oldi->tidss->max_attempted_rate[oldi->parent_vp] =
>>>> adjusted_mode->clock * 7 * 1000;
>>>> +    }
>>>
>>> This is not very nice. We should have a function in tidss that we call
>>> here, instead of poking into these tidss's variables directly.
>>>
>>> Actually... Do we even need to use the tidss->max_* fields? The above
>>> code is not checking the VP clock maximum, it's actually looking at the
>>> serial clock maximum. Currently those two clocks are linked, though, but
>>> would it make more sense to have the max_* fields here, in OLDI, for
>>> OLDI's serial clock?We don't require tidss->max_* fields here as we
>>> only have single mode
>> for OLDI. This is added to make it consistent with check_pixel_clock()
>> for validating modes.
>>
>> You are right we shouldn't use tidss->* fields directly in OLDI driver.
>>
>> As Maxime suggested we only have very few modes for OLDI, can we skip
>> caching maximum pixel clock in case of OLDI? What would you suggest Tomi?
> 
> I think it's best to at least try the trivial option discussed in this
> thread: just use clk_round_rate, without any code to cache or seek out
> the max.

Then for OLDI, we will drop caching the max_pclk.

Regards,
Swamil
> 
>   Tomi
> 
