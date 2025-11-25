Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9BC8525C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4856310E405;
	Tue, 25 Nov 2025 13:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="k/pXfk/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41B10E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:20:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso42895775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1764076807; x=1764681607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aprKDYKlrTiFqlYRX/ECW07g4Q7VGo6Tvic7fnoqVWQ=;
 b=k/pXfk/2qMUxur1kLPsBWI5GFqANSpHFZBse/XaZID1J/Vrbo+GviYP3aaITE+1qsH
 cacg90exGk8QasySKHVJsbFP5bujmKZUmvvgEEegKFnnqnj77OZwHNIqXPdDxINIHY8/
 AI8PWam6AdzBd1EyhEnSKak48ofpWn8xNSzaS/TRHI2R7h1uCdrEdVmvDTB0eTRuNFep
 SwxmgGN1ceYQDchCcQBt9kNFKjnmai4ZDPD3/9g8wfzwxhLlAo0yI4l50e3MV9FqmKXh
 EDN04I3bF33HwDHNc8eRmGyfa70AiHyNRQUOcheINqJ/A1NqACepkpwrWsYVtDzhmmbA
 TRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764076807; x=1764681607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aprKDYKlrTiFqlYRX/ECW07g4Q7VGo6Tvic7fnoqVWQ=;
 b=EM95NgPezjgJhEMzx2QWFe6tLyguUMD+NWVYAHdtGgYCIsBbhOJCcQKnNfsdMIUAso
 Q5BokqH+PNA1x6fqcWJSwAwAxmKuSZHdlhqNHE1C32sJ6uw0JQh+5szMt/ZlM2CZKl8U
 T/3734SMsXJTe2ytpzGSbm+NsZBtBMij++NTDDMWrSPWkjihIRXmi5iP1CeoCH2WIa5i
 KvMWTxGQ1r/CIN83qRikUhSERlKmdOGnCzpaOauZWneF2fcXIXkkgiG6ydYkf3PJMm4S
 JdIGAg8XcETe4ZC4aaoCyR8a7GUMVlh1eDltkRpR0AnMk4AmKfjNWTi24ylcHZ6lbARI
 a2rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGkZTh1ipHSmQWmWTwl+vFANExb9pIock9wIxVkOeKvw/fqXiujv3hhUPa95lWYxkT+1wGpR6q5nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziJwO6HUEQyH5S2iurBNn0myJRTZq0PyVdC9Mdv/DM/Tdwc4kL
 x3QH0g1GmOD0e3Ap22qTuAk0EnDVdNwD8f6CXddJgtj72U0aL9O44O/YbJCKwoLWg0w=
X-Gm-Gg: ASbGncv3L4ZgZkIQaUEV7g3QkU5OjTlw4IS/WJaCqYNtuW5tpaf+eOPxtCh3AlVaySK
 oe39cN9Hm5kzkP/T9n2a+1E9oDG4CFFAokrECMyPJ3c8miIXlIlM6jmcZAESnrd/Pz87TWYrnli
 wSjc4ITACVQkC/xQIQPOhCgX94MPHhCwSh4XjNGy+HuQlMx2mD4mIabypcGo6fmtG1JGzVR8Nho
 qiMtTBY5+xHcpgWqfygHm/XmonAI9TUgrgCptdcvmD8IUFv1770jkfAMf04r7Rci6OccS9wb/V9
 EbrIryTtxH+mNw7zCsz1s98U0uoHcTYf13m3RJoTS/zjmZAhRPnhiSlab28QFrFuh6vFRuhNHPs
 E87NVtjxajOzMYt19LgQP83LT/P6zkOaT57eY7kAmtrnYbYoxPOz6pZvauysIgVE933Pc5eWYmH
 TLn+KrteV1owRAW0VTnlhiLn7mY1dSsruv
X-Google-Smtp-Source: AGHT+IHQEznJBdhJdN1tPju1HTTqm2y8/XXE3XsJpkME6k/iECmmqiOWumbCD4N2hJu6XfqgUDRWEA==
X-Received: by 2002:a05:600c:c0c3:20b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-477b9ee4fdbmr151348115e9.11.1764076807041; 
 Tue, 25 Nov 2025 05:20:07 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf198a67sm264938725e9.0.2025.11.25.05.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 05:20:06 -0800 (PST)
Message-ID: <44d30056-612f-4563-ad9f-92696c5a803a@ursulin.net>
Date: Tue, 25 Nov 2025 13:20:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled
 fences
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251125104443.82974-2-phasta@kernel.org>
 <20251125104443.82974-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251125104443.82974-3-phasta@kernel.org>
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


On 25/11/2025 10:44, Philipp Stanner wrote:
> Almost all users of dma_fence_signal() ignore the return code which
> would indicate that the fence was already signaled. The same return code
> by dma_fence_add_callback() cannot be ignored, however, because it's
> needed to detect races.
> 
> For an already signaled fence, dma_fence_signal() returns -EINVAL,
> whereas dma_fence_add_callback() returns -ENOENT.
> 
> Unify the error codes by having dma_fence_signal() return -ENOENT, too.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3a48896ded62..09d97624e647 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   	lockdep_assert_held(fence->lock);
>   
>   	if (unlikely(__dma_fence_is_signaled(fence)))
> -		return -EINVAL;
> +		return -ENOENT;
>   
>   	/* Stash the cb_list before replacing it with the timestamp */
>   	list_replace(&fence->cb_list, &cb_list);

Story checks out AFAICT - only two callers fetch the error, xe and kfd, 
and neither does anything with it. So I'd say it makes sense to unify 
the errno.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

P.S. Just not sure of the 1/2 on which this one ends depending on. I 
*think* I suggested the helper in the context of some discussion long 
long time ago but what it was? And what about all the drivers which look 
at the signaled bit directly?
