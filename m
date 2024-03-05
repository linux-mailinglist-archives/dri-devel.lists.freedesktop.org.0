Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA08724E9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E05112C05;
	Tue,  5 Mar 2024 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KAT0mdQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4894410E573
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709657701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2z9lZCL9Z3rimHOG8O2ywzmChw7nkWjJ7ypccwQP5g=;
 b=KAT0mdQcwWzyfROxFekwASXIz4LS5E7te3iVnzr9ZVG6712BMGUYUm5shWakPbTPQyelDK
 u6KV/uqeaLslUB77kVfda+wcpI+C0wFOIa/RYIXYkNr//xVZXt7f7Gm9CYo9jx+QYiBTqs
 G3ouL4llISdhiWtpiCCYZdfTDYutufg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-owSwCaC7N3GzZJHs1bO8bQ-1; Tue, 05 Mar 2024 11:54:59 -0500
X-MC-Unique: owSwCaC7N3GzZJHs1bO8bQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78825e5e374so468114385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 08:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709657699; x=1710262499;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q2z9lZCL9Z3rimHOG8O2ywzmChw7nkWjJ7ypccwQP5g=;
 b=Xk+p8Cu02mapfGzkSWly3POsh+gr8OZiO49EbA0ls281i6AyigiKluRejd49a8nMCT
 D9Vjpf3TPOuH90/35qiAzYlY/1rKM1QVFOPCbY5Asmah9tXLiJxYKE7e564waw9S8aLu
 It/XzvZRc5Dj6KA0fz0+FH/JUHcCSp0kKLEMYeJINS3wn2IBPd+glBWkosw9Cyy4l8PX
 B0y1GZcwfbTffl0kjEfqbnxmwYSeItut/9hT160xzhv+He4NAoqwtFD8ba0vbVXhI0gd
 44zIegjjCGnT2LG13trwZtMaCDx2LtaJhxk2/TOMeMXZyWnUhIWhUCFOlKDHwy0oJZ+W
 cHHw==
X-Gm-Message-State: AOJu0YwrkhFqi8yYgBAMJdtYhF8JsMpZGa/U77KC6cvlGBNKRfKVS6BU
 XoKcmk00q7CLKOgFDMfKmjTPxpefO4keNCY/kEmIFRpRgK1sOh2CJoxxYhT+T1jTzxBM41UVBn5
 pgNbuZvAD1mvQVGgwE9mrZaL4Mw695NAQD0dcMd+PsvdYr5l5vsQwGYwpuO5L31ZhPQ==
X-Received: by 2002:a05:620a:1482:b0:788:322f:e8ab with SMTP id
 w2-20020a05620a148200b00788322fe8abmr3727314qkj.2.1709657699559; 
 Tue, 05 Mar 2024 08:54:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExv3MZheDgrjYzjAL3lBjTHXd+iKVpZeMtwriKBSS2qghKHcd7atNz/pH30IdbdmikOhTY+A==
X-Received: by 2002:a05:620a:1482:b0:788:322f:e8ab with SMTP id
 w2-20020a05620a148200b00788322fe8abmr3727284qkj.2.1709657699281; 
 Tue, 05 Mar 2024 08:54:59 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 p14-20020ae9f30e000000b0078825e2c57dsm2507620qkg.76.2024.03.05.08.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 08:54:58 -0800 (PST)
Message-ID: <93c832af-55df-4149-b9d1-1171528809c2@redhat.com>
Date: Tue, 5 Mar 2024 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nouveau/dmem: handle kcalloc() allocation failure
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, lyude@redhat.com, kherbst@redhat.com,
 timur@kernel.org, jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org
References: <20240305143936.25283-1-duoming@zju.edu.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240305143936.25283-1-duoming@zju.edu.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Duoming,

thanks for sending a V2.

On 3/5/24 15:39, Duoming Zhou wrote:
> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
> the physical memory has run out. As a result, if we dereference
> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
> will happen.
> 
> Moreover, the GPU is going away. If the kcalloc() fails, we could not
> evict all pages mapping a chunk. So this patch adds a __GFP_NOFAIL
> flag in kcalloc().
> 
> Fixes: 249881232e14 ("nouveau/dmem: evict device private memory during release")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v2:
>    - Allocate with __GFP_NOFAIL.
> 
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e7..f5ae9724ee2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -378,9 +378,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	dma_addr_t *dma_addrs;
>   	struct nouveau_fence *fence;
>   
> -	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> -	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> -	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);

I think we should also switch to kvcalloc(), AFAICS we don't need 
physically contiguous memory.

Sorry I did not mention that in V1 already.

- Danilo

>   
>   	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
>   			npages);

