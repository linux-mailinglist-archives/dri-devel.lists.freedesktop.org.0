Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04B79F389
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 23:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9802910E0E6;
	Wed, 13 Sep 2023 21:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 21:14:55 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2EA10E108
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 21:14:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1694639302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8uMLW91YWZxr+LdoYhxEN1bJONyrj8yRppLVn3LNdRs=;
 b=EPjM9koD5IVGcK3TzNImfOwSEignNr3wXBbM/1mx0oXc/AMHbsM/V2jLbcfphOPtpLpDLW
 1OD0KY1/fBggLYeqonFD+sR/NX+1ej91c36l7x3WSri5ausglyPksuR3oVcNvNenVs7NTV
 hjKX+EquMjD1rpvvm5cRtmaXLH0rno25T2zqL2RbzrJReQCC24QO1vvoc0nkoSVIqGBJAA
 SKDNHwJUtuRN/W/xQXSQfb/78CxPXQy6pfSGLbV25z3tDvzxPFIeySMuLRQByJX2VNkyR9
 tD19jKXw5lgOFxBR6W00sv01n4Eu1qH9I8lEYLsBrW2cqNTdiWCISZpal8TU7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1694639302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8uMLW91YWZxr+LdoYhxEN1bJONyrj8yRppLVn3LNdRs=;
 b=cvDKVSXEA5FFfnPE0Vg0fwwrSkqItU48RBEeJ+xGGNWPJHVyPXRNnEBwFilAPX4zKvMUq1
 Ty4mcKmEqV9H2uAw==
To: Linus Torvalds <torvalds@linux-foundation.org>, Tetsuo Handa
 <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
In-Reply-To: <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
 <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
Date: Wed, 13 Sep 2023 23:08:21 +0200
Message-ID: <87pm2lzsqi.ffs@tglx>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 syzkaller@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 13 2023 at 09:47, Linus Torvalds wrote:
> On Wed, 13 Sept 2023 at 07:21, Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> Hello. A deadlock was reported in drivers/gpu/drm/vkms/ .
>> It looks like this locking pattern remains as of 6.6-rc1. Please fix.
>>
>> void drm_crtc_vblank_off(struct drm_crtc *crtc) {
>>   spin_lock_irq(&dev->event_lock);
>>   drm_vblank_disable_and_save(dev, pipe) {
>>     __disable_vblank(dev, pipe) {
>>       crtc->funcs->disable_vblank(crtc) == vkms_disable_vblank {
>>         hrtimer_cancel(&out->vblank_hrtimer) { // Retries with dev->event_lock held until lock_hrtimer_base() succeeds.
>>           ret = hrtimer_try_to_cancel(timer) {
>>             base = lock_hrtimer_base(timer, &flags); // Fails forever because vkms_vblank_simulate() is in progress.
>
> Heh. Ok. This is clearly a bug, but it does seem to be limited to just
> the vkms driver, and literally only to the "simulate vblank" case.
>
> The worst part about it is that it's so subtle and not obvious.
>
> Some light grepping seems to show that amdgpu has almost the exact
> same pattern in its own vkms thing, except it uses
>
>         hrtimer_try_to_cancel(&amdgpu_crtc->vblank_timer);
>
> directly, which presumably fixes the livelock, but means that the
> cancel will fail if it's currently running.
>
> So just doing the same thing in the vkms driver probably fixes things.
>
> Maybe the vkms people need to add a flag to say "it's canceled" so
> that it doesn't then get re-enabled?  Or maybe it doesn't matter
> and/or already happens for some reason I didn't look into.

Maybe the VKMS people need to understand locking in the first place. The
first thing I saw in this code is:

static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
{
   ...
   mutex_unlock(&output->enabled_lock);

What?

Unlocking a mutex in the context of a hrtimer callback is simply
violating all mutex locking rules.

How has this code ever survived lock debugging without triggering a big
fat warning?

Thanks,

        tglx
