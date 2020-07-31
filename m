Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC823A0E4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4E36E21A;
	Mon,  3 Aug 2020 08:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC5D6EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 17:28:05 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:23eb::994] (unknown
 [IPv6:2804:431:e7dc:23eb::994])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C3B8D298919;
 Fri, 31 Jul 2020 18:27:59 +0100 (BST)
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Melissa Wen <melissa.srw@gmail.com>, Sidong Yang <realwakka@gmail.com>
References: <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <CAJeY4oGXbNbFQtBXSi8xo_mk48G1K7TOvxPqvRKFxGQxRnY=Wg@mail.gmail.com>
 <CAKMK7uEj=Se=cNwkapZtRLjrDAHpjJU_oOL7Y-2HyUaPn8vBnQ@mail.gmail.com>
 <20200730100901.daos4v6maqlcd2uj@smtp.gmail.com>
 <20200731090834.GR6419@phenom.ffwll.local> <20200731161314.GA21381@realwakka>
 <20200731164706.r62jjqu7nu3spyhx@smtp.gmail.com>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <a74502c1-2c75-d2e1-586c-998dcb836e0b@collabora.com>
Date: Fri, 31 Jul 2020 14:29:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731164706.r62jjqu7nu3spyhx@smtp.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com
Content-Type: multipart/mixed; boundary="===============0488183952=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0488183952==
Content-Type: multipart/alternative;
 boundary="------------2E546BA7EFAF17C0FDFC82D5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2E546BA7EFAF17C0FDFC82D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everybody!

I'm currently working on a writeback connector screenshooter for Weston. 
In order
to test it, I'm using VKMS with Rodrigo's writeback connector patch 
<https://lkml.org/lkml/2020/5/11/449>.Here is the
link with the MR in Weston 
<https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/458> 
with more details of how I've tested it.

