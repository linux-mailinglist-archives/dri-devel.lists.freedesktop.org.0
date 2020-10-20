Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3126293975
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 12:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D392C6EC44;
	Tue, 20 Oct 2020 10:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A88A6EC44
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:57:11 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id k68so1288394otk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqOPpZ12fcOCJG8387o2w3J06TqQ9CeNeDxu1JGqlZU=;
 b=f4lLkaQ3F26yg/sXjHZY/XBPSMiDqOJRzmwwgiPk5kxtfblwSwMMJlagh4yjto+M6u
 MiRxGozcLm7745Nhth8fHstJ8fBQi2q7auejnvbTXefJCZJTMS60ZpxhZ5xvaL5+h/3c
 t8gHcmcOsheP+iAMerStnKBZAneSFW6GubYzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqOPpZ12fcOCJG8387o2w3J06TqQ9CeNeDxu1JGqlZU=;
 b=fyc8G0BEJO3wbqmLRG3K16vBJxqE/JbL/F5SMm1sdlftE3rMASinBukOraYjrmdeqc
 lDFQusj9lGmvPS419BuUGIJrozMHEKNE1c8xOBXeFBFVPuL/vC/Ju50mQwvrKfimx9Zc
 GvfzuLTmji5co0QYhiZh7UTDtBWnljbIG+luSCPn5Yu7eaJH04LwaDq/uUm5uWqTEQHs
 vmuDx5Y60x41Tq7locFmhR6lsmukvqyx7eCVhcXZnfPOI6VWHoHt3Kp8ogFWBkawVrvx
 hYKJ/u1g/7ql/wwvjW4/SHrIW4O5TdqwdbDQTcJEEaWaeKde00B7HCErmlfdjtnforGP
 fWYw==
X-Gm-Message-State: AOAM530ig8akwZnUpdIxUiKTqmORdubaNSBd3O6AyYGJ3Xr28SiKLCAZ
 wDmSozRP1JED2qjsCb73e/Vx9lM5ZAIjzfPJNh/zoA==
X-Google-Smtp-Source: ABdhPJyIi2CTLsn4CJcOV6eOdo8RRdAeAXZ3rjIY+UPZF2ZYXpU4WIs86lAr/CB5twhZ3p7NMGSAQLzsBnhPvVRCTS8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr1390486ote.188.1603191430428; 
 Tue, 20 Oct 2020 03:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
In-Reply-To: <20201020090729.qgqish5kqamhvatj@vireshk-i7>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Oct 2020 12:56:59 +0200
Message-ID: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 11:07 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 12-10-20, 08:43, Rob Clark wrote:
> > On Mon, Oct 12, 2020 at 7:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Sun, Oct 11, 2020 at 07:09:34PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Unfortunately, due to an dev_pm_opp locking interaction with
> > > > mm->mmap_sem, we need to do pm get before aquiring obj locks,
> > > > otherwise we can have anger lockdep with the chain:
> > >
> > > tbh this sounds like a bug in that subsystem, since it means we cannot use
> > > said subsystem in mmap handlers either.
> > >
> > > So if you have some remapping unit or need to wake up your gpu to blt the
> > > buffer into system memory first, we're toast. That doesn't sound right. So
> > > maybe Cc: pm folks and figure out how to fix this long term properly? Imo
> > > not a good reason to hold up this patch set, since unwrangling mmap_sem
> > > tends to be work ...
> >
> > + a couple of PM folks
> >
> > Looks like it has been this way for quite some time, so I guess the
> > overlap between things using dev_pm_opp and mmap is low..
> >
> > fwiw, example splat so folks can see the locking interaction I am
> > talking about.. I suspect the pm_opp interaction with mm->mmap_sem is
> > from the debugfs calls while opp_table_lock is held?
>
> I am not very sure about why this circular locking dependency is
> happening here and how exactly can we fix it. The OPP core works under
> the opp_table_lock, from within which it creates/remove the debugfs
> stuff as well.

Yeah that's bad practice. Generally you shouldn't need to hold locks
in setup/teardown code, since there's no other thread which can
possible hold a reference to anything your touching anymore. Ofc
excluding quickly grabbing/dropping a lock to insert/remove objects
into lists and stuff.

