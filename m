Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0E1DB08A
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 12:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BD589D9A;
	Wed, 20 May 2020 10:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85989D8E;
 Wed, 20 May 2020 10:48:15 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id e2so3134260eje.13;
 Wed, 20 May 2020 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BJ/UCzsi6VWkG3ZZDu+33O2d2bF1wj81EEaZB1Z7K30=;
 b=WEPQ8MJrWaSjujdfKushADVupApSDARb7vrKJ/fPzUsc3mC/ujYkoHlzhlGNkA308s
 8QlM2py1RTW3ThJuqL16Dpm1nPcK2exZHYTewSxgEmvnBX8O73WjrhSWRPP0hp7qqKfW
 NbQHSbLaGDcilmMiDH6e6NwoD7qWS80mADr92pxpSZYaDKfCSgT0euPlX2HhzHki488r
 g5uQmhh21dl5sC0qN5bsGNktaK5rHkVXszDrtbSsBuxkKRcSA+thic04zS4eH6+Xbrwq
 PTAE7Nk0wBp+2n35cDhBohVR1UyNtmIR8pSjt57EXmTRH7q+SThhRTT0BzCiW4he0NaY
 g5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=BJ/UCzsi6VWkG3ZZDu+33O2d2bF1wj81EEaZB1Z7K30=;
 b=V3aA8Bek4qU6FVc4mi90YCpHefwasN01spqmYY61YUSgcyfLji+SXtWsvs8yq3A4jP
 T3NnAz/BSzWbQtDog3hwIalc37Mk4NV7hHQ9wI1cqxUCoPyi94BIJDfRnv2rpg8NF+Gc
 9xWHxbdnJvk3OFlJ3+DfkcNMkEwfIPf/PT38uI0E0mpv6zvE83koIErkWtAyVbEe8RIX
 cJDCSmM8qCPgBetM2wkJE5Vh0g5xoKqzQYlZMaalDu0G8ESD2J7KzVat3I16TO3umHGy
 IyXkwyfAlHKvRro4nYOrvJQmxVGaUX4MRSNPFc2Ru3dTITdFTVfshAtfIRVzwLvj0oIW
 rMNw==
X-Gm-Message-State: AOAM531eFSdF1p6gWYg8pg0eLCvxDgX3BwDFVqMVXtx37J6O5jbf1mgf
 8Ex3DaGtaDos8dlP2q2p0m8=
X-Google-Smtp-Source: ABdhPJwl6ENc60zjPf1yS0B2rvn9LuXNOLk4I5UDfSAupLCD7BKpxI1kC22/RvD9+6+rp/IyTh2rFg==
X-Received: by 2002:a17:906:8514:: with SMTP id
 i20mr3004443ejx.298.1589971693861; 
 Wed, 20 May 2020 03:48:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m3sm1558631ede.58.2020.05.20.03.48.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 03:48:13 -0700 (PDT)
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
Date: Wed, 20 May 2020 12:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200519214547.352050-14-a.darwish@linutronix.de>
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, "Paul E. McKenney" <paulmck@kernel.org>,
 David Airlie <airlied@linux.ie>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Steven Rostedt <rostedt@goodmis.org>, Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.20 um 23:45 schrieb Ahmed S. Darwish:
> A sequence counter write side critical section must be protected by some
> form of locking to serialize writers. If the serialization primitive is
> not disabling preemption implicitly, preemption has to be explicitly
> disabled before entering the sequence counter write side critical
> section.
>
> The dma-buf reservation subsystem uses plain sequence counters to manage
> updates to reservations. Writer serialization is accomplished through a
> wound/wait mutex.
>
> Acquiring a wound/wait mutex does not disable preemption, so this needs
> to be done manually before and after the write side critical section.
>
> Use the newly-added seqcount_ww_mutex_t instead:
>
>    - It associates the ww_mutex with the sequence count, which enables
>      lockdep to validate that the write side critical section is properly
>      serialized.
>
>    - It removes the need to explicitly add preempt_disable/enable()
>      around the write side critical section because the write_begin/end()
>      functions for this new data type automatically do this.
>
> If lockdep is disabled this ww_mutex lock association is compiled out
> and has neither storage size nor runtime overhead.

Mhm, is the dma_resv object the only user of this new seqcount_ww_mutex 
variant ?

If yes we are trying to get rid of this sequence counter for quite some 
time, so I would rather invest the additional time to finish this.

Regards,
Christian.

>
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> ---
>   drivers/dma-buf/dma-resv.c                       | 8 +-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 --
>   include/linux/dma-resv.h                         | 2 +-
>   3 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 590ce7ad60a0..3aba2b2bfc48 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -128,7 +128,7 @@ subsys_initcall(dma_resv_lockdep);
>   void dma_resv_init(struct dma_resv *obj)
>   {
>   	ww_mutex_init(&obj->lock, &reservation_ww_class);
> -	seqcount_init(&obj->seq);
> +	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
>   
>   	RCU_INIT_POINTER(obj->fence, NULL);
>   	RCU_INIT_POINTER(obj->fence_excl, NULL);
> @@ -259,7 +259,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	fobj = dma_resv_get_list(obj);
>   	count = fobj->shared_count;
>   
> -	preempt_disable();
>   	write_seqcount_begin(&obj->seq);
>   
>   	for (i = 0; i < count; ++i) {
> @@ -281,7 +280,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	smp_store_mb(fobj->shared_count, count);
>   
>   	write_seqcount_end(&obj->seq);
> -	preempt_enable();
>   	dma_fence_put(old);
>   }
>   EXPORT_SYMBOL(dma_resv_add_shared_fence);
> @@ -308,14 +306,12 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   	if (fence)
>   		dma_fence_get(fence);
>   
> -	preempt_disable();
>   	write_seqcount_begin(&obj->seq);
>   	/* write_seqcount_begin provides the necessary memory barrier */
>   	RCU_INIT_POINTER(obj->fence_excl, fence);
>   	if (old)
>   		old->shared_count = 0;
>   	write_seqcount_end(&obj->seq);
> -	preempt_enable();
>   
>   	/* inplace update, no shared fences */
>   	while (i--)
> @@ -393,13 +389,11 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>   	src_list = dma_resv_get_list(dst);
>   	old = dma_resv_get_excl(dst);
>   
> -	preempt_disable();
>   	write_seqcount_begin(&dst->seq);
>   	/* write_seqcount_begin provides the necessary memory barrier */
>   	RCU_INIT_POINTER(dst->fence_excl, new);
>   	RCU_INIT_POINTER(dst->fence, dst_list);
>   	write_seqcount_end(&dst->seq);
> -	preempt_enable();
>   
>   	dma_resv_list_free(src_list);
>   	dma_fence_put(old);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 9dff792c9290..87fd32aae8f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -258,11 +258,9 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>   	new->shared_count = k;
>   
>   	/* Install the new fence list, seqcount provides the barriers */
> -	preempt_disable();
>   	write_seqcount_begin(&resv->seq);
>   	RCU_INIT_POINTER(resv->fence, new);
>   	write_seqcount_end(&resv->seq);
> -	preempt_enable();
>   
>   	/* Drop the references to the removed fences or move them to ef_list */
>   	for (i = j, k = 0; i < old->shared_count; ++i) {
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index a6538ae7d93f..d44a77e8a7e3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -69,7 +69,7 @@ struct dma_resv_list {
>    */
>   struct dma_resv {
>   	struct ww_mutex lock;
> -	seqcount_t seq;
> +	seqcount_ww_mutex_t seq;
>   
>   	struct dma_fence __rcu *fence_excl;
>   	struct dma_resv_list __rcu *fence;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
