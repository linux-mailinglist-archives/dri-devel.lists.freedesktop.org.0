Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2A1DB5D4
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 16:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C786E17A;
	Wed, 20 May 2020 14:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57CA16E17A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 14:02:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB79BD6E;
 Wed, 20 May 2020 07:02:22 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268743F52E;
 Wed, 20 May 2020 07:02:20 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: fix runtime pm imbalance on error
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
References: <20200520110504.24388-1-dinghao.liu@zju.edu.cn>
From: Steven Price <steven.price@arm.com>
Message-ID: <73a1dc37-f862-f908-4c9f-64e256283857@arm.com>
Date: Wed, 20 May 2020 15:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520110504.24388-1-dinghao.liu@zju.edu.cn>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/05/2020 12:05, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Actually I think we have the opposite problem. To be honest we don't 
handle this situation very well. By the time panfrost_job_hw_submit() is 
called the job has already been added to the pfdev->jobs array, so it's 
considered submitted even if it never actually lands on the hardware. So 
in the case of this function bailing out early we will then (eventually) 
hit a timeout and trigger a GPU reset.

panfrost_job_timedout() iterates through the pfdev->jobs array and calls 
pm_runtime_put_noidle() for each job it finds. So there's no inbalance 
here that I can see.

Have you actually observed the situation where pm_runtime_get_sync() 
returns a failure?

HOWEVER, it appears that by bailing out early the call to 
panfrost_devfreq_record_busy() is never made, which as far as I can see 
means that there may be an extra call to panfrost_devfreq_record_idle() 
when the jobs have timed out. Which could underflow the counter.

But equally looking at panfrost_job_timedout(), we only call 
panfrost_devfreq_record_idle() *once* even though multiple jobs might be 
processed.

There's a completely untested patch below which in theory should fix that...

Steve

----8<---
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c 
b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7914b1570841..f9519afca29d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -145,6 +145,8 @@ static void panfrost_job_hw_submit(struct 
panfrost_job *job, int js)
  	u64 jc_head = job->jc;
  	int ret;

+	panfrost_devfreq_record_busy(pfdev);
+
  	ret = pm_runtime_get_sync(pfdev->dev);
  	if (ret < 0)
  		return;
@@ -155,7 +157,6 @@ static void panfrost_job_hw_submit(struct 
panfrost_job *job, int js)
  	}

  	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
-	panfrost_devfreq_record_busy(pfdev);

  	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
  	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
@@ -410,12 +411,12 @@ static void panfrost_job_timedout(struct 
drm_sched_job *sched_job)
  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
  		if (pfdev->jobs[i]) {
  			pm_runtime_put_noidle(pfdev->dev);
+			panfrost_devfreq_record_idle(pfdev);
  			pfdev->jobs[i] = NULL;
  		}
  	}
  	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);

-	panfrost_devfreq_record_idle(pfdev);
  	panfrost_device_reset(pfdev);

  	for (i = 0; i < NUM_JOB_SLOTS; i++)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
