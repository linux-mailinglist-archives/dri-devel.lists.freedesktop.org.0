Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DB943765
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADEC10E6C9;
	Wed, 31 Jul 2024 20:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jWTCYr0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DF710E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:50:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4280921baa2so4596595e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722459027; x=1723063827; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1IW9fAfwq5NHi01t4CV5LKiWLlhlBwcc8UFMWZp9sQ=;
 b=jWTCYr0fLsm/WtiVf7iHzi6iCsVMbjPSguMJXmjjYZe+LxHOJCr0S17w+2x3RZLmtO
 LCbAmGwpq/fSHpxyzw25LOkajZ7w+De1IQnTme9goL/2mMRe4W/MjbEK/bsYO6az/Gh4
 PbgrG7hh4tkSNJ2hPfHloXdwiuKN9N3wAHJsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722459027; x=1723063827;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1IW9fAfwq5NHi01t4CV5LKiWLlhlBwcc8UFMWZp9sQ=;
 b=ZRmGojVtPUDsvdkLJrDdTfyJOwPVX470r2WCP5D64Wi4TvrZHbv0ekt9GVd/iRQ4il
 1K7VBFGV/RR05tm+6lmhtxlfKb0NCgVBZzlCjOrilwIk9vPT07YIvu6gatgkvpeailpS
 fZOlvlJ/7CUXjHkAw7rgMcCt3BP997m0wHuQ6Yzyd55ENlkLGAAATATFrwhcSpEpY7jp
 Ct5wgBF/MEeOmPxih7e12roI31GprH+qvBefx4K6pVAOAgedailfbBpITd+slK0lAILJ
 lYjoNQjC1lzbj4f9WuCG3b4YIyTGpwGWII2NDjt9e5NfxJWsE5276EkFFpB2jcd+tDuL
 IW0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJtTzoGi+LjhXt4XpaQ+uEDu7DgwHeQ4rJX9kLCoQTA3i/5BtsLuX2Iwd4iqdoj6G/ihaMxF+A1aGOkMW7CEu9oCMOzqEYF5ptoBcMWj8W
X-Gm-Message-State: AOJu0YzDyLMHD8W6ab+rVKJHq7btZPoyNd9N+pd7BrSEm+QIY09daOsR
 iOnUJMOkU9WvKXiHqBFN+T9y1UqygSWKdqB4EF2tqdO9IstnmLQmJaUDKKt+IaA=
X-Google-Smtp-Source: AGHT+IHiZKSox2G+KBZt85yTqo1If0pNRi36MPMG5PUE38oK6EzOOZBBO76h+Oh0f6kIAO981/aiaA==
X-Received: by 2002:a05:600c:35c9:b0:425:6962:4253 with SMTP id
 5b1f17b1804b1-428b8a3da1emr2490685e9.4.1722459026790; 
 Wed, 31 Jul 2024 13:50:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282b8adc7dsm33246505e9.14.2024.07.31.13.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 13:50:26 -0700 (PDT)
Date: Wed, 31 Jul 2024 22:50:24 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH] udmabuf: use kmem_cache to alloc udmabuf folio
Message-ID: <ZqqjkCZtDP3jtD_2@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240731033449.1016195-1-link@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731033449.1016195-1-link@vivo.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Jul 31, 2024 at 11:34:49AM +0800, Huan Yang wrote:
> The current udmabuf_folio contains a list_head and the corresponding
> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
> allocate memory.
> 
> However, kmalloc is a public pool, starting from 64 bytes. This means
> that each udmabuf_folio allocation will waste 40 bytes.
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
>  drivers/dma-buf/udmabuf.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..db4de8c745ce 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>  module_param(size_limit_mb, int, 0644);
>  MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>  
> +static struct kmem_cache *udmabuf_folio_cachep;
> +
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct folio **folios;
> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
>  		unpin_folio(ubuf_folio->folio);
>  
>  		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> +		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>  	}
>  }
>  
> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
>  {
>  	struct udmabuf_folio *ubuf_folio;
>  
> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> +	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>  	if (!ubuf_folio)
>  		return -ENOMEM;
>  
> @@ -492,10 +494,20 @@ static int __init udmabuf_dev_init(void)
>  	if (ret < 0) {
>  		pr_err("Could not setup DMA mask for udmabuf device\n");
>  		misc_deregister(&udmabuf_misc);

misc_deregister() is now called twice in this error path, I think you've
forgotten to delete this line too?

Otherwise lgtm.
-Sima

> -		return ret;
> +		goto err;
> +	}
> +
> +	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
> +	if (unlikely(!udmabuf_folio_cachep)) {
> +		ret = -ENOMEM;
> +		goto err;
>  	}
>  
>  	return 0;
> +
> +err:
> +	misc_deregister(&udmabuf_misc);
> +	return ret;
>  }
>  
>  static void __exit udmabuf_dev_exit(void)
> 
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