The other reason is that especially with anything related to sysfs or
debugfs, the locking dependencies you're pulling in are enormous: vfs
locks pull in mm locks (due to mmap) and at that point there's pretty
much nothing left you're allowed to hold while acquiring such a lock.
For simple drivers this is no issue, but for fancy drivers (like gpu
drivers) which need to interact with core mm) this means your
subsystem is a major pain to use.

Usually the correct fix is to only hold your subsystem locks in
setup/teardown when absolutely required, and fix any data
inconsistency issues by reordering your setup/teardown code: When you
register as the last step and unregister as the first step, there's no
need for any additional locking. And hence no need to call debugfs
functions while holding your subsystem locks.

The catch phrase I use for this is "don't solve object lifetime issues
with locking". Instead use refcounting and careful ordering in
setup/teardown code.

I think Rob has found some duct-tape, so this isn't an immediate
issue, but would be really nice to get fixed.

Cheers, Daniel

> > [   15.627855] ======================================================
> > [   15.634202] WARNING: possible circular locking dependency detected
> > [   15.640550] 5.4.70 #41 Not tainted
> > [   15.644050] ------------------------------------------------------
> > [   15.650397] chrome/1805 is trying to acquire lock:
> > [   15.655314] ffffffed90720738 (opp_table_lock){+.+.}, at:
> > _find_opp_table+0x34/0x74
> > [   15.663092]
> > [   15.663092] but task is already holding lock:
> > [   15.669082] ffffff80ff3911a8 (reservation_ww_class_mutex){+.+.},
> > at: submit_lock_objects+0x70/0x1ec
> > [   15.678369]
> > [   15.678369] which lock already depends on the new lock.
> > [   15.678369]
> > [   15.686764]
> > [   15.686764] the existing dependency chain (in reverse order) is:
> > [   15.694438]
> > [   15.694438] -> #3 (reservation_ww_class_mutex){+.+.}:
> > [   15.701146]        __mutex_lock_common+0xec/0xc0c
> > [   15.705978]        ww_mutex_lock_interruptible+0x5c/0xc4
> > [   15.711432]        msm_gem_fault+0x2c/0x124
> > [   15.715731]        __do_fault+0x40/0x16c
> > [   15.719766]        handle_mm_fault+0x7cc/0xd98
> > [   15.724337]        do_page_fault+0x230/0x3b4
> > [   15.728721]        do_translation_fault+0x5c/0x78
> > [   15.733558]        do_mem_abort+0x4c/0xb4
> > [   15.737680]        el0_da+0x1c/0x20
> > [   15.741266]
> > [   15.741266] -> #2 (&mm->mmap_sem){++++}:
> > [   15.746809]        __might_fault+0x70/0x98
> > [   15.751022]        compat_filldir+0xf8/0x48c
> > [   15.755412]        dcache_readdir+0x70/0x1dc
> > [   15.759808]        iterate_dir+0xd4/0x180
> > [   15.763931]        __arm64_compat_sys_getdents+0xa0/0x19c
> > [   15.769476]        el0_svc_common+0xa8/0x178
> > [   15.773861]        el0_svc_compat_handler+0x2c/0x40
> > [   15.778868]        el0_svc_compat+0x8/0x10
> > [   15.783075]
> > [   15.783075] -> #1 (&sb->s_type->i_mutex_key#3){++++}:
> > [   15.789788]        down_write+0x54/0x16c
> > [   15.793826]        debugfs_remove_recursive+0x50/0x158
> > [   15.799108]        opp_debug_unregister+0x34/0x114
> > [   15.804028]        dev_pm_opp_put_opp_table+0xd0/0x14c
> > [   15.809308]        dev_pm_opp_put_clkname+0x3c/0x50
> > [   15.814318]        msm_dsi_host_destroy+0xb0/0xcc
> > [   15.819149]        dsi_destroy+0x40/0x58
> > [   15.823184]        dsi_bind+0x90/0x170
> > [   15.827041]        component_bind_all+0xf0/0x208
> > [   15.831787]        msm_drm_init+0x188/0x60c
> > [   15.836084]        msm_drm_bind+0x24/0x30
> > [   15.840205]        try_to_bring_up_master+0x15c/0x1a4
> > [   15.845396]        __component_add+0x98/0x14c
> > [   15.849878]        component_add+0x28/0x34
> > [   15.854086]        dp_display_probe+0x324/0x370
> > [   15.858744]        platform_drv_probe+0x90/0xb0
> > [   15.863400]        really_probe+0x134/0x2ec
> > [   15.867699]        driver_probe_device+0x64/0xfc
> > [   15.872443]        __device_attach_driver+0x8c/0xa4
> > [   15.877459]        bus_for_each_drv+0x90/0xd8
> > [   15.881939]        __device_attach+0xc0/0x148
> > [   15.886420]        device_initial_probe+0x20/0x2c
> > [   15.891254]        bus_probe_device+0x34/0x94
> > [   15.895726]        deferred_probe_work_func+0x78/0xb4
> > [   15.900914]        process_one_work+0x30c/0x5d0
> > [   15.905573]        worker_thread+0x240/0x3f0
> > [   15.909959]        kthread+0x144/0x154
> > [   15.913809]        ret_from_fork+0x10/0x18
> > [   15.918016]
> > [   15.918016] -> #0 (opp_table_lock){+.+.}:
> > [   15.923660]        __lock_acquire+0xee4/0x2450
> > [   15.928230]        lock_acquire+0x1cc/0x210
> > [   15.932527]        __mutex_lock_common+0xec/0xc0c
> > [   15.937359]        mutex_lock_nested+0x40/0x50
> > [   15.941928]        _find_opp_table+0x34/0x74
> > [   15.946312]        dev_pm_opp_find_freq_exact+0x2c/0xdc
> > [   15.951680]        a6xx_gmu_resume+0xc8/0xecc
> > [   15.952812] fscrypt: AES-256-CTS-CBC using implementation "cts-cbc-aes-ce"
> > [   15.956161]        a6xx_pm_resume+0x148/0x200
> > [   15.956166]        adreno_resume+0x28/0x34
> > [   15.956171]        pm_generic_runtime_resume+0x34/0x48
> > [   15.956174]        __rpm_callback+0x70/0x10c
> > [   15.956176]        rpm_callback+0x34/0x8c
> > [   15.956179]        rpm_resume+0x414/0x550
> > [   15.956182]        __pm_runtime_resume+0x7c/0xa0
> > [   15.956185]        msm_gpu_submit+0x60/0x1c0
> > [   15.956190]        msm_ioctl_gem_submit+0xadc/0xb60
> > [   16.003961]        drm_ioctl_kernel+0x9c/0x118
> > [   16.008532]        drm_ioctl+0x27c/0x408
> > [   16.012562]        drm_compat_ioctl+0xcc/0xdc
> > [   16.017038]        __se_compat_sys_ioctl+0x100/0x206c
> > [   16.022224]        __arm64_compat_sys_ioctl+0x20/0x2c
> > [   16.027412]        el0_svc_common+0xa8/0x178
> > [   16.031800]        el0_svc_compat_handler+0x2c/0x40
> > [   16.036810]        el0_svc_compat+0x8/0x10
> > [   16.041021]
> > [   16.041021] other info that might help us debug this:
> > [   16.041021]
> > [   16.049235] Chain exists of:
> > [   16.049235]   opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex
> > [   16.049235]
> > [   16.061014]  Possible unsafe locking scenario:
> > [   16.061014]
> > [   16.067091]        CPU0                    CPU1
> > [   16.071750]        ----                    ----
> > [   16.076399]   lock(reservation_ww_class_mutex);
> > [   16.081059]                                lock(&mm->mmap_sem);
> > [   16.087134]                                lock(reservation_ww_class_mutex);
> > [   16.094369]   lock(opp_table_lock);
> > [   16.097961]
> > [   16.097961]  *** DEADLOCK ***
> > [   16.097961]
> > [   16.104038] 3 locks held by chrome/1805:
> > [   16.108068]  #0: ffffff80fb20c0d8 (&dev->struct_mutex){+.+.}, at:
> > msm_ioctl_gem_submit+0x264/0xb60
> > [   16.117264]  #1: ffffff80dd712c70
> > (reservation_ww_class_acquire){+.+.}, at:
> > msm_ioctl_gem_submit+0x8e8/0xb60
> > [   16.127357]  #2: ffffff80ff3911a8
> > (reservation_ww_class_mutex){+.+.}, at: submit_lock_objects+0x70/0x1ec
> > [   16.137089]
> > [   16.137089] stack backtrace:
> > [   16.141567] CPU: 4 PID: 1805 Comm: chrome Not tainted 5.4.70 #41
> > [   16.147733] Hardware name: Google Lazor (rev1+) with LTE (DT)
> > [   16.153632] Call trace:
> > [   16.156154]  dump_backtrace+0x0/0x158
> > [   16.159924]  show_stack+0x20/0x2c
> > [   16.163340]  dump_stack+0xc8/0x160
> > [   16.166840]  print_circular_bug+0x2c4/0x2c8
> > [   16.171144]  check_noncircular+0x1a8/0x1b0
> > [   16.175351]  __lock_acquire+0xee4/0x2450
> > [   16.179382]  lock_acquire+0x1cc/0x210
> > [   16.183146]  __mutex_lock_common+0xec/0xc0c
> > [   16.187450]  mutex_lock_nested+0x40/0x50
> > [   16.191481]  _find_opp_table+0x34/0x74
> > [   16.195344]  dev_pm_opp_find_freq_exact+0x2c/0xdc
> > [   16.200178]  a6xx_gmu_resume+0xc8/0xecc
> > [   16.204120]  a6xx_pm_resume+0x148/0x200
> > [   16.208064]  adreno_resume+0x28/0x34
> > [   16.211743]  pm_generic_runtime_resume+0x34/0x48
> > [   16.216488]  __rpm_callback+0x70/0x10c
> > [   16.220342]  rpm_callback+0x34/0x8c
> > [   16.223933]  rpm_resume+0x414/0x550
> > [   16.227524]  __pm_runtime_resume+0x7c/0xa0
> > [   16.231731]  msm_gpu_submit+0x60/0x1c0
> > [   16.235586]  msm_ioctl_gem_submit+0xadc/0xb60
> > [   16.240066]  drm_ioctl_kernel+0x9c/0x118
> > [   16.244097]  drm_ioctl+0x27c/0x408
> > [   16.247602]  drm_compat_ioctl+0xcc/0xdc
> > [   16.251546]  __se_compat_sys_ioctl+0x100/0x206c
> > [   16.256204]  __arm64_compat_sys_ioctl+0x20/0x2c
> > [   16.260861]  el0_svc_common+0xa8/0x178
> > [   16.264716]  el0_svc_compat_handler+0x2c/0x40
> > [   16.269196]  el0_svc_compat+0x8/0x10
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > >   opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex
> > > >
> > > > For an explicit fencing userspace, the impact should be minimal
> > > > as we do all the fence waits before this point.  It could result
> > > > in some needless resumes in error cases, etc.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
> > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index 002130d826aa..a9422d043bfe 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -744,11 +744,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >
> > > >       ret = submit_lookup_objects(submit, args, file);
> > > >       if (ret)
> > > > -             goto out;
> > > > +             goto out_pre_pm;
> > > >
> > > >       ret = submit_lookup_cmds(submit, args, file);
> > > >       if (ret)
> > > > -             goto out;
> > > > +             goto out_pre_pm;
> > > > +
> > > > +     /*
> > > > +      * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
> > > > +      * in the resume path, we need to to rpm get before we lock objs.
> > > > +      * Which unfortunately might involve powering up the GPU sooner than
> > > > +      * is necessary.  But at least in the explicit fencing case, we will
> > > > +      * have already done all the fence waiting.
> > > > +      */
> > > > +     pm_runtime_get_sync(&gpu->pdev->dev);
> > > >
> > > >       /* copy_*_user while holding a ww ticket upsets lockdep */
> > > >       ww_acquire_init(&submit->ticket, &reservation_ww_class);
> > > > @@ -825,6 +834,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >
> > > >
> > > >  out:
> > > > +     pm_runtime_put(&gpu->pdev->dev);
> > > > +out_pre_pm:
> > > >       submit_cleanup(submit);
> > > >       if (has_ww_ticket)
> > > >               ww_acquire_fini(&submit->ticket);
>
> --
> viresh



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
