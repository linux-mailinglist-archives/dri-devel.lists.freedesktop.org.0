Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4A734CE8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC3910E1A6;
	Mon, 19 Jun 2023 07:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26210E19F;
 Mon, 19 Jun 2023 07:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0B2B240A80;
 Mon, 19 Jun 2023 09:59:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.2
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHJ22o8d7g3u; Mon, 19 Jun 2023 09:59:52 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C78C840A59;
 Mon, 19 Jun 2023 09:59:51 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 54A4D3631FE;
 Mon, 19 Jun 2023 09:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1687161591; bh=lKpentDuo+eUKVk60Qur3HgdnqCuR/j+T/VCjjRUt7M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GcxwNuF54lCuOZXO+hvxmf/SIrp7aDVR10nTeNMRwqYBO0EB23LW8ABDYY8m4mHCg
 iHIV1LT68QCjY6XT7vu9SmocuyOv2F70kadxdODdRKCie7KSE+Orv8bdx6BYl1QuZE
 gQgcBv3Urn2A5VlaJALdM8I8szMp1zEkd+G4h2Eg=
Message-ID: <f2cc785b-f34a-2a71-78b1-18b4f37de24b@shipmail.org>
Date: Mon, 19 Jun 2023 09:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230617180420.GA410966@sumitra.com>
 <648f48bc3d3c2_1de3f9294a3@iweiny-mobl.notmuch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <648f48bc3d3c2_1de3f9294a3@iweiny-mobl.notmuch>
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


On 6/18/23 20:11, Ira Weiny wrote:
> Sumitra Sharma wrote:
>> kmap() has been deprecated in favor of the kmap_local_page()
>> due to high cost, restricted mapping space, the overhead of a
>> global lock for synchronization, and making the process sleep
>> in the absence of free slots.
>>
>> kmap_local_page() is faster than kmap() and offers thread-local
>> and CPU-local mappings, take pagefaults in a local kmap region
>> and preserves preemption by saving the mappings of outgoing tasks
>> and restoring those of the incoming one during a context switch.
>>
>> The mapping is kept thread local in the function
>> “i915_vma_coredump_create” in i915_gpu_error.c
>>
>> Therefore, replace kmap() with kmap_local_page().
>>
>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>>
> NIT: No need for the line break between Suggested-by and your signed off line.
>
>> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
>> ---
>>
>> Changes in v2:
>> 	- Replace kmap() with kmap_local_page().
> Generally it is customary to attribute a change like this to those who
> suggested it in a V1 review.
>
> For example:
>
>   	- Tvrtko/Thomas: Use kmap_local_page() instead of page_address()
>
> Also I don't see Thomas on the new email list.  Since he took the time to
> review V1 he might want to check this version out.  I've added him to the
> 'To:' list.

Thanks.


> Also a link to V1 is nice.  B4 formats it like this:
>
> - Link to v1: https://lore.kernel.org/all/20230614123556.GA381200@sumitra.com/
>
> All that said the code looks good to me.  So with the above changes.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

LGTM. Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



>
>> 	- Change commit subject and message.
>>
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f020c0086fbc..bc41500eedf5 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1164,9 +1164,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>>   
>>   			drm_clflush_pages(&page, 1);
>>   
>> -			s = kmap(page);
>> +			s = kmap_local_page(page);
>>   			ret = compress_page(compress, s, dst, false);
>> -			kunmap(page);
>> +			kunmap_local(s);
>>   
>>   			drm_clflush_pages(&page, 1);
>>   
>> -- 
>> 2.25.1
>>
