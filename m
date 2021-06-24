Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF183B34BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572F96EC66;
	Thu, 24 Jun 2021 17:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409D86EC66
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:25:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j2so7515671wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BxgprfPQz14rzIPw369+/e5IhsgPNdmWhXEXBvQHkqI=;
 b=kFcxpC4IUHlIo0esw8hqM+9teolDWMT+2J3uGmx1mQ/s2Tw1STJai7MwY3vanVYNP5
 AzeyMVP+KGxui8aaLXjZKjCToqWJeEQ9BCpMXZCUk+fkBqyf6r3HY/zRrN//Rb61DetL
 hiPZU27cjd4dL38RcTn98/cTu1kuiShkRU1Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BxgprfPQz14rzIPw369+/e5IhsgPNdmWhXEXBvQHkqI=;
 b=uft1kk4TXzFNdvaiR8O652eJsY88ovR9A7RiV8aUgpMW2WqNzIV3JSnbyakpVzvCgn
 WSHHtwLXoZGAIeFDHtsB3HweSwxlVFecz0vE3kxUuVI35sI41lu8Nh93XeTeSPcX+iVU
 dYEKNf74IpfF508CAT3kCWbQ6BcXINhmkMvW1GV8Vmhwr7KslgUwBAxe18nHx4iS4rJk
 rs+UfeUP7yj+DA/uDroogx63UArIu2Mx6LYY9xUJLpG8pHdoEQl3b1yIPMyP96W7XeCH
 lhyMysvqVVD+NLRL0DG4S4CfcXx4VU4YzXOfNGBmS44JUtYuKdilYO9PambZfgOqrO2B
 kZsw==
X-Gm-Message-State: AOAM531Pbdhb/Il/Qfow25ar1Rs5OfgntM2RwNPAYVNQaynTTZPGsxiF
 7kNcsSFl+0bhk1/aVrDMJplyZw==
X-Google-Smtp-Source: ABdhPJwxN4b2i7sBY1fypXpLiInN0nUQVX4BvWk2zFtFe8VPvCbiqSrSpaZMVnDYvijpehL8TOi8MA==
X-Received: by 2002:a5d:61ce:: with SMTP id q14mr5899790wrv.313.1624555547921; 
 Thu, 24 Jun 2021 10:25:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p16sm3859481wrs.52.2021.06.24.10.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:25:47 -0700 (PDT)
Date: Thu, 24 Jun 2021 19:25:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
Message-ID: <YNTAGSjJRfjTNWz7@phenom.ffwll.local>
References: <20210526181053.GA3435@sdutt-i7>
 <53613c13-1cab-b9bd-3922-0389600773ee@linux.intel.com>
 <20210527143514.GA24720@sdutt-i7>
 <828fe399-5319-78a9-c6e3-c0c027e08e9c@linux.intel.com>
 <20210607173101.GA11968@sdutt-i7>
 <2706c890-5145-4edb-acd1-b9862caba8cf@linux.intel.com>
 <CAKMK7uENywXraNAfrU_3iP16zse+S5M7EMOrx7D0z-+AjSqaqA@mail.gmail.com>
 <20210609231023.GB5471@sdutt-i7>
 <YMIvdJ91DFZfybNm@phenom.ffwll.local>
 <20210624163833.GA8705@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624163833.GA8705@sdutt-i7>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 09:38:33AM -0700, Matthew Brost wrote:
> On Thu, Jun 10, 2021 at 05:27:48PM +0200, Daniel Vetter wrote:
> > On Wed, Jun 09, 2021 at 04:10:23PM -0700, Matthew Brost wrote:
> > > On Tue, Jun 08, 2021 at 10:46:15AM +0200, Daniel Vetter wrote:
> > > > On Tue, Jun 8, 2021 at 10:39 AM Tvrtko Ursulin
> > > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > > >
> > > > >
> > > > > On 07/06/2021 18:31, Matthew Brost wrote:
> > > > > > On Thu, May 27, 2021 at 04:11:50PM +0100, Tvrtko Ursulin wrote:
> > > > > >>
> > > > > >> On 27/05/2021 15:35, Matthew Brost wrote:
> > > > > >>> On Thu, May 27, 2021 at 11:02:24AM +0100, Tvrtko Ursulin wrote:
> > > > > >>>>
> > > > > >>>> On 26/05/2021 19:10, Matthew Brost wrote:
> > > > > >>>>
> > > > > >>>> [snip]
> > > > > >>>>
> > > > > >>>>>>>>> +static int ct_send_nb(struct intel_guc_ct *ct,
> > > > > >>>>>>>>> +                   const u32 *action,
> > > > > >>>>>>>>> +                   u32 len,
> > > > > >>>>>>>>> +                   u32 flags)
> > > > > >>>>>>>>> +{
> > > > > >>>>>>>>> +     struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > > >>>>>>>>> +     unsigned long spin_flags;
> > > > > >>>>>>>>> +     u32 fence;
> > > > > >>>>>>>>> +     int ret;
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +     spin_lock_irqsave(&ctb->lock, spin_flags);
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +     ret = ctb_has_room(ctb, len + 1);
> > > > > >>>>>>>>> +     if (unlikely(ret))
> > > > > >>>>>>>>> +             goto out;
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +     fence = ct_get_next_fence(ct);
> > > > > >>>>>>>>> +     ret = ct_write(ct, action, len, fence, flags);
> > > > > >>>>>>>>> +     if (unlikely(ret))
> > > > > >>>>>>>>> +             goto out;
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +     intel_guc_notify(ct_to_guc(ct));
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +out:
> > > > > >>>>>>>>> +     spin_unlock_irqrestore(&ctb->lock, spin_flags);
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>> +     return ret;
> > > > > >>>>>>>>> +}
> > > > > >>>>>>>>> +
> > > > > >>>>>>>>>       static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>>>>                          const u32 *action,
> > > > > >>>>>>>>>                          u32 len,
> > > > > >>>>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>>>>                          u32 response_buf_size,
> > > > > >>>>>>>>>                          u32 *status)
> > > > > >>>>>>>>>       {
> > > > > >>>>>>>>> +     struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > > >>>>>>>>>               struct ct_request request;
> > > > > >>>>>>>>>               unsigned long flags;
> > > > > >>>>>>>>>               u32 fence;
> > > > > >>>>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>>>>               GEM_BUG_ON(!len);
> > > > > >>>>>>>>>               GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> > > > > >>>>>>>>>               GEM_BUG_ON(!response_buf && response_buf_size);
> > > > > >>>>>>>>> +     might_sleep();
> > > > > >>>>>>>>
> > > > > >>>>>>>> Sleep is just cond_resched below or there is more?
> > > > > >>>>>>>>
> > > > > >>>>>>>
> > > > > >>>>>>> Yes, the cond_resched.
> > > > > >>>>>>>
> > > > > >>>>>>>>> +     /*
> > > > > >>>>>>>>> +      * We use a lazy spin wait loop here as we believe that if the CT
> > > > > >>>>>>>>> +      * buffers are sized correctly the flow control condition should be
> > > > > >>>>>>>>> +      * rare.
> > > > > >>>>>>>>> +      */
> > > > > >>>>>>>>> +retry:
> > > > > >>>>>>>>>               spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> > > > > >>>>>>>>> +     if (unlikely(!ctb_has_room(ctb, len + 1))) {
> > > > > >>>>>>>>> +             spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> > > > > >>>>>>>>> +             cond_resched();
> > > > > >>>>>>>>> +             goto retry;
> > > > > >>>>>>>>> +     }
> > > > > >>>>>>>>
> > > > > >>>>>>>> If this patch is about adding a non-blocking send function, and below we can
> > > > > >>>>>>>> see that it creates a fork:
> > > > > >>>>>>>>
> > > > > >>>>>>>> intel_guc_ct_send:
> > > > > >>>>>>>> ...
> > > > > >>>>>>>>        if (flags & INTEL_GUC_SEND_NB)
> > > > > >>>>>>>>                return ct_send_nb(ct, action, len, flags);
> > > > > >>>>>>>>
> > > > > >>>>>>>>        ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
> > > > > >>>>>>>>
> > > > > >>>>>>>> Then why is there a change in ct_send here, which is not the new
> > > > > >>>>>>>> non-blocking path?
> > > > > >>>>>>>>
> > > > > >>>>>>>
> > > > > >>>>>>> There is not a change to ct_send(), just to intel_guc_ct_send.
> > > > > >>>>>>
> > > > > >>>>>> I was doing by the diff which says:
> > > > > >>>>>>
> > > > > >>>>>>     static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>                     const u32 *action,
> > > > > >>>>>>                     u32 len,
> > > > > >>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>                     u32 response_buf_size,
> > > > > >>>>>>                     u32 *status)
> > > > > >>>>>>     {
> > > > > >>>>>> +        struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> > > > > >>>>>>          struct ct_request request;
> > > > > >>>>>>          unsigned long flags;
> > > > > >>>>>>          u32 fence;
> > > > > >>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> > > > > >>>>>>          GEM_BUG_ON(!len);
> > > > > >>>>>>          GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> > > > > >>>>>>          GEM_BUG_ON(!response_buf && response_buf_size);
> > > > > >>>>>> +        might_sleep();
> > > > > >>>>>> +        /*
> > > > > >>>>>> +         * We use a lazy spin wait loop here as we believe that if the CT
> > > > > >>>>>> +         * buffers are sized correctly the flow control condition should be
> > > > > >>>>>> +         * rare.
> > > > > >>>>>> +         */
> > > > > >>>>>> +retry:
> > > > > >>>>>>          spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> > > > > >>>>>> +        if (unlikely(!ctb_has_room(ctb, len + 1))) {
> > > > > >>>>>> +                spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> > > > > >>>>>> +                cond_resched();
> > > > > >>>>>> +                goto retry;
> > > > > >>>>>> +        }
> > > > > >>>>>>
> > > > > >>>>>> So it looks like a change to ct_send to me. Is that wrong?
> > > > > >>>>
> > > > > >>>> What about this part - is the patch changing the blocking ct_send or not,
> > > > > >>>> and if it is why?
> > > > > >>>>
> > > > > >>>
> > > > > >>> Yes, ct_send() changes. Sorry for the confusion.
> > > > > >>>
> > > > > >>> This function needs to be updated to account for the H2G space and
> > > > > >>> backoff if no space is available.
> > > > > >>
> > > > > >> Since this one is the sleeping path, it probably can and needs to be smarter
> > > > > >> than having a cond_resched busy loop added. Like sleep and get woken up when
> > > > > >> there is space. Otherwise it can degenerate to busy looping via contention
> > > > > >> with the non-blocking path.
> > > > > >>
> > > > > >
> > > > > > That screams over enginerring a simple problem to me. If the CT channel
> > > > > > is full we are really in trouble anyways - i.e. the performance is going
> > > > > > to terrible as we overwhelmed the GuC with traffic. That being said,
> > > > >
> > > > > Performance of what would be terrible? Something relating to submitting
> > > > > new jobs to the GPU I guess. Or something SRIOV related as you hint below.
> > > > >
> > > > > But there is no real reason why CPU cycles/power should suffer if GuC is
> > > > > busy.
> > > > >
> > > > > Okay, if it can't happen in real world then it's possibly passable as a
> > > > > design of a communication interface. But to me it leaves a bad taste and
> > > > > a doubt that there is this other aspect of the real world. And that is
> > > > > when the unexpected happens. Even the most trivial things like a bug in
> > > > > GuC firmware causes the driver to busy spin in there. So not much
> > > > > happening on the machine but CPU cores pinned burning cycles in this
> > > > > code. It's just lazy and not robust design. "Bug #nnnnn - High CPU usage
> > > > > and GUI blocked - Solution: Upgrade GuC firmware and _reboot_ the
> > > > > machine". Oh well..
> > > > >
> > > > > At least I think the commit message should spell out clearly that a busy
> > > > > looping path is being added to the sleeping send as a downside of
> > > > > implementation choices. Still, for the record, I object to the design.
> > > > >
> > > > > > IGTs can do this but that really isn't a real world use case. For the
> > > > > > real world, this buffer is large enough that it won't ever be full hence
> > > > > > the comment + lazy spin loop.
> > > > > >
> > > > > > Next, it isn't like we get an interrupt or something when space
> > > > > > becomes available so how would we wake this thread? Could we come up
> > > > > > with a convoluted scheme where we insert ops that generated an interrupt
> > > > > > at regular intervals, probably? Would it be super complicated, totally
> > > > > > unnecessary, and gain use nothing - absolutely.
> > > > > >
> > > > > > Lastly, blocking CTBs really shouldn't ever be used. Certainly the
> > > > > > submission code doesn't use these. I think SRIOV might, but those can
> > > > > > probably be reworked too to use non-blocking. At some point we might
> > > > > > want to scrub the driver and just delete the blocking path.
> > > > 
> > > > I'd do an s/cond_resched()/msleep(1)/ and comment explaining why we
> > > > just don't care about this. That checks of the cpu wasting in this
> > > > case (GuC is overloaded, it wont come back anytime soon anyway) and
> > > > explains why we really don't want to make this any more clever or
> > > > complex code (because comment can explain why we wont hit this in
> > > > actual real world usage except when something else is on fire already
> > > > anyway).
> > > > 
> > > 
> > > Sounds good.
> > > 
> > > > If you want to go absolutely overkill and it's not too much work, make
> > > > the msleep interruptible or check for signals, and bail out. That way
> > > > the process can be made unstuck with ^C at least.
> > > 
> > > This loop is already bound by a timer and if no forward progress is made
> > > we pop out of this loop. It is assumed if this happens the GuC / GPU is
> > > dead a and full GPU reset will have to be issued. A following patch
> > > adds the timer, a bit later in submission section of the series a patch
> > > is added to trigger the reset.
> > 
> > Yeah timeout bail-out works too, and if you then switch it from timeout to
> > also interruptible it shouldn't be much more code. It's just nice to not
> > have any uninterruptible sleep.
> > -Daniel
> 
> I didn't get this in my next rev as I didn't know how to do this off
> hand but I think all I need to add is something like this to each
> iteration of the busy loops, right?
> 
> if (signal_pending_state(TASK_INTERRUPTIBLE, current))
> 	bail out of busy loop, and return and error

Yeah. Or since this is all hopeless already anyway, go with
msleep_interruptible().
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