The reason why I'm writing this is that in the first writeback connector 
screenshot
VKMSgets stuck. And I believe (from what I've tried to debug) that what 
happens is
that thewriteback job gets stuck in the queue waiting for a vsync 
signal. Then from
the second screenshot on everything works fine. So I believe this is 
related to this
issue somehow.

Melissa's idea to add drm_crtc_vblank_put(crtc) made it work, although 
VKMS started
to print this warn message:

WARNING: CPU: 0 PID: 168 at drivers/gpu/drm/vkms/vkms_crtc.c:21 
vkms_vblank_simulate+0x101/0x110

I've decided to share this info with you, as it may help you somehow. 
I'm also
investigating to help understand what is happening.

Thanks,
Leandro Ribeiro

On 7/31/20 1:47 PM, Melissa Wen wrote:
> On 07/31, Sidong Yang wrote:
>> On Fri, Jul 31, 2020 at 11:08:34AM +0200, daniel@ffwll.ch wrote:
>>> On Thu, Jul 30, 2020 at 07:09:25AM -0300, Melissa Wen wrote:
>>>> On 07/29, Daniel Vetter wrote:
>>>>> On Wed, Jul 29, 2020 at 9:09 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>>>>>> Melissa Wen
>>>>>>
>>>>>> On Sat, Jul 25, 2020 at 3:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>> On Sat, Jul 25, 2020 at 7:45 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>>>>>>>> On 07/25, Daniel Vetter wrote:
>>>>>>>>> On Sat, Jul 25, 2020 at 5:12 AM Sidong Yang <realwakka@gmail.com> wrote:
>>>>>>>>>> On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
>>>>>>>>>>> On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>>>>>>>>>>>> On 07/22, daniel@ffwll.ch wrote:
>>>>>>>>>>>>> On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
>>>>>>>>>>>>>> This patch adds a missing drm_crtc_vblank_put op to the pair
>>>>>>>>>>>>>> drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> It clears the execution of the following kms_cursor_crc subtests:
>>>>>>>>>>>>>> 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
>>>>>>>>>>>>>>     random, fast-moving])] - successful when running individually.
>>>>>>>>>>>>>> 2. pipe-A-cursor-dpms passes again
>>>>>>>>>>>>>> 3. pipe-A-cursor-suspend also passes
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The issue was initially tracked in the sequential execution of IGT
>>>>>>>>>>>>>> kms_cursor_crc subtest: when running the test sequence or one of its
>>>>>>>>>>>>>> subtests twice, the odd execs complete and the pairs get stuck in an
>>>>>>>>>>>>>> endless wait. In the IGT code, calling a wait_for_vblank before the start
>>>>>>>>>>>>>> of CRC capture prevented the busy-wait. But the problem persisted in the
>>>>>>>>>>>>>> pipe-A-cursor-dpms and -suspend subtests.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Checking the history, the pipe-A-cursor-dpms subtest was successful when,
>>>>>>>>>>>>>> in vkms_atomic_commit_tail, instead of using the flip_done op, it used
>>>>>>>>>>>>>> wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
>>>>>>>>>>>>>> enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
>>>>>>>>>>>>>> blocking in the 2nd start of CRC capture, which may indicate that
>>>>>>>>>>>>>> something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
>>>>>>>>>>>>>> the crc setup was able to sync things and free all kms_cursor_crc
>>>>>>>>>>>>>> subtests.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Tracing and comparing a clean run with a blocked one:
>>>>>>>>>>>>>> - in a clean one, vkms_crtc_atomic_flush enables vblanks;
>>>>>>>>>>>>>> - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
>>>>>>>>>>>>>> started. Moreover, a series of vkms_vblank_simulate flow out until
>>>>>>>>>>>>>> disabling vblanks.
>>>>>>>>>>>>>> Also watching the steps of vkms_crtc_atomic_flush, when the very first
>>>>>>>>>>>>>> drm_crtc_vblank_get returned an error, the subtest crashed. On the other
>>>>>>>>>>>>>> hand, when vblank_get succeeded, the subtest completed. Finally, checking
>>>>>>>>>>>>>> the flush steps: it increases counter to hold a vblank reference (get),
>>>>>>>>>>>>>> but there isn't a op to decreased it and release vblanks (put).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>>>>>>>>> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>>>>>>>>>>>>>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>>>>>>>>>>>>>> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>   drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
>>>>>>>>>>>>>>   1 file changed, 1 insertion(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>>>>>>>>>>>>>> index ac85e17428f8..a99d6b4a92dd 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>>>>>>>>>>>>>> @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>              spin_unlock(&crtc->dev->event_lock);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +           drm_crtc_vblank_put(crtc);
>>>>>>>>>>>>> Uh so I reviewed this a bit more carefully now, and I dont think this is
>>>>>>>>>>>>> the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
>>>>>>>>>>>>>
>>>>>>>>>>>>>   * Caller must hold a vblank reference for the event @e acquired by a
>>>>>>>>>>>>>   * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
>>>>>>>>>>>>> for us. And that's the only case where we successfully acquired a vblank
>>>>>>>>>>>>> interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
>>>>>>>>>>>>> success for that function, failure negative error number) we directly send
>>>>>>>>>>>>> out the event.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So something else fishy is going on, and now I'm totally confused why this
>>>>>>>>>>>>> even happens.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
>>>>>>>>>>>>> we don't underflow the refcount, so it's also not that I think (except if
>>>>>>>>>>>>> this patch creates more WARNING backtraces).
>>>>>>>>>>>>>
>>>>>>>>>>>>> But clearly it changes behaviour somehow ... can you try to figure out
>>>>>>>>>>>>> what changes? Maybe print out the vblank->refcount at various points in
>>>>>>>>>>>>> the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
>>>>>>>>>>>>> is enabled/disabled ...
>>>>>>>>>>>> :(
>>>>>>>>>>>>
>>>>>>>>>>>> I can check these, but I also have other suspicions. When I place the
>>>>>>>>>>>> drm_crct_vblank_put out of the if (at the end of flush), it not only solve
>>>>>>>>>>>> the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
>>>>>>>>>>>> doesn't appear anymore (a total cleanup). Just after:
>>>>>>>>>>>>
>>>>>>>>>>>> vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
>>>>>>>>>>>>
>>>>>>>>>>>> looks like there is something stuck around here.
>>>>>>>>>>> Hm do you have the full WARNING for this? Maybe this gives me an idea
>>>>>>>>>>> what's going wrong.
>>>>>>>>>>>
>>>>>>>>>>>> Besides, there is a lock at atomic_begin:
>>>>>>>>>>>>
>>>>>>>>>>>>    /* This lock is held across the atomic commit to block vblank timer
>>>>>>>>>>>>     * from scheduling vkms_composer_worker until the composer is updated
>>>>>>>>>>>>     */
>>>>>>>>>>>>    spin_lock_irq(&vkms_output->lock);
>>>>>>>>>>>>
>>>>>>>>>>>> that seems to be released on atomic_flush and make me suspect something
>>>>>>>>>>>> missing on the composer update.
>>>>>>>>>>> atomic_begin/atomic_flush are symmetric functions an always called
>>>>>>>>>>> around all the plane updates. So having the spin_lock in _begin and
>>>>>>>>>>> the spin_unlock in _flush should be symmetric and correct.
>>>>>>>>>>>
>>>>>>>>>>> If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
>>>>>>>>>>> should immmediately give you a huge splat in dmesg if there's anything
>>>>>>>>>>> unbalanced with locking.
>>>>>>>>>>>
>>>>>>>>>>>> I'll check all these things and come back with news (hope) :)
>>>>>>>>>>> Have fun chasing stuff :-)
>>>>>>>>>>>
>>>>>>>>>>> Cheers, Daniel
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>
>>>>>>>>>>>> Melissa
>>>>>>>>>>>>> I'm totally confused about what's going on here now.
>>>>>>>>>>>>> -Daniel
>>>>>>>>>> Hi Daniel, Melissa.
>>>>>>>>>> I found something about this problem.
>>>>>>>>>> I traced vblank->refcount that it's important in the problem.
>>>>>>>>>> In normal case, first test run calls commit_tail() and enable vblank in
>>>>>>>>>> atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.
>>>>>>>>>>
>>>>>>>>>> in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
>>>>>>>>>> called by atomic_disable. in this function vblank's refcount was increased for
>>>>>>>>>> prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
>>>>>>>>>> and refcount goes one not zero for next test run.
>>>>>>>>>>
>>>>>>>>>> and next test run, drm_vblank_get() was called but it didn't enable vblank
>>>>>>>>>> because refcount was already one. drm_crtc_vblank_on() was called in next. but
>>>>>>>>>> it didn't enable vblank but just increase refcount only.
>>>>>>>>>>
>>>>>>>>>> I think this is why this problem happen. don't know how to fix this correctly.
>>>>>>>>>> should we force to enable vblank after enabling crtc?
>>>>>>>>> Hm, between drm_crtc_vblank_off and drm_crtc_vblank_on
>>>>>>>>> drm_crtc_vblank_get should fail (and leave the refcount unchanged).
>>>>>>>>> It's convoluted logic, but the check for vblank->enabled should catch
>>>>>>>>> that and return -EINVAL for this case. Does that not happen?
>>>>>>>>>
>>>>>>>>> It would indeed explain the bug (I think, I've been wrong way too many
>>>>>>>>> times with this).
>>>>>>>>> -Daniel
>>>>>>>>>
>>>>>>>> Hi Daniel and Sidong,
>>>>>>>>
>>>>>>>> I don't know if it will be confusing, but I will try to explain in a
>>>>>>>> little more detail (and newbie way) what I saw in this behavior of the
>>>>>>>> refcount (similar to what Sidong evaluated).
>>>>>>>>
>>>>>>>> 1. Starting with the loading of vkms is:
>>>>>>>> In vkms_init:
>>>>>>>> After drm_vblank_init (refcount=0), it calls:
>>>>>>>> vkms_modeset_init
>>>>>>>> --> vkms_output_init
>>>>>>>> ----> drm_mode_config_reset
>>>>>>>> -------> vkms_atomic_crtc_reset
>>>>>>>> (even more inside)--> drm_crtc_vblank_reset that bumps the refcount to
>>>>>>>> prevent vblank_get to enable vblank (refcount=1)
>>>>>>>>
>>>>>>>> 2. So, when we start a subtest, vblank is still disabled and in
>>>>>>>> commit_tail, commit_planes triggers a atomic_begin/flush->vblank_get that
>>>>>>>> return -EINVAL because !vblank->enabled (refcount ends 1) and send_vblank;
>>>>>>>> however the test fails before atomic_enable decrements refcount to 0 and
>>>>>>>> reset timestamp.
>>>>>>>> ** This warning also appears in this very first running:
>>>>>>>> WARNING: CPU: 0 PID: 708 at drivers/gpu/drm/vkms/vkms_crtc.c:91 vkms_get_vblank_timestamp+0x41/0x50 [vkms]
>>>>>>> Hm yeah I guess that's something we should paper over a bit, but maybe
>>>>>>> the bugfix will take care of that.
>>>>>>>
>>>>>>>> In the end, this sequence modeset_disable -> atomic_begin ->
>>>>>>>> atomic_flush: refcount going from 0 to 1 and than drm_vblank_enable
>>>>>>>> prepares to everything going well in the next subtest (because
>>>>>>>> atomic_disable is not called).
>>>>>>>>
>>>>>>>> 3. It could be nice, but in the next subtest (with success), as refcount +
>>>>>>>> vblank_enabled ok, after doind its job, it calls
>>>>>>>> atomic_disable->vblank_off and here refcount ends 1 and vblank disabled
>>>>>>>> (the problem returns).
>>>>>>>> So, we have a kind of good turn and bad turn.
>>>>>>>>
>>>>>>>> I tried different things, but the only relatively stable result was
>>>>>>>> putting the sequence modeset_disable + modeset_enables + commit_planes in
>>>>>>>> the commit_tail. That didn't convince me and then I keep trying things.
>>>>>>> This actually sounds like a good idea, I had the same one. Doing it
>>>>>>> this way should also resolve the WARNING you've pointed out I think?
>>>>>> Hi Daniel,
>>>>>>
>>>>>> My uncertainty in this idea was related to a subtest, the cursor-suspend.
>>>>>> Although the reordering solves most of the blocking in kms-cursor-crc, the
>>>>>> suspend subtest fails because when vkms suspends, it disables vblank,
>>>>>> and when it resumes, vblank is not enabled in time. In this subtest, there is
>>>>>> a pipe-crc-start and adding a igt_wait_for_vblank solves... but again,
>>>>>> I know it is not the real fix.
>>>>>>
>>>>>> Would be the case to develop a specific feature of suspend/resume in vkms?
>>>>>> I mean, something to enable vblank when resume. I am trying to figure out how
>>>>>> to develop it, but still without success.
>>>>> Hm since it's all software I expected that the hrtimer will simply
>>>>> continue to run as if nothing happened. For real hw we'd need to use
>>>>> drm_mode_config_helper_suspend/resume, but for vkms I dont think
>>>>> that's required. Is the vblank hrtimer not working after resume? Or is
>>>>> it simply reporting a garbage timestamp and that's why the testcase
>>>>> fails?
>>>> The testcase fails for the same timeout in waiting the first crc
>>>> (already applying the change in the commit_tail sequence):
>>>>
>>>> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: (power_dir = open("/sys/power", O_RDONLY)) >= 0
>>>> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: get_supported_suspend_states(power_dir) & (1 << state)
>>>> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: test == SUSPEND_TEST_NONE || faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0
>>>> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: !(state == SUSPEND_STATE_DISK && !intel_get_total_swap_mb())
>>>> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: ret == 0
>>>> (kms_cursor_crc:732) igt_core-INFO: [cmd] rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jul 30 09:23:59 2020
>>>> (kms_cursor_crc:732) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
>>>> (kms_cursor_crc:732) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.
>>>>
>>>> What I could check was, when suspend, vblanks are disabled (calling
>>>> vkms_disable_vblank), and when resume, the testcase fails and only after
>>>> the failure vblanks are enabled (vkms_enable_vblank) and
>>>> hrtimer_init/starts.
>>> Hm, what is disabling the vblank there? Can you grab a full backtrace for
>>> that? I have no idea why that's even happening ...
>>>
>>>> If I "force" enabling vblanks via testcase (adding a
>>>> igt_wait_for_vblank before igt_pipe_crc_start), things work fine.
>>>> This is why I thought about anticipating the restarting of activities by
>>>> placing a vblank "wakeup" in a resume function. Or perhaps prevent vblank
>>>> from being disabled when suspended, since that last attempt to place a
>>>> vblank_put at the end of the flush made this test case (suspend) work,
>>>> because it prevented the vblank from being disabled.
>>>>
>>>> This failure in suspend subtest is so closer to the previous ones, that I
>>>> was unsure if my attempt in fix by reordering commit_tail would be enough.
>>>> But maybe they are different situations that deserve different treats.
>>>> Do you think restarting a vblank in resume can make sense for vkms?
>>> tbh I'm just really confused what's going on :-/
>> Hi Daniel, Mellisa.
>> I made up the situation Melissa said, and thought about what's going on now.
>> What pipe-A-cursor-suspend different from size-change is that it has some
>> suspend command just before disabling cursor in test. usually vblank is enabled
>> by drm_vblank_get() and it's handled by vblank interrupt (vkms_vblank_simulate
>> in vkms). by calling drm_crtc_handle_vblank(), drm_vblank_put() is called and it
>> disable vblank with disable timer. the timer will disable vblank after 5 seconds
>> (drm_vblank_offdelay) later in default. that time is enough to execute crc
>> command in simple size-change test. but in suspending situation, if suspend and
>> wakup command takes more than 5 seconds, vblank will disabled and also crc
>> command is failed from polling crc file. the test are passed if I make my
>> environment wake up earlier.
> Oh, nice! I tested what you say extending the offdelay, and the test goes well.
> But what would be the right way to fix?
>
> Melissa
>
>> In the same way, if there is the code delaying crc command in igt test, it make
>> same problem even if it's in simple size-change.
>>
>> -Sidong
>>
>>> -Daniel
>>>
>>>> Melissa
>>>>> Not sure how to wire it up for fake drivers like vkms, but maybe doing
>>>>> the suspend/resume like for real drivers helps. I think ideally we'd
>>>>> try to attach a platform driver to our platform device we create (but
>>>>> not sure how to do that).
>>>>> -Daniel
>>>>>
>>>>>> Melissa
>>>>>>> But I'm still wondering why after step 3 we don't get -EINVAL from
>>>>>>> vblank_get() - after vblank_off() vblank->enabled should be false
>>>>>>> again, getting us back to the same state as after 1. Is that not
>>>>>>> happening?
>>>>>>> -Daniel
>>>>>>>
>>>>>>>>>> Thanks
>>>>>>>>>> -Sidong
>>>>>>>>>>
>>>>>>>>>>>>>>              crtc->state->event = NULL;
>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> --
>>>>>>>>>>>>>> 2.27.0
>>>>>>>>>>>>>>
>>>>>>>>>>>>> --
>>>>>>>>>>>>> Daniel Vetter
>>>>>>>>>>>>> Software Engineer, Intel Corporation
>>>>>>>>>>>>> http://blog.ffwll.ch
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> --
>>>>>>>>>>> Daniel Vetter
>>>>>>>>>>> Software Engineer, Intel Corporation
>>>>>>>>>>> http://blog.ffwll.ch
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> Daniel Vetter
>>>>>>>>> Software Engineer, Intel Corporation
>>>>>>>>> http://blog.ffwll.ch
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> http://blog.ffwll.ch
>>>>>
>>>>>
>>>>> -- 
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--------------2E546BA7EFAF17C0FDFC82D5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <tt>Hello everybody!</tt><br>
    <br>
    <tt>I'm currently working on a writeback connector screenshooter for
      Weston. In order</tt><br>
    <tt>to test it, I'm using VKMS with <a moz-do-not-send="true"
        href="https://lkml.org/lkml/2020/5/11/449">Rodrigo's writeback
        connector patch</a>.</tt><tt> Here is <a moz-do-not-send="true"
