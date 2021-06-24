Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E63B3421
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 18:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9113C6EB35;
	Thu, 24 Jun 2021 16:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766206EB33;
 Thu, 24 Jun 2021 16:45:16 +0000 (UTC)
IronPort-SDR: t+REZ2j5DPts262KQtIytAn8TDF8mcwb1vGGk9XPodONCnxwRz4pf9+C9oYpzLHQj9aT3u/w8Z
 yQCc3t3RIGPA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204504298"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="204504298"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:45:15 -0700
IronPort-SDR: YIMt1Z5iQrA2KDRh2X1Ww2bTQAbNZRLtcLC/5Zw9PPndjT/Z2Z6FT1HY9tVrYOaAbnLyjH/Blk
 HgRXtOgbECHw==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556555471"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:45:15 -0700
Date: Thu, 24 Jun 2021 09:38:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
Message-ID: <20210624163833.GA8705@sdutt-i7>
References: <0f26f76f-e066-fb23-a7b2-784bb8ee771d@linux.intel.com>
 <20210526181053.GA3435@sdutt-i7>
 <53613c13-1cab-b9bd-3922-0389600773ee@linux.intel.com>
 <20210527143514.GA24720@sdutt-i7>
 <828fe399-5319-78a9-c6e3-c0c027e08e9c@linux.intel.com>
 <20210607173101.GA11968@sdutt-i7>
 <2706c890-5145-4edb-acd1-b9862caba8cf@linux.intel.com>
 <CAKMK7uENywXraNAfrU_3iP16zse+S5M7EMOrx7D0z-+AjSqaqA@mail.gmail.com>
 <20210609231023.GB5471@sdutt-i7>
 <YMIvdJ91DFZfybNm@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMIvdJ91DFZfybNm@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 05:27:48PM +0200, Daniel Vetter wrote:
