Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72F552BA6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5082210F00B;
	Tue, 21 Jun 2022 07:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31B10E077;
 Tue, 21 Jun 2022 07:19:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cf14so8320743edb.8;
 Tue, 21 Jun 2022 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vUa/+0360889XNMZ8LlW5kuG26dnpqfJwGYvdJBavqs=;
 b=cMuB5ojyHH8kx1cLSXnl4ewOn1xk1mZKayMkfKw7+xHFrVNL+5J0wJogaK8nOpiRDe
 7WyiUFuQJT9nNWDUzf9bjsEzTm5YGtwO7zZ4NWYg0SG61Tz3cSlT7PZwwKs6QdJvzmUn
 IE0gD20JLrhW5/OPIZ/J56nPum34536kwQN07kHHzrf9H5zdRhbY3tGlxyd2s9L6zajA
 QK4IhCG28tnVpuxECkwf+x9HnuKoaSSBt1FkCA7wA024uFUdAqac+/cPekL0NEhUNhAa
 MERRESMUolbDbi53yWr9HpDoAYoXCNiB4JFiUC8Kqjz7081wuUT2NSCkw/uFEGO+z47+
 e8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vUa/+0360889XNMZ8LlW5kuG26dnpqfJwGYvdJBavqs=;
 b=z0DQodwi9v6n9699i9FXKYOfai+InjDkiRHkR4y+EiQyLrIm2daB4kPvdUMgfYwbvg
 LJrAcMVGujeQ8r2Lza6o6XYAcswApKK5GcebTO/87xhOHvkS2FElipgGJxPOSVd/Q+kx
 tkWpb2y6iEP0E+wyxHCNY3tZ1lDJ8m1pCfJPLW5pPQ9lG97UCJpI4huZQ84Mja0bcB1E
 oUJVJVAWc/e/Hz5oQ22NXIhUYIVHuJZgrIYY46YU1O6DS8p27hO9n0BU83Maj77fsrCr
 yyx3dEBZiTtspES5SYNuW1VThzg8ZGJOVC1e3VA96lAvvbWcZ2IY04eQKFT/wC/i+tvX
 bYVQ==
X-Gm-Message-State: AJIora80fVEwE+NsFsMo64pq63k3u6XTfxYAxO4lELsxKHFyUmm9uN6H
 q+MtQz8B8Ecj92xtrWGa5w8oGglbSxM=
X-Google-Smtp-Source: AGRyM1vqhAL1nzlQW4ayUY9i9bTRHPjx4r/Zw6P7qwKJgKSqansnIr9Cdr3Xafewhel/DCcTPnbS3w==
X-Received: by 2002:a05:6402:358b:b0:435:828a:a403 with SMTP id
 y11-20020a056402358b00b00435828aa403mr9352379edc.117.1655795961606; 
 Tue, 21 Jun 2022 00:19:21 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 ku22-20020a170907789600b006f3ef214dd2sm6985163ejc.56.2022.06.21.00.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:19:21 -0700 (PDT)
Message-ID: <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
Date: Tue, 21 Jun 2022 09:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220620220302.86389-2-andrey.grodzovsky@amd.com>
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
> Problem:
> In amdgpu_job_submit_direct - The refcount should drop by 2
> but it drops only by 1.
>
> amdgpu_ib_sched->emit -> refcount 1 from first fence init
> dma_fence_get -> refcount 2
> dme_fence_put -> refcount 1
>
> Fix:
> Add put for external_hw_fence in amdgpu_job_free/free_cb

Well what is the external_hw_fence good for in this construct?

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 10aa073600d4..58568fdde2d0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>       /* only put the hw fence if has embedded fence */
>   	if (job->hw_fence.ops != NULL)
>   		dma_fence_put(&job->hw_fence);
> -	else
> +	else {

When one side of the if uses {} the other side should use {} as well, 
e.g. use } else { here.

Christian.

> +		dma_fence_put(job->external_hw_fence);
>   		kfree(job);
> +	}
>   }
>   
>   void amdgpu_job_free(struct amdgpu_job *job)
> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>   	/* only put the hw fence if has embedded fence */
>   	if (job->hw_fence.ops != NULL)
>   		dma_fence_put(&job->hw_fence);
> -	else
> +	else {
> +		dma_fence_put(job->external_hw_fence);
>   		kfree(job);
> +	}
>   }
>   
>   int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,

