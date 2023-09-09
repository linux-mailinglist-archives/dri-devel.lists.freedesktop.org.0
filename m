Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E079994A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304FC10E148;
	Sat,  9 Sep 2023 15:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFA710E13D;
 Sat,  9 Sep 2023 15:28:25 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F28386607285;
 Sat,  9 Sep 2023 16:28:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694273304;
 bh=Z2MxcuZipWd2FvUe1wHWLtIgtX0SLjGKnDFobgnzFmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=apF2hSiCUJLj7Lrao1jzKltnLzYQZMqEizjoWJBKM2J63ernRl+9AOMUSwPt/YcJz
 sFLPmG2QVMtkqu4jjo2SxLAgK3Tvmw3cxF1e/bdkK6plxjr1cklJq3b4whRaDuBZMl
 Faj+sIkytZQIEwUAkPsKwg5aBPRtznNvkodpbhZ3LKOSqsbGJ8XrWean5kjOpbwn7w
 HnpgJmIdKCR8uLZgEFPcs7AXtARSXFcxJXfb97o4OC3yWHJFA6FPkvb7/d0yXzHOxj
 CEs3qokHYxwKRE9sIoK35koa70nqXdU6xdRSvgGLgmSWwFyF5ZHccqNhHWpMb+TGZp
 rYgQIOv8T34zA==
Date: Sat, 9 Sep 2023 16:28:22 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 2/8] drm/panfrost: Enable cycle counter register upon
 job submission
Message-ID: <2bw3su4ev5cnyienhfrxbpingtfjbz7nii3npnp7hyllby3n2k@pvzuhrmmfge2>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-3-adrian.larumbe@collabora.com>
 <20230906095730.27cb394f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230906095730.27cb394f@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.09.2023 09:57, Boris Brezillon wrote:
>On Tue,  5 Sep 2023 19:45:18 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 033f5e684707..8b1bf6ac48f8 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -297,6 +297,11 @@ int panfrost_job_push(struct panfrost_job *job)
>>  
>>  	kref_get(&job->refcount); /* put by scheduler job completion */
>>  
>> +	if (atomic_read(&pfdev->profile_mode)) {
>> +		panfrost_cycle_counter_get(pfdev);
>
>This one should go in panfrost_job_hw_submit() IMO, otherwise you're
>enabling the cycle-counter before the job has its dependencies met, and
>depending on what the job depends on, it might take some time.

I think at first I decided against this because of a previous thread about
enabling the cycle counters:
https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg352508.html

But it turns out the fix suggested by Steven Price was what I was doing already
in the previous patch revision, namely tagging the job with whether it
had taken the cycle counter refcnt, so I guess it should be fine.

>> +		job->is_profiled = true;
>> +	}
>> +
>>  	drm_sched_entity_push_job(&job->base);
>>  
>>  	mutex_unlock(&pfdev->sched_lock);
>> @@ -351,6 +356,9 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
>>  
>>  	drm_sched_job_cleanup(sched_job);
>>  
>> +	if (job->is_profiled)
>> +		panfrost_cycle_counter_put(job->pfdev);
>
>I think I'd move this panfrost_cycle_counter_put() to
>panfrost_job_handle_{err,done}(), to release the counter as soon as
>we're done executing the job. We also need to make sure we release
>cycle counter refs in the reset path (here [1]), to keep get/put
>balanced when jobs are resubmitted.
>
>> +
>>  	panfrost_job_put(job);
>>  }
>
>[1]https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panfrost/panfrost_job.c#L666