> On Wed, Jun 09, 2021 at 04:10:23PM -0700, Matthew Brost wrote:
> > On Tue, Jun 08, 2021 at 10:46:15AM +0200, Daniel Vetter wrote:
> > > On Tue, Jun 8, 2021 at 10:39 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > >
> > > >
> > > > On 07/06/2021 18:31, Matthew Brost wrote:
> > > > > On Thu, May 27, 2021 at 04:11:50PM +0100, Tvrtko Ursulin wrote:
> > > > >>
> > > > >> On 27/05/2021 15:35, Matthew Brost wrote:
> > > > >>> On Thu, May 27, 2021 at 11:02:24AM +0100, Tvrtko Ursulin wrote:
> > > > >>>>
> > > > >>>> On 26/05/2021 19:10, Matthew Brost wrote:
> > > > >>>>
> > > > >>>> [snip]
> > > > >>>>
> > > > >>>>>>>>> +static int ct_send_nb(struct intel_guc_ct *ct,
> > > > >>>>>>>>> +                   const u32 *action,
> > > > >>>>>>>>> +                   u32 len,
> > > > >>>>>>>>> +                   u32 flags)
> > > > >>>>>>>>> +{
> > > > >>>>>>>>> +     struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > >>>>>>>>> +     unsigned long spin_flags;
> > > > >>>>>>>>> +     u32 fence;
> > > > >>>>>>>>> +     int ret;
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +     spin_lock_irqsave(&ctb->lock, spin_flags);
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +     ret = ctb_has_room(ctb, len + 1);
> > > > >>>>>>>>> +     if (unlikely(ret))
> > > > >>>>>>>>> +             goto out;
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +     fence = ct_get_next_fence(ct);
> > > > >>>>>>>>> +     ret = ct_write(ct, action, len, fence, flags);
> > > > >>>>>>>>> +     if (unlikely(ret))
> > > > >>>>>>>>> +             goto out;
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +     intel_guc_notify(ct_to_guc(ct));
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +out:
> > > > >>>>>>>>> +     spin_unlock_irqrestore(&ctb->lock, spin_flags);
> > > > >>>>>>>>> +
> > > > >>>>>>>>> +     return ret;
> > > > >>>>>>>>> +}
> > > > >>>>>>>>> +
> > > > >>>>>>>>>       static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>>>>                          const u32 *action,
> > > > >>>>>>>>>                          u32 len,
> > > > >>>>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>>>>                          u32 response_buf_size,
> > > > >>>>>>>>>                          u32 *status)
> > > > >>>>>>>>>       {
> > > > >>>>>>>>> +     struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > >>>>>>>>>               struct ct_request request;
> > > > >>>>>>>>>               unsigned long flags;
> > > > >>>>>>>>>               u32 fence;
> > > > >>>>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>>>>               GEM_BUG_ON(!len);
> > > > >>>>>>>>>               GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> > > > >>>>>>>>>               GEM_BUG_ON(!response_buf && response_buf_size);
> > > > >>>>>>>>> +     might_sleep();
> > > > >>>>>>>>
> > > > >>>>>>>> Sleep is just cond_resched below or there is more?
> > > > >>>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> Yes, the cond_resched.
> > > > >>>>>>>
> > > > >>>>>>>>> +     /*
> > > > >>>>>>>>> +      * We use a lazy spin wait loop here as we believe that if the CT
> > > > >>>>>>>>> +      * buffers are sized correctly the flow control condition should be
> > > > >>>>>>>>> +      * rare.
> > > > >>>>>>>>> +      */
> > > > >>>>>>>>> +retry:
> > > > >>>>>>>>>               spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> > > > >>>>>>>>> +     if (unlikely(!ctb_has_room(ctb, len + 1))) {
> > > > >>>>>>>>> +             spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> > > > >>>>>>>>> +             cond_resched();
> > > > >>>>>>>>> +             goto retry;
> > > > >>>>>>>>> +     }
> > > > >>>>>>>>
> > > > >>>>>>>> If this patch is about adding a non-blocking send function, and below we can
> > > > >>>>>>>> see that it creates a fork:
> > > > >>>>>>>>
> > > > >>>>>>>> intel_guc_ct_send:
> > > > >>>>>>>> ...
> > > > >>>>>>>>        if (flags & INTEL_GUC_SEND_NB)
> > > > >>>>>>>>                return ct_send_nb(ct, action, len, flags);
> > > > >>>>>>>>
> > > > >>>>>>>>        ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
> > > > >>>>>>>>
> > > > >>>>>>>> Then why is there a change in ct_send here, which is not the new
> > > > >>>>>>>> non-blocking path?
> > > > >>>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> There is not a change to ct_send(), just to intel_guc_ct_send.
> > > > >>>>>>
> > > > >>>>>> I was doing by the diff which says:
> > > > >>>>>>
> > > > >>>>>>     static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>                     const u32 *action,
> > > > >>>>>>                     u32 len,
> > > > >>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>                     u32 response_buf_size,
> > > > >>>>>>                     u32 *status)
> > > > >>>>>>     {
> > > > >>>>>> +        struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > >>>>>>          struct ct_request request;
> > > > >>>>>>          unsigned long flags;
> > > > >>>>>>          u32 fence;
> > > > >>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > >>>>>>          GEM_BUG_ON(!len);
> > > > >>>>>>          GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> > > > >>>>>>          GEM_BUG_ON(!response_buf && response_buf_size);
> > > > >>>>>> +        might_sleep();
> > > > >>>>>> +        /*
> > > > >>>>>> +         * We use a lazy spin wait loop here as we believe that if the CT
> > > > >>>>>> +         * buffers are sized correctly the flow control condition should be
> > > > >>>>>> +         * rare.
> > > > >>>>>> +         */
> > > > >>>>>> +retry:
> > > > >>>>>>          spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> > > > >>>>>> +        if (unlikely(!ctb_has_room(ctb, len + 1))) {
> > > > >>>>>> +                spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> > > > >>>>>> +                cond_resched();
> > > > >>>>>> +                goto retry;
> > > > >>>>>> +        }
> > > > >>>>>>
> > > > >>>>>> So it looks like a change to ct_send to me. Is that wrong?
> > > > >>>>
> > > > >>>> What about this part - is the patch changing the blocking ct_send or not,
> > > > >>>> and if it is why?
> > > > >>>>
> > > > >>>
> > > > >>> Yes, ct_send() changes. Sorry for the confusion.
> > > > >>>
> > > > >>> This function needs to be updated to account for the H2G space and
> > > > >>> backoff if no space is available.
> > > > >>
> > > > >> Since this one is the sleeping path, it probably can and needs to be smarter
> > > > >> than having a cond_resched busy loop added. Like sleep and get woken up when
> > > > >> there is space. Otherwise it can degenerate to busy looping via contention
> > > > >> with the non-blocking path.
> > > > >>
> > > > >
> > > > > That screams over enginerring a simple problem to me. If the CT channel
> > > > > is full we are really in trouble anyways - i.e. the performance is going
> > > > > to terrible as we overwhelmed the GuC with traffic. That being said,
> > > >
> > > > Performance of what would be terrible? Something relating to submitting
> > > > new jobs to the GPU I guess. Or something SRIOV related as you hint below.
> > > >
> > > > But there is no real reason why CPU cycles/power should suffer if GuC is
> > > > busy.
> > > >
> > > > Okay, if it can't happen in real world then it's possibly passable as a
> > > > design of a communication interface. But to me it leaves a bad taste and
> > > > a doubt that there is this other aspect of the real world. And that is
> > > > when the unexpected happens. Even the most trivial things like a bug in
> > > > GuC firmware causes the driver to busy spin in there. So not much
> > > > happening on the machine but CPU cores pinned burning cycles in this
> > > > code. It's just lazy and not robust design. "Bug #nnnnn - High CPU usage
> > > > and GUI blocked - Solution: Upgrade GuC firmware and _reboot_ the
> > > > machine". Oh well..
> > > >
> > > > At least I think the commit message should spell out clearly that a busy
> > > > looping path is being added to the sleeping send as a downside of
> > > > implementation choices. Still, for the record, I object to the design.
> > > >
> > > > > IGTs can do this but that really isn't a real world use case. For the
> > > > > real world, this buffer is large enough that it won't ever be full hence
> > > > > the comment + lazy spin loop.
> > > > >
> > > > > Next, it isn't like we get an interrupt or something when space
> > > > > becomes available so how would we wake this thread? Could we come up
> > > > > with a convoluted scheme where we insert ops that generated an interrupt
> > > > > at regular intervals, probably? Would it be super complicated, totally
> > > > > unnecessary, and gain use nothing - absolutely.
> > > > >
> > > > > Lastly, blocking CTBs really shouldn't ever be used. Certainly the
> > > > > submission code doesn't use these. I think SRIOV might, but those can
> > > > > probably be reworked too to use non-blocking. At some point we might
> > > > > want to scrub the driver and just delete the blocking path.
> > > 
> > > I'd do an s/cond_resched()/msleep(1)/ and comment explaining why we
> > > just don't care about this. That checks of the cpu wasting in this
> > > case (GuC is overloaded, it wont come back anytime soon anyway) and
> > > explains why we really don't want to make this any more clever or
> > > complex code (because comment can explain why we wont hit this in
> > > actual real world usage except when something else is on fire already
> > > anyway).
> > > 
> > 
> > Sounds good.
> > 
> > > If you want to go absolutely overkill and it's not too much work, make
> > > the msleep interruptible or check for signals, and bail out. That way
> > > the process can be made unstuck with ^C at least.
> > 
> > This loop is already bound by a timer and if no forward progress is made
> > we pop out of this loop. It is assumed if this happens the GuC / GPU is
> > dead a and full GPU reset will have to be issued. A following patch
> > adds the timer, a bit later in submission section of the series a patch
> > is added to trigger the reset.
> 
> Yeah timeout bail-out works too, and if you then switch it from timeout to
> also interruptible it shouldn't be much more code. It's just nice to not
> have any uninterruptible sleep.
> -Daniel

I didn't get this in my next rev as I didn't know how to do this off
hand but I think all I need to add is something like this to each
iteration of the busy loops, right?

if (signal_pending_state(TASK_INTERRUPTIBLE, current))
	bail out of busy loop, and return and error

Matt

> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
