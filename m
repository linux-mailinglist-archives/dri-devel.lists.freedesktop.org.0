Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C89AFA5B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B16010EA05;
	Fri, 25 Oct 2024 06:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="j/c0eeh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5210EA05
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729839167; x=1730443967; i=friedrich.vock@gmx.de;
 bh=/6RwklIZCa9yb5GfzL7m2B0KiifbcKmAP0s9I3PXRj4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=j/c0eeh7AiRS/4sMhnMsamY73W0qcbET1BHXLE26IWzm+dOyipXr2afDJEJQRysl
 Y/bqSzGq60wY1OSblSs7B7XMA4dU7nasLJ3CQ6jw5VUu148/A+n1iP5NpErYc4es+
 3827+orC/CWqkMD1/s2fKRrOKjWuLen9FYCx2dKkT2qj6tCPeQcauaeR/BOxX4bVL
 gUJtqW+9KOet4gdXJLvIqv7rfX+YIpOnAPheiAD2ayRApO7dQhXbiYkx6Gj09vEc0
 VW5eL02AGfJiZFpRR8Uqp7ffSuOP+jXEnScIyX5mO+ANSWTeb82A4DHYTLjHI9Wbi
 COKyXwI43bZt4ioWyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1tm7iA0HxJ-00q32s; Fri, 25
 Oct 2024 08:52:47 +0200
Message-ID: <1ee2453d-f661-4ea6-8b54-3f911b179420@gmx.de>
Date: Fri, 25 Oct 2024 08:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <ZxquPRn1QtaVzydE@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <ZxquPRn1QtaVzydE@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b9FU0+8IJRsQEb4eeD7hqHDp3liLno8Fhj6dhu/r7zT0DFgAPdo
 5vWN1jB3gEZaSd6WqJP+WG2QKHZLdlGx+7ppqZroCwZiN6qJtrfdknf3SAD8b+G7sNxeA4y
 2OU0hHSziONGKiwnwfxl55QR+IFgUSSTO72IIFDYBTrMbyMXwCf/L9vvbr1IVIA/hWbDtwH
 4tr99o1RfB0+NHWFwZ34w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mF6dlbFMn7I=;iKC5CcxxUGcAFscCuaBOmyZmBU6
 VpdzjhblANvzfE/nX37vKlUvywiPdeGypqJokhF4Dg1CwwykU+xRZF6JypIHRjWfJpC9qA4+W
 EZCSiyvj7iOZKPcV4//e3YkCHO/Va8CoVGrZVCV5Q/5ant7IAb2pCE1OCto8VmIUOkWLRSrjo
 GQ1Mo9SQkTYvAdOwPnEbQMjGLS0vv9Rp1N9f3cES8lrGQNBo01wxTdxdIUgUfrwMgSDKm47wH
 nGtitrz4mc+EoUylRitmxpidu1Ze24baFb+jkhULOzH7CYFNReUW5JEhpnA8K5Hsk3K4Mf3In
 QOr3HWgI0NVJ5OMr0rwKNSP+JC2TXzBv0EPu5NEaDP3ttZ77TaD/nPaBfRcfu984xibg1/7SY
 kbkfC9a4fRdB/KpdL0r6uQ+CbPQ+y+lRNQygPGB91oZVsObXaLuXCmsFcTpd3eOl5H1nz01+C
 KQu4pKbTzv1jZ9xS1a8hcWVp0fMLq8OYScNg9DfAau3FpZ3YyoQbmNZf5CylFlj9Xiy+6YVxS
 n1RJT9II+6ZsN56fxY1Ra9gi/1klUy68w7+DsV2n7BYAIxLmG/FoHksN1qEyW7KbAALARUTiq
 5I5r2So23Zdop24oAkQgxDXLQdPWBPZrra2V99TeZOyVgb6TB4Cr4O+7Id3/IoRzgecMc5Es+
 sZEli3VES+Sx7myUR9oSy7CV1bhlJ5HJZeaAs1amfLKzhEo8jym8SUa7r2fSegbhQ3/wZS1XK
 Cyr1xbzONPCcGsq3WAiZ7CZEZMTla5W9E7zdqI65VNifHO5x5Cl665dkxdVfqnSMPCKjOfJg8
 stYC9jgAdG5O73c4i5UM6vuBmFXO33g5HHLGIy36AutLI=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.10.24 22:29, Matthew Brost wrote:
> On Thu, Oct 24, 2024 at 02:41:57PM +0200, Christian K=C3=B6nig wrote:
>> Reports indicates that some userspace applications try to merge more th=
an
>> 80k of fences into a single dma_fence_array leading to a warning from
>
> Really, yikes.

Not really IME. Unless Christian means some reports I don't have access
to, the cases where userspace applications tried to do that were really
just cases where the fence count exploded exponentially because
dma_fence_unwrap_merge failed to actually merge identical fences (see
patch 2). At no point have I actually seen apps trying to merge 80k+
unique fences.

Regards,
Friedrich

>
>> kzalloc() that the requested size becomes to big.
>>
>> While that is clearly an userspace bug we should probably handle that c=
ase
>> gracefully in the kernel.
>>
>> So we can either reject requests to merge more than a reasonable amount=
 of
>> fences (64k maybe?) or we can start to use kvzalloc() instead of kzallo=
c().
>> This patch here does the later.
>>
>
> This patch seems reasonable to me if the above use is in fact valid.
>
>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
>
> Fixes tag?
>
> Patch itself LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fe=
nce-array.c
>> index 8a08ffde31e7..46ac42bcfac0 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fenc=
e *fence)
>>   	for (i =3D 0; i < array->num_fences; ++i)
>>   		dma_fence_put(array->fences[i]);
>>
>> -	kfree(array->fences);
>> -	dma_fence_free(fence);
>> +	kvfree(array->fences);
>> +	kvfree_rcu(fence, rcu);
>>   }
>>
>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int n=
um_fences)
>>   {
>>   	struct dma_fence_array *array;
>>
>> -	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL)=
;
>> +	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL=
);
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>
>> --
>> 2.34.1
>>

