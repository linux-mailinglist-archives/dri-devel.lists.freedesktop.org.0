Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71507CB641B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4A510E12D;
	Thu, 11 Dec 2025 14:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="De0dI5FP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828310E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:53:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b7ce5d6627dso36391466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765464824; x=1766069624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KJmVtTUWRg/nWAOk10vIh00eEJeEeO5vakycm7y456g=;
 b=De0dI5FPLdwHonatJN9VZSe4xxBPJuhUG1o6JGyB5DwGH36GT6ZixJLE6pNjICk/p2
 Vhs2A37WHJ2cR7IO6OBj9PdgIIy0OpPUJo83oQikKEu6a75CvSdPIaDOmGwE05NO1FJU
 0ccS7d13CSKGmntKY+yhM5y9cHHoe72tGhh0clHGo3Iw7thvRWBEKkykYekFzA0BBPcq
 kvslG5rnymmcaO3CQUFEEARPYJFDJcwCGxIr0my/GkROSSepEQG25rhe+VuVsm3CiOVp
 PDHXbUkBeE4gnRXr3NdB+pq2yyiiAglAceHgHpJbfpD8NRwkbcl0tzvEagRiMgqro/nW
 7Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765464824; x=1766069624;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJmVtTUWRg/nWAOk10vIh00eEJeEeO5vakycm7y456g=;
 b=ogoVFQ3L4wxOwK1v0gyw3ptRtDg9Da5naWaEAV3FGHgGnSuHolLdkk+IqsJyvGT6O0
 o5QR3GZYlHvNiIl3jORxsdK39V3H47C/CBO2OY5JWzwMwLefqyA6pKgRpH9sxXjQhLe1
 +1YgUUnmU6svdD/onIvDnPAPiaETFDwVERjIpFLyzJPQd1Shj7F8JOvgUYSde9Hf3SHX
 Cr8NdxLlY6Otqxl855RNCnyS1FrMEm3CYZdDRCL58lVJVyNoNSC+Ml1eGsUxMXtsUuxK
 urLxtKZxUyKZmquwcid4rIUrhL4KspBKEoNV19XiIl8X8eaOq6BTBD+oQO2uh08XRgwh
 4bbA==
X-Gm-Message-State: AOJu0YznR8bNoCJ6YgWiujYQIUshDosYppk8j0LZeSsnQ0gWfpD4lCIW
 4rMhB1Z7+F0rBQUwsaAwp/SSJu/GnXUp4ZHLIRaRXAplmE9c3EcFNuZRS014d/W97/U=
X-Gm-Gg: AY/fxX5KwzHdYZrT6fKn8GgHO/MCdav36BIpt7wtc3hq18WCkm48P+1+pucRP4q3BjM
 v3AFoymzcRDLWoaplnpg14eSSzm9BrOgesFU35A1J+PQqeLqkpv12VaLSvKNTKSzfxU0yBTR0YG
 IYYOLsQ1fugKv5+PHyaX8CZT872HL2NE9JICkfqXveXcakuv7vL2Kx2TMyWyx7Jk2Gia0oFwn3H
 garmrf6dtoD3LvgYUA2CQHfHI+VvKx8CAQ5YoQYiKd2ZlanUfHKAb8vgigvv7VCnYm/Qhjt+iZU
 yQIputNjStKk5aWI9S5LYMZlawY3Oo5B86DnvVGxYCWHhk2VxpaHLM7iVSCzAPfU+kDM1FGRqVB
 g5b0ab5atZ8Bk5OQmOE48dOH3bX6D6Q6/4zSqqExFGwOwtjrdJ6emOtusL7GeHVGmx4CI5uZT3s
 QOvUAGhJWGSypRL407h/CTIRawYBh5
X-Google-Smtp-Source: AGHT+IGfEvX0L7YvYoHqcUSQGQSLB7W3XQ5xc6dQA/QTNHlW+NlIhJMuXoTTd+3JSMFUP/Bne2Jk/g==
X-Received: by 2002:a17:907:96a3:b0:b75:8b9f:de3a with SMTP id
 a640c23a62f3a-b7ce850ab79mr707957366b.59.1765464823546; 
 Thu, 11 Dec 2025 06:53:43 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa56c152sm286733366b.56.2025.12.11.06.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 06:53:43 -0800 (PST)
