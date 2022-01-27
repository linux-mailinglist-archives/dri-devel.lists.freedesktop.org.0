Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F263049DD77
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28910EE93;
	Thu, 27 Jan 2022 09:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DD10EE91;
 Thu, 27 Jan 2022 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643274801; x=1674810801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ypHEOArCLQ9Lqljw8MluEpZa7igABREh5sdnYemF0aQ=;
 b=Jo3jnObdlKWn5/BjlnVvH+Vu9rBNM1t2BE7R4LRfBSDc+cHJXujhvlMc
 VnmwBNq3JB2vXNSp8jwBJ5mFb1Xn1xlDv5BnQgDVVNuQPkk5AjemwlE+H
 iixsWIlBTvOkluwK6qlELauXFPIv1sscx+xCTEoxAIT8w2FSvEDqn3dHz
 hHeOs9mbB6ZPZ0UofgbPmi+bYMCJvwhYzTgeKtxP4zEmpLMne3oWvphRF
 eX7vIOntia7OxQ/ohp12axgf6r+qgvAYqb0b+CT5AZzZOSnnJwnExxS4L
 31ze2DzCkBTGiDTXeskdi7nIPZw/k8BHwjDy05Kr5SsM4PJmofpdJOhDe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246574004"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="246574004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 01:12:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="581408612"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 01:12:48 -0800
Date: Thu, 27 Jan 2022 01:12:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <20220127091247.3uqi5zhesqtecbsw@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <20220127081810.6zt6cyib4s7kpa6f@ldmartin-desk2>
 <3c6a9126-bf88-0f29-425f-36748271c179@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c6a9126-bf88-0f29-425f-36748271c179@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 09:55:05AM +0100, Christian König wrote:
>Am 27.01.22 um 09:18 schrieb Lucas De Marchi:
>>On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>>>Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>>>On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>>>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>>>[SNIP]
>>>>humn... not sure if I was  clear. There is no importer and 
>>>>exporter here.
>>>
>>>Yeah, and exactly that's what I'm pointing out as problem here.
>>>
>>>You are using the inter driver framework for something internal to 
>>>the driver. That is an absolutely clear NAK!
>>>
>>>We could discuss that, but you guys are just sending around 
>>>patches to do this without any consensus that this is a good idea.
>>
>>s/you guys/you/ if you have to blame anyone - I'm the only s-o-b in
>>these patches. I'm sending these to _build consensus_ on what may be 
>>a good
>>use for it showing a real problem it's helping to fix.
>
>Well a cover letter would have been helpful, my impression was that 
>you have a larger set and just want to upstream some minor DMA-buf 
>changes necessary for it.

I missed adding this sentence to the cover letter, as my impression was that
dma-buf-map was already used outside inter-driver framework. But there
is actually a cover letter:

https://lore.kernel.org/all/20220126203702.1784589-1-lucas.demarchi@intel.com/

And looking at it now, it seems I missed adding Thomas Zimmermann to Cc.

>
>Now I know why people are bugging me all the time to add cover letters 
>to add more context to my sets.
>
>>
>>From its documentation:
>>
>> * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its 
>>helpers are
>> * actually independent from the dma-buf infrastructure. When 
>>sharing buffers
>> * among devices, drivers have to know the location of the memory to 
>>access
>> * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
>> * solves this problem for dma-buf and its users. If other drivers or
>> * sub-systems require similar functionality, the type could be 
>>generalized
>> * and moved to a more prominent header file.
>>
>>if there is no consensus and a better alternative, I'm perfectly fine in
>>throwing it out and using the better approach.
>
>When Thomas Zimmermann upstreamed the dma_buf_map work we had a 
>discussion if that shouldn't be independent of the DMA-buf framework.
>
>The consensus was that as soon as we have more widely use for it this 
>should be made independent. So basically that is what's happening now.
>
>I suggest the following approach:
>1. Find a funky name for this, something like iomem_, kiomap_ or similar.

iosys_map?

>2. Separate this from all you driver dependent work and move the 
>dma_buf_map structure out of DMA-buf into this new whatever_ prefix.

should this be a follow up to the driver work or a prerequisite?

thanks
Lucas De Marchi

>3. Ping Thomas, LKML, me and probably a couple of other core people if 
>this is the right idea or not.
>4. Work on dropping the map parameter from dma_buf_vunmap(). This is 
>basically why we can't modify the pointers returned from 
>dma_buf_vmap() and has already cause a few problems with 
>dma_buf_map_incr().
>
>Regards,
>Christian.
>
>>
>>Lucas De Marchi
>
