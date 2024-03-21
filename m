Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92306885BFC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C119310EC75;
	Thu, 21 Mar 2024 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="GQB1fSAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796DE10E49F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 15:35:23 +0000 (UTC)
Message-ID: <f6e5931a-22ab-4291-b1c5-9885be0b1b22@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711035319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9hMomlUeqjzcui/PNXNj+lcsYhOrH42hxxoUf3sOynU=;
 b=GQB1fSALASUYhhzxpdtat42BHs5CvVT0xVmi9dgflPlXquMmo4jwZoe6IFy6r8lpi0cbaf
 sfs6CdZBFxnEBnoDDsIK2mYSc4wX7VbMiqZ5Pmi6PJFdLB/yy6ISJNC4nZYMIb5zByANOH
 b3qryv4Nb8ukfM1svRdcRTSnsm3XSd0=
Date: Thu, 21 Mar 2024 11:35:14 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/8] drm: zynqmp_dp: Adjust training values per-lane
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-4-sean.anderson@linux.dev>
 <c16665d3-ff3a-48d7-9f4e-076473a3b45d@ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <c16665d3-ff3a-48d7-9f4e-076473a3b45d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/20/24 01:57, Tomi Valkeinen wrote:
> On 20/03/2024 00:51, Sean Anderson wrote:
>> The feedback we get from the DPRX is per-lane. Make changes using this
>> information, instead of picking the maximum values from all lanes. This
>> results in more-consistent training on marginal links.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 23 ++++++++---------------
>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> index 98a32e6a0459..8635b5673386 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> @@ -605,28 +605,21 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
>>                      u8 link_status[DP_LINK_STATUS_SIZE])
>>   {
>>       u8 *train_set = dp->train_set;
>> -    u8 voltage = 0, preemphasis = 0;
>>       u8 i;
>>         for (i = 0; i < dp->mode.lane_cnt; i++) {
>> -        u8 v = drm_dp_get_adjust_request_voltage(link_status, i);
>> -        u8 p = drm_dp_get_adjust_request_pre_emphasis(link_status, i);
>> +        u8 voltage = drm_dp_get_adjust_request_voltage(link_status, i);
>> +        u8 preemphasis =
>> +            drm_dp_get_adjust_request_pre_emphasis(link_status, i);
>>   -        if (v > voltage)
>> -            voltage = v;
>> +        if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
>> +            voltage |= DP_TRAIN_MAX_SWING_REACHED;
>>   -        if (p > preemphasis)
>> -            preemphasis = p;
>> -    }
>> +        if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
>> +            preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>>   -    if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
>> -        voltage |= DP_TRAIN_MAX_SWING_REACHED;
>> -
>> -    if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
>> -        preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>> -
>> -    for (i = 0; i < dp->mode.lane_cnt; i++)
>>           train_set[i] = voltage | preemphasis;
>> +    }
>>   }
>>     /**
> 
> Looks fine to me, but a few cosmetic suggestions, feel free to ignore if not to your liking:
> 
> 1)
> 
> u8 voltage, preemphasis;
> 
> voltage = drm_dp_get_adjust_request_voltage(link_status, i);
> preemphasis = drm_dp_get_adjust_request_pre_emphasis(link_status, i);

If the comment here is about the line break, I agree that this looks
better but the second line is over 80 characters.

> 2)
> 
> for (unsigned int i = 0; i < dp->mode.lane_cnt; i++)

Is this allowed now?

> 3)
> 
> dp->train_set[i] = voltage | preemphasis;

This would be undone in patch 7/8.

--Sean

> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>  Tomi
> 
