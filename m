Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B96619C9D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 17:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC8810E8D3;
	Fri,  4 Nov 2022 16:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392AB10E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 16:10:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A4GAJ5N025672;
 Fri, 4 Nov 2022 11:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1667578219;
 bh=KxtxHFsnZX9YIDaI0wAJ3iyWAqdOhCP8AGovocZ1JOk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=iglOzJpT3q300lvNyu4s4lSRe2zhxnlCLVHnNwoRm0xMww3orA7uNjQmYzwZI/kYA
 cF/E19SN/mnviN9UnkS4vrKlLm7WdlbwaVTHbpBLz6hkcEYrO50+m2cuf1fjgGhFy8
 CXGspE7Q1MuzYsy9boaR/mtMFsvV/ksEnL0sAMgM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A4GAJ9n015161
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Nov 2022 11:10:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 4 Nov
 2022 11:10:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 4 Nov 2022 11:10:18 -0500
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A4GAIkD036385;
 Fri, 4 Nov 2022 11:10:18 -0500
Message-ID: <f4a4cb29-55d1-dd4f-e49b-5c6d7a845dda@ti.com>
Date: Fri, 4 Nov 2022 11:10:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sspatil@android.com,
 linaro-mm-sig@lists.linaro.org, jstultz@google.com, labbott@redhat.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/22 11:05 AM, Dawei Li wrote:
> Racing conflict could be:
> task A                 task B
> list_for_each_entry
> strcmp(h->name))
>                         list_for_each_entry
>                         strcmp(h->name)
> kzalloc                kzalloc
> ......                 .....
> device_create          device_create
> list_add
>                         list_add
> 
> The root cause is that task B has no idea about the fact someone
> else(A) has inserted heap with same name when it calls list_add,
> so a potential collision occurs.
> 
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

LGTM, Thanks,

Acked-by: Andrew Davis <afd@ti.com>

> ---
> v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> v1->v2: Narrow down locking scope, check the existence of heap before
> insertion, as suggested by Andrew Davis.
> v2->v3: Remove double checking.
> v3->v4: Minor coding style and patch formatting adjustment.
> ---
>   drivers/dma-buf/dma-heap.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 8f5848aa144f..59d158873f4c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	/* check the name is unique */
> -	mutex_lock(&heap_list_lock);
> -	list_for_each_entry(h, &heap_list, list) {
> -		if (!strcmp(h->name, exp_info->name)) {
> -			mutex_unlock(&heap_list_lock);
> -			pr_err("dma_heap: Already registered heap named %s\n",
> -			       exp_info->name);
> -			return ERR_PTR(-EINVAL);
> -		}
> -	}
> -	mutex_unlock(&heap_list_lock);
> -
>   	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
>   	if (!heap)
>   		return ERR_PTR(-ENOMEM);
> @@ -283,13 +271,27 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   		err_ret = ERR_CAST(dev_ret);
>   		goto err2;
>   	}
> -	/* Add heap to the list */
> +
>   	mutex_lock(&heap_list_lock);
> +	/* check the name is unique */
> +	list_for_each_entry(h, &heap_list, list) {
> +		if (!strcmp(h->name, exp_info->name)) {
> +			mutex_unlock(&heap_list_lock);
> +			pr_err("dma_heap: Already registered heap named %s\n",
> +			       exp_info->name);
> +			err_ret = ERR_PTR(-EINVAL);
> +			goto err3;
> +		}
> +	}
> +
> +	/* Add heap to the list */
>   	list_add(&heap->list, &heap_list);
>   	mutex_unlock(&heap_list_lock);
>   
>   	return heap;
>   
> +err3:
> +	device_destroy(dma_heap_class, heap->heap_devt);
>   err2:
>   	cdev_del(&heap->heap_cdev);
>   err1:
