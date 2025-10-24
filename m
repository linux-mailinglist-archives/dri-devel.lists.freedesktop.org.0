Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D895EC04B81
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B0710E9ED;
	Fri, 24 Oct 2025 07:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="2bQQ8qkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B01010E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:29:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso1119608f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761290992; x=1761895792;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aF/u/q9kbdo6CwcaSzIK0ty5c6Xv+ybqJNfYM8rphuY=;
 b=2bQQ8qkVbJ8IgFHVjYBTNh8aY5V+F5Qxpj/E3k6q1NhOqiojTePwP4tnn0q1RmxqIK
 ubqq5EX7HkapNcBaMNTmBDkaR1El4Fbssbchlasu6Gu/v3T5Vm4UMZYEG6JMn9wwA1iw
 MUUN6ub+8Fz07a//wBW+sUpBTz7XPFuWK1S6aadsf67aK/BNb74OsYJnjQKn/ufEDw9A
 aujHXMvQg4HlYbjL8PAf8KcfjBO0f4l4DphxiA64oGOEM0pTiAfazbQow3Svn8SQvjZA
 iJdWFHsnnDsx4GG8RoMxAlwr7L6chG+c1xBCEdbHD6FvsL6qNPfAgdQNlR6NiFlDppaX
 2v3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761290992; x=1761895792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aF/u/q9kbdo6CwcaSzIK0ty5c6Xv+ybqJNfYM8rphuY=;
 b=Nr/qp8Ph0F8ucwC1RNjcePTlSmlFsGXdanTSQd6k+Hq3NZlRNtkMDGUVvqwb10vWXH
 QrkYE18ZPs5+LLlNLNlt5um7mNiePi4XG9ji3XNe29B6RyIQKYMg2PBkI6sJGRCvHMsL
 okIN2YdagFgzgX3Dn8mxeRas2mBRyAEFIx5ypVTvGqTqIme9LGNmAc8QzEWNTs2SX2LL
 jBbq5MGSXIfAckZ1SwmeeCXZRdwirS7AtyOBMiZK3EzDBh+NOhFV90bFrh8ZdaHcl+h4
 p3f5ua/DpTwoqwQf/LNFtPRkCmJCi0XwzbPkosQ4JXMhR2BlxhxMObPbZceGvrgNnsmQ
 kx7w==
X-Gm-Message-State: AOJu0YwzqKAy5l99HfSs83pgb2zRRHtt56M0DwsK8v+qasXxpuUBQp3i
 vWjUaAwgv4O/juMqgej8g+ahztflT5bBnP8mv7QUUp0SmF8gxdEHth5JdmpG6pzIxE8=
X-Gm-Gg: ASbGncs9gA9jalrHqdqcC/FeexENF37WuAlRjnrtLUUexzUevcfM3qD3+yjaR4kiIpR
 h/inlLFr5j+CZL0KJ0Q1bl7eEHPmobYaDGqT5SBzXLINrkKy8bghoJEtj0jacn+NBcE0+Zg7usa
 FulMnafMVV15XQ7pwSJXx80WBhWXp3hnk5OCihXozsJvt+CiVJ0gw2m5LiW8AaGxDrrYF/RwuHN
 b7UQje/JBPgaiEeDzVbXatN45DIYjkT8b5EdfsS0yBJJhogDAFcDdcWNdgQaSxDGDtlpXLPfsaj
 T4kJQXPOmefbz+Dp2WPzaUFt57rSkCiWD7WbsarkCrqNGm4O7o8tQ10fZ2A/GQ32E9N7kcoY/6Q
 McLtqlspqOxgHFXhj3kHOqN2YqjjkyokkY46QWS8jLCpBPlaX/J+gkV4XhR/+iUpHmtpVIvDwxk
 B3BDHlrlpA9oBX56aGf+G7QT7A0g==
X-Google-Smtp-Source: AGHT+IEu1zD0i6VYfaEoWTqQsLYOKir+KR+V+WwdpuYMDYKL6mx+z6MRmKD/LjQoCrHs35cjDrcY9g==
X-Received: by 2002:a05:6000:2486:b0:425:7c1b:9344 with SMTP id
 ffacd0b85a97d-429907091femr1119587f8f.15.1761290991721; 
 Fri, 24 Oct 2025 00:29:51 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898adf78sm8327823f8f.32.2025.10.24.00.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:29:51 -0700 (PDT)
Message-ID: <67c24e3c-299d-44aa-af7b-7d45b7e3b391@ursulin.net>
Date: Fri, 24 Oct 2025 08:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dma-buf: rework stub fence initialisation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-3-christian.koenig@amd.com>
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


On 13/10/2025 14:48, Christian König wrote:
> Instead of doing this on the first call of the function just initialize
> the stub fence during kernel load.
> 
> This has the clear advantage of lower overhead and also doesn't rely on
> the ops to not be NULL any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0539c73ed57..51ee13d005bc 100644
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
> +	dma_fence_signal_locked(&dma_fence_stub);

Kernel test robot reports lockdep_assert_held(fence->lock) inside here. 
Probably just copy and paste error, at least I don't see a reason why 
dma_fence_signal couldn't be called.

Regards,

Tvrtko

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
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);

