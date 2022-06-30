Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B8561E03
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37FA1132A1;
	Thu, 30 Jun 2022 14:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52395112A35;
 Thu, 30 Jun 2022 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656599667; x=1688135667;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=crOZD7V4ZX3FEAarkbR7Sp/bHKjgCb3lUrH+0mhBeX0=;
 b=mtehrtepXeBXGckpJcewt7l+kF+2W8A7xxGSuQER9kyyuuQ6keQvkzKQ
 wwq1QdTMKTLrAwEU/N8rh1EDUz4FAdC6DilQU0M+8o5V7QkfnIjKiLmwZ
 bmD4g0iG5Xkg3BzO09bLhYHIL8Tuj3UibTUmj7AFTnXCIg1BZFe5SPWE5
 b1JTe5+4OjUY77bRK4K1lfiOC8/tRrLu/Os0n8/7ETyAdySd2BWCdWLbp
 7zT+pjDrbd3NjucTVZlgBITzFMono6un2MJLZKJHzUdR7v5jtf/dpSdiy
 v5KJxjlgVyNIiCL76dza1ArvDja08a+rNTaX7h2Cx8fzzV+d+92hIqAYH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262767760"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="262767760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:34:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="647914615"
Received: from fdugast-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.39.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:34:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: How to convert drivers/gpu/drm/i915/ to use local workqueue?
In-Reply-To: <Yr2sJBdZ3TnXZF+s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
 <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
 <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
 <703244a5-f2c9-adfb-892f-dd2353cf384e@linux.intel.com>
 <f15c7336-10fd-cd86-a95f-aec99154319b@I-love.SAKURA.ne.jp>
 <b21d9f1e-65e3-8f2f-a5c3-04bf866823e3@linux.intel.com>
 <Yr2sJBdZ3TnXZF+s@intel.com>
