Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EAFAC726C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 22:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13BA10E6C6;
	Wed, 28 May 2025 20:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="PrCl445E";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="2c90E6kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947310E073;
 Wed, 28 May 2025 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1748465181;
 bh=svuVRpYD101PQQjEIYeBfNI
 7EzQ94IYrrQSyKqrxUdI=; b=PrCl445EpWjPcP+iU8eHEQ/MN+ibguAM/a2ZyXB2QDjmClntHE
 6iDCnWkc9FcSdu3maFPCzI319Jm9VxI+bCzzEDxuFtToBG9kFjsF7sJ34Q5oXkTVBkjwOs/2VcO
 QqMD1n/lWtgGlL5R0bIcYhwK7LrKzbTJEZtchodSfo7trin8o9s1M3o1YP77FZ4PVl4jAiw4Hi+
 hL1fAGqsDYlQFnSms1AaWiLyYIx9G+TzXZPeJds8AeQBWMOa7IN3NaCTrzT84YcQexcR5pulh1x
 RFRfqQPkf0bORnk1NTGb3LESfmtvLuaCYmA2rt5gQKifiAzocVn0uW7vMJPrNxWQEFg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1748465181; bh=svuVRpYD101PQQjEIYeBfNI
 7EzQ94IYrrQSyKqrxUdI=; b=2c90E6kFhoO7N+OQYfMSedjyoygwYF40Dn3Zf92fw/vkK4L1Do
 DioSoq6rPw+duTfwZ2sDwRNglm4uwj0U4yAQ==;
Message-ID: <5e312895-27ed-4ad4-b1c6-55035cdcd112@damsy.net>
Date: Wed, 28 May 2025 22:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/10] drm/sched: Store the drm client_id in
 drm_sched_fence
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
 <20250526125505.2360-3-pierre-eric.pelloux-prayer@amd.com>
 <5jnpsmjef5ibegbsbelkfmudv4wagpcfb25nptqs5z4ccitq4c@3bdtrbrrmtil>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <5jnpsmjef5ibegbsbelkfmudv4wagpcfb25nptqs5z4ccitq4c@3bdtrbrrmtil>
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

Hi,

Le 28/05/2025 à 21:07, Lucas De Marchi a écrit :
> On Mon, May 26, 2025 at 02:54:44PM +0200, Pierre-Eric Pelloux-Prayer wrote:
>> drivers/gpu/drm/xe/xe_sched_job.c                |  3 ++-
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>> index f0a6ce610948..5921293b25db 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>> @@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>>     kref_init(&job->refcount);
>>     xe_exec_queue_get(job->q);
>>
>> -    err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
>> +    err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
>> +                 q->xef->drm->client_id);
> 
> you can't do this here. xef is only !NULL if it's a job from userspace.

sorry about that.

> For in-kernel jobs, xef is NULL and this explodes. Right now this
> completely breaks xe since one of the very first things we do is
> to submit a job to save the default context. Example:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3/bat- 
> bmg-1/igt@xe_module_load@load.html
> 
>      <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
>      <4> [] Code: c1 43 18 85 c0 0f 84 6f 02 00 00 8d 50 01 09 c2 0f 88 3e 02 00 00 48 8b 03 48 8b 
> b3 d8 00 00 00 31 c9 4c 89 ef ba 01 00 00 00 <48> 8b 40 08 4c 8b 40 60 e8 86 64 7c ff 41 89 c4 85 c0 
> 0f 85 9b 01
>      <4> [] RSP: 0018:ffffc900031972d8 EFLAGS: 00010246
>      <4> [] RAX: 0000000000000000 RBX: ffff88815fc40d00 RCX: 0000000000000000
>      <4> [] RDX: 0000000000000001 RSI: ffff88812e6552a8 RDI: ffff88815f939c40
>      <4> [] RBP: ffffc90003197318 R08: 0000000000000000 R09: 0000000000000000
>      <4> [] R10: 0000000000000000 R11: 0000000000000000 R12: ffffc90003197428
>      <4> [] R13: ffff88815f939c40 R14: ffff88811f054000 R15: ffff88815fc40d00
>      <4> [] FS:  00007681f2948940(0000) GS:ffff8888daf14000(0000) knlGS:0000000000000000
>      <4> [] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      <4> [] CR2: 0000000000000008 CR3: 0000000118315004 CR4: 0000000000f72ef0
>      <4> [] PKRU: 55555554
>      <4> [] Call Trace:
>      <4> []  <TASK>
>      <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
>      <4> []  ? find_held_lock+0x31/0x90
>      <4> []  ? xa_find_after+0x12c/0x250
>      <4> []  xe_bb_create_job+0x6e/0x380 [xe]
>      <4> []  ? xa_find_after+0x136/0x250
>      <4> []  ? __drm_dev_dbg+0x7d/0xb0
>      <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]
> 
> Can we use 0 for in-kernel client since drm_file starts them from 1?

Yes, this is what amdgpu does.

> Like this:
> 
> | diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> | index 5921293b25db3..d21bf8f269640 100644
> | --- a/drivers/gpu/drm/xe/xe_sched_job.c
> | +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> | @@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> |         xe_exec_queue_get(job->q);
> | |         err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
> | -                                q->xef->drm->client_id);
> | +                                q->xef ? q->xef->drm->client_id : 0);
> |         if (err)
> |                 goto err_free;
> 
> I tested with the above diff and it at least loads...

Thanks for looking into this, the change looks fine to me.

Pierre-Eric

> 
> Also, I see this in intel-xe mailing list, but I'm not sure why we
> didn't have any CI results... I will check that.
> 
> Lucas De Marchi
