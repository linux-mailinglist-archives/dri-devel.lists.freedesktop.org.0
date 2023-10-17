Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AB7CCAE7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 20:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209EB10E174;
	Tue, 17 Oct 2023 18:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3BB10E174;
 Tue, 17 Oct 2023 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697568145; x=1729104145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gIIaUbMREGUxFxFnrr+FF212gksrSjNtJ4BqljL32oo=;
 b=XOFHH9AvHU/Lb1SfHcW8KrNGm4Q79ij2554uF8NGClw54RXHeo3UenLZ
 NbVOjb50GzCfVmDdqVjvEdoDLwD026+aP1/Apo2nf14Das3dOAJfDw7i2
 BfDVYyo9v3IPnVEAa5VvyY+gIVwt96Cuf+7Ut90lgBZQh9Wka9ZIYfdbz
 xdP2mvJwPJUSayqjtQCuCTuy1YTWmNjUumkfMpAL3JZ8AT0uLD66X2MTz
 ckUwD+aCxnSRb2gVj8PlvZL2exEps4K9phoGEOiMUC+gsN9mbxmRmnRGF
 899soOeEh+Ojs1Pwbl0mTk9bkn8AAGuyMlg930PT3S63sgM9ckuofzFYI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370922938"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="370922938"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 11:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826561261"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="826561261"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.38.47])
 ([10.249.38.47])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 11:42:22 -0700
Message-ID: <1b9e1768-a5b9-7cc1-41fc-01b5b002d136@linux.intel.com>
Date: Tue, 17 Oct 2023 20:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
 <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
 <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
 <ZS6dVvH9yoFu+Uvy@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZS6dVvH9yoFu+Uvy@ashyti-mobl2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 dri-devel@lists.freedesktop.org, Mikka Kuoppala <mika.kuoppala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/17/2023 4:42 PM, Andi Shyti wrote:
> Hi Vinay,
>
>>>> This bit does not cause an explicit L3 flush. We already use
>>> At all? Or only on newer hardware? And as a genuine spec change or as a
>>> bug / workaround?
>>>
>>> If the hardware has re-purposed the bit then it is probably worth at
>>> least adding a comment to the bit definition to say that it is only
>>> valid up to IP version 12.70.
>> At this point, this is a bug on MTL since this bit is not related to L3
>> flushes as per spec. Regarding older platforms, still checking the reason
>> why this was added (i.e if it fixed something and will regress if removed).
>> If not, we can extend the change for others as well in a separate patch. On
>> older platforms, this bit seems to cause an implicit flush at best.
>>>> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
>>>>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>>> index ba4c2422b340..abbc02f3e66e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>>>> @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct
>>>> i915_request *rq)
>>>>    int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>>>>    {
>>>>        struct intel_engine_cs *engine = rq->engine;
>>>> +    struct intel_gt *gt = rq->engine->gt;
>>>>          /*
>>>>         * On Aux CCS platforms the invalidation of the Aux
>>>> @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request
>>>> *rq, u32 mode)
>>>>             * deals with Protected Memory which is not needed for
>>>>             * AUX CCS invalidation and lead to unwanted side effects.
>>>>             */
>>>> -        if (mode & EMIT_FLUSH)
>>>> +        if ((mode & EMIT_FLUSH) &&
>>>> +            !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
>>> Why stop at 12.71? Is the meaning only changed for 12.70 and the
>>> old/correct version will be restored in later hardware?
>> Was trying to keep this limited to MTL for now until the above statements
>> are verified.
> I'm not fully conviced here... this is not what the hardware spec
> says. Am I reading the specs wrong?

The main issue is we are using side-effects of that bit as to flush L3 
but that is not it's primary task.

Unless there is a WA specially mentioned for MTL to use that bit to 
flush L3, I see no reason to use on MTL or further.


Regards,

Nirmoy



>
> Is there any ongoing discussion with the hardware developers?
>
> Andi
