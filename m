Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA03B9F65
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F8899A7;
	Fri,  2 Jul 2021 10:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0031F899A7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:58:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335A11FB;
 Fri,  2 Jul 2021 03:58:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DECA93F718;
 Fri,  2 Jul 2021 03:58:39 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
 <700919f1-a0d0-d8fb-e871-915b56260f83@arm.com>
 <20210702125234.14ab19fb@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <e42f478f-eaa4-752f-8fb6-b0f53f09a2d7@arm.com>
Date: Fri, 2 Jul 2021 11:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702125234.14ab19fb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 11:52, Boris Brezillon wrote:
> On Fri, 2 Jul 2021 11:08:58 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 01/07/2021 10:12, Boris Brezillon wrote:
>>> Needed to keep VkQueues isolated from each other.  
>>
>> One more comment I noticed when I tried this out:
>>
>> [...]
>>> +struct panfrost_submitqueue *
>>> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
>>> +			    enum panfrost_submitqueue_priority priority,
>>> +			    u32 flags)
>>> +{
>>> +	struct panfrost_submitqueue *queue;
>>> +	enum drm_sched_priority sched_prio;
>>> +	int ret, i;
>>> +
>>> +	if (flags || priority >= PANFROST_SUBMITQUEUE_PRIORITY_COUNT)
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>>> +	if (!queue)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	queue->pfdev = ctx->pfdev;
>>> +	sched_prio = to_sched_prio(priority);
>>> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>>> +		struct drm_gpu_scheduler *sched;
>>> +
>>> +		sched = panfrost_job_get_sched(ctx->pfdev, i);
>>> +		ret = drm_sched_entity_init(&queue->sched_entity[i],
>>> +					    sched_prio, &sched, 1, NULL);
>>> +		if (ret)
>>> +			break;
>>> +	}
>>> +
>>> +	if (ret) {
>>> +		for (i--; i >= 0; i--)
>>> +			drm_sched_entity_destroy(&queue->sched_entity[i]);
>>> +
>>> +		return ERR_PTR(ret);
>>> +	}
>>> +
>>> +	kref_init(&queue->refcount);
>>> +	idr_lock(&ctx->queues);
>>> +	ret = idr_alloc(&ctx->queues, queue, 0, INT_MAX, GFP_KERNEL);  
>>
>> This makes lockdep complain. idr_lock() is a spinlock and GFP_KERNEL can
>> sleep. So either we need to bring our own mutex here or not use GFP_KERNEL.
>>
> 
> Ouch! I wonder why I don't see that (I have lockdep enabled, and the
> igt tests should have exercised this path).

Actually I'm not sure it technically lockdep - have you got
CONFIG_DEBUG_ATOMIC_SLEEP set?

Steve
