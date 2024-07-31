Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7099434C5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3214A10E665;
	Wed, 31 Jul 2024 17:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dvTxmvOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3FA10E665
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 17:11:40 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id ZCrRsJemgWPKVZCrRsG3Ul; Wed, 31 Jul 2024 19:11:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722445898;
 bh=l/N7BL6uXIDoiEcTV0sQ9X+6QKDbvzDQWB0h4bM+lFE=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=dvTxmvOJZbGhRxoANl70qmf7S2ZSEKLOcNeA9hLaqEFBvPQUcsA6f9iuxkqiSgiAu
 MJOoqNaHkAis3+RugHTH6u2kXY+UKzaEFLzfPZwMxF3sTZAm+DeHEmp8yjO3uU9F4/
 HSwpkttWi+aUh05ALFIE3fLkL1l2S7CFYAmCcXxBYnZ6RRTnafAawtCfja3mIbTWEZ
 6A2+ULcm7D39ArVc/5GdclhHK+BrJw5SBb9cp1nSTKfIHbxlA3sxI7pVOwjp+D37d2
 mKUR4ccBalvZNLsOncet2VLSiWwX5OYVyTA1j2PZVVbsSrR8/EMAhCmdjzjd2Nq9wr
 Xqk1uLNDRGQzA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 31 Jul 2024 19:11:38 +0200
X-ME-IP: 90.11.132.44
Message-ID: <0fbca32a-d0e9-4884-9839-be1714543398@wanadoo.fr>
Date: Wed, 31 Jul 2024 19:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] udmabuf: use kmem_cache to alloc udmabuf folio
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240731073752.1225177-1-link@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240731073752.1225177-1-link@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 31/07/2024 à 09:37, Huan Yang a écrit :
> The current udmabuf_folio contains a list_head and the corresponding
> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
> allocate memory.
> 
> However, kmalloc is a public pool, starting from 8,16,32 bytes.
> Additionally, if the size is not aligned with the kmalloc size, it will
> be rounded up to the corresponding size.
> This means that each udmabuf_folio allocation will get 32 bytes, and
> waste 8 bytes.
> 
> Considering that each udmabuf creates a folio corresponding to a
> udmabuf_folio, the wasted memory can be significant in the case of
> memory fragmentation.
> 
> Furthermore, if udmabuf is frequently used, the allocation and
> deallocation of udmabuf_folio will also be frequent.
> 
> Therefore, this patch adds a kmem_cache dedicated to the allocation and
> deallocation of udmabuf_folio.This is expected to improve the
> performance of allocation and deallocation within the expected range,
> while also avoiding memory waste.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
> v3 -> v2: fix error description.
> v2 -> v1: fix double unregister, remove unlikely.
>   drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..c112c58ef09a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>   module_param(size_limit_mb, int, 0644);
>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>   
> +static struct kmem_cache *udmabuf_folio_cachep;
> +
>   struct udmabuf {
>   	pgoff_t pagecount;
>   	struct folio **folios;
> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
>   		unpin_folio(ubuf_folio->folio);
>   
>   		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> +		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>   	}
>   }
>   
> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
>   {
>   	struct udmabuf_folio *ubuf_folio;
>   
> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> +	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>   	if (!ubuf_folio)
>   		return -ENOMEM;
>   
> @@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
>   					   DMA_BIT_MASK(64));
>   	if (ret < 0) {
>   		pr_err("Could not setup DMA mask for udmabuf device\n");
> -		misc_deregister(&udmabuf_misc);
> -		return ret;
> +		goto err;
> +	}
> +
> +	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
> +	if (!udmabuf_folio_cachep) {
> +		ret = -ENOMEM;
> +		goto err;
>   	}
>   
>   	return 0;
> +
> +err:
> +	misc_deregister(&udmabuf_misc);
> +	return ret;
>   }
>   
>   static void __exit udmabuf_dev_exit(void)

Hi,

should a kmem_cache_destroy() be also added in udmabuf_dev_exit()?

CJ

> 
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed

