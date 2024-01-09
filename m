Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B468F828266
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD7C10E3AF;
	Tue,  9 Jan 2024 08:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E5F10E310;
 Tue,  9 Jan 2024 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704790022; x=1736326022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9y2C60KzGbz+mAi2nbmXunLacn6B86C5OdVSTPAPihE=;
 b=J5CBuMZEv9SAdDjLRuQSPY0S0cKF6ax/pIi+fz8QMRGHeV7/kTzj/aNQ
 hQs7b8wPJaicR58l4EQqlyKPMYB09A8t8iTdEPFSLyjEzgYlwCzG+qpwW
 SWr3roaNa5UKiQsNdSuBGdHxuOo+JgqwDD9OLt+rWqHZ9spmFrcgPqKNx
 ZDpxtiCLRJlF9vy3zIu7od93iEhAZtzTxIw+tMgKqZoXXrYiRdwlPBPTo
 5NYkJktEfC6C1psn90S1f8RRvQ7a5Gd0XWLPs6jex6My3hQEvvsRWg5zE
 Nn+g5HFitJNPM5p6lgKHQsI7jGYmyE0jr+rbciA0oiWHKxoTSGAvkmFdh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4909032"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4909032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 00:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113014742"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="1113014742"
Received: from larnott-mobl1.ger.corp.intel.com (HELO [10.213.222.67])
 ([10.213.222.67])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 00:46:59 -0800
Message-ID: <7c6fe714-d412-4e5d-8fa9-da84d614201b@linux.intel.com>
Date: Tue, 9 Jan 2024 08:46:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/i915/gt: Support fixed CCS mode
Content-Language: en-US
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
 <20240104143558.193694-2-andi.shyti@linux.intel.com>
 <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
 <ZZchsRQ5Kc-x9dlk@ashyti-mobl2.lan>
 <73f0a8e9-3fd6-45a9-a084-b5308900ca8f@linux.intel.com>
 <170472678023.31232.8020112065054338164@jlahtine-mobl.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <170472678023.31232.8020112065054338164@jlahtine-mobl.ger.corp.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/01/2024 15:13, Joonas Lahtinen wrote:
> Quoting Tvrtko Ursulin (2024-01-05 12:39:31)
>>
>> On 04/01/2024 21:23, Andi Shyti wrote:
> 
> <SNIP>
> 
>>>>> +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
>>>>> +{
>>>>> +   mutex_lock(&gt->ccs.mutex);
>>>>> +   __intel_gt_apply_ccs_mode(gt);
>>>>> +   mutex_unlock(&gt->ccs.mutex);
>>>>> +}
>>>>> +
>>>>> +void intel_gt_init_ccs_mode(struct intel_gt *gt)
>>>>> +{
>>>>> +   mutex_init(&gt->ccs.mutex);
>>>>> +   gt->ccs.mode = 1;
>>>>
>>>> What is '1'? And this question carries over to the sysfs interface in the
>>>> following patch - who will use it and where it is documented how to use it?
>>>
>>> The value '1' is explained in the comment above[1] and in the
>>
>> Do you mean this is mode '1':
>>
>>    * With 1 engine (ccs0):
>>    *   slice 0, 1, 2, 3: ccs0
>>
>> ?
>>
>> But I don't see where it says what do different modes mean on different
>> SKU configurations.
>>
>> It also does not say what should the num_slices sysfs file be used for.
>>
>> Does "mode N" mean "assign each command streamer N compute slices"? Or
>> "assign each compute slice N command streamers"?
>>
>> I wonder if we should add something user friendly into
>> Documentation/ABI/*/sysfs-... Joonas your thoughts?
> 
> We definitely should always properly document all sysfs additions, just
> seems like we less frequently remember to do so. So yeah, this should be
> documented just like other uAPI.
> 
> I also like the idea of not exposing the the file at all if the value
> can't be modified.
> 
> The ccs_mode is just supposed to allow user to select how many CCS
> engines they want to expose, and always make an even split of slices
> between them, nothing more nothing less.

Hmm I can't see that the series changes anywhere what command streamers 
will get reported as available.

Regards,

Tvrtko