href="https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/458">the<br>
        link with the MR in Weston</a> with more details of how I've
      tested it.</tt><br>
    <br>
    <tt>The reason why I'm writing this is that in the first writeback
      connector screenshot<br>
      VKMS</tt><tt> gets stuck. And I believe (from what I've tried to
      debug) that what happens is<br>
      that the</tt><tt> writeback job gets stuck in the queue waiting
      for a vsync signal. Then from<br>
      the second screenshot on everything works fine. So I believe this
      is related to this<br>
      issue somehow.<br>
    </tt><br>
    <tt>Melissa's idea to add drm_crtc_vblank_put(crtc) made it work,
      although VKMS started</tt><br>
    <tt>to print this warn message:</tt><tt><br>
      <br>
      WARNING: CPU: 0 PID: 168 at drivers/gpu/drm/vkms/vkms_crtc.c:21
      vkms_vblank_simulate+0x101/0x110</tt><br>
    <tt> <br>
    </tt><tt>I've decided to share this info with you, as it may help
      you somehow. I'm also<br>
      investigating to help understand what is happening.<br>
      <br>
      Thanks,<br>
      Leandro Ribeiro<br>
    </tt><tt><br>
    </tt>
    <div class="moz-cite-prefix">On 7/31/20 1:47 PM, Melissa Wen wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200731164706.r62jjqu7nu3spyhx@smtp.gmail.com">
      <pre class="moz-quote-pre" wrap="">On 07/31, Sidong Yang wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, Jul 31, 2020 at 11:08:34AM +0200, <a class="moz-txt-link-abbreviated" href="mailto:daniel@ffwll.ch">daniel@ffwll.ch</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Jul 30, 2020 at 07:09:25AM -0300, Melissa Wen wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 07/29, Daniel Vetter wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Wed, Jul 29, 2020 at 9:09 PM Melissa Wen <a class="moz-txt-link-rfc2396E" href="mailto:melissa.srw@gmail.com">&lt;melissa.srw@gmail.com&gt;</a> wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
