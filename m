Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6552F8871
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E0A89A98;
	Fri, 15 Jan 2021 22:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2D089A98
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:30:06 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id w26so12040991ljo.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohNmhbk8Ew7sN/XmW/sgvzlKB8sX24a2RuJXs6pXwt8=;
 b=JvlthKanIMvSAr3/bpCVOhSkhtgH4MiDEAUjlmE4HR/W3jqZGXCj3y1jNh4EQkdhty
 keHMk85jtiyJTDeUqC9rm0t3oz951gurHnQ4YRxsVBrScszMg3Vkk8CBZ6x/xOVjIcg9
 0FZYHswEKBYLZSLRMn1F0B8q8yENHVhEJQDCpICoddhE8koywX1PNicCSl8Al2ljsXPH
 uDf6dTWA5aARc8QLEt5MYK/A/PNDRPya2FfiLVg15RscY91wF4haABim8EEUNy+xCAnd
 RiJWNPW2UIPsjup2XYLpmlQkm60qi9Bke2oJqC5g+cJuqIK6uC8El9W1ib66Mi5Z9vqb
 hbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohNmhbk8Ew7sN/XmW/sgvzlKB8sX24a2RuJXs6pXwt8=;
 b=TpwXe3TbC+uH20LwmxupABzGIMk3fIetrq8zJTsp/ZJqdFzq93UqqGNL31npaCFbTO
 DgO8Vxt6AnX8sqwqwqBAwX/6ZpUwE6rkKHtdAL8CmEk5Aj352p4pMErBcBHPEj65KswH
 MTx0ZOov7/KO1B5+8rJzc+dZUhkIgxPJSBfLMn8Z9yFtowLBuODAPfqNjmFh01vwmuGh
 W/WUNPAjsTPFu7BbN1h1//Zlq+UnTKwL/Gd5DpguBmUyz6OTBpgtsfFuuybk4WS64XWs
 uZiOdjXwqJVCcjLAdN/nIzdVVuEMz0OSCxuo+r6Gk1BdAR7rFmcaRnTyez6ViG9kg5ll
 nYkA==
X-Gm-Message-State: AOAM533oToKvAoyRCe+ARODr14X4+yYvDAS0ofsJTKhZOxSrLFd8iHIz
 AemIOqhe30e8tKP3sMx7+5lwe1G0m6OcJieOp3d48Q==
X-Google-Smtp-Source: ABdhPJx0VNKAZi50/0xKkaYsEiu9plclTph8cCFWlkxP7gsRQ3jNghlUUbHgUyJChywPgUR2c0G1+IN18LxsdA2AG5s=
X-Received: by 2002:a2e:b001:: with SMTP id y1mr6300920ljk.257.1610749804704; 
 Fri, 15 Jan 2021 14:30:04 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
 <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
 <CALAqxLVdNGCPyB+nQKh2iv41Xr_VarVz3ZLc99mNrShtVr2SAw@mail.gmail.com>
 <e13db164c6efaf8524fb863e8f0e2f0f@codeaurora.org>
