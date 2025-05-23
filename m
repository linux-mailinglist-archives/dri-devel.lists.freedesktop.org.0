Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75407AC2480
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 15:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FD310E7EF;
	Fri, 23 May 2025 13:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Lc5/j6H8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88810E80A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 13:50:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so66732005e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1748008200; x=1748613000;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CqbZlLxqudOElbnSUFWVJQWOSiHqoX5MUBKhQqTAI0I=;
 b=Lc5/j6H8CV9AyEyKWgABgpdIvRn/cHVqumikilNFz8isHg/ZrR0/oTScFrq7fQtzg2
 m0XWHhtjEDyoXRBA3FfkoUACAf5owrvizIbTClMdoPrkdS9qwIB96nNB5y/DP+bMhKvl
 IV9B+FlpI/4C+VkOSI2Kp38PxyLTrTaRlGqDxJupiOOvbuCauV32RZ5RFurK6AuwIoj8
 4drmPuEsb72/OOIZh3GyB7S20Bf5FpXXQ9xMy+5N/2EelBki7d1g7jbe6mzuUeNoIp6t
 rXkvmaJ/OeInO/SHbfsJ1n/hscWMDSjdnB8ioWrJcuYUkxorqVljbO/23zMo+BOp8EH1
 stXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748008200; x=1748613000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CqbZlLxqudOElbnSUFWVJQWOSiHqoX5MUBKhQqTAI0I=;
 b=tnJy42KrzYpQL3Klw0dk+EyiePBvSzes9nFHExyc8e7Fz7OvfRfMDe4msDniOdJBIZ
 Lb0572fiyjAHKCQoRDIsIso1X95Pt/q28W04YHCd+Q1gU/Ukb5RdU8G+eweBY49ZiXjp
 F1KA67GmON8BahwrD74fWjH+odOLjCrfQjwf1g5UO6DvBQk6Sz8lcO2tuetU2qGuxAGE
 sr+mMatorYrdKBHmjWOCPWrQVjoXmY6VOFhwlIU0KJwOprFCWfditzPS+3rSUzXqi+Wb
 lSk3KIi7O1dCjS1tEDJ4yuWOIYJV+Wd3JjleoSWicIq4ABAfvF0Zhl7rVULPAIDhdsbm
 hAOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUermR/ycG/L22eXlGSsSIpCgCfl1ZSaSabW/CKVww3WmCzixDOMHHOJrwj4Lc3hSr2c8iZz3LRSpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHDl7QB/Pr4fJPG5uue0qbZQIlYS1ouYOzZMp18IIOD0c0NBoB
 4edPagbTQe8HXo+8FFwULLcUbuVvAZBZ2uyvC5t4LvYxjYgx+1aAX16ox+cFD4+NY1E=
X-Gm-Gg: ASbGnctSMt9dhMd3I36rvIy+74z4I8GyIEGiFbSQrYb26KfDDd+jjtr1cs33JCObnc8
 irLIlDncWttx3HCM6sE3qtPZjBb4Y8s4SW7Gxlxe5OqvdeG6abnHX3T8/ih61rnTcoF57EOfNU9
 xBTu6GYPePbJYpfpbpgPhz0fzrDjvpcUhKnlzLagIpqeUmzH8NafLb/C/LXyxIJ4tzQ06DFvKS9
 /p852k9KECy39pSFeppjRCtZ1bpo8ZL+zKPT0S2tQVMOx4Jx5idzqmGOuGXTvWQmuAkn1qSnZpx
 ON6Q90i5fmOYJE4WgGe7BM0hEdr2VEiSasd3sk3pIEOnhVT4HsTCDvWEM96ce7GMfQ==
X-Google-Smtp-Source: AGHT+IFyh7Lwlhi0eEaP5F0H0mD3Q7/UCKuKAqQ074eLg0qBEImHjvk33e02q6x4pQ5C37T/3ihwXw==
X-Received: by 2002:a5d:64ee:0:b0:3a2:12a:e631 with SMTP id
 ffacd0b85a97d-3a35fe7a46dmr26328780f8f.22.1748008200208; 
 Fri, 23 May 2025 06:50:00 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88a13sm26402753f8f.74.2025.05.23.06.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 06:49:59 -0700 (PDT)
Message-ID: <3c8aac1b-a220-4f80-8b10-9df1fa5ed63c@ursulin.net>
Date: Fri, 23 May 2025 14:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, dakr@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250523125643.7540-2-christian.koenig@amd.com>
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


On 23/05/2025 13:56, Christian König wrote:
> It turned out that we can actually massively optimize here.
> 
> The previous code was horrible inefficient since it constantly released
> and re-acquired the lock of the xarray and started each iteration from the
> base of the array to avoid concurrent modification which in our case
> doesn't exist.
> 
> Additional to that the xas_find() and xas_store() functions are explicitly
> made in a way so that you can efficiently check entries and if you don't
> find a match store a new one at the end or replace existing ones.
> 
> So use xas_for_each()/xa_store() instead of xa_for_each()/xa_alloc().
> It's a bit more code, but should be much faster in the end.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..cf200b1b643e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence)
>   {
> +	XA_STATE(xas, &job->dependencies, 0);
>   	struct dma_fence *entry;
> -	unsigned long index;
> -	u32 id = 0;
> -	int ret;
>   
>   	if (!fence)
>   		return 0;
> @@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   	 * This lets the size of the array of deps scale with the number of
>   	 * engines involved, rather than the number of BOs.
>   	 */
> -	xa_for_each(&job->dependencies, index, entry) {
> +	xa_lock(&job->dependencies);
> +	xas_for_each(&xas, entry, ULONG_MAX) {
>   		if (entry->context != fence->context)
>   			continue;
>   
>   		if (dma_fence_is_later(fence, entry)) {
>   			dma_fence_put(entry);
> -			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> +			xas_store(&xas, fence);
>   		} else {
>   			dma_fence_put(fence);
>   		}
> -		return 0;
> +		xa_unlock(&job->dependencies);
> +		return xas_error(&xas);
>   	}
>   
> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> -	if (ret != 0)
> +retry:
> +	entry = xas_store(&xas, fence);
> +	xa_unlock(&job->dependencies);
> +
> +	/* There shouldn't be any concurrent add, so no need to loop again */
> +	if (xas_nomem(&xas, GFP_KERNEL)) {
> +		xa_lock(&job->dependencies);
> +		goto retry;
> +	}
> +
> +	if (xas_error(&xas))
>   		dma_fence_put(fence);
> +	else
> +		WARN_ON(entry);

Looks good, I cannot spot a high level problem with this approach.

Maybe only tail end of this function could be improved with something 
like this:

...
if (xas_nomem(&xas, GFP_KERNEL)) {
	xa_lock(&job->dependencies);
	goto retry;
}

err = xas_error(&xas);
if (WARN_ON(!err && entry))
	dma_fence_put(entry);
else if (err)
	dma_fence_put(fence);

return err;

Thoughts?


>   
> -	return ret;
> +	return xas_error(&xas);
>   }
>   EXPORT_SYMBOL(drm_sched_job_add_dependency);
>   