Melissa Wen

On Sat, Jul 25, 2020 at 3:12 PM Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a> wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
On Sat, Jul 25, 2020 at 7:45 PM Melissa Wen <a class="moz-txt-link-rfc2396E" href="mailto:melissa.srw@gmail.com">&lt;melissa.srw@gmail.com&gt;</a> wrote:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">
On 07/25, Daniel Vetter wrote:
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">On Sat, Jul 25, 2020 at 5:12 AM Sidong Yang <a class="moz-txt-link-rfc2396E" href="mailto:realwakka@gmail.com">&lt;realwakka@gmail.com&gt;</a> wrote:
</pre>
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">
On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
</pre>
                        <blockquote type="cite">
                          <pre class="moz-quote-pre" wrap="">On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <a class="moz-txt-link-rfc2396E" href="mailto:melissa.srw@gmail.com">&lt;melissa.srw@gmail.com&gt;</a> wrote:
</pre>
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">
On 07/22, <a class="moz-txt-link-abbreviated" href="mailto:daniel@ffwll.ch">daniel@ffwll.ch</a> wrote:
</pre>
                            <blockquote type="cite">
                              <pre class="moz-quote-pre" wrap="">On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
</pre>
                              <blockquote type="cite">
                                <pre class="moz-quote-pre" wrap="">This patch adds a missing drm_crtc_vblank_put op to the pair
drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).

It clears the execution of the following kms_cursor_crc subtests:
1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
   random, fast-moving])] - successful when running individually.
2. pipe-A-cursor-dpms passes again
3. pipe-A-cursor-suspend also passes

The issue was initially tracked in the sequential execution of IGT
kms_cursor_crc subtest: when running the test sequence or one of its
subtests twice, the odd execs complete and the pairs get stuck in an
endless wait. In the IGT code, calling a wait_for_vblank before the start
of CRC capture prevented the busy-wait. But the problem persisted in the
pipe-A-cursor-dpms and -suspend subtests.

Checking the history, the pipe-A-cursor-dpms subtest was successful when,
in vkms_atomic_commit_tail, instead of using the flip_done op, it used
wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
blocking in the 2nd start of CRC capture, which may indicate that
something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
the crc setup was able to sync things and free all kms_cursor_crc
subtests.

Tracing and comparing a clean run with a blocked one:
- in a clean one, vkms_crtc_atomic_flush enables vblanks;
- when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
started. Moreover, a series of vkms_vblank_simulate flow out until
disabling vblanks.
Also watching the steps of vkms_crtc_atomic_flush, when the very first
drm_crtc_vblank_get returned an error, the subtest crashed. On the other
hand, when vblank_get succeeded, the subtest completed. Finally, checking
the flush steps: it increases counter to hold a vblank reference (get),
but there isn't a op to decreased it and release vblanks (put).

Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
Cc: Rodrigo Siqueira <a class="moz-txt-link-rfc2396E" href="mailto:rodrigosiqueiramelo@gmail.com">&lt;rodrigosiqueiramelo@gmail.com&gt;</a>
Cc: Haneen Mohammed <a class="moz-txt-link-rfc2396E" href="mailto:hamohammed.sa@gmail.com">&lt;hamohammed.sa@gmail.com&gt;</a>
Signed-off-by: Melissa Wen <a class="moz-txt-link-rfc2396E" href="mailto:melissa.srw@gmail.com">&lt;melissa.srw@gmail.com&gt;</a>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..a99d6b4a92dd 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,

            spin_unlock(&amp;crtc-&gt;dev-&gt;event_lock);

