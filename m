Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E77A52FF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F8210E2D9;
	Mon, 18 Sep 2023 19:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECC810E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:22:49 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id iJpUqXaW8vRSUiJpVqOPuM; Mon, 18 Sep 2023 21:22:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1695064967;
 bh=qUTILhPdiaRO8mrn/9Xa/LyWEJmc0jgEzY8KobjS0VU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IOzxAW2lb1j3Wwnmt0nnTQ9t31+qJFPnpTRxYU9+Wupy4Kk82Di9jWTUtPUXyQ48R
 PvIEWdTX/wwZQY5s+RLBnI/tga8o72m10FsOXACjCxkuxPZNG+wY5TEO5oUW0g+KkE
 nz5N5o3jtwVqEbus7SQSHMAlLcDb/iJW3QhZjErBHCdDbMuqeRxLtGTSPdEwnCQeR1
 xCwIs3USoUec9heY2cu3RZ/bcuj3VXmsX4MiYCI/dWA9mdFaUiW1rVygJ09aqNC21n
 L7cK7pAwtCxzt3irmbIoBQTzRGoJcLhzKyqSq8pa+OEfzXsuWf6BWSdVOvRloEd75X
 M1lDb3Pv0IOjA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 18 Sep 2023 21:22:47 +0200
X-ME-IP: 86.243.2.178
Message-ID: <a49f800e-e56f-433a-81d2-6edd68a0a015@wanadoo.fr>
Date: Mon, 18 Sep 2023 21:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr>
 <7043f179-b670-db3c-3ab0-a1f3e991add9@embeddedor.com>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <7043f179-b670-db3c-3ab0-a1f3e991add9@embeddedor.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 18/09/2023 à 05:10, Gustavo A. R. Silva a écrit :
> 
> 
> On 9/18/23 12:46, Christophe JAILLET wrote:
>> If 'list_limit' is set to a very high value, 'lsize' computation could
>> overflow if 'head.count' is big enough.
>>
>> In such a case, udmabuf_create() will access to memory beyond 'list'.
>>
>> Use size_mul() to saturate the value, and have memdup_user() fail.
>>
>> Fixes: fbb0de795078 ("Add udmabuf misc device")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/dma-buf/udmabuf.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index c40645999648..fb4c4b5b3332 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -314,13 +314,13 @@ static long udmabuf_ioctl_create_list(struct 
>> file *filp, unsigned long arg)
>>       struct udmabuf_create_list head;
>>       struct udmabuf_create_item *list;
>>       int ret = -EINVAL;
>> -    u32 lsize;
>> +    size_t lsize;
>>       if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>>           return -EFAULT;
>>       if (head.count > list_limit)
>>           return -EINVAL;
>> -    lsize = sizeof(struct udmabuf_create_item) * head.count;
>> +    lsize = size_mul(sizeof(struct udmabuf_create_item), head.count);
>>       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
>>       if (IS_ERR(list))
>>           return PTR_ERR(list);
> 
> How about this, and we get rid of `lsize`:

Keeping or removing lsize is mostly a matter of taste, I think.

Using sizeof(*list) is better.

Let see if there are some other comments, and I'll send a v2.

Thanks for the feed-back.

CJ

> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..5cf9d849aaa8 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -314,14 +314,13 @@ static long udmabuf_ioctl_create_list(struct file 
> *filp, unsigned long arg)
>          struct udmabuf_create_list head;
>          struct udmabuf_create_item *list;
>          int ret = -EINVAL;
> -       u32 lsize;
> 
>          if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>                  return -EFAULT;
>          if (head.count > list_limit)
>                  return -EINVAL;
> -       lsize = sizeof(struct udmabuf_create_item) * head.count;
> -       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
> +       list = memdup_user((void __user *)(arg + sizeof(head)),
> +                          size_mul(sizeof(*list), head.count));
>          if (IS_ERR(list))
>                  return PTR_ERR(list);
> 
> 
> -- 
> Gustavo
> 

