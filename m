Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383EF2C8151
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FC56E43F;
	Mon, 30 Nov 2020 09:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBCB6E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:46:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AU9kYtv039448;
 Mon, 30 Nov 2020 03:46:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606729594;
 bh=br6Uw3uXf6rPebxLz86JAyAZZ7C0waHEYzJznRfSY5w=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ixF72V9dP/5SGH6R94iPOq4Q5f8lywq5+EZbiEsWholSpOVcJxy99qK78T0wseWDS
 YDxQ5hfWC51CC5S565zJSA3L3TfpY+PUKBiYXNLVR2Pxh0za7zq70YbD+55HH9H55O
 FC3M+TI/qZdQsuWOpA02/8jQBjJRI1SIKy6JvEKw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AU9kYtg011631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 03:46:34 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 03:46:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 03:46:34 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AU9kWEI077553;
 Mon, 30 Nov 2020 03:46:32 -0600
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
 <20201130093600.GB4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
Date: Mon, 30 Nov 2020 11:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130093600.GB4141@pendragon.ideasonboard.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 11:36, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Thu, Nov 19, 2020 at 09:31:29PM +0530, Nikhil Devshatwar wrote:
>> bus_flags can be specified by a bridge in the timings.
>> If the bridge provides it, Override the bus_flags when propagating
>> from next bridge.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>
>> Notes:
>>     changes from v2:
>>     * update comment
>>     changes from v1:
>>     * Check for timings
>>     * Prioritize timings flags over next bridge's flags
>>
>>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 64f0effb52ac..13b67fc0dad3 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -975,6 +975,14 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>>  	 * duplicate the "dummy propagation" logic.
>>  	 */
>>  	bridge_state->input_bus_cfg.flags = output_flags;
>> +
>> +	/*
>> +	 * If legacy bus flags are provided in bridge->timings, use those as
>> +	 * input flags instead of propagating the output flags.
>> +	 */
>> +	if (bridge->timings && bridge->timings->input_bus_flags)
>> +		bridge_state->input_bus_cfg.flags =
>> +			bridge->timings->input_bus_flags;
> 
> Hasn't Boris commented in his review of v1 that bus flags should be set
> in atomic_check, even when they're static ? We're moving towards
> removing timings->input_bus_flags, so this patch goes in the wrong
> direction :-S

We have atomic_check only if the bridge has implemented atomic funcs. And even if there's
atomic_check, not all bridges set the bus_flags there. So we need to either 1) fix the issue for now
as in this patch, or 2) convert all bridges to use atomic funcs and fix all the bridges to set the
bus_flags.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