+           drm_crtc_vblank_put(crtc);
</pre>
                              </blockquote>
                              <pre class="moz-quote-pre" wrap="">
Uh so I reviewed this a bit more carefully now, and I dont think this is
the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():

 * Caller must hold a vblank reference for the event @e acquired by a
 * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.

So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
for us. And that's the only case where we successfully acquired a vblank
interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
success for that function, failure negative error number) we directly send
out the event.

So something else fishy is going on, and now I'm totally confused why this
even happens.

We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
we don't underflow the refcount, so it's also not that I think (except if
this patch creates more WARNING backtraces).

But clearly it changes behaviour somehow ... can you try to figure out
what changes? Maybe print out the vblank-&gt;refcount at various points in
the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
is enabled/disabled ...
</pre>
                            </blockquote>
                            <pre class="moz-quote-pre" wrap="">
:(

I can check these, but I also have other suspicions. When I place the
drm_crct_vblank_put out of the if (at the end of flush), it not only solve
the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
doesn't appear anymore (a total cleanup). Just after:

vkms_output-&gt;composer_state = to_vkms_crtc_state(crtc-&gt;state);

looks like there is something stuck around here.
</pre>
                          </blockquote>
                          <pre class="moz-quote-pre" wrap="">
Hm do you have the full WARNING for this? Maybe this gives me an idea
what's going wrong.

</pre>
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">Besides, there is a lock at atomic_begin:

  /* This lock is held across the atomic commit to block vblank timer
   * from scheduling vkms_composer_worker until the composer is updated
   */
  spin_lock_irq(&amp;vkms_output-&gt;lock);

that seems to be released on atomic_flush and make me suspect something
missing on the composer update.
</pre>
                          </blockquote>
                          <pre class="moz-quote-pre" wrap="">
atomic_begin/atomic_flush are symmetric functions an always called
around all the plane updates. So having the spin_lock in _begin and
the spin_unlock in _flush should be symmetric and correct.

If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
should immmediately give you a huge splat in dmesg if there's anything
unbalanced with locking.

</pre>
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">I'll check all these things and come back with news (hope) :)
</pre>
                          </blockquote>
                          <pre class="moz-quote-pre" wrap="">
Have fun chasing stuff :-)

