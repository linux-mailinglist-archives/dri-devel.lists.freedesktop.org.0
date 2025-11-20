Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F85C74751
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4110E757;
	Thu, 20 Nov 2025 14:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="wUOaOX3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090510E757
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:10:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so7822695e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763647801; x=1764252601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eCHpy1o/ACTFMJgtD/aw3O86hM4JbHXhTf5b8jy+cHc=;
 b=wUOaOX3xgrsntnbtO2wbp3n7VULqo7ms0Umim59IGwdNncGMYZfE5hXaghROI96Tkj
 3uuA61A9MB5JN9zmqUROYlTl4hEgyQgnsndyJX+BESrLWsrp8MOGUNzJ5ABKQqgBwrOh
 3xd5kNnzkRF4p8QqL7Yxv777Zhhj2cSw2JhHcjdMVlYW3H4rvdP4Tj8iKZwI6Y0IfpIY
 BmxdWTHurJCykc0E4gOR5mcvYhGzh6S21HXqxP4JwvrqC4bJSuzjMrGhPclOSkuz3NH4
 7Lybk20WO4rFciMAGU8qpnbDv0O3TLXdHhLZ3XY5PXz71rZTb62TjOCuYdjWatImjRRi
 xTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763647801; x=1764252601;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eCHpy1o/ACTFMJgtD/aw3O86hM4JbHXhTf5b8jy+cHc=;
 b=Ra8LHpYSpQs0gv/peEfHZGiLHNeBLQkcu4TH901mQUH2tqe62mL0yeIywWa9y/oW2O
 WX3ZfOzPyvznz78EEV3LxZdKnbh3AwViS70ndgZ8ABCb1b/0RoE7I/Fe29lkMPHBwf1+
 ylOyYxpa3UImtEAirlaBqb9EFHVrzjhvyiz1tEEq5wnqlm4H2Zcmm6teTg7OwhGuDH2c
 I3/uM1+2hgJv5zWd/TDMwxyQyMoIfS3Z2aWlwln6ciGmg7KIfUmLK9pzUN6ohA5UZZUk
 HyQIM8/MEXV4isMaUWub2yU28fyn0tk73y+miiNhnIXmYE1woDQL6AAn8TYi6GQHyLjY
 2PSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUUdDfLJr0YK9hBzwHxZHX+JXcpIWTAyafqA0VHlwqC43+J6HqA2kos2yoKFtzPwoJWdXGt6Ecal0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6QUmjQeM4Oe+Os8PMi3y411Qhdv6H4Bkqj/ZhmfgWWdq2hgZK
 xR0FS8E5F30Ly/cp0K8DShZBKtFVZz0cfTL4p+RDAS+OlIoMSrTpVY+JjlCUTiJbdds=
X-Gm-Gg: ASbGnctW9ZdoCAHFuo5Clgt7uRb5+amSXFVg0y5n6q9IR5ATwnQEe5DzI7oClItUdIB
 SES3h4JKQ6IUy44xBukMAXROoVRgwjJ8EEBNGS3kG6HCtFPj7fMA3fTAFySXrzYjmgaJLA5s5kY
 JS/YJvfbm68dXIT+KzS1PXhrlCgMppMvz+hfMxCbbyFzRHrzf0DtsxESozIdqz+Jf5PbUH1sQ/C
 2oIjcgdfvIb1+ZdPGga0L8CMWp/PMvy8rvWtteCC0V8SG+/BpA+6lDObrsewpRFCwWQx6Y+6g9x
 RS6PMXhLY1o5S5q0aF58SBhnCsQ7jDOi8zhKIXfk972yAxpW5Ga+xeF3SmHVNRNRyrM2wBts3Ls
 4XkDtMvCZ1J3U02Ktf1rWcQ+Bqgv42bj2mqsshOqW0xW54iuIsddnIsxek3DLNKHhG2K0KpawB6
 70sLTNu53nJVJ8pwXRkEGSeSLFiPOwj7YbUKtAy79ksMg=
X-Google-Smtp-Source: AGHT+IF3fFe6uHBbufSIu8dYBqLVhlYanBolrvml//L4SVgEuQ8hTozu3CVUaxX66a/P0gLZaYR88A==
X-Received: by 2002:a05:600c:1f0f:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-477b8a8bd4fmr33404995e9.18.1763647800592; 
 Thu, 20 Nov 2025 06:10:00 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b106a9b0sm111116985e9.11.2025.11.20.06.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:10:00 -0800 (PST)
Message-ID: <6f26a30f-7c66-4e88-a3bf-bfa41f7efa7b@ursulin.net>
Date: Thu, 20 Nov 2025 14:09:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] dma-buf: cleanup dma_fence_describe v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251113145332.16805-2-christian.koenig@amd.com>
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


On 13/11/2025 14:51, Christian König wrote:
> The driver and timeline name are meaningless for signaled fences.
> 
> Drop them and also print the context number.
> 
> v2: avoid the calls when the BO is already signaled.
> v3: use same format as trace points for context and seqno.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c5d1478b28dd..b4f5c8635276 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -997,19 +997,21 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>    */
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>   {
> -	const char __rcu *timeline;
> -	const char __rcu *driver;
> +	const char __rcu *timeline = "";
> +	const char __rcu *driver = "";
> +	const char *signaled = "";
>   
>   	rcu_read_lock();
>   
> -	timeline = dma_fence_timeline_name(fence);
> -	driver = dma_fence_driver_name(fence);
> +	if (!dma_fence_is_signaled(fence)) {
> +		timeline = dma_fence_timeline_name(fence);
> +		driver = dma_fence_driver_name(fence);
> +		signaled = "un";
> +	}
>   
> -	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   rcu_dereference(driver),
> -		   rcu_dereference(timeline),
> -		   fence->seqno,
> -		   dma_fence_is_signaled(fence) ? "" : "un");
> +	seq_printf(seq, "%llu:%llu %s %s %ssignalled\n",
> +		   fence->context, fence->seqno, timeline, driver,
> +		   signaled);
>   
>   	rcu_read_unlock();
>   }

I thought I r-b-ed this one but apparently not.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