In-Reply-To: <e13db164c6efaf8524fb863e8f0e2f0f@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 15 Jan 2021 14:29:52 -0800
Message-ID: <CALAqxLUZhb7p26w-a3AmNzFtpB2xDU8k3951VYGGtqgnsqj03A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 12:54 PM <veeras@codeaurora.org> wrote:
>
> On 2021-01-13 18:28, John Stultz wrote:
> > On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
> > <veeras@codeaurora.org> wrote:
> >>
> >> The explicit out-fences in crtc are signaled as part of vblank event,
> >> indicating all framebuffers present on the Atomic Commit request are
> >> scanned out on the screen. Though the fence signal and the vblank
> >> event
> >> notification happens at the same time, triggered by the same hardware
> >> vsync event, the timestamp set in both are different. With drivers
> >> supporting precise vblank timestamp the difference between the two
> >> timestamps would be even higher. This might have an impact on use-mode
> >> frameworks using these fence timestamps for purposes other than simple
> >> buffer usage. For instance, the Android framework [1] uses the
> >> retire-fences as an alternative to vblank when frame-updates are in
> >> progress. Set the fence timestamp during send vblank event using a new
> >> drm_send_event_timestamp_locked variant to avoid discrepancies.
> >>
> >> [1]
> >> https://android.googlesource.com/platform/frameworks/native/+/master/
> >> services/surfaceflinger/Scheduler/Scheduler.cpp#397
> >>
> >> Changes in v2:
> >> - Use drm_send_event_timestamp_locked to update fence timestamp
> >> - add more information to commit text
> >>
> >> Changes in v3:
> >> - use same backend helper function for variants of drm_send_event to
> >> avoid code duplications
> >>
> >> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/drm_file.c   | 71
> >> ++++++++++++++++++++++++++++++++++++--------
> >>  drivers/gpu/drm/drm_vblank.c |  9 +++++-
> >>  include/drm/drm_file.h       |  3 ++
> >>  3 files changed, 70 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index 0ac4566..b8348ca 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -775,20 +775,19 @@ void drm_event_cancel_free(struct drm_device
> >> *dev,
> >>  EXPORT_SYMBOL(drm_event_cancel_free);
> >>
> >>  /**
> >> - * drm_send_event_locked - send DRM event to file descriptor
> >> + * drm_send_event_helper - send DRM event to file descriptor
> >>   * @dev: DRM device
> >>   * @e: DRM event to deliver
> >> + * @timestamp: timestamp to set for the fence event in kernel's
> >> CLOCK_MONOTONIC
> >> + * time domain
> >>   *
> >> - * This function sends the event @e, initialized with
> >> drm_event_reserve_init(),
> >> - * to its associated userspace DRM file. Callers must already hold
> >> - * &drm_device.event_lock, see drm_send_event() for the unlocked
> >> version.
> >> - *
> >> - * Note that the core will take care of unlinking and disarming
> >> events when the
> >> - * corresponding DRM file is closed. Drivers need not worry about
> >> whether the
> >> - * DRM file for this event still exists and can call this function
> >> upon
> >> - * completion of the asynchronous work unconditionally.
> >> + * This helper function sends the event @e, initialized with
> >> + * drm_event_reserve_init(), to its associated userspace DRM file.
> >> + * The timestamp variant of dma_fence_signal is used when the caller
> >> + * sends a valid timestamp.
> >>   */
> >> -void drm_send_event_locked(struct drm_device *dev, struct
> >> drm_pending_event *e)
> >> +void drm_send_event_helper(struct drm_device *dev,
> >> +                       struct drm_pending_event *e, ktime_t
> >> timestamp)
> >>  {
> >>         assert_spin_locked(&dev->event_lock);
> >>
> >> @@ -799,7 +798,10 @@ void drm_send_event_locked(struct drm_device
> >> *dev, struct drm_pending_event *e)
> >>         }
> >>
> >>         if (e->fence) {
> >> -               dma_fence_signal(e->fence);
> >> +               if (timestamp)
> >> +                       dma_fence_signal_timestamp(e->fence,
> >> timestamp);
> >> +               else
> >> +                       dma_fence_signal(e->fence);
> >>                 dma_fence_put(e->fence);
> >>         }
> >>
> >> @@ -814,6 +816,51 @@ void drm_send_event_locked(struct drm_device
> >> *dev, struct drm_pending_event *e)
> >>         wake_up_interruptible_poll(&e->file_priv->event_wait,
> >>                 EPOLLIN | EPOLLRDNORM);
> >>  }
> >> +
> >> +/**
> >> + * drm_send_event_timestamp_locked - send DRM event to file
> >> descriptor
> >> + * @dev: DRM device
> >> + * @e: DRM event to deliver
> >> + * @timestamp: timestamp to set for the fence event in kernel's
> >> CLOCK_MONOTONIC
> >> + * time domain
> >> + *
> >> + * This function sends the event @e, initialized with
> >> drm_event_reserve_init(),
> >> + * to its associated userspace DRM file. Callers must already hold
> >> + * &drm_device.event_lock.
> >> + *
> >> + * Note that the core will take care of unlinking and disarming
> >> events when the
> >> + * corresponding DRM file is closed. Drivers need not worry about
> >> whether the
> >> + * DRM file for this event still exists and can call this function
> >> upon
> >> + * completion of the asynchronous work unconditionally.
> >> + */
> >> +void drm_send_event_timestamp_locked(struct drm_device *dev,
> >> +                       struct drm_pending_event *e, ktime_t
> >> timestamp)
> >> +{
> >> +       WARN_ON(!timestamp);
> >> +
> >> +       drm_send_event_helper(dev, e, timestamp);
> >> +
> >> +}
> >> +EXPORT_SYMBOL(drm_send_event_timestamp_locked);
> >
> >
> > Hey Veera,
> >   So actually, after closer look at the testing I was doing, we seem
> > to be hitting that WARN_ON right as the display first comes up (I see
> > this on both db845c and HiKey960).
> > It seems in drm_crtc_send_vblank_event(), if "now" is set by
> > drm_vblank_count_and_time(), the first timestamp value we get from it
> > seems to be 0.
> >
> > Let me know if you need any help reproducing and sorting this issue
> > out.
> >
> Hi John,
> Thanks for the review and testing.
> Since vblank timestamp being set to 0 is acceptable currently, I think
> it would
> be safe to remove the WARN_ON in drm_send_event_timestamp_locked(), so
> the same
> would be applied to the corresponding fences as well. Especially with
> high
> precision vblank timestamping enabled, driver is free to set and there
> is no
> timestamp validation within drm. This is a separate work and can be
> decoupled
> from this patch. Or we can use the appropriate  drm_send_event variant
> from send_vblank_event() based on the availability of "now" timestamp.
> Please let me know your opinion, I will modify the patch accordingly.


Not sure if I know the vblank details well enough to really recommend a path.
I suspect there needs to be some special case handling of the
initialization state so the first vblank isn't at time 0, but I'd need
to dig more to understand it.

I'd guess removing the warning is ok for now, but it does seem like
something needs to eventually be fixed.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
