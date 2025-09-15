Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04DB573B2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329DB10E38D;
	Mon, 15 Sep 2025 08:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ebbnAGVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA1C10E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:56:14 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F8tXDV1524201;
 Mon, 15 Sep 2025 03:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757926533;
 bh=BdQbWtYbeZd3ff4SF4DPOxT/9nRkdW0ksRCipVlpThk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ebbnAGVzM0l2AjdwR6nvnIB5TtcuDgvTG61UwruFOAZ80SXkn7+5fV09wBD2R0JgF
 zVZxauxjDch4l3DSKrWwGoOg/aAkAiUN5i5TA/eMV1Cut8dGFiZEgfZ4lMyUnF1u/2
 3izsb602Eowt9mHGaAwYa3ofJBC80Va+BJqMCSqU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F8tXN9619040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 15 Sep 2025 03:55:33 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 03:55:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 03:55:33 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F8tSDU3764317;
 Mon, 15 Sep 2025 03:55:29 -0500
Message-ID: <4f0a00d9-4edc-4114-aca6-70d6bb654767@ti.com>
Date: Mon, 15 Sep 2025 14:25:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
To: Maxime Ripard <mripard@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>,
 <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
 <praneeth@ti.com>, <u-kumar1@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250911110715.2873596-1-s-jain1@ti.com>
 <20250911110715.2873596-4-s-jain1@ti.com>
 <20250915-benevolent-military-penguin-d64871@penduick>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250915-benevolent-military-penguin-d64871@penduick>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 9/15/25 13:27, Maxime Ripard wrote:
> On Thu, Sep 11, 2025 at 04:37:15PM +0530, Swamil Jain wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> Since OLDI consumes DSS VP clock directly as serial clock, mode_valid()
>> check cannot be performed in tidss driver which should be checked
>> in OLDI driver.
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>> Tested-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 7ecbb2c3d0a2..ada691839ef3 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -309,6 +309,26 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>   	return input_fmts;
>>   }
>>   
>> +static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
>> +				   struct drm_bridge_state *bridge_state,
>> +				   struct drm_crtc_state *crtc_state,
>> +				   struct drm_connector_state *conn_state)
>> +{
>> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
>> +	struct drm_display_mode *adjusted_mode;
>> +	unsigned long round_clock;
>> +
>> +	adjusted_mode = &crtc_state->adjusted_mode;
>> +	round_clock = clk_round_rate(oldi->serial, adjusted_mode->clock * 7 * 1000);
>> +	/*
>> +	 * To keep the check consistent with dispc_vp_set_clk_rate(),
>> +	 * we use the same 5% check here.
>> +	 */
>> +	if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000, round_clock) > 5)
>> +		return -EINVAL;
>> +	return 0;
>> +}
>> +
> 
> If you're introducing that check to tidss, please use .5% like everyone
> else. I understand that you don't want to change tilcdc to avoid any
> regression, but that's not the case here
>
This is just to make the tolerance check consistent for mode validation 
and setting clock rate. This patch isn't introducing anything new, we 
are following this as dispc_vp_set_clk_rate() and 
tidss_oldi_set_serial_clk() are already checking for 5% tolerance while 
setting clock. To remove/modify, this needs extensive testing with other 
K3 and K2G SoCs and can be handled as a separate patch.

Regards,
Swamil

> Maxime

