Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97358C31AF2
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C000810E1EC;
	Tue,  4 Nov 2025 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="NXih5Oou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADE210E1EC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:01:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso3570855e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762268479; x=1762873279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=msn47VShOfNrrQc7tuPanRu3F1JPI2dv1n+qPnPK/cg=;
 b=NXih5OouAEX2vI/ITk44WW5CTU2PLs92RlOZtWFDmMV2AmVSzO7ZF7X9SOMgyv3V7g
 IwoRyOnw6Kdau40NJtFBxkTZUrPJeBsVsWPzExflLPWz8I1qQ1yLbto44ceXtb8Erk5G
 R+MbCRLZi+n4kd/tBi5UwxSwkyZt1DDaB5XuVKAIJH+vgpPWlkrXpXg1SIGcdeoTwCVB
 Eg/vxc9RTRpNLVx7WrfsysEvRj2OMnKJXZqGJUqLdvD/UW5DyPNNNgJY4RbVn4MgU+VT
 gz9c7PNHX4QYMr+XK7J1/cz8QHJFmppriMYFcDYn1KZSNqsUwKDwTxpCWoMNo7b1B8+F
 /wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762268479; x=1762873279;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=msn47VShOfNrrQc7tuPanRu3F1JPI2dv1n+qPnPK/cg=;
 b=B0EFxxw4qT4zrzaW6F0wa5GkMIyVbekua0/MDKDE7KQDPELaUfRFdd+51t5rcxFYvM
 VnfjVkB0zZBGawBPPw/ZUsBQQWfse1XNhjo7vfPxopj282RB36f0OF/9LFduW7CMjx3+
 VM3FsyzDPtdEOq4olpxLOLjPT2MKwLjj5z0tjFioblirOW3EIsFF9tD3IKeL0V8AA30K
 xYMBresDh1QRJkY+urIOXJIroLE8UfHAbIInoJpaWBFMKNa3gp7M6BjW904X082bSLaG
 0J7MUPqUdklVLc0KcsrQg1/9eTrr6rPq3J+OOqYURXpEeItkPTKxjDTK9IWNlX2uFRoZ
 YXEw==
X-Gm-Message-State: AOJu0YxBwHFoep9DkYG5Nll7Lyy79OSbXHZaT+KpaIF9Bui9lemlVKEv
 8g113wEZ/ZCj5aYpF8MhqmXMZh9sauMgYF9ckVzx/dRCypmJIaVjS26n0D/6zDi2wU8=
X-Gm-Gg: ASbGncu6M2gloufaPDUkyk1hPWii7w1MRooclr9lPWsW+lua/ydwUsoGphbiiM4wHWW
 qC7dUamoMT5xnmhVypz88jsspi+csiUS9rsRDgyQbus3upElp+inAE1TGk567p1gl19cyP2oBj6
 jHsdmmzdA8t1yJMvYgPTqXMVgjvvWI4+32VdyY3nkPeIOq7h1dX7ou+Jy0kQVntMZBUarWokc4l
 lHRM2x+7glPyQF5p6BTEpaRxCKnE4VadIKbQHscIClEVdxQV0Elc0kTshv+gxsonhNyYU04ZjjK
 uNkqNMgwzYFNa7TrHbRI2WMLisMy2eSdmqlQ8N7DrTyXfjbFVcb+bA/x/ywdIT0VLB+yCKe3CbO
 x0Yp6+GWFWI3AQ+Fx4l6+NEr+mzl89b4Uwaff6IgfkpXIpOt5FIKJGydt4tAbXliQoRf5/a+vmE
 pBs0ID2viM6r7pNEIJ
X-Google-Smtp-Source: AGHT+IEwZIonxVU2yBR7raiieFHieCXZ1iH+yDLJH0Y+BNGU4B6hJjyDG2QrCG9C/l3wPcNA4ac70A==
X-Received: by 2002:a05:600c:8706:b0:45f:2922:2aef with SMTP id
 5b1f17b1804b1-477308b0a8bmr191236885e9.28.1762268478926; 
 Tue, 04 Nov 2025 07:01:18 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558b88f2sm19500475e9.2.2025.11.04.07.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:01:18 -0800 (PST)
Message-ID: <c9b23fae-cb89-48cb-b9e2-35804bdc7701@ursulin.net>
Date: Tue, 4 Nov 2025 15:01:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] dma-buf: rework stub fence initialisation v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-3-christian.koenig@amd.com>
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


On 31/10/2025 13:16, Christian König wrote:
> Instead of doing this on the first call of the function just initialize
> the stub fence during kernel load.
> 
> This has the clear advantage of lower overhead and also doesn't rely on
> the ops to not be NULL any more.
> 
> v2: use correct signal function
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index cfa6ddcc1278..b229d96f551c 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   	.get_timeline_name = dma_fence_stub_get_name,
>   };
>   
> +static int __init dma_fence_init_stub(void)
> +{
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> +		       &dma_fence_stub_lock, 0, 0);
> +
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +		&dma_fence_stub.flags);
> +
> +	dma_fence_signal(&dma_fence_stub);
> +	return 0;
> +}
> +subsys_initcall(dma_fence_init_stub);
> +
>   /**
>    * dma_fence_get_stub - return a signaled fence
>    *
> - * Return a stub fence which is already signaled. The fence's
> - * timestamp corresponds to the first time after boot this
> - * function is called.
> + * Return a stub fence which is already signaled. The fence's timestamp
> + * corresponds to the initialisation time of the linux kernel.
>    */
>   struct dma_fence *dma_fence_get_stub(void)
>   {
> -	spin_lock(&dma_fence_stub_lock);
> -	if (!dma_fence_stub.ops) {
> -		dma_fence_init(&dma_fence_stub,
> -			       &dma_fence_stub_ops,
> -			       &dma_fence_stub_lock,
> -			       0, 0);
> -
> -		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -			&dma_fence_stub.flags);
> -
> -		dma_fence_signal_locked(&dma_fence_stub);
> -	}
> -	spin_unlock(&dma_fence_stub_lock);
> -
>   	return dma_fence_get(&dma_fence_stub);

Actually could you check if this could be demoted to static inline? It 
strikes me pointless to export a symbol for such a trivial wrapper.

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);

