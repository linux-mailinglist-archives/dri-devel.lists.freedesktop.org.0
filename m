Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935151ED42D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 18:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4D89A57;
	Wed,  3 Jun 2020 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A2A89A57
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 16:23:11 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k4so783613oik.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 09:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0tH0k+NKmqZwrk0o/ce4PRCneuv7ifovr1S3MHnzdQ=;
 b=m6w6N2JQdmkBfIVly09ykkGNhf8/JvxLrE7ZB4g+tENYsgSTo2jAV0IYiRImgIv5U6
 vOtvynDUHxmyS8082k/A/VG2I7eWU+11gzqD6yT8YZPhJbg0HbaOQH5cm5zoMVduscSL
 WFzQK7EYtR+7V+Fm9YRPQaqRxTB08OTBmXrmhdUvnhjYbVv56ISA0oxqQ1U0YzbkG1r6
 3S9YjyviS+j44w/fkmVfMQ2AiLod86xV2qtWybPWi5r+GCBeBsEk1kE8zrxj6dOD19v+
 HmZOPyCYXUtkcXeBhrhX6I8HabddKHSyjBB6l+L1K1aCTm1x/cCw9zQOBmSK86fSc7tB
 8Drg==
X-Gm-Message-State: AOAM533GtTESHKi+/sfC0aq91nn+gWAB4PT8zUVgtzHz4Ur69A+DAh6L
 ZoxjNsNNROiHiabrre46cqZDwDBkgkF/MejbimHAWUTSB28=
X-Google-Smtp-Source: ABdhPJwGbhBzu2/wV2PpRFGG9a3o5D1jEOyqXTkeaU16FlI8R1zzrfIL9oCIBz6eYF1bVRMcOc+uDVd0IGSSSo86mNA=
X-Received: by 2002:aca:eb56:: with SMTP id j83mr383303oih.110.1591201390749; 
 Wed, 03 Jun 2020 09:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
 <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
 <7201e161-6952-6e28-4036-bd0f0353ec30@arm.com>
 <CAJZ5v0jwoNSYOz3nGqNshd=5btsLxOp-di-Dot+cHqAQZEQVRw@mail.gmail.com>
 <d6a0d345-53ef-523c-836d-3bc4ea4c6e66@arm.com>
 <CAJZ5v0iDNH7tZmKsYgW1xp-g3WmOod+Wo-AzJmszXuv_wztwwA@mail.gmail.com>
 <d0894383-1362-fdea-f74c-7dd8ecdc33ca@arm.com>
In-Reply-To: <d0894383-1362-fdea-f74c-7dd8ecdc33ca@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Jun 2020 18:22:59 +0200
Message-ID: <CAJZ5v0jL0+TXDGXaO=WfYg6QM3=B83LLZ90xtc2HtX70jdoiYQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: Nishanth Menon <nm@ti.com>, Juri Lelli <juri.lelli@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Segall <bsegall@google.com>, alyssa.rosenzweig@collabora.com,
 Matthias Kaehlcke <mka@chromium.org>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, steven.price@arm.com,
 Chanwoo Choi <cw00.choi@samsung.com>, Ingo Molnar <mingo@redhat.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Zhang, Rui" <rui.zhang@intel.com>,
 Mel Gorman <mgorman@suse.de>, orjan.eide@arm.com,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Quentin Perret <qperret@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 patrick.bellasi@matbug.net, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 3, 2020 at 6:12 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 6/3/20 4:40 PM, Rafael J. Wysocki wrote:
