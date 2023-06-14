Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D434E7303F1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 17:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE95C10E07D;
	Wed, 14 Jun 2023 15:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 15:35:59 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B069B10E07D;
 Wed, 14 Jun 2023 15:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2B49C3FF00;
 Wed, 14 Jun 2023 17:30:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.199
X-Spam-Level: 
X-Spam-Status: No, score=-2.199 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe7QbcaBXzJp; Wed, 14 Jun 2023 17:30:27 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6D7533FECC;
 Wed, 14 Jun 2023 17:30:26 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E894D3631FF;
 Wed, 14 Jun 2023 17:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1686756626; bh=My99GLkGvRcJlCBxLCHL4W/UQjFF1tmEmHpgRBESrnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QNeJaHjqVqB4HskMw/NNX9mPCz3LWemDx6Hc9IdNNAgtZlzQ4A7fWTNVmnP/xOySI
 PLrCXXFLtVOR7+eRI+rMD7YULyQ4zzgSUKUdC3iBYdxBogO/lfZxtVmwIh4YtuX2IL
 pJl/J1CQhbmzWiugIIF4GGiWwohPosaBmKBT/QG8=
Message-ID: <69d7af2f-f4c2-5a7d-ce69-c38be5660c74@shipmail.org>
Date: Wed, 14 Jun 2023 17:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Call page_address() on page
 acquired with GFP_KERNEL flag
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230614123556.GA381200@sumitra.com>
 <bebd57fc-7135-dc97-701e-54cb9c2955c0@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <bebd57fc-7135-dc97-701e-54cb9c2955c0@linux.intel.com>
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, Fabio <fmdefrancesco@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/14/23 15:22, Tvrtko Ursulin wrote:
>
> On 14/06/2023 13:35, Sumitra Sharma wrote:
>> Pages allocated with GFP_KERNEL cannot come from Highmem.
>> That is why there is no need to call kmap() on them.
>
> Are you sure it is GFP_KERNEL backed and not tmpfs? I am not sure 
> myself so let me copy Matt and Thomas if they happen to know off hand.

It looks to me these are shmem pages or TTM pages. Both could be 
highmem. So I think kmap is the correct choice here.

/Thomas




>
> Regards,
>
> Tvrtko
>
>> Therefore, don't call kmap() on the page coming from
>> vma_res->bi.pages using for_each_sgt_page() in
>> i915_vma_coredump_create().
>>
>> Use a plain page_address() to get the kernel address instead.
>>
>> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f020c0086fbc..6f51cb4fc55c 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1164,9 +1164,8 @@ i915_vma_coredump_create(const struct intel_gt 
>> *gt,
>>                 drm_clflush_pages(&page, 1);
>>   -            s = kmap(page);
>> +            s = page_address(page);
>>               ret = compress_page(compress, s, dst, false);
>> -            kunmap(page);
>>                 drm_clflush_pages(&page, 1);
