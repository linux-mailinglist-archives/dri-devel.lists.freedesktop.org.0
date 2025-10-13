Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F5BD2F2F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6816E10E233;
	Mon, 13 Oct 2025 12:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="roVeR1Tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF210E233
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:21:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso30245485e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760358087; x=1760962887;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ABCeOI0Ueeiv4CUdV7HP2uy/+8hpV76uJWq4TqSIBQ=;
 b=roVeR1Tl/zjpBrLCC9rrfdgXalQW+VBPMhHOWowTgH6ijPGr7ZYDFQ6eKyuu26720q
 5toaS3y6EQbhf1qT2YOVc8sLfSDYpOuyVhzjjV/8lGhq/wKckDY6XmII/x9/Cs+h5U5n
 xoykv4C1/RE07vB9VCc7+uE0uCx4UaYS3oyg/nKT2/UWyw1Bd7/HVb8hsT5coUWEkoBh
 vq6pEmwZVMkyZeaRMCVdvUw8OMk+9MHAVoJEVOUZBmHT4ivA6fSdJSPVRu3l5T+Tg0Y8
 D2SskpFWN/fGuHCMWURR1Pb0BOH2HOrsRc7AIz/fb974TSobW9NTW9O+fZ+3Kr4KtxgN
 QrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358087; x=1760962887;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ABCeOI0Ueeiv4CUdV7HP2uy/+8hpV76uJWq4TqSIBQ=;
 b=BJJYIZypUJuQ3aYnYJPXSj86tiqDxjqRnuVveYt/6cRYEevEuB4hFR7Xaf+acIKYgC
 kU4WijcxZUM0meBCeTI6Nb/bWFuCFHL8lpuJFPk1Klqd7FBjC08ZOHBV0uyRHD89EUP6
 /1To4nEFaRttuJ2Em/sK56J5meCR8WXaYyEeh4C41kpqRLnpXSdNu2B8NYvMIYIyuC/s
 VrCCHTspcwc+1Dn/2vfEf4mpq1mD4BtZVefJYDjITOpwKSz2ojmvBt47OIn9fJVuqRrG
 iGvaxjEb0OjplDKsuZnKLSivqpvDqiDUo25TC98XGnhldOJt3q/xbuzRrTVLShZcdOOf
 AWJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE3f7khOBjc8qTg0/pFNYWEaVp/9bsW+fbb6uvo3nFm+pPZbDyuS0p/IDl58IKzqYrbSmvn/Lp5vQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0FchT3Gfs/mByOmVZqVDlcMMwxr37Rvm3q2RdNZBFzlO7Jp4v
 XQFHmuG6tma7ZckII6gMygcwptDNArlW3IC8nTR6VX7NBojtbPJl4Mstj1wZedr4pj0=
X-Gm-Gg: ASbGncsy/G2ColZVq1d5Ka/WxwpyxEFsuKnz5qw/D7cZOl+QdN1QF9FINW5ckFVHQxm
 rS6BFQBlacobrDi7x1UN0/ZWxH9Ii5lR7ZIMQE2BRxwvRtpI8ZwlKBp7cUttTfKG4jgMddosBoX
 QxVIEO5s8znbvgJgH66TTDAtkdln8CbEVEciw3LYFuZRq9haMvJlFcZKsq7UWz4gBNcnXkuby8P
 xFoTXM3ZLFEEamjHs1R3uuGdICbQv4N0XcgtErGobvQZVtJSI2ochaL6YMj+Duk25embMX1KVCG
 w1S2++sOmu3EjxNezEwc73YvZwc2gy5SoC0SQy9W8v8ZeW3RnJBOcjan2GwkC0j/rd9Ik2IvODT
 j5i/YLejNUITZwKVAE4BSgcCJqbspMcPzTSkOefU3AUkzZUABk/qBIg==
X-Google-Smtp-Source: AGHT+IGZu4vLoKcsEs0prOUdg2NRu/m5YMAG/vLWkjgsWlICHV6YrbIFcE3Ys3pz0mcx8tQ8BIpSgw==
X-Received: by 2002:a05:600c:609b:b0:45d:dbf0:4831 with SMTP id
 5b1f17b1804b1-46fa9e39456mr143776135e9.0.1760358086690; 
 Mon, 13 Oct 2025 05:21:26 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483bcf9sm188213965e9.6.2025.10.13.05.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 05:21:26 -0700 (PDT)
Message-ID: <24affb5a-af97-4d1e-abdf-aaa061bdce4b@ursulin.net>
Date: Mon, 13 Oct 2025 13:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 stable@vger.kernel.org
References: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
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


A gentle ping - any takers to double check my analysis and review the below?

Regards,

Tvrtko

On 03/10/2025 10:26, Tvrtko Ursulin wrote:
> Drm_sched_job_add_dependency() consumes the fence reference both on
> success and failure, so in the latter case the dma_fence_put() on the
> error path (xarray failed to expand) is a double free.
> 
> Interestingly this bug appears to have been present ever since
> ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code back
> then looked like this:
> 
> drm_sched_job_add_implicit_dependencies():
> ...
>         for (i = 0; i < fence_count; i++) {
>                 ret = drm_sched_job_add_dependency(job, fences[i]);
>                 if (ret)
>                         break;
>         }
> 
>         for (; i < fence_count; i++)
>                 dma_fence_put(fences[i]);
> 
> Which means for the failing 'i' the dma_fence_put was already a double
> free. Possibly there were no users at that time, or the test cases were
> insufficient to hit it.
> 
> The bug was then only noticed and fixed after
> 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
> landed, with its fixup of
> 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies").
> 
> At that point it was a slightly different flavour of a double free, which
> 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
> noticed and attempted to fix.
> 
> But it only moved the double free from happening inside the
> drm_sched_job_add_dependency(), when releasing the reference not yet
> obtained, to the caller, when releasing the reference already released by
> the former in the failure case.
> 
> As such it is not easy to identify the right target for the fixes tag so
> lets keep it simple and just continue the chain.
> 
> We also drop the misleading comment about additional reference, since it
> is not additional but the only one from the point of view of dependency
> tracking.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.16+
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..aff34240f230 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -960,20 +960,16 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
>   {
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
> -	int ret;
> +	int ret = 0;
>   
>   	dma_resv_assert_held(resv);
>   
>   	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> -		/* Make sure to grab an additional ref on the added fence */
> -		dma_fence_get(fence);
> -		ret = drm_sched_job_add_dependency(job, fence);
> -		if (ret) {
> -			dma_fence_put(fence);
> -			return ret;
> -		}
> +		ret = drm_sched_job_add_dependency(job, dma_fence_get(fence));
> +		if (ret)
> +			break;
>   	}
> -	return 0;
> +	return ret;
>   }
>   EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
>   

