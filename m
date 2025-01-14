Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82002A11050
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B710E46A;
	Tue, 14 Jan 2025 18:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Kpu3BEVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9B410E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m1BioEekil4xYG4U5bqE11GiuV8g7u/Qrsz7Ig9wPL8=; b=Kpu3BEVaq41+vPuCQVSFjCzScX
 ulOk+2v2iHWbx8O8bGWFQeLfZSeEtDALP0lNiy9tJouyQgtZdZpMBIALu34DgFtHVf67j3grcFjfv
 DX3EkX16nLDJ/ecnyXH/L4s3wWtS7rCLtkhUQJz3K8HdNZIS6sm/GgeylYJPWjfdV3UkfOAkgOZuZ
 uZViB2QAoTGKqY1/xg6lg04qmvcG7gLaLXlZTlqUJ3F9JnrNCscoRQF+g+oWTvDSHRZ8l2y0asdhm
 ujITtEZwBQTV3MkYBwxrrDFyDIW9P4uLYjm0Gvb4KhaGwtIyLRRfViVeZ9ofNGYlFu7hHg3Zd08uG
 7L4aQ8WQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXloE-00FlgU-MY; Tue, 14 Jan 2025 19:38:39 +0100
Message-ID: <c4578422-d755-4850-a819-df3879029102@igalia.com>
Date: Tue, 14 Jan 2025 15:38:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: Remove `v3d->cpu_job`
To: Chema Casanova <jmcasanova@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250113154741.67520-1-mcanal@igalia.com>
 <20250113154741.67520-2-mcanal@igalia.com>
 <841965dc-31a6-4ced-83b2-1e47ea4b52f7@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <841965dc-31a6-4ced-83b2-1e47ea4b52f7@igalia.com>
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

On 13/01/25 16:27, Chema Casanova wrote:
> Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Thanks for the review! Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> 
> El 13/1/25 a las 16:47, Maíra Canal escribió:
>> CPU jobs, like Clean Cache jobs, execute synchronously once the DRM
>> scheduler starts running them. Consequently, a global `v3d->cpu_job`
>> variable is unnecessary, as everything is managed within the
>> `v3d_cpu_job_run()` function.
>>
>> This commit removes the `v3d->cpu_job` pointer, as it is not needed.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.h   | 1 -
>>   drivers/gpu/drm/v3d/v3d_sched.c | 2 --
>>   2 files changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/ 
>> v3d_drv.h
>> index dc1cfe2e14be..9deaefa0f95b 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -147,7 +147,6 @@ struct v3d_dev {
>>       struct v3d_render_job *render_job;
>>       struct v3d_tfu_job *tfu_job;
>>       struct v3d_csd_job *csd_job;
>> -    struct v3d_cpu_job *cpu_job;
>>       struct v3d_queue_state queue[V3D_MAX_QUEUES];
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/ 
>> v3d_sched.c
>> index da08ddb01d21..961465128d80 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -656,8 +656,6 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
>>       struct v3d_cpu_job *job = to_cpu_job(sched_job);
>>       struct v3d_dev *v3d = job->base.v3d;
>> -    v3d->cpu_job = job;
>> -
>>       if (job->job_type >= ARRAY_SIZE(cpu_job_function)) {
>>           DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job->job_type);
>>           return NULL;