Cheers, Daniel


</pre>
                          <blockquote type="cite">
                            <pre class="moz-quote-pre" wrap="">
Thanks,

Melissa
</pre>
                            <blockquote type="cite">
                              <pre class="moz-quote-pre" wrap="">
I'm totally confused about what's going on here now.
-Daniel
</pre>
                            </blockquote>
                          </blockquote>
                        </blockquote>
                        <pre class="moz-quote-pre" wrap="">
Hi Daniel, Melissa.
I found something about this problem.
I traced vblank-&gt;refcount that it's important in the problem.
In normal case, first test run calls commit_tail() and enable vblank in
atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.

in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
called by atomic_disable. in this function vblank's refcount was increased for
prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
and refcount goes one not zero for next test run.

and next test run, drm_vblank_get() was called but it didn't enable vblank
because refcount was already one. drm_crtc_vblank_on() was called in next. but
it didn't enable vblank but just increase refcount only.

I think this is why this problem happen. don't know how to fix this correctly.
should we force to enable vblank after enabling crtc?
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">
Hm, between drm_crtc_vblank_off and drm_crtc_vblank_on
drm_crtc_vblank_get should fail (and leave the refcount unchanged).
It's convoluted logic, but the check for vblank-&gt;enabled should catch
that and return -EINVAL for this case. Does that not happen?

It would indeed explain the bug (I think, I've been wrong way too many
times with this).
-Daniel

</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Hi Daniel and Sidong,

I don't know if it will be confusing, but I will try to explain in a
little more detail (and newbie way) what I saw in this behavior of the
refcount (similar to what Sidong evaluated).

1. Starting with the loading of vkms is:
In vkms_init:
After drm_vblank_init (refcount=0), it calls:
vkms_modeset_init
--&gt; vkms_output_init
----&gt; drm_mode_config_reset
-------&gt; vkms_atomic_crtc_reset
(even more inside)--&gt; drm_crtc_vblank_reset that bumps the refcount to
prevent vblank_get to enable vblank (refcount=1)

2. So, when we start a subtest, vblank is still disabled and in
commit_tail, commit_planes triggers a atomic_begin/flush-&gt;vblank_get that
return -EINVAL because !vblank-&gt;enabled (refcount ends 1) and send_vblank;
however the test fails before atomic_enable decrements refcount to 0 and
reset timestamp.
** This warning also appears in this very first running:
WARNING: CPU: 0 PID: 708 at drivers/gpu/drm/vkms/vkms_crtc.c:91 vkms_get_vblank_timestamp+0x41/0x50 [vkms]
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">
Hm yeah I guess that's something we should paper over a bit, but maybe
the bugfix will take care of that.

</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">In the end, this sequence modeset_disable -&gt; atomic_begin -&gt;
atomic_flush: refcount going from 0 to 1 and than drm_vblank_enable
prepares to everything going well in the next subtest (because
atomic_disable is not called).

3. It could be nice, but in the next subtest (with success), as refcount +
vblank_enabled ok, after doind its job, it calls
atomic_disable-&gt;vblank_off and here refcount ends 1 and vblank disabled
(the problem returns).
So, we have a kind of good turn and bad turn.

I tried different things, but the only relatively stable result was
putting the sequence modeset_disable + modeset_enables + commit_planes in
the commit_tail. That didn't convince me and then I keep trying things.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">
This actually sounds like a good idea, I had the same one. Doing it
this way should also resolve the WARNING you've pointed out I think?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">
Hi Daniel,

My uncertainty in this idea was related to a subtest, the cursor-suspend.
Although the reordering solves most of the blocking in kms-cursor-crc, the
suspend subtest fails because when vkms suspends, it disables vblank,
and when it resumes, vblank is not enabled in time. In this subtest, there is
a pipe-crc-start and adding a igt_wait_for_vblank solves... but again,
I know it is not the real fix.

