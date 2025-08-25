Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDDB34C20
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F1510E55B;
	Mon, 25 Aug 2025 20:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mHuXBaym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55110E55B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mkvJJwtl20blYtbU0EPgi8DUQHjBFVcz1z+xoNxUXBE=; b=mHuXBaymZyRH9I9brgipBOiDWW
 upl6RZ5YGuFvsx3jNy8R6PnALNxTgRk/A6aYmqPUBSYjxv9y4WEUgzpPImYDJgU9RVHuUKQ4vDDqM
 Gehrt6rBZOj1F3Cn+AHnGhoJjglHzgsDPg5nZ5kfyRS6sjpn7q3pZ4BVsrY22AVFf5gYJRjDAMxi4
 vUeAFXBZGwYrkJK36tlhQPasmgc8JeiBxgFsuyRHCrbenfl2p+XekIQOrfecliN6dtkOBdI5grF1P
 Xwhz7pYZiFxZPyRa9Tk6K8+4vbX0NomMIKfRwmMeWYGrmx5haMxAM+UPQzAdo2X5ooLOWX6jcmipa
 K8yHnC2w==;
Received: from [189.7.87.79] (helo=[192.168.0.2])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uqdum-001a6U-U3; Mon, 25 Aug 2025 22:35:41 +0200
Message-ID: <b3f5f3f9-7a18-486d-8892-d22d7b269b22@igalia.com>
Date: Mon, 25 Aug 2025 17:35:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/v3d: Replace a global spinlock with a
 per-queue spinlock
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
 <20250815-v3d-queue-lock-v2-3-ce37258ffb53@igalia.com>
 <60a25b9a-34a2-4e8b-9cff-2855168dcea8@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <60a25b9a-34a2-4e8b-9cff-2855168dcea8@igalia.com>
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

Hi Melissa,

On 25/08/25 16:57, Melissa Wen wrote:
> 
> 
> On 15/08/2025 16:58, Maíra Canal wrote:
>> Each V3D queue works independently and all the dependencies between the
>> jobs are handled through the DRM scheduler. Therefore, there is no need
>> to use one single lock for all queues. Using it, creates unnecessary
>> contention between different queues that can operate independently.
>>
>> Replace the global spinlock with per-queue locks to improve parallelism
>> and reduce contention between different V3D queues (BIN, RENDER, TFU,
>> CSD). This allows independent queues to operate concurrently while
>> maintaining proper synchronization within each queue.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.h   |  8 ++------
>>   drivers/gpu/drm/v3d/v3d_fence.c | 11 ++++++-----
>>   drivers/gpu/drm/v3d/v3d_gem.c   |  3 ++-
>>   drivers/gpu/drm/v3d/v3d_irq.c   |  6 +++---
>>   drivers/gpu/drm/v3d/v3d_sched.c | 13 +++++++------
>>   5 files changed, 20 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/ 
>> v3d_drv.h
>> index 
>> d557caca5c4b8a7d7dcd35067208c5405de9df3c..cfc2f9c123aa99f6f1875b297eaf6c226b03d4ec 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -61,6 +61,7 @@ struct v3d_queue_state {
>>       /* Currently active job for this queue */
>>       struct v3d_job *active_job;
>> +    spinlock_t queue_lock;
>>   };
>>   /* Performance monitor object. The perform lifetime is controlled by 
>> userspace
>> @@ -164,11 +165,6 @@ struct v3d_dev {
>>       struct v3d_queue_state queue[V3D_MAX_QUEUES];
>> -    /* Spinlock used to synchronize the overflow memory
>> -     * management against bin job submission.
>> -     */
>> -    spinlock_t job_lock;
>> -
>>       /* Used to track the active perfmon if any. */
>>       struct v3d_perfmon *active_perfmon;
>> @@ -568,7 +564,7 @@ void v3d_get_stats(const struct v3d_stats *stats, 
>> u64 timestamp,
>>   /* v3d_fence.c */
>>   extern const struct dma_fence_ops v3d_fence_ops;
>> -struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum 
>> v3d_queue queue);
>> +struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum 
>> v3d_queue q);
> nit: Why rename queue -> q?
> 

[...]

>> +struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum 
>> v3d_queue q)
>>   {
>> +    struct v3d_queue_state *queue = &v3d->queue[q];

I'm trying to establish a convention inside the driver in which q is
`enum v3d_queue` and queue is `struct `v3d_queue_state`, which was
created in PATCH 2/6.

Thanks for the review!

Best Regards,
- Maíra

