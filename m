Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE97CCA95
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D58710E314;
	Tue, 17 Oct 2023 18:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B0B10E312;
 Tue, 17 Oct 2023 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697567164; x=1729103164;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0V/M5V/4I9hDS/oxp4YfvuNpfuB8GcyxkEgvWG2TSWQ=;
 b=kfkJ6Dd4MFzCmtc7GM8Hz7spYnvgU3le9256EIOzxz+9ABynfQFvlMUR
 u8ppAxh1X+PKsO5La4SvfES8LfuGEuD2LUZt1rU3M6/V3l5uAPBLNXvL7
 ZCsw1hBM4AU9dlSCKJELSyhuEk28kE1MZ/vEkigPgNAd9AdOXqrdZZ+co
 w5+gBh31ioCoK772t+bQFmxj05BjnJU2d+IoVgR6lJvBCr5dGPcPKC44y
 mrvhl9XgdOZBK2Y80BGjzyWk99tGzz0BlIQhPUEOnNy3jM98j5UL8md88
 up6I5Iq0pXEwd9KtLDLdQxIF5CCTqB99u07JOgTCtCQs+s9xBkqHqbpM5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472080002"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="472080002"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 11:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749778847"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="749778847"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.38.47])
 ([10.249.38.47])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 11:25:54 -0700
Message-ID: <218f539b-fa6a-ef6c-7a0c-9fd82d3eb977@linux.intel.com>
Date: Tue, 17 Oct 2023 20:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 John Harrison <john.c.harrison@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
 <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
 <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
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
Cc: Mikka Kuoppala <mika.kuoppala@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/17/2023 2:23 AM, Belgaumkar, Vinay wrote:
>
> On 10/16/2023 4:24 PM, John Harrison wrote:
>> On 10/16/2023 15:55, Vinay Belgaumkar wrote:
>>> This bit does not cause an explicit L3 flush. We already use
>> At all? Or only on newer hardware? And as a genuine spec change or as 
>> a bug / workaround?
>>
>> If the hardware has re-purposed the bit then it is probably worth at 
>> least adding a comment to the bit definition to say that it is only 
>> valid up to IP version 12.70.
> At this point, this is a bug on MTL since this bit is not related to 
> L3 flushes as per spec. Regarding older platforms, still checking the 
> reason why this was added (i.e if it fixed something and will regress 
> if removed). If not, we can extend the change for others as well in a 
> separate patch. On older platforms, this bit seems to cause an 
> implicit flush at best.
>>
>>> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
>>>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>> index ba4c2422b340..abbc02f3e66e 100644
>>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>> @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct 
>>> i915_request *rq)
>>>   int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>>>   {
>>>       struct intel_engine_cs *engine = rq->engine;
>>> +    struct intel_gt *gt = rq->engine->gt;
>>>         /*
>>>        * On Aux CCS platforms the invalidation of the Aux
>>> @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request 
>>> *rq, u32 mode)
>>>            * deals with Protected Memory which is not needed for
>>>            * AUX CCS invalidation and lead to unwanted side effects.
>>>            */
>>> -        if (mode & EMIT_FLUSH)
>>> +        if ((mode & EMIT_FLUSH) &&
>>> +            !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
>> Why stop at 12.71? Is the meaning only changed for 12.70 and the 
>> old/correct version will be restored in later hardware?
>
> Was trying to keep this limited to MTL for now until the above 
> statements are verified.

If we don't need it for MTL, we are most likely not going to need it 
after MTL too. It should be fine if you make it >= MTL until

we get more clarity about lower platforms.


With that,  this is

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>
> Thanks,
>
> Vinay.
>
>>
>> John.
>>
>>
>>>               bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>>>             bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>>> @@ -812,12 +814,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct 
>>> i915_request *rq, u32 *cs)
>>>       u32 flags = (PIPE_CONTROL_CS_STALL |
>>>                PIPE_CONTROL_TLB_INVALIDATE |
>>>                PIPE_CONTROL_TILE_CACHE_FLUSH |
>>> -             PIPE_CONTROL_FLUSH_L3 |
>>>                PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>>>                PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>>>                PIPE_CONTROL_DC_FLUSH_ENABLE |
>>>                PIPE_CONTROL_FLUSH_ENABLE);
>>>   +    if (!(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
>>> +        flags |= PIPE_CONTROL_FLUSH_L3;
>>> +
>>>       /* Wa_14016712196 */
>>>       if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || 
>>> IS_DG2(i915))
>>>           /* dummy PIPE_CONTROL + depth flush */
>>
