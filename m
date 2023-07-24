Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C618E75EE57
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139310E28D;
	Mon, 24 Jul 2023 08:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1610E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:51:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5CC6DE0;
 Mon, 24 Jul 2023 01:51:48 -0700 (PDT)
Received: from [10.57.34.62] (unknown [10.57.34.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03B6F3F6C4;
 Mon, 24 Jul 2023 01:51:01 -0700 (PDT)
Message-ID: <ecceef7c-8243-5770-c449-6f96636106b4@arm.com>
Date: Mon, 24 Jul 2023 09:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/panfrost: Sync IRQ by job's timeout handler
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
 <20230724085723.5e574bff@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230724085723.5e574bff@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2023 07:57, Boris Brezillon wrote:
> On Sun, 23 Jul 2023 03:01:42 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Panfrost IRQ handler may stuck for a long time, for example this happens
>> when there is a bad HDMI connection and HDMI handler takes a long time to
>> finish processing, holding Panfrost. Make Panfrost's job timeout handler
>> to sync IRQ before checking fence signal status in order to prevent
>> spurious job timeouts due to a slow IRQ processing.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>
>> Changelog:
>>
>> v2: - Moved synchronize_irq() after first signal-check to avoid unnecessary
>>       blocking on syncing.
>>
>>     - Added warn message about high interrupt latency.
>>
>>  drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index dbc597ab46fb..a7663d7847a2 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -720,6 +720,13 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>>  	if (dma_fence_is_signaled(job->done_fence))
>>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>>  
>> +	synchronize_irq(pfdev->js->irq);
> 
> Can we add a comment here explaining why we're doing that?

Agreed, with a comment added:

Reviewed-by: Steven Price <steven.price@arm.com>

>> +
>> +	if (dma_fence_is_signaled(job->done_fence)) {
>> +		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
>> +		return DRM_GPU_SCHED_STAT_NOMINAL;
>> +	}
>> +
>>  	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>>  		js,
>>  		job_read(pfdev, JS_CONFIG(js)),
> 

