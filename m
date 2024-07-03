Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C39264D5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8958710E932;
	Wed,  3 Jul 2024 15:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8377D10E93F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:29:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2571B367;
 Wed,  3 Jul 2024 08:29:29 -0700 (PDT)
Received: from [10.1.37.29] (e122027.cambridge.arm.com [10.1.37.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C5E3F762;
 Wed,  3 Jul 2024 08:29:02 -0700 (PDT)
Message-ID: <157b20fa-078a-479c-bb40-017d16d55c21@arm.com>
Date: Wed, 3 Jul 2024 16:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support fdinfo runtime and memory stats on Panthor
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
 <ae1ec268-fd76-48b5-94f9-761565153e12@arm.com>
 <uzsqh2b3j7hp6z3zcjcsxxudt2sucgutzwof5bhsvjjaeusigy@wvfhibqtyz4y>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <uzsqh2b3j7hp6z3zcjcsxxudt2sucgutzwof5bhsvjjaeusigy@wvfhibqtyz4y>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2024 12:23, Adrián Larumbe wrote:
> Hi Steven,
> 
> On 13.06.2024 16:28, Steven Price wrote:
>> On 06/06/2024 01:49, Adrián Larumbe wrote:
>>> This patch series enables userspace utilities like gputop and nvtop to
>>> query a render context's fdinfo file and figure out rates of engine
>>> and memory utilisation.
>>>
>>> Previous discussion can be found at
>>> https://lore.kernel.org/dri-devel/20240423213240.91412-1-adrian.larumbe@collabora.com/
>>>
>>> Changelog:
>>> v3:
>>>  - Fixed some nits and removed useless bounds check in panthor_sched.c
>>>  - Added support for sysfs profiling knob and optional job accounting
>>>  - Added new patches for calculating size of internal BO's
>>> v2:
>>>  - Split original first patch in two, one for FW CS cycle and timestamp
>>>  calculations and job accounting memory management, and a second one
>>>  that enables fdinfo.
>>>  - Moved NUM_INSTRS_PER_SLOT to the file prelude
>>>  - Removed nelem variable from the group's struct definition.
>>>  - Precompute size of group's syncobj BO to avoid code duplication.
>>>  - Some minor nits.
>>>
>>>
>>> Adrián Larumbe (7):
>>>   drm/panthor: introduce job cycle and timestamp accounting
>>>   drm/panthor: add DRM fdinfo support
>>>   drm/panthor: enable fdinfo for memory stats
>>>   drm/panthor: add sysfs knob for enabling job profiling
>>>   drm/panthor: support job accounting
>>>   drm/drm_file: add display of driver's internal memory size
>>>   drm/panthor: register size of internal objects through fdinfo
>>
>> The general shape of what you end up with looks correct, but these
>> patches are now in a bit of a mess. It's confusing to review when the
>> accounting is added unconditionally and then a sysfs knob is added which
>> changes it all to be conditional. Equally that last patch (register size
>> of internal objects through fdinfo) includes a massive amount of churn
>> moving everything into an 'fdinfo' struct which really should be in a
>> separate patch.
> 
> I do agree with you in that perhaps too many things change across successive
> patches in the series. I think I can explain this because of the way the series
> has evolved thorugh successive revisions.
> 
> In the last one of them, only the first three patches were present, and both
> Liviu and Boris seemed happy with the shape they had taken, but then Boris
> suggested adding the sysfs knob and optional profiling support rather than
> submitting them as part of a different series like I had done in Panfrost. In
> that spirit, I decided to keep the first three patches intact.
> 
> The last two patches are a bit more of an afterthought, and because they touch
> on the drm fdinfo core, I understood they were more likely to be rejected for
> now, at least until consensus with Tvrtko and other people involved in the
> development of fdinfo had agreed on a way to report internal bo sizes.  However,
> being also part of fdinfo, I thought this series was a good place to spark a
> debate about them, even if they don't seem as seamlessly linked with the rest
> of the work.
> 
>> Ideally this needs to be reworked into a logical series of patches with
>> knowledge of what's coming next. E.g. the first patch could introduce
>> the code for cycle/timestamp accounting but leave it disabled to be then
>> enabled by the sysfs knob patch.
>>
>> One thing I did notice though is that I wasn't seeing the GPU frequency
>> change, looking more closely at this it seems like there's something
>> dodgy going on with the devfreq code. From what I can make out I often
>> end up in a situation where all contexts are idle every time tick_work()
>> is called - I think this is simply because tick_work() is scheduled with
>> a delay and by the time the delay has hit the work is complete. Nothing
>> to do with this series, but something that needs looking into. I'm on
>> holiday for a week but I'll try to look at this when I'm back.
> 
> Would you mind sharing what you do in UM to trigger this behaviour and also
> maybe the debug traces you've written into the driver to confirm this?

Debugging is tricky as adding a printk() completely changes the timing. 
My hack was just to record the count of calls to 
panthor_devfreq_record_{busy,idle}() and output that along with the 
debug message. See below.

With that change I could see that when glmark I was seeing a number of 
calls to idle(), but rarely any calls to busy(). This obviously causes 
devfreq to sit at the lowest possible frequency. A possible fix is as 
simple as:

----8<----
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 79ffcbc41d78..42929e147107 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2926,6 +2926,7 @@ queue_run_job(struct drm_sched_job *sched_job)
                        pm_runtime_get(ptdev->base.dev);
                        sched->pm.has_ref = true;
                }
+               panthor_devfreq_record_busy(sched->ptdev);
        }
 
        done_fence = dma_fence_get(job->done_fence);
----8<----

With that I see roughly as many calls to busy() as idle() and devfreq scales the GPU 
frequency up as expected.

Steve

----8<----
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index c6d3c327cc24..bfc06e58fff5 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -31,6 +31,8 @@ struct panthor_devfreq {
 	/** @time_last_update: Last update time. */
 	ktime_t time_last_update;
 
+	int counta, counti;
+
 	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
 	bool last_busy_state;
 
@@ -76,6 +78,8 @@ static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
 {
 	pdevfreq->busy_time = 0;
 	pdevfreq->idle_time = 0;
+	pdevfreq->counta = 0;
+	pdevfreq->counti = 0;
 	pdevfreq->time_last_update = ktime_get();
 }
 
@@ -97,14 +101,17 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 
 	status->busy_time = ktime_to_ns(pdevfreq->busy_time);
 
+	int counta = pdevfreq->counta;
+	int counti = pdevfreq->counti;
+
 	panthor_devfreq_reset(pdevfreq);
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 
-	drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
+	printk("busy %lu total %lu %lu %% freq %lu MHz count=%da,%di\n",
 		status->busy_time, status->total_time,
 		status->busy_time / (status->total_time / 100),
-		status->current_frequency / 1000 / 1000);
+		status->current_frequency / 1000 / 1000, counta,counti);
 
 	return 0;
 }
@@ -262,6 +269,7 @@ void panthor_devfreq_record_busy(struct panthor_device *ptdev)
 
 	panthor_devfreq_update_utilization(pdevfreq);
 	pdevfreq->last_busy_state = true;
+	pdevfreq->counta++;
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
@@ -278,6 +286,7 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
 
 	panthor_devfreq_update_utilization(pdevfreq);
 	pdevfreq->last_busy_state = false;
+	pdevfreq->counti++;
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
