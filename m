Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3044DD363
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 04:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2D910E250;
	Fri, 18 Mar 2022 03:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Fri, 18 Mar 2022 03:00:48 UTC
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn
 [202.108.3.25])
 by gabe.freedesktop.org (Postfix) with SMTP id 5712210E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 03:00:47 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.61.131])
 by sina.com (172.16.97.23) with ESMTP
 id 6233F4900002CE3E; Fri, 18 Mar 2022 10:55:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 53681054919322
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/gpu: Remove mutex from wait_event
 condition
Date: Fri, 18 Mar 2022 10:55:12 +0800
Message-Id: <20220318025512.2199-1-hdanton@sina.com>
In-Reply-To: <CAF6AEGvF7rJ2iK+roGTA1BEthwCLMguMHrG-45dyxfk=b-acug@mail.gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-4-robdclark@gmail.com>
 <3b066b63-c180-09c6-e39f-b408464b5bc1@quicinc.com>
MIME-Version: 1.0
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
Cc: open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Mar 2022 14:07:45 -0700 Rob Clark wrote:
> On Thu, Mar 17, 2022 at 1:45 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On 3/11/2022 5:16 AM, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The mutex wasn't really protecting anything before.  Before the previous
> > > patch we could still be racing with the scheduler's kthread, as that is
> > > not necessarily frozen yet.  Now that we've parked the sched threads,
> > > the only race is with jobs retiring, and that is harmless, ie.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +----------
> > >   1 file changed, 1 insertion(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index 0440a98988fc..661dfa7681fb 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -607,15 +607,6 @@ static int adreno_runtime_resume(struct device *dev)
> > >       return gpu->funcs->pm_resume(gpu);
> > >   }
> > >
> > > -static int active_submits(struct msm_gpu *gpu)
> > > -{
> > > -     int active_submits;
> > > -     mutex_lock(&gpu->active_lock);
> > > -     active_submits = gpu->active_submits;
> > > -     mutex_unlock(&gpu->active_lock);
> > I assumed that this lock here was to ensure proper barriers while
> > reading active_submits. Is that not required?
> 
> There is a spinlock in prepare_to_wait_event() ahead of checking the
> condition, which AFAIU is a sufficient barrier

set_current_state() is instead - feel free to grep it in <linux/wait.h>

Hillf
> 
> BR,
> -R
> 
> >
> > -Akhil.
> > > -     return active_submits;
> > > -}
> > > -
> > >   static int adreno_runtime_suspend(struct device *dev)
> > >   {
> > >       struct msm_gpu *gpu = dev_to_gpu(dev);
> > > @@ -669,7 +660,7 @@ static int adreno_system_suspend(struct device *dev)
> > >       suspend_scheduler(gpu);
> > >
> > >       remaining = wait_event_timeout(gpu->retire_event,
> > > -                                    active_submits(gpu) == 0,
> > > +                                    gpu->active_submits == 0,
> > >                                      msecs_to_jiffies(1000));
> > >       if (remaining == 0) {
> > >               dev_err(dev, "Timeout waiting for GPU to suspend\n");
> >
