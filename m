Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C76E0C65
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 13:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571210EABE;
	Thu, 13 Apr 2023 11:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFB610EABE;
 Thu, 13 Apr 2023 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681385161; x=1712921161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=of+2FZvU42jR3qf9UhUQB7y288ceCh2j8lJjjWfmm8E=;
 b=kuRurdMwkqdiXlnO98byNfRBbMlxCXjgNgMoTCo5UdY8LulDlWodiuVc
 58ZONCPH7r4eVKSgXhSD6svQoeoaf+MrXmO++Im3oNl5bHaK5eRj+DwPW
 0PmoUb4pBM3b8zfOdhUeZrwG5DRqZSQw3R1iqshcwRHmGrDpGH24u2/iI
 TeFxp8XdFkMhzh3m2iIPTgWAbj8k5x9/e2UQNDXFsrQognGZRLD0iKQAD
 ofxOjd7CyMov4vnzpmsj/GEPCbNjWIe4wPeDntVOGeHD88LmmfKfMS9YF
 tEb3CSkPUXUUlBGeKy6W+x/PsLd5Q72zJoL2iWfVh5/JKafkmZwuJS+Ny w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324514089"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="324514089"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 04:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800782791"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="800782791"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 04:25:57 -0700
Message-ID: <ac089621-509f-d5af-ab3b-2aabb9022cc0@linux.intel.com>
Date: Thu, 13 Apr 2023 12:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v4 5/5] drm/i915/gt: Make sure that errors are
 propagated through request chains
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230308094106.203686-1-andi.shyti@linux.intel.com>
 <20230308094106.203686-6-andi.shyti@linux.intel.com>
 <1bee29d0-a5cc-9ff3-d164-f162259558e2@intel.com> <ZDVwMawvlOLZ2VZt@intel.com>
 <ZDaOWhKiG5jD7ftp@ashyti-mobl2.lan> <ZDatt0vKsRECOYTD@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDatt0vKsRECOYTD@intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org, "Das,
 Nirmoy" <nirmoy.das@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/04/2023 14:10, Rodrigo Vivi wrote:
> On Wed, Apr 12, 2023 at 12:56:26PM +0200, Andi Shyti wrote:
>> Hi Rodrigo,
>>
>>>>> Currently, when we perform operations such as clearing or copying
>>>>> large blocks of memory, we generate multiple requests that are
>>>>> executed in a chain.
>>>>>
>>>>> However, if one of these requests fails, we may not realize it
>>>>> unless it happens to be the last request in the chain. This is
>>>>> because errors are not properly propagated.
>>>>>
>>>>> For this we need to keep propagating the chain of fence
>>>>> notification in order to always reach the final fence associated
>>>>> to the final request.
>>>>>
>>>>> To address this issue, we need to ensure that the chain of fence
>>>>> notifications is always propagated so that we can reach the final
>>>>> fence associated with the last request. By doing so, we will be
>>>>> able to detect any memory operation  failures and determine
>>>>> whether the memory is still invalid.
>>>>>
>>>>> On copy and clear migration signal fences upon completion.
>>>>>
>>>>> On copy and clear migration, signal fences upon request
>>>>> completion to ensure that we have a reliable perpetuation of the
>>>>> operation outcome.
>>>>>
>>>>> Fixes: cf586021642d80 ("drm/i915/gt: Pipelined page migration")
>>>>> Reported-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> Cc: stable@vger.kernel.org

Try to find from which kernel version this needs to go in. For instance 
if we look at cf586021642d80 it would be v5.15+, but actually in that 
commit there are no users apart from selftests. So I think find the 
first user which can be user facing and mark the appropriate kernel 
version in the stable tag.

>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> With  Matt's comment regarding missing lock in intel_context_migrate_clear
>>>> addressed, this is:
>>>>
>>>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>>>
>>> Nack!
>>>
>>> Please get some ack from Joonas or Tvrtko before merging this series.
>>
>> There is no architectural change... of course, Joonas and Tvrtko
>> are more than welcome (and actually invited) to look into this
>> patch.
>>
>> And, btw, there are still some discussions ongoing on this whole
>> series, so that I'm not going to merge it any time soon. I'm just
>> happy to revive the discussion.
>>
>>> It is a big series targeting stable o.O where the revisions in the cover
>>> letter are not helping me to be confident that this is the right approach
>>> instead of simply reverting the original offending commit:
>>>
>>> cf586021642d ("drm/i915/gt: Pipelined page migration")
>>
>> Why should we remove all the migration completely? What about the
>> copy?
> 
> Is there any other alternative that doesn't hurt the Linux stable rules?
> 
> I honestly fail to see this one here is "obviously corrected and tested"
> and it looks to me that it has more "than 100 lines, with context".
> 
> Does this series really "fix only one thing" with 5 patches?

This is challenging.

Fix to me looks needed on the high level (haven't read the patch details 
yet), but when a series sent to stable can go quite badly and we had 
such problem very recently with only a two patch series. And it is also 
indeed quite large.

Reverting cf586021642d80 definitely isn't an option because stuff 
depends on the code added by it and would need an alternative 
implementation. Losing async clear/migrate which would be bad and could 
also a large patch to implement the alternative.

So since I think we are indeed stuck with fixing this - would it be 
better to squash it all into one patch for easier backporting?

We can also look if there are ways to make the diff smaller.

Regards,

Tvrtko

>>> It looks to me that we are adding magic on top of magic to workaround
>>> the deadlocks, but then adding more waits inside locks... And this with
>>> the hang checks vs heartbeats, is this really an issue on current upstream
>>> code? or was only on DII?
>>
>> There is no real magic happening here. It's just that the error
>> message was not reaching the end of the operation while this
>> patch is passing it over.
>>
>>> Where was the bug report to start with?
>>
>> Matt has reported this, I will give to you the necessary links to
>> it offline.
> 
> It would be really good to have a report to see if this is
> "real bug that bothers people (not a, “This could be a problem…” type thing)."
> 
> All quotes above are from:
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
>>
>> Thanks for looking into this,
>> Andi
