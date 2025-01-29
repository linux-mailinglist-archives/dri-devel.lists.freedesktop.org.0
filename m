Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27DA21FC1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB810E813;
	Wed, 29 Jan 2025 14:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Kr81Qjcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2236C10E819;
 Wed, 29 Jan 2025 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ATdtI6Dd3DoUOYZ07wKSkHu7Owxf4k55Pq91Q66IojI=; b=Kr81QjcgK6UcWQra5TY/YKkye5
 gxtg82HR7U34vK8NxfC9/BT4IxNPjjQrc0uhiNUyrv0fdLE6HpwrjFwtUGF59YB7uKNYOrpRl9ZyT
 Xd2DpdST9ZiJTU/CEeBz7h0AH6hQIqCYNGVp9icPhR3guTEkX5MjRFUm/YJWgYhRTUr6z/SMnD9Bd
 RzVpevEoWEkTluuTEn14W1AImKGAewSb6JZ9qf8zllJ3pJt+gE5YPZEx4/AS8z399cyCPRgG8cHRt
 neJZKUOvfdu4n9a4/09nP5Oa/ihfliclagdSPdhu85WE6FMofNcFJ6+3ksV+0/h7FcMLziY/Y4AQV
 GCU5uudg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1td9S5-000ck3-Qz; Wed, 29 Jan 2025 15:54:07 +0100
Message-ID: <d3ab5057-22fe-43d5-baea-4dec091fb303@igalia.com>
Date: Wed, 29 Jan 2025 11:53:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: phasta@kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250128142927.103290-2-phasta@kernel.org>
 <f8c9a876-4616-454d-a816-bb3c90960245@igalia.com>
 <c5c3791df54b7ae4ba1a31159a4beda0b44d00cf.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <c5c3791df54b7ae4ba1a31159a4beda0b44d00cf.camel@mailbox.org>
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

Hi Philipp,

