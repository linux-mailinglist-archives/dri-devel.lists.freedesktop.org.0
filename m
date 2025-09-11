Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D96B52D4E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385D10EA63;
	Thu, 11 Sep 2025 09:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19A2110EA63
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:30:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26734153B;
 Thu, 11 Sep 2025 02:30:42 -0700 (PDT)
Received: from [10.1.30.24] (e122027.cambridge.arm.com [10.1.30.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6B93F694;
 Thu, 11 Sep 2025 02:30:48 -0700 (PDT)
Message-ID: <aec81419-a827-43bc-a157-75df059c2bd5@arm.com>
Date: Thu, 11 Sep 2025 10:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/panfrost: Introduce JM contexts for manging
 job resources
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-3-adrian.larumbe@collabora.com>
 <99a903b8-4b51-408d-b620-4166a11e3ad1@arm.com>
 <20250910175213.542fdb4b@fedora>
 <bba00626-f9aa-4525-8568-2616adac7563@arm.com>
 <20250910185058.5239ada4@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250910185058.5239ada4@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/09/2025 17:50, Boris Brezillon wrote:
> On Wed, 10 Sep 2025 16:56:43 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 10/09/2025 16:52, Boris Brezillon wrote:
>>> On Wed, 10 Sep 2025 16:42:32 +0100
>>> Steven Price <steven.price@arm.com> wrote:
>>>   
>>>>> +int panfrost_jm_ctx_create(struct drm_file *file,
>>>>> +			   struct drm_panfrost_jm_ctx_create *args)
>>>>> +{
>>>>> +	struct panfrost_file_priv *priv = file->driver_priv;
>>>>> +	struct panfrost_device *pfdev = priv->pfdev;
>>>>> +	enum drm_sched_priority sched_prio;
>>>>> +	struct panfrost_jm_ctx *jm_ctx;
>>>>> +
>>>>> +	int ret;
>>>>> +
>>>>> +	jm_ctx = kzalloc(sizeof(*jm_ctx), GFP_KERNEL);
>>>>> +	if (!jm_ctx)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	kref_init(&jm_ctx->refcnt);
>>>>> +
>>>>> +	/* Same priority for all JS within a single context */
>>>>> +	jm_ctx->config = JS_CONFIG_THREAD_PRI(args->priority);
>>>>> +
>>>>> +	ret = jm_ctx_prio_to_drm_sched_prio(file, args->priority, &sched_prio);
>>>>> +	if (ret)
>>>>> +		goto err_put_jm_ctx;
>>>>> +
>>>>> +	for (u32 i = 0; i < NUM_JOB_SLOTS - 1; i++) {
>>>>> +		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
>>>>> +		struct panfrost_js_ctx *js_ctx = &jm_ctx->slots[i];
>>>>> +
>>>>> +		ret = drm_sched_entity_init(&js_ctx->sched_entity, sched_prio,
>>>>> +					    &sched, 1, NULL);
>>>>> +		if (ret)
>>>>> +			goto err_put_jm_ctx;
>>>>> +
>>>>> +		js_ctx->enabled = true;
>>>>> +	}
>>>>> +
>>>>> +	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
>>>>> +		       XA_LIMIT(0, MAX_JM_CTX_PER_FILE), GFP_KERNEL);
>>>>> +	if (ret)
>>>>> +		goto err_put_jm_ctx;    
>>>>
>>>> On error here we just jump down and call panfrost_jm_ctx_put() which
>>>> will free jm_ctx but won't destroy any of the drm_sched_entities. There
>>>> seems to be something a bit off with the lifetime management here.
>>>>
>>>> Should panfrost_jm_ctx_release() be responsible for tearing down the
>>>> context, and panfrost_jm_ctx_destroy() be nothing more than dropping the
>>>> reference?  
>>>
>>> The idea was to kill/cancel any pending jobs as soon as userspace
>>> releases the context, like we were doing previously when the FD was
>>> closed. If we defer this ctx teardown to the release() function, we're
>>> basically waiting for all jobs to complete, which:
>>>
>>> 1. doesn't encourage userspace to have proper control over the contexts
>>>    lifetime
>>> 2. might use GPU/mem resources to execute jobs no one cares about
>>>    anymore  
>>
>> Ah, good point - yes killing the jobs in panfrost_jm_ctx_destroy() makes
>> sense. But we still need to ensure the clean-up happens in the other
>> paths ;)
>>
>> So panfrost_jm_ctx_destroy() should keep the killing jobs part, butthe
>> drm scheduler entity cleanup should be moved.
> 
> The thing is, we need to call drm_sched_entity_fini() if we want all
> pending jobs that were not queued to the HW yet to be cancelled
> (_fini() calls _flush() + _kill()). This has to happen before we cancel
> the jobs at the JM level, otherwise drm_sched might pass us new jobs
> while we're trying to get rid of the currently running ones. Once we've
> done that, there's basically nothing left to defer, except the kfree().

Ok, I guess that makes sense.

In which case panfrost_jm_ctx_create() just needs fixing to fully tear
down the context in the event the xa_alloc() fails. Although that makes
me wonder whether the reference counting on the JM context really
achieves anything. Are we ever expecting the context to live past the
panfrost_jm_ctx_destroy() call?

Indeed is it even possible to have any in-flight jobs after
drm_sched_entity_destroy() has returned?

Once all the sched entities have been destroyed there doesn't really
seem to be anything left in struct panfrost_jm_ctx.

Thanks,
Steve