Message-ID: <346e3df8-5f3a-4394-9d90-4ba107294161@ursulin.net>
Date: Thu, 11 Dec 2025 15:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] dma-buf/selftests: drop the mock_wait implementation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-5-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-5-christian.koenig@amd.com>
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


On 11/12/2025 13:16, Christian König wrote:
> Actually test the documented expectation of dma_fence_wait() instead of
> comming up with a mock_wait implementation which uses undocumented
> and non standard return codes and behavior.
>
> Additional to that increase the timeout to one second, otherwise the
> test case is a bit unreliable.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/st-dma-fence.c | 51 ++++------------------------------
>   1 file changed, 5 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 5cb8f90a7448..5d0d9abc6e21 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -33,50 +33,9 @@ static void mock_fence_release(struct dma_fence *f)
>   	kmem_cache_free(slab_fences, to_mock_fence(f));
>   }
>   
> -struct wait_cb {
> -	struct dma_fence_cb cb;
> -	struct task_struct *task;
> -};
> -
> -static void mock_wakeup(struct dma_fence *f, struct dma_fence_cb *cb)
> -{
> -	wake_up_process(container_of(cb, struct wait_cb, cb)->task);
> -}
> -
> -static long mock_wait(struct dma_fence *f, bool intr, long timeout)
> -{
> -	const int state = intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
> -	struct wait_cb cb = { .task = current };
> -
> -	if (dma_fence_add_callback(f, &cb.cb, mock_wakeup))
> -		return timeout;
> -
> -	while (timeout) {
> -		set_current_state(state);
> -
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
> -			break;
> -
> -		if (signal_pending_state(state, current))
> -			break;
> -
> -		timeout = schedule_timeout(timeout);
> -	}
> -	__set_current_state(TASK_RUNNING);
> -
> -	if (!dma_fence_remove_callback(f, &cb.cb))
> -		return timeout;
> -
> -	if (signal_pending_state(state, current))
> -		return -ERESTARTSYS;
> -
> -	return -ETIME;
> -}
> -
>   static const struct dma_fence_ops mock_ops = {
>   	.get_driver_name = mock_name,
>   	.get_timeline_name = mock_name,
> -	.wait = mock_wait,
>   	.release = mock_fence_release,
>   };
>   
> @@ -349,14 +308,14 @@ static int test_wait(void *arg)
>   
>   	dma_fence_enable_sw_signaling(f);
>   
> -	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
> +	if (dma_fence_wait_timeout(f, false, 0) != 0) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
>   	}
>   
>   	dma_fence_signal(f);
>   
> -	if (dma_fence_wait_timeout(f, false, 0) != 0) {
> +	if (dma_fence_wait_timeout(f, false, 0) != 1) {
>   		pr_err("Wait reported incomplete after being signaled\n");
>   		goto err_free;
>   	}
> @@ -393,16 +352,16 @@ static int test_wait_timeout(void *arg)
>   
>   	dma_fence_enable_sw_signaling(wt.f);
>   
> -	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
> +	if (dma_fence_wait_timeout(wt.f, false, 1) != 0) {
>   		pr_err("Wait reported complete before being signaled\n");
>   		goto err_free;
>   	}
>   
>   	mod_timer(&wt.timer, jiffies + 1);
>   
> -	if (dma_fence_wait_timeout(wt.f, false, 2) == -ETIME) {
> +	if (dma_fence_wait_timeout(wt.f, false, HZ) == 0) {
>   		if (timer_pending(&wt.timer)) {
> -			pr_notice("Timer did not fire within the jiffy!\n");
> +			pr_notice("Timer did not fire within one HZ!\n");
>   			err = 0; /* not our fault! */
>   		} else {
>   			pr_err("Wait reported incomplete after timeout\n");

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

