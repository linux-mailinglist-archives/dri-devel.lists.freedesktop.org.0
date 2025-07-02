Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFBAF0B87
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 08:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8B10E660;
	Wed,  2 Jul 2025 06:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mKokjAYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3AA10E660
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 06:21:36 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5626L8qF3136733;
 Wed, 2 Jul 2025 01:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751437268;
 bh=Fh54AFP91kGbAIE5c9TTtLhbgwuyDY5fnumHL7psVG0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=mKokjAYnPxy0czJz0suk7cXTRFWGBRgvhRxH+P2lmzKybDRsm18i/aDr2z37oSD8s
 wUpqMUwI6dDhJKk+4OkMzg1FrjjizcSBbF4kg7mRTXbmokq2yGBNPjtrIhOTT+vf7O
 E/zX6Y2ZXm/5WgphSd9vGOmgKSBajU2zxrJLWGGo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5626L7U03283402
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 2 Jul 2025 01:21:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 01:21:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 01:21:07 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.166])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5626L3Oq2647415;
 Wed, 2 Jul 2025 01:21:03 -0500
Message-ID: <9f894f18-ac82-46d1-afa6-2f786ba895b1@ti.com>
Date: Wed, 2 Jul 2025 11:51:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701095541.190422-1-j-choudhary@ti.com>
 <20250701095541.190422-4-j-choudhary@ti.com>
 <5ed30153-53e0-4f1f-9c45-2f2530b9034e@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <5ed30153-53e0-4f1f-9c45-2f2530b9034e@ti.com>
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

Hello Devarsh,

On 01/07/25 19:22, Devarsh Thakkar wrote:
> On 01/07/25 15:25, Jayesh Choudhary wrote:
>> Since OLDI consumes DSS VP clock directly as serial clock, certain
>> checks cannot be performed in tidss driver which should be checked
>> in oldi driver. Add check for mode clock and set the curr_max_pclk
>> field for tidss in case the VP is OLDI.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c 
>> b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 63e07c8edeaa..a1f5fb39b32c 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -309,6 +309,29 @@ static u32 
>> *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>       return input_fmts;
>>   }
>> +static int tidss_oldi_bridge_atomic_check(struct drm_bridge *bridge,
>> +                      struct drm_bridge_state *bridge_state,
>> +                      struct drm_crtc_state *crtc_state,
>> +                      struct drm_connector_state *conn_state)
>> +{
>> +    struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
>> +    struct drm_display_mode *adjusted_mode;
>> +    unsigned long round_clock;
>> +
>> +    adjusted_mode = &crtc_state->adjusted_mode;
>> +
>> +    if (adjusted_mode->clock > 
>> oldi->tidss->curr_max_pclk[oldi->parent_vp]) {
>> +        round_clock = clk_round_rate(oldi->serial, 
>> adjusted_mode->clock * 7 * 1000);
>> +
>> +        if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000, 
>> round_clock) > 5)
>> +            return -EINVAL;
>> +
>> +        oldi->tidss->curr_max_pclk[oldi->parent_vp] = round_clock;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
>>       .attach    = tidss_oldi_bridge_attach,
>>       .atomic_pre_enable = tidss_oldi_atomic_pre_enable,
>> @@ -317,6 +340,7 @@ static const struct drm_bridge_funcs 
>> tidss_oldi_bridge_funcs = {
>>       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>       .atomic_reset = drm_atomic_helper_bridge_reset,
>> +    .atomic_check = tidss_oldi_bridge_atomic_check,
> 
> 
> Nitpick: looks like some mismatch in naming convention.
> We don't use bridge for other atomic calls for e.g. 
> tidss_oldi_atomic_pre_enable, tidss_oldi_atomic_post_disable so maybe 
> change those too ?

Will change in v4.

Thanks,
Jayesh

> 
> With suggested change,
> 
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> 
> Regards
> Devarsh
> 
>>   };
>>   static int get_oldi_mode(struct device_node *oldi_tx, int 
>> *companion_instance)
