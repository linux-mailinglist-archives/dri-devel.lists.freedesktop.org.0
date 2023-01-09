Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C26621C2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094F410E392;
	Mon,  9 Jan 2023 09:39:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDB310E391;
 Mon,  9 Jan 2023 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673257169; x=1704793169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5rVVzSBD1AyB8rNYOEao6ic+WdBoUjtp+v9LVZSHgXo=;
 b=eNQ+XTOwL2wdlL6K3HU/eJxgzH+UlC1EgZam+uDZjasJtp9dR8FvYXDY
 RE1Eezw0++nH8t6L0bDGqcqTXI0KIqLPAluIoco6TvHmsLAGV9XjuXFG9
 VyVDyjWBd0SZz+7A6C08QR+xJN0+44UVP2qqoo0Y6+gJdjZT/dNYvnOYk
 l+RmUqpB7g//5l9rWlmEGXUhwHDnjEetLEL9xNX5r7Hu7ioaCCJUm5vbp
 3fzUgX3SxluvuhUsdDYnJFoOG1ug4Z2S4arFKH5Kfbq7be1SaT2hIlZp8
 o1ynC6N9YAz/dQzzV2Hn6/hJljcBfdJwHVswZ9fNu3h5ygOIJ5zSweNxc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322909656"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="322909656"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:39:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="985342024"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="985342024"
Received: from lherman-mobl.ger.corp.intel.com (HELO [10.213.209.244])
 ([10.213.209.244])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:39:27 -0800
Message-ID: <58691e33-4b69-aa16-42bf-4c2d5ae5b699@linux.intel.com>
Date: Mon, 9 Jan 2023 09:39:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
 <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
 <467f47f4-c30f-16ba-3330-a3d4752366a8@intel.com>
 <f0ebffa1-45b7-d6f9-4341-3fa8aabae3f5@linux.intel.com>
 <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/01/2023 18:57, John Harrison wrote:
> On 12/6/2022 03:06, Tvrtko Ursulin wrote:
>> On 05/12/2022 18:44, Michal Wajdeczko wrote:
>>> On 05.12.2022 14:16, Tvrtko Ursulin wrote:
>>>> On 02/12/2022 20:14, John Harrison wrote:
>>>> [snip]
>>>>
>>>>> Random meaningless (to me) message that is apparently a display thing:
>>>>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>>>>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>>>>> PORT PLL B
>>>>
>>>> Plan is to not touch outside gt/.
> For some unexplicable reason that means it is almost impossible to see 
> the actual problems in most CI dmesg logs because they are swamped with 
> irrelevant display messages that cannot be filtered out. For example, I 
> recently manually grep'd out all the display spam from a bug report log. 
> The dmesg file went from 12MB to 700KB. That is a significant problem 
> that makes bug triage way harder than it needs to be.

I didn't get this part, how it would reduce the amount of spam by adding 
new macros? Anyway, that's something to split out and discuss with 
display folks.

>> Maybe as a way forward work could be split? If John wants to deal with 
>> gt_xxx macros, avoid touching GuC (putting his original motivation 
>> aside) and you want to convert the gt/uc folder? Assuming John you are 
>> okay with "GuC:" and "CT:" prefixes.
> Meaning just repost patch #1 only and expand to more intel_gt_* files? 
> Sure, if someone will actually reply to that patch with some kind of r-b 
> first so I know I'm not still wasting my time on a huge re-write that 
> will to be redone multiple times when someone objects to the use of a 
> colon or the lack of spaces, braces or whatever.

First patch looks good to me (ack in principle) apart that Michal found 
one potential null pointer dereference if I understood it right. That 
other comment about the ratelimited call is maybe okay to leave for 
later, *if* it will be a single instance, otherwise needs a gt logger as 
well. I can r-b once you re-send with the first issue fixed.

Regards,

Tvrtko
