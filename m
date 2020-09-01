Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADA725992D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7753A6E88F;
	Tue,  1 Sep 2020 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198266E82B;
 Tue,  1 Sep 2020 08:20:47 +0000 (UTC)
IronPort-SDR: 8nnsxidtZ5fIZ8nM4vophadf0GTozSY2gmTF3cV5Jwa01blmPVrhrPGp8Q80s0TNz9MEkAj2oz
 tTjO1qLIMT+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175172821"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="175172821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 01:20:46 -0700
IronPort-SDR: MXAxPr2Vzy4qUUKQkiKfJmIYTjihMCgLy8aJui9KHCAcoHAhgh7fPaXmYo8eNojhgSgPzLcQC4
 dd++6Ek6LzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="330990479"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 01 Sep 2020 01:20:42 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kD1MQ-00DFCK-08; Tue, 01 Sep 2020 11:09:46 +0300
Date: Tue, 1 Sep 2020 11:09:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 06/17] pwm: lpss: Use pwm_lpss_restore() when
 restoring state on resume
Message-ID: <20200901080945.GM1891694@smile.fi.intel.com>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-7-hdegoede@redhat.com>
 <20200831111006.GD1688464@ulmo>
 <d63a89d2-84e5-ca05-aa96-a06291503c5f@redhat.com>
 <20200831131533.GI1689119@ulmo>
 <84887293-11b3-82c9-1e62-bac39861e39e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84887293-11b3-82c9-1e62-bac39861e39e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 07:57:30PM +0200, Hans de Goede wrote:
> On 8/31/20 3:15 PM, Thierry Reding wrote:
> > On Mon, Aug 31, 2020 at 01:46:28PM +0200, Hans de Goede wrote:
> > > On 8/31/20 1:10 PM, Thierry Reding wrote:
> > > > On Sun, Aug 30, 2020 at 02:57:42PM +0200, Hans de Goede wrote:
> > > > > Before this commit a suspend + resume of the LPSS PWM controller
> > > > > would result in the controller being reset to its defaults of
> > > > > output-freq = clock/256, duty-cycle=100%, until someone changes
> > > > > to the output-freq and/or duty-cycle are made.
> > > > > 
> > > > > This problem has been masked so far because the main consumer
> > > > > (the i915 driver) was always making duty-cycle changes on resume.
> > > > > With the conversion of the i915 driver to the atomic PWM API the
> > > > > driver now only disables/enables the PWM on suspend/resume leaving
> > > > > the output-freq and duty as is, triggering this problem.
> > > > 
> > > > Doesn't this imply that there's another bug at play here? At the PWM API
> > > > level you're applying a state and it's up to the driver to ensure that
> > > > the hardware state after ->apply() is what the software has requested.
> > > > 
> > > > If you only switch the enable state and that doesn't cause period and
> > > > duty cycle to be updated it means that your driver isn't writing those
> > > > registers when it should be.
> > > 
> > > Right, the driver was not committing those as it should *on resume*,
> > > that and it skips setting the update bit on the subsequent enable,
> > > which is an optimization which gets removed in 7/17.
> > > 
> > > Before switching the i915 driver over to atomic, when the LPSS-PWM
> > > was used for the backlight we got the following order on suspend/resume
> > > 
> > > 1. Set duty-cycle to 0%
> > > 2. Set enabled to 0
> > > 3. Save ctrl reg
> > > 4. Power-off PWM controller, it now looses all its state
> > > 5. Power-on PWM ctrl
> > > 6. Restore ctrl reg (as a single reg write)
> > > 7. Set enabled to 1, at this point one would expect the
> > > duty/freq from the restored ctrl-reg to apply, but:
> > > a) The resume code never sets the update bit (which this commit fixes); and
> > > b) On applying the pwm_state with enabled=1 the code applying the
> > > state does this (before setting the enabled bit in the ctrl reg):
> > > 
> > > 	if (orig_ctrl != ctrl) {
> > > 		pwm_lpss_write(pwm, ctrl);
> > > 		pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
> > > 	}
> > > and since the restore of the ctrl reg set the old duty/freq the
> > > writes are skipped, so the update bit never gets set.
> > > 
> > > 8. Set duty-cycle to the pre-suspend value (which is not 0)
> > > this does cause a change in the ctrl-reg, so now the update flag
> > > does get set.
> > > 
> > > Note that 1-2 and 7-8 are both done by the non atomic i915 code,
> > > when moving the i915 code to atomic I decided that having these
> > > 2 separate steps here is non-sense, so the new i915 code just
> > > toggles the enable bit. So in essence the new atomic PWM
> > > i915 code drops step 1 and 8.
> > > 
> > > Dropping steps 8 means that the update bit never gets set and we
> > > end up with the PWM running at its power-on-reset duty cycle.
> > > 
> > > You are correct in your remark to patch 7/17 that since that removes
> > > the if (orig_ctrl != ctrl) for the writes that now step 7 will be
> > > sufficient to get the PWM to work again. But that only takes the i915
> > > usage into account.
> > > 
> > > What if the PWM is used through the sysfs userspace API?
> > > Then only steps 3-6 will happen on suspend-resume and without
> > > fixing step 6 to properly restore the PWM controller in its
> > > pre-resume state (this patch) it will once again be running at
> > > its power-on-reset defaults instead of the values from the
> > > restored control register.
> > 
> > Actually PWM's sysfs code has suspend/resume callbacks that basically
> > make sysfs just a regular consumer of PWMs. So they do end up doing a
> > pwm_apply_state() on the PWM as well on suspend and restore the state
> > from before suspend on resume.
> > 
> > This was done very specifically because the suspend/resume order can be
> > unexpected under some circumstances, so for PWM we really want for the
> > consumer to always have ultimate control over when precisely the PWM is
> > restored on resume.
> > 
> > The reason why we did this was because people observed weird glitches on
> > suspend/resume with different severity. In some cases a backlight would
> > be resumed before the display controller had had a chance to start
> > sending frames, causing on-screen corruption in some cases (such as
> > smart displays) and in other cases a PWM-controller regulator would be
> > resumed too late or too early, which I think was causing some issue with
> > the CPUs not working properly on resume.
> > 
> > So I'd prefer not to have any PWM driver save and restore its own
> > context on suspend/resume, because that's inevitably going to cause
> > unexpected behaviour at some point. If it's absolutely necessary we can
> > of course still do that, but I think in that case we need to at least
> > add a comment in the code about why context save/restore is needed in
> > this particular case and make it clear that this is not something that
> > other drivers should copy because they most likely won't be needing it.
> > 
> > Given the above it also doesn't sound to me like there's a real problem,
> > or at least that the bug is somewhere else. A consumer should always be
> > responsible for applying the pre-suspend state upon resume and it sounds
> > like that would be true after patch 7. Since sysfs is just a regular
> > consumer, the same should apply for sysfs-controlled PWMs as well.
> 
> Ok, I was not aware that for PWM the consumer is supposed to always
> be the one to restore the state. If that is the rule then we should probably
> just drop the save/restore suspend/resume code from pwm-lpss.
> 
> It seems that I'm actually responsible for adding that suspend/resume
> code in the first place, see commit 1d375b58c12f ("pwm: lpss: platform:
> Save/restore the ctrl register over a suspend/resume") although the
> ctrl-register was already being saved/restored before that commit
> but then by the acpi/acpi_lpss.c code.
> 
> One worry after dropping the suspend/resume save/restore code is what
> happens if the controller was enabled at the moment the system suspends
> and the consumers first post resume apply() call has pwm_state.enabled
> set too.
> 
> Currently pwm_lpss_apply() looks like this:
> 
>         if (state->enabled) {
>                 if (!pwm_is_enabled(pwm)) {
>                         pm_runtime_get_sync(chip->dev);
>                         ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
>                         if (ret)
>                                 pm_runtime_put(chip->dev);
>                 } else {
>                         ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
>                 }
>         } else if (pwm_is_enabled(pwm)) {
> 
> Where the true / false parameter to pwm_lpss_prepare_enable()
> decides if pwm_lpss_prepare_enable() sets the enable bit in the controllers
> ctrl register, or if it skips that.
> 
> If we then come from a full system suspend (controller loses state,
> comes up with enable bit cleared) we will still enter the:
> 
>                         ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
> 
> Path since the !pwm_is_enabled(pwm) check checks the pwm_state struct,
> not the actual hw-enabled bit and then we do not (re)set the enabled after
> resume as we should when apply() is called with pwm_state.enabled set.
> 
> Fixing this is easy though, we still need to check for the disabled ->
> enabled transition for runtime pm refcounting, but we can also tell
> pwm_lpss_prepare_enable() to set the enable bit in the other path, this
> will be a no-op in case it is already set.
> 
> So then the new apply() code would become:
> 
>         if (state->enabled) {
>                 if (!pwm_is_enabled(pwm)) {
>                         pm_runtime_get_sync(chip->dev);
>                         ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
>                         if (ret)
>                                 pm_runtime_put(chip->dev);
>                 } else {
>                         ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
>                 }
>         } else if (pwm_is_enabled(pwm)) {
> 
> (and we can even optimize out the enable parameter to pwm_lpss_prepare_enable
> then and always make it set the enable bit).
> 
> Together with patch 07/16 will make apply() always work independent of
> the state the controller was in before it got called. Which in light of
> all the subtle issues we have seen surrounding this is likely a good thing.
> 
> And with the fix to make apply() fully independent of the previous state
> of the controller, I'm all for dropping the suspend/resume state
> save/restore code.  Doing that makes things more KISS so I like it :)
> 
> > > So at step 6, if the PWM was enabled before, we must set the update
> > > bit, and then wait for it to clear again so the controller is
> > > ready for subsequent updates. The waiting for it to clear again
> > > needs to happen before or after setting the enable bit depending
> > > on the hw generation, which leads to this patch.
> > 
> > But all of that should be happening as part of the call to
> > pwm_apply_state(), right? That path should be taken for all consumers on
> > resume, including sysfs.
> 
> Ack.
> 
> <snip>
> 
> > > See above, apply() was trying to be smart but the restore of ctrl
> > > on resume without setting the update bit was tricking it. That
> > > being too smart for its own good is removed in 7/16 as you
> > > rightfully point out. But this patch is still necessary for the
> > > PWM controller to be in the expected state between resume and the
> > > first apply() after resume (which may be quite a long time in
> > > the future when using e.g. the sysfs API).
> > 
> > Like I said, the sysfs code should be resuming any exported PWMs on
> > resume just like any other consumer.
> > 
> > Obviously it's always up to the consumer to call pwm_apply_state() at
> > the right time. If that's "too late" for some reason, then that's a bug
> > in the consumer driver. But as I explained above there are a number of
> > cases where restoring context in the PWM driver itself doesn't work
> > because it can cause sequencing issues.
> 
> Ack, I was not aware that PWM consumers are responsible for restoring
> their own state on resume. If that is the case then:
> 
> TL;DR:
> 
> 1. We (I) should make apply() work independent of the current
> hardware state, instead of having it make various assumptions
> about that state as it now does.
> 
> 2. We (I) should drop the suspend/resume save/restore state
> handlers from pwm-lpss completely.
> 
> So I believe that I should prepare yet another version of this
> patch-set replacing 06/17 and 07/17 with 2 patches doing these
> 2 things.
> 
> Thierry, Andy, does that sound good to you ?

Good to me, thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
