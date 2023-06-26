Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B673DAB8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 11:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD510E096;
	Mon, 26 Jun 2023 09:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCF210E052;
 Mon, 26 Jun 2023 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687770177; x=1719306177;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UM1r9KTEsMc/uyww/lZ8f5bqgszra6Nb5ggkVJu6Ujk=;
 b=Fgx6YsiB+kgm98vcNEZ9LW5SzqE4Ca1wWMEU9GdmqFoGjiUHoqYXN8eF
 WiP7KgrfiIFQE6qCRs2qvGYw7DhfBNkTkXP2LtcwfxJ+bq0JExfcck/kY
 bRaFfVwtgzpOKuPA1COOaOVNefa4tqoNZ88oJFl+1noPV3BkxEHtj4Dsh
 aNEdWQ90APuNMBzbsym5B+QUdoEfkA1pbRkOYYFcjWfqY5TQkHjUg/IKw
 FOll4anccC7+oDihpJ1snV/Xf2Qtj5F0LhRE2h+Yi8beZBCADl9hgdIpg
 SvrJCPsE1UcOaqhujoZJUSN8MIrrQG9B54znY/ST867ir9gohSaKIczxH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="364667983"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364667983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="840195585"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="840195585"
Received: from mcherry-mobl.ger.corp.intel.com (HELO [10.213.228.175])
 ([10.213.228.175])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:02:20 -0700
Message-ID: <d7a6f81e-94b8-1cb3-5fd6-ac944a052470@linux.intel.com>
Date: Mon, 26 Jun 2023 10:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
References: <20230617180420.GA410966@sumitra.com>
 <648f48bc3d3c2_1de3f9294a3@iweiny-mobl.notmuch>
 <20230619154550.GB412243@sumitra.com>
 <6491a85a37cc8_28e729425@iweiny-mobl.notmuch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6491a85a37cc8_28e729425@iweiny-mobl.notmuch>
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/06/2023 14:23, Ira Weiny wrote:
> Sumitra Sharma wrote:
>> On Sun, Jun 18, 2023 at 11:11:08AM -0700, Ira Weiny wrote:
>>> Sumitra Sharma wrote:
>>>> kmap() has been deprecated in favor of the kmap_local_page()
>>>> due to high cost, restricted mapping space, the overhead of a
>>>> global lock for synchronization, and making the process sleep
>>>> in the absence of free slots.
>>>>
>>>> kmap_local_page() is faster than kmap() and offers thread-local
>>>> and CPU-local mappings, take pagefaults in a local kmap region
>>>> and preserves preemption by saving the mappings of outgoing tasks
>>>> and restoring those of the incoming one during a context switch.
>>>>
>>>> The mapping is kept thread local in the function
>>>> “i915_vma_coredump_create” in i915_gpu_error.c
>>>>
>>>> Therefore, replace kmap() with kmap_local_page().
>>>>
>>>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>>>>
>>>
>>> NIT: No need for the line break between Suggested-by and your signed off line.
>>>
>>
>> Hi Ira,
>>
>> What does NIT stand for?
> 
> Shorthand for 'nitpicking'.
> 
> "giving too much attention to details that are not important, especially
> as a way of criticizing: "
> 
> 	- https://dictionary.cambridge.org/dictionary/english/nitpicking
> 
> Via email this is a way for authors of an email to indicate something is
> technically wrong but while nicely acknowledging that it is not very
> significant and could be seen as overly critical.
> 
> For this particular comment I'm showing something to pay attention to next
> time but that was not a big deal this time around.
> 
>>
>> Thank you. I will take care about the line breaks.
>>
>>>> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 	- Replace kmap() with kmap_local_page().
>>>
>>> Generally it is customary to attribute a change like this to those who
>>> suggested it in a V1 review.
>>>
>>> For example:
>>>
>>>   	- Tvrtko/Thomas: Use kmap_local_page() instead of page_address()
>>>
>>> Also I don't see Thomas on the new email list.  Since he took the time to
>>> review V1 he might want to check this version out.  I've added him to the
>>> 'To:' list.
>>>
>>> Also a link to V1 is nice.  B4 formats it like this:
>>>
>>> - Link to v1: https://lore.kernel.org/all/20230614123556.GA381200@sumitra.com/
>>>
>>> All that said the code looks good to me.  So with the above changes.
>>>
>>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>>>
>>
>> I have noted down the points mentioned above. Thank you again.
>>
>> I am not supposed to create another version of this patch for
>> adding the above mentions, as you and Thomas both gave this patch
>> a reviewed-by tag. Right?
>>
> 
> Based on this response[*] from Tvrtko I think this version can move
> through without a v3.
> 
> Thanks!
> Ira
> 
> [*] https://lore.kernel.org/all/bcb0a1d2-cd4d-a56f-1ee6-7ccfdd2f7b38@linux.intel.com/
> 
> <quote>
> Thanks all! I'll just re-send the patch for our CI, since it didn't get
> picked up automatically (stuck in moderation perhaps), with all r-b tags
> added and extra line space removed and merge it if results will be green.
> 
> Regards,
> 
> Tvrtko
> </quote>

Pushed to drm-intel-gt-next, thanks for the patch and reviews!

Regards,

Tvrtko
