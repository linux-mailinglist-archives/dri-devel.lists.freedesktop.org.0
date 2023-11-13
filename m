Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE27E9801
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 09:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907910E15F;
	Mon, 13 Nov 2023 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E864510E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699865189; x=1731401189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gmxq88w/iGsKH4qbDzTAQLu1bUPv5mPSgUOG2tQYRBQ=;
 b=SnmHoR+FRVM+oFuMigOw/r3omD2LLP7Tk8O5TjI1weww6VljLJxk1mS8
 2D75ZBsRwK3I7S8Cv3BqRQsCgRKjcMrlWv5akacViop7Cs2I/XG3NJw3m
 ddS0nIFAl0IdhWo0BP1RdjGz8VW4XF+VDRO/cfZjqhDvKLXsT2o86cPOM
 3APIzPVv9ORCWHVlkZIP1TNpj93enqCqxGrZb7YK01CZtDIvw1WnQSSEF
 4axuVLYPhlaoOwJNa5rPA0BL72A2tge91Pf0uriETs5S+CyW73BFz0QH3
 bijBqdbU6I2C/pzY0VosechSPlg4dwqhqi6GcEAqCqoAcDnANaAtQYBy0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421495834"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="421495834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="740713798"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740713798"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.83])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:46:26 -0800
Date: Mon, 13 Nov 2023 09:46:24 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/8] accel/ivpu: Stop job_done_thread on suspend
Message-ID: <ZVHiYKagsIb/jnYi@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
 <20231028155936.1183342-4-stanislaw.gruszka@linux.intel.com>
 <CAKMK7uHiPvFOLFUHqdoKKupdx4t3FnDZH-wDXhaihKfz+KfHOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHiPvFOLFUHqdoKKupdx4t3FnDZH-wDXhaihKfz+KfHOQ@mail.gmail.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi 
On Mon, Nov 13, 2023 at 08:39:42AM +0100, Daniel Vetter wrote:
> This conflicts with the kthread change in 6.7-rc1 6309727ef271
> ("kthread: add kthread_stop_put")
> 
> Please double-check that the conflict resolution I've done in drm-tip
> is correct and then ask drm-misc/accel maintainers to backmerge -rc2
> to bake this in properly. Adding them as fyi.

Can not rebuild drm-tip due to core-to-CI merge problem. However resolution
in drm-rerere commit fa53f5a2888265d883eedb83a943613a410b9fc9 is correct.

Thomas please do the backmarge.

Regards
Stanislaw

