Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1E7FA0F7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33710E29A;
	Mon, 27 Nov 2023 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9A10E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:24:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so29263705e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701091464; x=1701696264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FH0s3pNKOJxZQ6z+iEoKI4AAtRx5ZhF+IIxrjC4hS7Y=;
 b=Vmg/Y8oPkF5fvYyLfGDe74IIzFQVJSw5jyD4h2G0FZsr9zydtyV8FsWHt21oysfWea
 AqFvUdkKABXlAR7RDq7kl3D0dzOoMh21WfX6347Me17i9fmwiAK0lTkXWblHbVu1NObN
 ksN3im1xWvs9RDZfzKInMuNOb5Tdp4HTh4I8oeLwQnw7hC3tMjDa0Q5q8gmkIhR6ahOP
 vtio4qt4daL1TgFeZjq4Ao3/RAE+0viw838oTHxrFNquVFxI6nRZnrI95E2nwMWCpBrZ
 jCBfoiFMgPmCkpw8/4IKoe05Ds0NyGb9/wVix5PWprbJJzs0wG7uU3zoYEg9xJEQF4Ip
 O3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701091464; x=1701696264;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FH0s3pNKOJxZQ6z+iEoKI4AAtRx5ZhF+IIxrjC4hS7Y=;
 b=co3kWPbbMMa5LclEV44qUeBKfCXJBK4dVWcDC9RftlfK8j5jw2QIZtFH1wikpQLhn0
 25Rua9i0Y9oYyDuggRwYYEGLlMlvYGHY677dH5HG5O19+7axy7Nup1JG1c+evKWsIdp+
 CN1bkox0JLufqTRsnAiCig9Nk/Ct/K6dWi1tMBO232BXN5EYTUu+woWYXmI1N574cLX+
 uH7VLsr32w//FCHCzURElf88+H5vHj630qtbdAsug3znMTqmb5zseaszp6aPsYR9nrgB
 I5jrKRXPYbXAsHJBK4Ow1pEAvPf+nFAWYicMuoFaV2PPRmImgLyg/+RH5t0M6IbVGCrg
 JUow==
X-Gm-Message-State: AOJu0YwlFOEAmOnx6DZ0pW1PI6Ce+8ad7d1TqrK6fH88ufBs5Bekfurk
 eyfgRCXkIQkMnYJ9tgNgwdI=
X-Google-Smtp-Source: AGHT+IEkgZi6dHQenViMLORQ+BGP+Cu5JcNbxI8Ky4tY3ox+8USr6NjXaEho/GBtYPZe71+Kc5fs3g==
X-Received: by 2002:a05:600c:3106:b0:40b:3df2:c5f8 with SMTP id
 g6-20020a05600c310600b0040b3df2c5f8mr5896949wmo.36.1701091463940; 
 Mon, 27 Nov 2023 05:24:23 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a5d5959000000b00332eb96cb73sm8652933wri.73.2023.11.27.05.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 05:24:19 -0800 (PST)
Message-ID: <e35e67dd-fd96-4ac5-a6ba-f351f12a146c@gmail.com>
Date: Mon, 27 Nov 2023 14:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix check in dma_resv_add_fence
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <Alexander.Deucher@amd.com>
References: <20231115093035.1889-1-christian.koenig@amd.com>
In-Reply-To: <20231115093035.1889-1-christian.koenig@amd.com>
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

Ping? Can I get an rb or acked-by for that?

Thanks,
Christian.

Am 15.11.23 um 10:30 schrieb Christian König:
> It's valid to add the same fence multiple times to a dma-resv object and
> we shouldn't need one extra slot for each.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: a3f7c10a269d5 ("dma-buf/dma-resv: check if the new fence is really later")
> Cc: stable@vger.kernel.org # v5.19+
> ---
>   drivers/dma-buf/dma-resv.c |  2 +-
>   include/linux/dma-fence.h  | 15 +++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 38b4110378de..eb8b733065b2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -301,7 +301,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>   
>   		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
>   		if ((old->context == fence->context && old_usage >= usage &&
> -		     dma_fence_is_later(fence, old)) ||
> +		     dma_fence_is_later_or_same(fence, old)) ||
>   		    dma_fence_is_signaled(old)) {
>   			dma_resv_list_set(fobj, i, fence, usage);
>   			dma_fence_put(old);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index ebe78bd3d121..b3772edca2e6 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -498,6 +498,21 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
>   	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
>   }
>   
> +/**
> + * dma_fence_is_later_or_same - return true if f1 is later or same as f2
> + * @f1: the first fence from the same context
> + * @f2: the second fence from the same context
> + *
> + * Returns true if f1 is chronologically later than f2 or the same fence. Both
> + * fences must be from the same context, since a seqno is not re-used across
> + * contexts.
> + */
> +static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
> +					      struct dma_fence *f2)
> +{
> +	return f1 == f2 || dma_fence_is_later(f1, f2);
> +}
> +
>   /**
>    * dma_fence_later - return the chronologically later fence
>    * @f1:	the first fence from the same context