Would be the case to develop a specific feature of suspend/resume in vkms?
I mean, something to enable vblank when resume. I am trying to figure out how
to develop it, but still without success.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
Hm since it's all software I expected that the hrtimer will simply
continue to run as if nothing happened. For real hw we'd need to use
drm_mode_config_helper_suspend/resume, but for vkms I dont think
that's required. Is the vblank hrtimer not working after resume? Or is
it simply reporting a garbage timestamp and that's why the testcase
fails?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
The testcase fails for the same timeout in waiting the first crc
(already applying the change in the commit_tail sequence):

(kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: (power_dir = open("/sys/power", O_RDONLY)) &gt;= 0
(kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: get_supported_suspend_states(power_dir) &amp; (1 &lt;&lt; state)
(kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: test == SUSPEND_TEST_NONE || faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0
(kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: !(state == SUSPEND_STATE_DISK &amp;&amp; !intel_get_total_swap_mb())
(kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: ret == 0
(kms_cursor_crc:732) igt_core-INFO: [cmd] rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jul 30 09:23:59 2020
(kms_cursor_crc:732) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
(kms_cursor_crc:732) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.

What I could check was, when suspend, vblanks are disabled (calling
vkms_disable_vblank), and when resume, the testcase fails and only after
the failure vblanks are enabled (vkms_enable_vblank) and
hrtimer_init/starts.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Hm, what is disabling the vblank there? Can you grab a full backtrace for
that? I have no idea why that's even happening ...

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">If I "force" enabling vblanks via testcase (adding a
igt_wait_for_vblank before igt_pipe_crc_start), things work fine.
This is why I thought about anticipating the restarting of activities by
placing a vblank "wakeup" in a resume function. Or perhaps prevent vblank
from being disabled when suspended, since that last attempt to place a
vblank_put at the end of the flush made this test case (suspend) work,
because it prevented the vblank from being disabled.

This failure in suspend subtest is so closer to the previous ones, that I
was unsure if my attempt in fix by reordering commit_tail would be enough. 
But maybe they are different situations that deserve different treats.
Do you think restarting a vblank in resume can make sense for vkms?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
tbh I'm just really confused what's going on :-/
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Daniel, Mellisa.
I made up the situation Melissa said, and thought about what's going on now.  
What pipe-A-cursor-suspend different from size-change is that it has some 
suspend command just before disabling cursor in test. usually vblank is enabled 
by drm_vblank_get() and it's handled by vblank interrupt (vkms_vblank_simulate 
in vkms). by calling drm_crtc_handle_vblank(), drm_vblank_put() is called and it 
disable vblank with disable timer. the timer will disable vblank after 5 seconds 
(drm_vblank_offdelay) later in default. that time is enough to execute crc 
command in simple size-change test. but in suspending situation, if suspend and 
wakup command takes more than 5 seconds, vblank will disabled and also crc 
command is failed from polling crc file. the test are passed if I make my 
environment wake up earlier.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Oh, nice! I tested what you say extending the offdelay, and the test goes well.
But what would be the right way to fix?

Melissa

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In the same way, if there is the code delaying crc command in igt test, it make 
same problem even if it's in simple size-change.

-Sidong

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-Daniel

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Melissa
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Not sure how to wire it up for fake drivers like vkms, but maybe doing
the suspend/resume like for real drivers helps. I think ideally we'd
try to attach a platform driver to our platform device we create (but
not sure how to do that).
-Daniel

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
Melissa
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
But I'm still wondering why after step 3 we don't get -EINVAL from
vblank_get() - after vblank_off() vblank-&gt;enabled should be false
again, getting us back to the same state as after 1. Is that not
happening?
-Daniel

</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">
</pre>
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">
Thanks
-Sidong

</pre>
                        <blockquote type="cite">
                          <blockquote type="cite">
                            <blockquote type="cite">
                              <pre class="moz-quote-pre" wrap="">
</pre>
                              <blockquote type="cite">
                                <pre class="moz-quote-pre" wrap="">            crtc-&gt;state-&gt;event = NULL;
    }

--
2.27.0

</pre>
                              </blockquote>
                              <pre class="moz-quote-pre" wrap="">
--
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
                            </blockquote>
                          </blockquote>
                          <pre class="moz-quote-pre" wrap="">


--
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
                        </blockquote>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">


--
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
                    </blockquote>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">


--
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">


-- 
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
-- 
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2E546BA7EFAF17C0FDFC82D5--

--===============0488183952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0488183952==--