Date: Thu, 30 Jun 2022 17:34:22 +0300
Message-ID: <87wncynrtd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jun 2022, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Jun 30, 2022 at 02:09:02PM +0100, Tvrtko Ursulin wrote:
>> 
>> On 30/06/2022 12:19, Tetsuo Handa wrote:
>> > On 2022/06/30 19:17, Tvrtko Ursulin wrote:
>> > > Could you give more context on reasoning here please? What is the difference
>> > > between using the system_wq and flushing it from a random context? Or concern
>> > > is about flushing from specific contexts?
>> > 
>> > Excuse me, but I couldn't catch what you want. Thus, I show three patterns of
>> > problems with an example.
>> > 
>> > Commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a macro") says:
>> > 
>> >    Tejun Heo commented that it makes no sense at all to call flush_workqueue()
>> >    on the shared WQs as the caller has no idea what it's gonna end up waiting for.
>> > 
>> >    The "Think twice before calling this function! It's very easy to get into trouble
>> >    if you don't take great care." warning message does not help avoiding problems.
>> > 
>> >    Let's change the direction to that developers had better use their local WQs
>> >    if flush_scheduled_work()/flush_workqueue(system_*_wq) is inevitable.
>> > 
>> > Three patterns of problems are:
>> > 
>> >    (a) Flushing from specific contexts (e.g. GFP_NOFS/GFP_NOIO) can cause deadlock
>> >        (circular locking dependency) problem.
>> > 
>> >    (b) Flushing with specific locks (e.g. module_mutex) held can cause deadlock
>> >        (circular locking dependency) problem.
>> > 
>> >    (c) Even if there is no possibility of deadlock, flushing with specific locks
>> >        held can cause khungtaskd to complain.
>> > 
>> > An example of (a):
>> > 
>> >    ext4 filesystem called flush_scheduled_work(), which meant to wait for only
>> >    work item scheduled by ext4 filesystem, tried to also wait for work item
>> >    scheduled by 9p filesystem.
>> >    https://syzkaller.appspot.com/bug?extid=bde0f89deacca7c765b8
>> > 
>> >    Fixed by reverting the problematic patch.
>> > 
>> > An example of (b):
>> > 
>> >    It is GFP_KERNEL context when module's __exit function is called. But whether
>> >    flush_workqueue() is called from restricted context depends on what locks does
>> >    the module's __exit function hold.
>> > 
>> >    If request_module() is called from some work function using one of system-wide WQs,
>> >    and flush_workqueue() is called on that WQ from module's __exit function, the kernel
>> >    might deadlock on module_mutex lock. Making sure that flush_workqueue() is not called
>> >    on system-wide WQs is the safer choice.
>> > 
>> >    Commit 1b3ce51dde365296 ("Input: psmouse-smbus - avoid flush_scheduled_work() usage")
>> >    is for drivers/input/mouse/psmouse-smbus.c .
>> > 
>> > An example of (c):
>> > 
>> >    ath9k driver calls schedule_work() via request_firmware_nowait().
>> >    https://syzkaller.appspot.com/bug?id=78a242c8f1f4d15752c8ef4efc22974e2c52c833
>> > 
>> >    ath6kl driver calls flush_scheduled_work() which needlessly waits for completion
>> >    of works scheduled by ath9k driver (i.e. loading firmware used by ath9k driver).
>> >    https://syzkaller.appspot.com/bug?id=10a1cba59c42d11e12f897644341156eac9bb7ee
>> > 
>> >    Commit 4b2b8e748467985c ("ath6kl: avoid flush_scheduled_work() usage") in linux-next.git
>> >    might be able to mitigate these problems. (Waiting for next merge window...)
>> 
>> Okay, from 1b3ce51dde365296:
>> 
>>  "Flushing system-wide workqueues is dangerous and will be forbidden."
>> 
>> Thank you, this exactly explains the motivation which is what I was after. I
>> certainly agree there is a possibility for lock coupling via the shared wq
>> so that is fine by me.
>> 
>> > > On the i915 specifics, the caller in drivers/gpu/drm/i915/gt/selftest_execlists.c
>> > > I am pretty sure can be removed. It is synchronized with the error capture side of
>> > > things which is not required for the test to work.
>> > > 
>> > > I can send a patch for that or you can, as you prefer?
>> > 
>> > OK. Please send a patch for that, for that patch will go linux-next.git tree via
>> > a tree for gpu/drm/i915 driver.
>> 
>> Patch sent. If I am right the easiest solution was just to remove the flush.
>> If I was wrong though I'll need to create a dedicated wq so we will see what
>> our automated CI will say.
>
> But besides of flush_scheduled_work() it looks like
> we also need to take care of the flush_workqueue() calls, no?!
>
> * i915_gem_drain_workqueue()
> * intel_ggtt.c:   flush_workqueue(ggtt->vm.i915->wq);
> * i915_gem_pm.c: flush_workqueue(i915->wq);
>
> and the display ones for
> dev_priv->modeset_wq
> i915->flip_wq
>
> besides the flush_scheduled_work in intel_modeset_driver_remove_noirq

I thought the problem was flushing the system-wide workqueues. The above
calls flush our own.

As to removing flush_scheduled_work() from
intel_modeset_driver_remove_noirq(), I think we'll need to account for
all the work and delayed work we've scheduled on the system workqueue,
i.e. we need to cancel or flush each of them individually, as
necessary. Some of them we do already, but some others, not really.

For example we never cancel the fbc underrun work on the driver remove
path AFAICT. And it's not even as simple as just adding the
cancel_work_sync(&fbc->underrun_work) call in intel_fbc_cleanup(),
because intel_fbc_cleanup() is called *after*
intel_mode_config_cleanup(), i.e. the work function might get called
after the crtc it accesses has been destroyed. So we're going to need to
change the cleanup order too.

Things have changed considerably since the flush was added in
1630fe754c83 ("drm/i915: Perform intel_enable_fbc() from a delayed
task").

I suppose the alternative is to have a local i915 display workqueue,
schedule all the random display works and delayed works on that, and
then flush that wq instead of the system wq in
intel_modeset_driver_remove_noirq().

IIUC, anyway.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
