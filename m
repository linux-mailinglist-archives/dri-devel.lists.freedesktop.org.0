Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984845D781
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 10:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A3B6E884;
	Thu, 25 Nov 2021 09:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44976E802;
 Thu, 25 Nov 2021 09:44:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so10271353wrg.5;
 Thu, 25 Nov 2021 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=M4eNhtRyfszXgoCevZXctJE/hLAngb4kNGrAZca/vtQ=;
 b=hr7P+jqEo1S6urwHZfCCiWe591gBIwIqfjkJ9WWAo4LsbX2JWYICNZteJ2bwEpNfFk
 KGMkOnX6lZpF7lMAQWo17B7/5k1AGx48qJpn/jgqPCF4eClsFCaoU0dJDBB1GX12LdFp
 fkaPzCdUOyqJCQAop8HdN7pXrpRb1ZkqULRBplAsjnmdi6yPj6GShfbGGv26bSOZ5mj3
 4+ZUXqmYIJgUr8McgNrrtafhElJmiaHGgHeHor7r4lHHeOa5wq1Y8xMrRg4c3rJ2de+V
 AFlcXQ7KdIsOFfB8z3+hj7QxR3NuK7/epZZw15YOM24P/CBqinvAWd7mKF/WbeWzavpg
 ek5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=M4eNhtRyfszXgoCevZXctJE/hLAngb4kNGrAZca/vtQ=;
 b=LuV9L5A1HiwhJ67iORD8pRECoCb4EeVqY7wG2DYkNPQZDCEDLTAORhoFZiNr7B13SE
 TT6bUudB32hlPNBFOsNBfMBQxK4H3Ww9kFwfkXx6uwqfGtQIt6yD7tPR8mLLlbcNHg5n
 rXJUPWa9bTdRS9InQ4bZWNzln/uzBeP8QKMiEuHoiwHEkobLfWgIfyPBPrSiSO7B1Tq2
 OeH/Wd3sbeWMXnKC0jl8W2HkAbeooWVsHA5ZUq+ck38DJjvfecVi365VsasIx6MUhJut
 ksW25DpwqNzSo8CfQimB8ZaR2Ix4hpdkL0iiZImV+4S4fRkQMjmRzMZ2AnuoXjT5s5AP
 twgQ==
X-Gm-Message-State: AOAM5300CR7S0jsMHFbBM+sfNYoKG62eUYcjtz6uGRI1RjKejgFyHWUf
 E8kyWToT3h+qe9m43BTytQag/6Tt2b8=
X-Google-Smtp-Source: ABdhPJwgehb/hMyMIn8NfuWZloUVEaV7WrJtRSt6A7q1DOrmUwW6oVfThdS27Z+K6FCs7SoPVSqGFQ==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr4929492wrz.159.1637833468170; 
 Thu, 25 Nov 2021 01:44:28 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id az15sm2355074wmb.0.2021.11.25.01.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 01:44:27 -0800 (PST)
Subject: Re: [PATCH 1/6] dma-buf: move dma_resv_prune_unlocked into dma_resv.c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211028132630.2330-1-christian.koenig@amd.com>
 <7729c40e-fe4e-853e-06d4-5e39dff17d32@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0d2f11ef-012e-f51a-80f3-3e8109fac060@gmail.com>
Date: Thu, 25 Nov 2021 10:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7729c40e-fe4e-853e-06d4-5e39dff17d32@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 25.11.21 um 10:31 schrieb Maarten Lankhorst:
> [SNIP]
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index eebf04325b34..e0558429a5ee 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -458,6 +458,7 @@ void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>> +void dma_resv_prune_unlocked(struct dma_resv *obj);
>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>>   			unsigned *pshared_count, struct dma_fence ***pshared);
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> I don't mind adding a dma_resv_prune for locked case, but I don't think unlocked would have benefits.
>
> Furthermore, I'm trying to remove the unlocked versions from i915. Could this be a prereq patch instead?
>
> https://patchwork.freedesktop.org/patch/460722/?series=96115&rev=1

Yeah, that works for me as well.

I was on the edge of dropping that from TTM as well since this is really 
just abusing the interface to save a few bytes of memory.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the i915 patch if it helps to get that committed.

Regards,
Christian.

>
> ~Maarten
>
> ~Maarten
>