> > On Wed, Jun 3, 2020 at 5:26 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>
> >>
> >>
> >> On 6/3/20 4:13 PM, Rafael J. Wysocki wrote:
> >>> On Tue, Jun 2, 2020 at 1:31 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>>>
> >>>> Hi Daniel,
> >>>>
> >>>> On 6/1/20 10:44 PM, Daniel Lezcano wrote:
> >>>>> On 27/05/2020 11:58, Lukasz Luba wrote:
> >>>>>> Add support for other devices than CPUs. The registration function
> >>>>>> does not require a valid cpumask pointer and is ready to handle new
> >>>>>> devices. Some of the internal structures has been reorganized in order to
> >>>>>> keep consistent view (like removing per_cpu pd pointers).
> >>>>>>
> >>>>>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> >>>>>> ---
> >>>>>
> >>>>> [ ... ]
> >>>>>
> >>>>>>     }
> >>>>>>     EXPORT_SYMBOL_GPL(em_register_perf_domain);
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
> >>>>>> + * @dev             : Device for which the EM is registered
> >>>>>> + *
> >>>>>> + * Try to unregister the EM for the specified device (but not a CPU).
> >>>>>> + */
> >>>>>> +void em_dev_unregister_perf_domain(struct device *dev)
> >>>>>> +{
> >>>>>> +    if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
> >>>>>> +            return;
> >>>>>> +
> >>>>>> +    if (_is_cpu_device(dev))
> >>>>>> +            return;
> >>>>>> +
> >>>>>> +    mutex_lock(&em_pd_mutex);
> >>>>>
> >>>>> Is the mutex really needed?
> >>>>
> >>>> I just wanted to align this unregister code with register. Since there
> >>>> is debugfs dir lookup and the device's EM existence checks I thought it
> >>>> wouldn't harm just to lock for a while and make sure the registration
> >>>> path is not used. These two paths shouldn't affect each other, but with
> >>>> modules loading/unloading I wanted to play safe.
> >>>>
> >>>> I can change it maybe to just dmb() and the end of the function if it's
> >>>> a big performance problem in this unloading path. What do you think?
> >>>
> >>> I would rather leave the mutex locking as is.
> >>>
> >>> However, the question to ask is what exactly may go wrong without that
> >>> locking in place?  Is there any specific race condition that you are
> >>> concerned about?
> >>>
> >>
> >> I tried to test this with module loading & unloading with panfrost
> >> driver and CPU hotplug (which should bail out quickly) and was OK.
> >> I don't see any particular race. I don't too much about the
> >> debugfs code, though. That's why I tried to protect from some
> >> scripts/services which try to re-load the driver.
> >>
> >> Apart from that, maybe just this dev->em = NULL to be populated to all
> >> CPUs, which mutex_unlock synchronizes for free here.
> >
> > If it may run concurrently with the registration for the same device,
> > the locking is necessary, but in that case the !dev->em_pd check needs
> > to go under the mutex too IMO, or you may end up leaking the pd if the
> > registration can run between that check and the point at which the
> > mutex is taken.
>
> They don't run concurrently for the same device and users of that EM are
> already gone.
> I just wanted to be sure that everything is cleaned and synced properly.
> Here is some example of the directories under
> /sys/kernel/debug/energy_model
> cpu0, cpu4, gpu, dsp, etc
>
> The only worry that I had was the debugfs dir name, which is a
> string from dev_name() and will be the same for the next registration
> if module is re-loaded.

OK, so that needs to be explained in a comment.

> So the 'name' is reused and debugfs_create_dir()
> and debugfs_remove_recursive() uses this fsnotify, but they are
> operating under inode_lock/unlock() on the parent dir 'energy_model'.
> Then there is also this debugfs_lookup() which is slightly different.
>
> That's why I put a mutex to separate all registration and unregistration
> for all devices.
> It should work without the mutex in unregister path, but I think it does
> not harm to take

Well, fair enough, but I still think that the !dev->em_pd check should
be done under the mutex or it will be confusing.

> it just in case and also have the CPU variable sync for free.

I'm not sure what you mean by the last part here?

> >
> > Apart from this your kerneldoc comments might me improved IMO.
> >
> > First of all, you can use @dev inside of a kerneldoc (if @dev
> > represents an argument of the documented function) and that will
> > produce the right output automatically.
>
> OK
>
> >
> > Second, it is better to avoid saying things like "Try to unregister
> > ..." in kerneldoc comments (the "Try to" part is redundant).  Simply
> > say "Unregister ..." instead.
>
> Good point, thanks, I will use "Unregister ..." then.
>
> >
> > Thanks!
> >
>
> Shell I send a 'resend patch' which changes these @dev and
> 'unregister' comments?

Yes, please, but see the comments above too.

> Or wait for you to finish reviewing the other patches and send v9?

That is not necessary, unless you want to make kerneldoc improvements
in the other patches.

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
