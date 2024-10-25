Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023D9AFD6C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4710EA46;
	Fri, 25 Oct 2024 08:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="kGO3ETzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302C610EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:59:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so1205843f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1729846769; x=1730451569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j+vub8DEsJHEh2sL2JcVp3kQnAvq4yLrqztD79s8mVw=;
 b=kGO3ETzYT2OcpCc6t9Ya6PYWWxUQN8Nl1rGtPa+fcKCbGPG302ppP2oKMhZo7zBjQv
 nhVkBGOZtqGZgIbaT10Cf9nrzg3KVntjKEpQVmAkfadNDtmNp3uWx2RD9/B93fwi30D2
 /Lp/he0XVKXAK0IQbHT6n0ySBS31WZnD2t12KwRjrE8q2lfkGrRxOF3Pw6DfGuvPgh8g
 hClvlOerS3J0M9LAOSDUt+DFht33Evj2T8FeIJdYGTSwBfYDs8j7J7A28vsxb3eH8wLO
 imEozCIgr3PgXlQTxzGzHoj+gwmotgKa0VpM3bsh/jMLK2quBkpGAq85FXb9GhZgTM2a
 1d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729846769; x=1730451569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+vub8DEsJHEh2sL2JcVp3kQnAvq4yLrqztD79s8mVw=;
 b=CcZRsfT/Jfgpc8Ma6mX/gintVLvFGc6fMAOEGKPwXspa7ke6SP2iQWNZlNq/1dIVrd
 c421W67CEbjhDFts27LW4sfbT5TkgpEBkMrdIgYGv0tvumSSSVZYINIwpwCCNN2wTkBk
 GulxxSxxIGOUMCHASuZDfR5wVKETZP75gjJ8j3qJpodd8oq6lmvyJAw/o+E2rVkASIlp
 vJ+O43Uh4IA1KJ6VuyMCBgiVq4yj0FLff/mxE8XsNsIE3Uy9OYcv5aQHb+aS1+0HGaz1
 suZwwTwHwlCV9WW1AwpvmMrrHPABwfTMYzJzNQr85ySx+PFNndec4j7lrO6EoW81Ekgp
 I7rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNd827UrBfTfW13ZDrw3uP3PAw5012C8Ex78e7dXa88kkFwG/EDDx8Jffd8Nz7DWpr9Zgvtl276ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3KyjqFTVc60HgzsIo3K1TVN2U8zuCvX0/JXa9BNiusH6Nop4O
 qi4UpzoUeusoiX0HCzoYAhIYU+1dHZ++opaMgDBei8CE1NcFQGhWAzJXeL+mKD0=
X-Google-Smtp-Source: AGHT+IHbXZsR/OXFr8glBMLCe8MNtBA2IUyahWn/Pderk0Aa1yBbmUqPLcYCBv6op8kG0w1MAFwcGQ==
X-Received: by 2002:a5d:4142:0:b0:37d:45c3:3459 with SMTP id
 ffacd0b85a97d-38045868631mr3385520f8f.21.1729846769101; 
 Fri, 25 Oct 2024 01:59:29 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b46bffsm980247f8f.46.2024.10.25.01.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 01:59:28 -0700 (PDT)
Message-ID: <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
Date: Fri, 25 Oct 2024 09:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241024124159.4519-2-christian.koenig@amd.com>
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


On 24/10/2024 13:41, Christian König wrote:
> Reports indicates that some userspace applications try to merge more than
> 80k of fences into a single dma_fence_array leading to a warning from
> kzalloc() that the requested size becomes to big.
> 
> While that is clearly an userspace bug we should probably handle that case
> gracefully in the kernel.
> 
> So we can either reject requests to merge more than a reasonable amount of
> fences (64k maybe?) or we can start to use kvzalloc() instead of kzalloc().
> This patch here does the later.

Rejecting would potentially be safer, otherwise there is a path for 
userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) and 
spam dmesg at will.

Question is what limit to set...

Regards,

Tvrtko

> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..46ac42bcfac0 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fence *fence)
>   	for (i = 0; i < array->num_fences; ++i)
>   		dma_fence_put(array->fences[i]);
>   
> -	kfree(array->fences);
> -	dma_fence_free(fence);
> +	kvfree(array->fences);
> +	kvfree_rcu(fence, rcu);
>   }
>   
>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>   {
>   	struct dma_fence_array *array;
>   
> -	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> +	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
>   }
>   EXPORT_SYMBOL(dma_fence_array_alloc);
>   
