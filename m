Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945CD80443C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B710E0EC;
	Tue,  5 Dec 2023 01:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96DB10E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701740796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbno49Ozn83opUUQC9lXKEmHbpgCw1zH1ujjqmy6cLA=;
 b=gqsbme/c6yZJBjW4CuAZvrdbFE5bAyB2y9QCTJZVN1PA+cqoL/hcO4DVjqRf4LByiKNvyI
 j1zkzH6n1ADXk2AU2DWCd8RQnwDHyDk0g8ZGOyqViZDcT1VnA4/QCVCQy8s3ko+9AjWAnK
 LkYcTTS/L0CKV6O/uzl1xkcGDxgY7nw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-b2HMUy9bPKG_ed7WEs7Dqg-1; Mon, 04 Dec 2023 20:46:34 -0500
X-MC-Unique: b2HMUy9bPKG_ed7WEs7Dqg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a1b760ce3e3so79758066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 17:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701740793; x=1702345593;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbno49Ozn83opUUQC9lXKEmHbpgCw1zH1ujjqmy6cLA=;
 b=eky9vNZ6aUVNrO1RutesK2pkjWSrr9uBifDD/yIm51nXY9Ixg4QnzHFlRfk7Gb6vf8
 AXhiTxor7RCWbQJU87K4kakrtwXcczwQnQcjN8dseRe8O87c6FRWp8yfbcFRKr1mRWRK
 aUvlXb19CzKtLZDW6OyjSNiRv3dViRkYNIOzFJEblidvyymTH+62ZGYul7ZlokTBEMy/
 qkBkaL6OWEUodal5WJHuGBasOTk1ddQzYcS015jFmhgTrySoR9d6P6JGiyUYxx7zW8yv
 Ce2XOlrTZaSfKIy0R5qm1rgEdmVAZCPhONbDI7p7JYKHCdMVniV7VWCYk1Wk/5R2DB9r
 EtEw==
X-Gm-Message-State: AOJu0YyY7wlu09HIvUT7i4X0rM9dg35vm2mOwgXvgIYIh1bX8qrbXAkc
 TYqkxLXKQ0H+w4hC4TV5/Kiq14WxGmSgYz7KhhTO50iVS957CEXcr1A0VfJ8NMZSXkWvahwhyTY
 FmZy6OLI7xbFUDZABUVOFynEFTBvg
X-Received: by 2002:a17:906:eb57:b0:9ff:64d2:6b28 with SMTP id
 mc23-20020a170906eb5700b009ff64d26b28mr3981936ejb.55.1701740793838; 
 Mon, 04 Dec 2023 17:46:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNOWFT7a0PKTZARt0Ec7LZEoSAGatvl0989FyAQELEQt8AyIWihxFycGupAhqa3RABdqYrZw==
X-Received: by 2002:a17:906:eb57:b0:9ff:64d2:6b28 with SMTP id
 mc23-20020a170906eb5700b009ff64d26b28mr3981929ejb.55.1701740793584; 
 Mon, 04 Dec 2023 17:46:33 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 hj4-20020a170906874400b009a193a5acffsm828222ejb.121.2023.12.04.17.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 17:46:33 -0800 (PST)
Message-ID: <a5d208d1-4215-4432-ace7-e13eee0f7851@redhat.com>
Date: Tue, 5 Dec 2023 02:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo
 object is destroyed
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231204151406.1977285-1-boris.brezillon@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231204151406.1977285-1-boris.brezillon@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/4/23 16:14, Boris Brezillon wrote:
> Some users need to release resources attached to the vm_bo object when
> it's destroyed. In Panthor's case, we need to release the pin ref so
> BO pages can be returned to the system when all GPU mappings are gone.
> 
> This could be done through a custom drm_gpuvm::vm_bo_free() hook, but
> this has all sort of locking implications that would force us to expose
> a drm_gem_shmem_unpin_locked() helper, not to mention the fact that
> having a ::vm_bo_free() implementation without a ::vm_bo_alloc() one
> seems odd. So let's keep things simple, and extend drm_gpuvm_bo_put()
> to report when the object is destroyed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/drm_gpuvm.c | 8 ++++++--
>   include/drm/drm_gpuvm.h     | 2 +-
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 54f5e8851de5..ae13e2d63637 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1502,14 +1502,18 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>    * hold the dma-resv or driver specific GEM gpuva lock.
>    *
>    * This function may only be called from non-atomic context.
> + *
> + * Returns: true if vm_bo was destroyed, false otherwise.
>    */
> -void
> +bool
>   drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>   {
>   	might_sleep();
>   
>   	if (vm_bo)
> -		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> +		return !!kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> +
> +	return false;
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
>   
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index f94fec9a8517..7cc41a7d86d5 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -738,7 +738,7 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
>   	return vm_bo;
>   }
>   
> -void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
> +bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
>   
>   struct drm_gpuvm_bo *
>   drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,

