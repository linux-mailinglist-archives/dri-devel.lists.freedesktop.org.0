Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6238905B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2316EDCA;
	Wed, 19 May 2021 14:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF316EDC5;
 Wed, 19 May 2021 14:15:12 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h16so15551909edr.6;
 Wed, 19 May 2021 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TtP8WVW+tcp98Fr66u48tzo0yVxMukLz/us7XyyQfO0=;
 b=L3fd4Ue0cwgbLoLKhQ0G1QwPmmtSSs0L+08FFlHNTTc3XxvGzkcE59S22AlHvuGBno
 MWgkJzcAeHdJKWqnCJmrBGDNYJx5dca9GGbXyBdy10DwiiL0xli+qbDu95FEFKhS12hh
 ydthdRpENL5mo7MFuIgzVmzoD1hsyXggBWcx8zpE66J2ps4NHqSinXjh7Y/I7rkk88+1
 PiH+1aYmU5w7obWmZ4CFZzpMXYe6oUECKkO79DLhjD+AQrLc4fyNqpPcJfs5IqbN19Ja
 JWnf9n608wLrgMvBmxcZYRS9GYMnxufXBV6fAE+/AnOU5jEQgfSc+3fupuZeQfVyfsew
 cmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TtP8WVW+tcp98Fr66u48tzo0yVxMukLz/us7XyyQfO0=;
 b=HaQD/Ou6uMavE2pG95HnLUqMz25ZwTLLKEjr+Z/Kv21RVrXYPBpwYTTAqvCb9Q53To
 tbluXzMsAAQN4ISA6UdTU0Z1L/1xAuiyc7RM3Q8WoiYcZKWIziL2itJcBt36X4pwg1fA
 QxrcV7Gxj5o3MPAJbbor3Gnpx72FM84T9ccjtyM/tAoboAKMJgirKGiiW4z9UTdYSrt8
 FkYJSyh2UFrumWZwWJJYXsWYavsIlVXFg3JHRnVNSsxcHxk0xdCrHMOJ1IA8bjRrrNcz
 PZiL0uRVaMPVfd61nXlYEdi4S1+J+hI+JxxBm9g5MCKfteqA+w9nhfW6vHeirDfv5hBn
 E5Mg==
X-Gm-Message-State: AOAM531FwynJjEcQfte9va/4x3dk4pSlOeVXJUWQfy/scif5X6OgngdI
 h0OcwEIpyiVBA3tCprYImwI=
X-Google-Smtp-Source: ABdhPJzJUFi4X4JkOfXlS4GBwyBhso5zyGqdyI0xZ4exkwDbf4pf9WqJu+3fM53IHc7WvecZOLXQPw==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr14809405edq.37.1621433711484; 
 Wed, 19 May 2021 07:15:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a?
 ([2a02:908:1252:fb60:8e28:1d3:41f3:e15a])
 by smtp.gmail.com with ESMTPSA id c3sm16593506edn.16.2021.05.19.07.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:15:11 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Avoid data corruptions
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <fa81de6a-e272-66cf-61d8-5bb2d0ebcb03@gmail.com>
 <20210519141407.88444-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ce0d6f1c-4cb6-e21f-28c5-93531b687976@gmail.com>
Date: Wed, 19 May 2021 16:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519141407.88444-1-andrey.grodzovsky@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 16:14 schrieb Andrey Grodzovsky:
> Wait for all dependencies of a job  to complete before
> killing it to avoid data corruptions.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 2e93e881b65f..d5cf61972558 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -222,11 +222,16 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   {
>   	struct drm_sched_job *job;
> +	struct dma_fence *f;
>   	int r;
>   
>   	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
> +		/* Wait for all dependencies to avoid data corruptions */
> +		while ((f = job->sched->ops->dependency(job, entity)))
> +			dma_fence_wait(f);
> +
>   		drm_sched_fence_scheduled(s_fence);
>   		dma_fence_set_error(&s_fence->finished, -ESRCH);
>   

