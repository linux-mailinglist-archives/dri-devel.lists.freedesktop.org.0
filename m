Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795136E7721
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FDB10E91B;
	Wed, 19 Apr 2023 10:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C50810E919
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:05:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6BB106F;
 Wed, 19 Apr 2023 03:06:32 -0700 (PDT)
Received: from [10.57.20.93] (unknown [10.57.20.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 777643F6C4;
 Wed, 19 Apr 2023 03:05:47 -0700 (PDT)
Message-ID: <12a775f5-a4fe-6a61-c187-fb3afa0ab6e2@arm.com>
Date: Wed, 19 Apr 2023 11:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
To: Lucas Stach <l.stach@pengutronix.de>, Danilo Krummrich <dakr@redhat.com>, 
 luben.tuikov@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20230418100453.4433-1-dakr@redhat.com>
 <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
 <04f039ac71f3c0685a849b492478d18ec6ea4d11.camel@pengutronix.de>
 <dcd957cf-8e26-11f1-2ac1-0fdd8541eed3@arm.com>
In-Reply-To: <dcd957cf-8e26-11f1-2ac1-0fdd8541eed3@arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 10:53, Steven Price wrote:
> On 19/04/2023 10:44, Lucas Stach wrote:
>> Hi Steven,
>>
>> Am Mittwoch, dem 19.04.2023 um 10:39 +0100 schrieb Steven Price:
>>> On 18/04/2023 11:04, Danilo Krummrich wrote:
>>>> It already happend a few times that patches slipped through which
>>>> implemented access to an entity through a job that was already removed
>>>> from the entities queue. Since jobs and entities might have different
>>>> lifecycles, this can potentially cause UAF bugs.
>>>>
>>>> In order to make it obvious that a jobs entity pointer shouldn't be
>>>> accessed after drm_sched_entity_pop_job() was called successfully, set
>>>> the jobs entity pointer to NULL once the job is removed from the entity
>>>> queue.
>>>>
>>>> Moreover, debugging a potential NULL pointer dereference is way easier
>>>> than potentially corrupted memory through a UAF.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>
>>> This triggers a splat for me (with Panfrost driver), the cause of which
>>> is the following code in drm_sched_get_cleanup_job():
>>>
>>> 	if (job) {
>>> 		job->entity->elapsed_ns += ktime_to_ns(
>>> 			ktime_sub(job->s_fence->finished.timestamp,
>>> 				  job->s_fence->scheduled.timestamp));
>>> 	}
>>>
>>> which indeed is accessing entity after the job has been returned from
>>> drm_sched_entity_pop_job(). And obviously job->entity is a NULL pointer
>>> with this patch.
>>>
>>> I'm afraid I don't fully understand the lifecycle so I'm not sure if
>>> this is simply exposing an existing bug in drm_sched_get_cleanup_job()
>>> or if this commit needs to be reverted.
>>>
>> Not sure which tree you are on. The offending commit has been reverted
>> in 6.3-rc5.
> 
> This is in drm-misc-next - I'm not sure which "offending commit" you are
> referring to. I'm referring to:
> 
> 96c7c2f4d5bd ("drm/scheduler: set entity to NULL in
> drm_sched_entity_pop_job()")
> 
> which was merged yesterday to drm-misc-next (and is currently the top
> commit).
> 
> Is there another commit which has been reverted elsewhere which is
> conflicting?

Answering my own question, the conflicting commit is:

baad10973fdb ("Revert "drm/scheduler: track GPU active time per entity"")

But that commit isn't (yet) in drm-misc-next. Which unfortunately means
drm-misc-next is broken until a back-merge happens.

Steve