> On Sat, 28 Oct 2023 at 18:00, Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > Stop job_done thread when going to suspend. Use kthread_park() instead
> > of kthread_stop() to avoid memory allocation and potential failure
> > on resume.
> >
> > Use separate function as thread wake up condition. Use spin lock to assure
> > rx_msg_list is properly protected against concurrent access.
> >
> > Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/accel/ivpu/ivpu_drv.c |  2 ++
> >  drivers/accel/ivpu/ivpu_ipc.c | 17 +++++++++++++++--
> >  drivers/accel/ivpu/ivpu_job.c | 20 ++++++++++++++++----
> >  drivers/accel/ivpu/ivpu_job.h |  2 ++
> >  4 files changed, 35 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index 064cabef41bb..60277ff6af69 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -378,6 +378,7 @@ int ivpu_boot(struct ivpu_device *vdev)
> >         enable_irq(vdev->irq);
> >         ivpu_hw_irq_enable(vdev);
> >         ivpu_ipc_enable(vdev);
> > +       ivpu_job_done_thread_enable(vdev);
> >         return 0;
> >  }
> >
> > @@ -389,6 +390,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
> >         disable_irq(vdev->irq);
> >         ivpu_ipc_disable(vdev);
> >         ivpu_mmu_disable(vdev);
> > +       ivpu_job_done_thread_disable(vdev);
> >
> >         ret = ivpu_hw_power_down(vdev);
> >         if (ret)
> > diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> > index d069d1e1f91d..270caef789bf 100644
> > --- a/drivers/accel/ivpu/ivpu_ipc.c
> > +++ b/drivers/accel/ivpu/ivpu_ipc.c
> > @@ -202,6 +202,20 @@ ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct v
> >         return ret;
> >  }
> >
> > +static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
> > +{
> > +       int ret = 0;
> > +
> > +       if (IS_KTHREAD())
> > +               ret |= (kthread_should_stop() || kthread_should_park());
> > +
> > +       spin_lock_irq(&cons->rx_msg_lock);
> > +       ret |= !list_empty(&cons->rx_msg_list);
> > +       spin_unlock_irq(&cons->rx_msg_lock);
> > +
> > +       return ret;
> > +}
> > +
> >  int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
> >                      struct ivpu_ipc_hdr *ipc_buf,
> >                      struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
> > @@ -211,8 +225,7 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
> >         int wait_ret, ret = 0;
> >
> >         wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
> > -                                                   (IS_KTHREAD() && kthread_should_stop()) ||
> > -                                                   !list_empty(&cons->rx_msg_list),
> > +                                                   ivpu_ipc_rx_need_wakeup(cons),
> >                                                     msecs_to_jiffies(timeout_ms));
> >
> >         if (IS_KTHREAD() && kthread_should_stop())
> > diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> > index 6e96c921547d..a245b2d44db7 100644
> > --- a/drivers/accel/ivpu/ivpu_job.c
> > +++ b/drivers/accel/ivpu/ivpu_job.c
> > @@ -590,6 +590,11 @@ static int ivpu_job_done_thread(void *arg)
> >                                 ivpu_pm_schedule_recovery(vdev);
> >                         }
> >                 }
> > +               if (kthread_should_park()) {
> > +                       ivpu_dbg(vdev, JOB, "Parked %s\n", __func__);
> > +                       kthread_parkme();
> > +                       ivpu_dbg(vdev, JOB, "Unparked %s\n", __func__);
> > +               }
> >         }
> >
> >         ivpu_ipc_consumer_del(vdev, &cons);
> > @@ -610,9 +615,6 @@ int ivpu_job_done_thread_init(struct ivpu_device *vdev)
> >                 return -EIO;
> >         }
> >
> > -       get_task_struct(thread);
> > -       wake_up_process(thread);
> > -
> >         vdev->job_done_thread = thread;
> >
> >         return 0;
> > @@ -620,6 +622,16 @@ int ivpu_job_done_thread_init(struct ivpu_device *vdev)
> >
> >  void ivpu_job_done_thread_fini(struct ivpu_device *vdev)
> >  {
> > +       kthread_unpark(vdev->job_done_thread);
> >         kthread_stop(vdev->job_done_thread);
> > -       put_task_struct(vdev->job_done_thread);
> > +}
> > +
> > +void ivpu_job_done_thread_disable(struct ivpu_device *vdev)
> > +{
> > +       kthread_park(vdev->job_done_thread);
> > +}
> > +
> > +void ivpu_job_done_thread_enable(struct ivpu_device *vdev)
> > +{
> > +       kthread_unpark(vdev->job_done_thread);
> >  }
> > diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
> > index aa1f0b9479b0..a8e914e5affc 100644
> > --- a/drivers/accel/ivpu/ivpu_job.h
> > +++ b/drivers/accel/ivpu/ivpu_job.h
> > @@ -61,6 +61,8 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev);
> >
> >  int ivpu_job_done_thread_init(struct ivpu_device *vdev);
> >  void ivpu_job_done_thread_fini(struct ivpu_device *vdev);
> > +void ivpu_job_done_thread_disable(struct ivpu_device *vdev);
> > +void ivpu_job_done_thread_enable(struct ivpu_device *vdev);
> >
> >  void ivpu_jobs_abort_all(struct ivpu_device *vdev);
> >
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
