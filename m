Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CCA11290
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 21:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FED10E483;
	Tue, 14 Jan 2025 20:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cveDJWLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8D10E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wfl7K50NBRSqc1aRNuzQJ654C0aYXe2/QFZLOkWQTr8=; b=cveDJWLQRU8moDd0/u8T8Va57Q
 U9m78XTnYhZLUAETxK4gFGAWZLLtU7s4JeO2De1xuibOaQAl8SeovOtfENnUWdQGGM1PVyYMa8qkp
 l8B3iG2FdiqQqvKJz59QlhsVJeMWmuMmyXoBgf3NKY154HbjtRdar1t4wTPqBi+h1YALJtGdUXpch
 fdvVGvQQEN3K4807oWHx5CUkPJr1GS7NygrzNYHM8BnISERqZ6DHb5oUh3D+9axTlrqOBC+OM5EC4
 7on/dkSSLiKemZWiBe7qARSa+fNCI0SuCSLItjVB8S0x4nfZvIUxXTc2F9VkJaaiPEcBUISFDNQNx
 X5fGDUIQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXnwy-00FoCc-K0; Tue, 14 Jan 2025 21:55:48 +0100
Message-ID: <6bab08e0-4d2a-48b5-93fd-e31bedeb0dbe@igalia.com>
Date: Tue, 14 Jan 2025 17:55:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: Ensure job pointer is set to NULL after job
 completion
To: Chema Casanova <jmcasanova@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250113154741.67520-1-mcanal@igalia.com>
 <3fc574d2-00d5-4c22-933c-8db7ed201465@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <3fc574d2-00d5-4c22-933c-8db7ed201465@igalia.com>
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

Hi Chema,

Thanks for the review!

On 13/01/25 16:26, Chema Casanova wrote:
> El 13/1/25 a las 16:47, Maíra Canal escribió:
>> After a job completes, the corresponding pointer in the device must
>> be set to NULL. Failing to do so triggers a warning when unloading
>> the driver, as it appears the job is still active. To prevent this,
>> assign the job pointer to NULL after completing the job and signaling
>> the fence, indicating the job has finished.
>>
>> Fixes: 14d1d1908696 ("drm/v3d: Remove the bad signaled() implementation")
> 
> Just a question, should we add next commit to the Fixes tag:
> 
> Fixes: 79d94360d50f ("drm/v3d: wait for all jobs to finish before 
> unregistering")

I believe it is better to have the older reference, as it will ease the
backport to kernels older than 79d94360d50f.

I just applied the patch to misc/kernel.git (drm-misc-fixes).

Best Regards,
- Maíra

> 
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_irq.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/ 
>> v3d_irq.c
>> index 20bf33702c3c..da203045df9b 100644
>> --- a/drivers/gpu/drm/v3d/v3d_irq.c
>> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
>> @@ -108,6 +108,7 @@ v3d_irq(int irq, void *arg)
>>           v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
>>           trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
>>           dma_fence_signal(&fence->base);
>> +        v3d->bin_job = NULL;
>>           status = IRQ_HANDLED;
>>       }
>> @@ -118,6 +119,7 @@ v3d_irq(int irq, void *arg)
>>           v3d_job_update_stats(&v3d->render_job->base, V3D_RENDER);
>>           trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
>>           dma_fence_signal(&fence->base);
>> +        v3d->render_job = NULL;
>>           status = IRQ_HANDLED;
>>       }
>> @@ -128,6 +130,7 @@ v3d_irq(int irq, void *arg)
>>           v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
>>           trace_v3d_csd_irq(&v3d->drm, fence->seqno);
>>           dma_fence_signal(&fence->base);
>> +        v3d->csd_job = NULL;
>>           status = IRQ_HANDLED;
>>       }
>> @@ -165,6 +168,7 @@ v3d_hub_irq(int irq, void *arg)
>>           v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
>>           trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
>>           dma_fence_signal(&fence->base);
>> +        v3d->tfu_job = NULL;
>>           status = IRQ_HANDLED;
>>       }
> 
> With or without my previous comment this is:
> 
> Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> 
> Thanks for fixing this so fast.
> 
> Regards,
> 
> Chema
> 

