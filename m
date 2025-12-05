Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E4CA7366
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AE310EAAD;
	Fri,  5 Dec 2025 10:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACdUQYIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0533A10EAAD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:41:30 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-882379c0b14so15029096d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764931289; x=1765536089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pl0KZsEEFyvHk530kg5eqVspRdfF3HFp7SF4AM4hfeM=;
 b=ACdUQYInXYmxrU2CtbgWaCtP+wTSyIqlJTAdJRMjKeL73h/XdfheeUHaXx9rZReEBO
 w85YJNMMl2SFEoLiMFT/auhvKjSoHgOaKXtUDVHWXrS/eS5q7Ckly+MsLR2KHZ/gfFmp
 3xqj10VNRKTh0iaFrEeJk24vP2NcjBRD5O4zNaNztPipWmD4d0a21bfY5ZYvfJTW4kGv
 HchbpSDDJktBpGavJVTG10Xpfup2bIUgZdYxUtUyFZHHyUiJ33Jppz2zniLpEea5AEPy
 F78ITp6waGawf3pEVqM6Owug2qrYCUrCZOrcvcix4Ioe8C2BCjhpXuwFczKPkN+3eNLH
 sE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764931289; x=1765536089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pl0KZsEEFyvHk530kg5eqVspRdfF3HFp7SF4AM4hfeM=;
 b=idyygyjW559l60BX+mVfKFoZ9lTo4hola0UasoMXofIn3leP4jHqnRvPgSPdI/hEI1
 3VyF6PvBJJdaTBWbiPvM/4JsSJPWhahpSN+jB8tSMXzZahQUgBMwT5/oKb/ydhvnXfBA
 bWqHJBYIiofUq1kE6FcGF+kUH4MRNsntfluD/IUqd1UiGoLPtOR76ngO66pu5g2xk1yr
 Lj6Djo0HJrWAVhSFhID2ZByLOLAywC1IBuC3lcGuKArzM53wPxzeoTk8OYKPFE8EREV1
 Lyn45CnnjtXaN6eEjgn/cUvF+ZiTxsxbNnz3OPLJCgB3mj8PSpSAscF3JzzsCzaYJ4DV
 zMFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGsIYCKjwOOUzsZUdFesUW2ZC/Y1VGaqPoN19XnktXspVV1j+wXtSPz2VxOMHI+USzYKb+S5EuA7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxrI4WcJIyMF4+J/oIkh4R17M29R3tQ7lNVqOzFZV28/N/k6t2
 7Q6GHN2ZO5jbPROC4VjYfiMEs5MFxmAHWo12lXjnCdqBSHwm1+G4LQYI
X-Gm-Gg: ASbGncs6dRE2XHntt/ENuUVvTx8Lu+7HaJPNkjj+Cpft3GcTHtRXvLpqy3QvWl9CbZr
 dQ1e1pdh2LV6LkRnhfg1f08BtBNjhsEeH1WSa5SZ9GAo2EkQdyrlM4lLflYxD+wmTkj4ktM9mLb
 778pguxMwuNHkCmkef0+rLhiR1Rw1YFvobrdTZO0l3hJtr2GMWDgvFxW3ct3psZWIG5XcxMwrhk
 9thlFRdIY9toksVvxYoLLE/uCRfkCZJpK/QckWkmGZ/a7fQ+c6G+/xt07IQoYLsl5iTLdY2PdqF
 F9T+MokKdA5oT/IpoLMvI+7lGpYm2hVnNfV0DnrDWsRIf14dRW5TK2W5oDuvlZiGqI2KI3dUOZn
 eQTy6LQQ6kuunC5xUe8UEFCuK67kBv4CtVs/gkWLmUZgp/EnB2Q9i8f79n7lsjWGHhQ//BxxPnf
 vcpBpU/SpFf4SyWZgEQU4ydLjrp9a2qi9DYV0zPuQ3CA==
X-Google-Smtp-Source: AGHT+IHNxqFp5G2R7gNMuG1VWImXhi2+k99kfXSMAJ0YiDtIklgT1SoXMb9r1YrkoI4/X88XYCBQTw==
X-Received: by 2002:a05:6214:33c9:b0:882:6797:3a67 with SMTP id
 6a1803df08f44-888194838a2mr123350926d6.13.1764931288868; 
 Fri, 05 Dec 2025 02:41:28 -0800 (PST)
Received: from [10.254.120.97] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88827f332a7sm31835936d6.5.2025.12.05.02.41.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:41:28 -0800 (PST)
Message-ID: <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
Date: Fri, 5 Dec 2025 11:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
To: Matthew Auld <matthew.auld@intel.com>, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, simona.vetter@ffwll.ch
References: <20251204145952.7052-1-christian.koenig@amd.com>
 <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/4/25 16:51, Matthew Auld wrote:
> On 04/12/2025 14:59, Christian König wrote:
>> This debugging hack is important to enforce the rule that importers
>> should *never* touch the underlying struct page of the exporter.
>>
>> Instead of just mangling the page link create a copy of the sg_table
>> but only copy over the DMA addresses and not the pages.
>>
>> This will cause a NULL pointer de-reference if the importer tries to
>> touch the struct page. Still quite a hack but this at least allows the
>> exporter to properly keeps it's sg_table intact while allowing the
>> DMA-buf maintainer to find and fix misbehaving importers and finally
>> switch over to using a different data structure in the future.
>>
>> v2: improve the hack further by using a wrapper structure and explaining
>> the background a bit more in the commit message.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
>> ---
>>   drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 58 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 2305bb2cc1f1..8c4afd360b72 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -35,6 +35,12 @@
>>     #include "dma-buf-sysfs-stats.h"
>>   +/* Wrapper to hide the sg_table page link from the importer */
>> +struct dma_buf_sg_table_wrapper {
>> +    struct sg_table *original;
>> +    struct sg_table wrapper;
>> +};
>> +
>>   static inline int is_dma_buf_file(struct file *);
>>     static DEFINE_MUTEX(dmabuf_list_mutex);
>> @@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>>   -static void mangle_sg_table(struct sg_table *sg_table)
>> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>>   {
>> -#ifdef CONFIG_DMABUF_DEBUG
>> -    int i;
>> -    struct scatterlist *sg;
>> -
>> -    /* To catch abuse of the underlying struct page by importers mix
>> -     * up the bits, but take care to preserve the low SG_ bits to
>> -     * not corrupt the sgt. The mixing is undone on unmap
>> -     * before passing the sgt back to the exporter.
>> +    struct scatterlist *to_sg, *from_sg;
>> +    struct sg_table *from = *sg_table;
>> +    struct dma_buf_sg_table_wrapper *to;
>> +    int i, ret;
>> +
>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +        return 0;
>> +
>> +    /*
>> +     * To catch abuse of the underlying struct page by importers copy the
>> +     * sg_table without copying the page_link and give only the copy back to
>> +     * the importer.
>>        */
>> -    for_each_sgtable_sg(sg_table, sg, i)
>> -        sg->page_link ^= ~0xffUL;
>> -#endif
>> +    to = kzalloc(sizeof(*to), GFP_KERNEL);
>> +    if (!to)
>> +        return -ENOMEM;
>> +
>> +    ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
>> +    if (ret)
>> +        goto free_to;
>> +
>> +    to_sg = to->wrapper.sgl;
>> +    for_each_sgtable_dma_sg(from, from_sg, i) {
>> +        sg_set_page(to_sg, NULL, 0, 0);
> 
> Are we still allowed to pass NULL page here? There looks to be the recently added:
> 
> VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
> 
> And if page_range_contiguous() does not just return true, it potentially wants to dereference the page, like with page_to_pfn()?

Good point.

It doesn't crash at the moment because page_to_pfn() also works with NULL as page, but it is clearly not the nicest thing to do.

I will switch over to using sg_assign_page() instead.

> 
> 
>> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
>> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);
> 
> Nit: formatting looks off here.

Oh, indeed.

Thanks,
Christian.

> 
>> +        to_sg = sg_next(to_sg);
>> +    }
>>   +    to->original = from;
>> +    *sg_table = &to->wrapper;
>> +    return 0;
>> +
>> +free_to:
>> +    kfree(to);
>> +    return ret;
>> +}
>> +
>> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
>> +{
>> +    struct dma_buf_sg_table_wrapper *copy;
>> +
>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +        return;
>> +
>> +    copy = container_of(*sg_table, typeof(*copy), wrapper);
>> +    *sg_table = copy->original;
>> +    sg_free_table(&copy->wrapper);
>> +    kfree(copy);
>>   }
>>     static inline bool
>> @@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>           if (ret < 0)
>>               goto error_unmap;
>>       }
>> -    mangle_sg_table(sg_table);
>> +    ret = dma_buf_mangle_sg_table(&sg_table);
>> +    if (ret)
>> +        goto error_unmap;
>>         if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>>           struct scatterlist *sg;
>> @@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>         dma_resv_assert_held(attach->dmabuf->resv);
>>   -    mangle_sg_table(sg_table);
>> +    dma_buf_demangle_sg_table(&sg_table);
>>       attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>         if (dma_buf_pin_on_map(attach))
> 

