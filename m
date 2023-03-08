Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292886B0C65
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF62F10E0FE;
	Wed,  8 Mar 2023 15:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEE310E0FE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 622BA41F78;
 Wed,  8 Mar 2023 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678288709;
 bh=LmsELnvNppKSIw1uomPRrZaTWF5g2NJzpFeIFnsgn7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=uVC2jkrfjynzQsvbHySQcGCPBDD9vbROb59eRCFeeK0zHteVuDaP6C66Myomr6ebM
 wcZNCfcUMgFYTj0A+Z/rIZPCJgq7MnRspLTSC9sVCRbHfu63XvS5MSTtYd/lS4JjcH
 iJGKN6nAAkyQSWzR3MohpsI6j8burzsd1HZWV/Y/52Su2g4eg6NoP1j5yDSTSHwOhf
 Zu8b4F4wXYXhav8jDRjTja4TUIjRa3HyCFtSB0H4ickQZf+MKApr55owkDRzWJlQq1
 XNw5xC+L3KtOCfrhU0ISWaAFU277dHEDb4MeYA/KeWwgZEyFu+ZD64oyltslT1BMKA
 qCvhRk7brj5Qw==
Message-ID: <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
Date: Thu, 9 Mar 2023 00:18:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <585fa052-4eff-940e-b307-2415c315686a@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2023 19.03, Christian König wrote:
> Am 08.03.23 um 10:57 schrieb Maarten Lankhorst:
>>
>> On 2023-03-07 15:25, Asahi Lina wrote:
>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>> causes segfaults and other badness when job completion fences are
>>> signaled after the scheduler is torn down.
>>>
>>> Explicitly detach all jobs from their completion callbacks and free
>>> them. This makes it possible to write a sensible safe abstraction for
>>> drm_sched, without having to externally duplicate the tracking of
>>> in-flight jobs.
>>>
>>> This shouldn't regress any existing drivers, since calling
>>> drm_sched_fini() with any pending jobs is broken and this change should
>>> be a no-op if there are no pending jobs.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 27 
>>> +++++++++++++++++++++++++--
>>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 5c0add2c7546..0aab1e0aebdd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1119,10 +1119,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>   {
>>>       struct drm_sched_entity *s_entity;
>>> +    struct drm_sched_job *s_job, *tmp;
>>>       int i;
>>>   -    if (sched->thread)
>>> -        kthread_stop(sched->thread);
>>> +    if (!sched->thread)
>>> +        return;
>>> +
>>> +    /*
>>> +     * Stop the scheduler, detaching all jobs from their hardware 
>>> callbacks
>>> +     * and cleaning up complete jobs.
>>> +     */
>>> +    drm_sched_stop(sched, NULL);
>>> +
>>> +    /*
>>> +     * Iterate through the pending job list and free all jobs.
>>> +     * This assumes the driver has either guaranteed jobs are 
>>> already stopped, or that
>>> +     * otherwise it is responsible for keeping any necessary data 
>>> structures for
>>> +     * in-progress jobs alive even when the free_job() callback is 
>>> called early (e.g. by
>>> +     * putting them in its own queue or doing its own refcounting).
>>> +     */
>>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>> +        spin_lock(&sched->job_list_lock);
>>> +        list_del_init(&s_job->list);
>>> +        spin_unlock(&sched->job_list_lock);
>>> +        sched->ops->free_job(s_job);
>>> +    }
>>
>> I would stop the kthread first, then delete all jobs without spinlock 
>> since nothing else can race against sched_fini?
>>
>> If you do need the spinlock, It would need to guard 
>> list_for_each_entry too.
> 
> Well this case here actually should not happen in the first place.

"This should not happen in the first place" is how you end up with C
APIs that have corner cases that lead to kernel oopses...

The idea with Rust abstractions is that it needs to be actually
impossible to create memory safety problems for the user of the
abstraction, you can't impose arbitrary constraints like "you must wait
for all jobs to finish before destroying the scheduler"... it needs to
be intrinsically safe.

> Jobs depend on their device, so as long as there are jobs there should 
> also be a reference to the scheduler.

These schedulers are created dynamically per userspace queue. The memory
management and reference counting involved make it safe to destroy the
scheduler even when behind the scenes hardware jobs are still running,
as long as drm_sched itself doesn't crash on fences firing without a
scheduler (which is what this patch fixes).

This is the power of Rust: it forces you to architect your code in a way
that you don't have complex high-level dependencies that span the entire
driver and are difficult to prove hold. In my driver, you can kill a
process and that destroys the drm_sched, closes all GEM objects,
everything, even if the GPU is still running jobs from that process. The
worst that can happen is that the GPU faults as in-use userspace buffers
are unmapped out from under the running user job, but that's fine (GPU
faults are recoverable). The actual firmware resources, queues, etc. in
use are all kept alive until the commands finish executing (or fault,
which is just an abnormal completion), even if the userspace process
that owned them is long gone. I've tested this extensively by doing
things like large-resolution glmark runs in a loop that get `kill -9`'d
repeatedly, and it works very well! Tons of GPU faults but no firmware
crashes, no oopses, nothing. And the firmware *will* crash irrecoverably
if anything goes wrong with its shared memory structures, so that it
doesn't is pretty good evidence that all this works!

> What could be is that you have allocated a scheduler instance 
> dynamically, but even then you should first tear down all entities and 
> then the scheduler.

This is about creating a safe Rust abstraction, so we can't impose
requirements on users like that, the abstraction has to take care of it.
Unfortunately, the jobs cannot depend on the scheduler at the
abstraction level. I tried that (putting a reference counted reference
to the scheduler in the job abstraction), but it doesn't work because a
job completing can end up dropping the last reference to the scheduler,
and then you end up trying to stop and clean up the scheduler from a
callback called from the scheduler kthread itself, which deadlocks. We
could throw those cleanups into a workqueue or something, but that's
just adding bandages around the problem that the drm_sched interface
today is just not safe without this patch...

Right now, it is not possible to create a safe Rust abstraction for
drm_sched without doing something like duplicating all job tracking in
the abstraction, or the above backreference + deferred cleanup mess, or
something equally silly. So let's just fix the C side please ^^

So far, drm_sched is the only DRM API that has had such a fundamental
API safety issue that I had to make a change like this to the C to make
the Rust abstraction possible/reasonable... drm_sched has also been by
far the hardest DRM component API to understand from a safety point of
view, with the most inconsistent documentation about what the
ownership/freeing rules are, and what objects need to outlive what other
objects (I had to just read the code to figure most of this out). That's
also one nice outcome of writing Rust abstractions: it forces us to make
all these rules and invariants explicit, instead of leaving them as
unwritten assumptions (almost nobody consistently documents this in C
APIs...).

If I got it right, anyone using the Rust drm_sched abstraction doesn't
have to worry about this any more because if they do something that
would oops with it, their code won't compile. But I need this patch to
be able to make that guarantee...

~~ Lina
