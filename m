Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C454B734E40
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5910E1C1;
	Mon, 19 Jun 2023 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A310E1BA;
 Mon, 19 Jun 2023 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687164266; x=1718700266;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BNE4W1P14rdG6VZuxcI9DPPgclY10aiYF6zQ+x3pbJ0=;
 b=VL+Z7zXZ/PDMm8ZUfYqDuCFRPqiaaZUPMloq2WI1JZhC6y3f1eLBWV+r
 ZbTUSj4hxxld/XTwYj+ghLp5fJ0stegTPOGyfpEDbbZQrX/ADSWIQxNkN
 E3vsdaf/IaYIaCeOEAysiYgIqBnFGrm1wfwzClBCliwvHCzkMqlFDksrC
 xgRUxtiXuMvDPisYP6fv9c7ghEBxRDyUJoQ4PFmpeWneL+aMAEjf6Pqcv
 WIJ43jzTR3LwpYFtwhQW75gDRn2N0bQwW9Pv/FamcAvGcd2npw7exLOf7
 1npsRw1Y1Mb20aDIHrPWmphRkVa3Z9V49gTonyjtLp8/FnqCP9ImG49Cp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="344327721"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="344327721"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 01:44:25 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="747478487"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="747478487"
Received: from acarew-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 01:44:22 -0700
Message-ID: <bcb0a1d2-cd4d-a56f-1ee6-7ccfdd2f7b38@linux.intel.com>
Date: Mon, 19 Jun 2023 09:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230617180420.GA410966@sumitra.com>
 <648f48bc3d3c2_1de3f9294a3@iweiny-mobl.notmuch>
 <f2cc785b-f34a-2a71-78b1-18b4f37de24b@shipmail.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f2cc785b-f34a-2a71-78b1-18b4f37de24b@shipmail.org>
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/06/2023 08:59, Thomas Hellström (Intel) wrote:
> 
> On 6/18/23 20:11, Ira Weiny wrote:
>> Sumitra Sharma wrote:
>>> kmap() has been deprecated in favor of the kmap_local_page()
>>> due to high cost, restricted mapping space, the overhead of a
>>> global lock for synchronization, and making the process sleep
>>> in the absence of free slots.
>>>
>>> kmap_local_page() is faster than kmap() and offers thread-local
>>> and CPU-local mappings, take pagefaults in a local kmap region
>>> and preserves preemption by saving the mappings of outgoing tasks
>>> and restoring those of the incoming one during a context switch.
>>>
>>> The mapping is kept thread local in the function
>>> “i915_vma_coredump_create” in i915_gpu_error.c
>>>
>>> Therefore, replace kmap() with kmap_local_page().
>>>
>>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>>>
>> NIT: No need for the line break between Suggested-by and your signed 
>> off line.
>>
>>> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
>>> ---
>>>
>>> Changes in v2:
>>>     - Replace kmap() with kmap_local_page().
>> Generally it is customary to attribute a change like this to those who
>> suggested it in a V1 review.
>>
>> For example:
>>
>>       - Tvrtko/Thomas: Use kmap_local_page() instead of page_address()
>>
>> Also I don't see Thomas on the new email list.  Since he took the time to
>> review V1 he might want to check this version out.  I've added him to the
>> 'To:' list.
> 
> Thanks.
> 
> 
>> Also a link to V1 is nice.  B4 formats it like this:
>>
>> - Link to v1: 
>> https://lore.kernel.org/all/20230614123556.GA381200@sumitra.com/
>>
>> All that said the code looks good to me.  So with the above changes.
>>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> 
> LGTM. Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thanks all! I'll just re-send the patch for our CI, since it didn't get 
picked up automatically (stuck in moderation perhaps), with all r-b tags 
added and extra line space removed and merge it if results will be green.

Regards,

Tvrtko