On 29/01/25 09:39, Philipp Stanner wrote:
> On Wed, 2025-01-29 at 07:53 -0300, Maíra Canal wrote:
>> Hi Philipp,
>>
>> On 28/01/25 11:29, Philipp Stanner wrote:
>>> drm_sched_init() has a great many parameters and upcoming new
>>> functionality for the scheduler might add even more. Generally, the
>>> great number of parameters reduces readability and has already
>>> caused
>>> one missnaming in:
>>>
>>> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
>>> nouveau_sched_init()").
>>>
>>> Introduce a new struct for the scheduler init parameters and port
>>> all
>>> users.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> Changes in v2:
>>>     - Point out that the hang-limit is deprecated. (Christian)
>>>     - Initialize the structs to 0 at declaration. (Planet Earth)
>>>     - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>>>     - Make the structs const where possible. (Boris)
>>>     - v3d: Use just 1, universal, function for sched-init. (Maíra)
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>>>    drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>>>    drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>>>    drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>>>    drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>>>    drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>>>    drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>>>    drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>>>    drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++--------
>>> -----
>>>    drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>>>    drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>>>    include/drm/gpu_scheduler.h                | 37 ++++++++++--
>>>    14 files changed, 206 insertions(+), 151 deletions(-)
>>>
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>>> b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 5844a7f639e0..44713cfdcd74 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -3284,6 +3284,22 @@ static struct panthor_queue *
>>>    group_create_queue(struct panthor_group *group,
>>>    		   const struct drm_panthor_queue_create *args)
>>>    {
>>> +	const struct drm_sched_init_args sched_args = {
>>> +		.ops = &panthor_queue_sched_ops,
>>> +		.submit_wq = group->ptdev->scheduler->wq,
>>> +		.num_rqs = 1,
>>> +		/*
>>> +		 * The credit limit argument tells us the total
>>> number of
>>> +		 * instructions across all CS slots in the
>>> ringbuffer, with
>>> +		 * some jobs requiring twice as many as others,
>>> depending on
>>> +		 * their profiling status.
>>> +		 */
>>> +		.credit_limit = args->ringbuf_size / sizeof(u64),
>>> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
>>> +		.timeout_wq = group->ptdev->reset.wq,
>>> +		.name = "panthor-queue",
>>> +		.dev = group->ptdev->base.dev
>>> +	};
>>>    	struct drm_gpu_scheduler *drm_sched;
>>>    	struct panthor_queue *queue;
>>>    	int ret;
>>> @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group
>>> *group,
>>>    	if (ret)
>>>    		goto err_free_queue;
>>>    
>>> -	/*
>>> -	 * Credit limit argument tells us the total number of
>>> instructions
>>> -	 * across all CS slots in the ringbuffer, with some jobs
>>> requiring
>>> -	 * twice as many as others, depending on their profiling
>>> status.
>>> -	 */
>>> -	ret = drm_sched_init(&queue->scheduler,
>>> &panthor_queue_sched_ops,
>>> -			     group->ptdev->scheduler->wq, 1,
>>> -			     args->ringbuf_size / sizeof(u64),
>>> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>>> -			     group->ptdev->reset.wq,
>>> -			     NULL, "panthor-queue", group->ptdev-
>>>> base.dev);
>>> +
>>
>> Please don't use multiple blank lines.
>>
>>> +	ret = drm_sched_init(&queue->scheduler, &sched_args);
>>>    	if (ret)
>>>    		goto err_free_queue;
>>>    
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a48be16ab84f..6295b2654a7c 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct
>>> work_struct *w)
>>>     * drm_sched_init - Init a gpu scheduler instance
>>>     *
>>>     * @sched: scheduler instance
>>> - * @ops: backend operations for this scheduler
>>> - * @submit_wq: workqueue to use for submission. If NULL, an
>>> ordered wq is
>>> - *	       allocated and used
>>> - * @num_rqs: number of runqueues, one for each priority, up to
>>> DRM_SCHED_PRIORITY_COUNT
>>> - * @credit_limit: the number of credits this scheduler can hold
>>> from all jobs
>>> - * @hang_limit: number of times to allow a job to hang before
>>> dropping it
>>> - * @timeout: timeout value in jiffies for the scheduler
>>> - * @timeout_wq: workqueue to use for timeout work. If NULL, the
>>> system_wq is
>>> - *		used
>>> - * @score: optional score atomic shared with other schedulers
>>> - * @name: name used for debugging
>>> - * @dev: target &struct device
>>> + * @args: scheduler initialization arguments
>>>     *
>>>     * Return 0 on success, otherwise error code.
>>>     */
>>> -int drm_sched_init(struct drm_gpu_scheduler *sched,
>>> -		   const struct drm_sched_backend_ops *ops,
>>> -		   struct workqueue_struct *submit_wq,
>>> -		   u32 num_rqs, u32 credit_limit, unsigned int
>>> hang_limit,
>>> -		   long timeout, struct workqueue_struct
>>> *timeout_wq,
>>> -		   atomic_t *score, const char *name, struct
>>> device *dev)
>>> +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct
>>> drm_sched_init_args *args)
>>>    {
>>>    	int i;
>>>    
>>> -	sched->ops = ops;
>>> -	sched->credit_limit = credit_limit;
>>> -	sched->name = name;
>>> -	sched->timeout = timeout;
>>> -	sched->timeout_wq = timeout_wq ? : system_wq;
>>> -	sched->hang_limit = hang_limit;
>>> -	sched->score = score ? score : &sched->_score;
>>> -	sched->dev = dev;
>>> +	sched->ops = args->ops;
>>> +	sched->credit_limit = args->credit_limit;
>>> +	sched->name = args->name;
>>> +	sched->timeout = args->timeout;
>>> +	sched->timeout_wq = args->timeout_wq ? : system_wq;
>>> +	sched->hang_limit = args->hang_limit;
>>> +	sched->score = args->score ? args->score : &sched->_score;
>>
>> Could we keep it consistent and use the Elvis Operator here as well?
>> Just like `sched->timeout_wq`.
> 
> This is literally just the old code.
> 
> And if at all, this insanely stupid GCC extension should not be used.
> It's one of the typical compiler people rampages that make the C
> language so terrible.

Not a problem to me, we can remove the Elvis Operator from `sched-
 >timeout_wq`. My idea is just to do things consistently in variable
assignment.

Best Regards,
- Maíra

