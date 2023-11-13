Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912467E971B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 08:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC2910E071;
	Mon, 13 Nov 2023 07:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4010E071
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 07:39:55 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1efba24b038so704631fac.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1699861194; x=1700465994; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=90/XKw4sFrMtIKkLPnVT3kc5IUUIlTFSHfV4SQiBxFk=;
 b=iPTU4JkhqWAlqnaviLHiXgJTH2CCXzLPwU4PGG0kOatmeVdX+acBX+BrJG4kb3K3nW
 w1bnMYcc2QWWKEE7J+mBlvzhFEJ86aUAbJYrsMYmmYtfeIDA4TIDLv7de0iKM/fMQM0+
 3KZhsL20/wbpTOEojz3ntDzU9aV8be8S8njWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699861194; x=1700465994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=90/XKw4sFrMtIKkLPnVT3kc5IUUIlTFSHfV4SQiBxFk=;
 b=oisunrBmBOPQHcFrhRYmYbwjFTrF7NVkhaFV5yA2xMH6/k9elWBJV4aiDmIgCYoCCf
 8TmntoROQlnu0DSTLGBct151N0gHZexaAuidVdq+yN1acV0ZRgzy8R0HGR2br6CO99X2
 GJ0gONMLO0Qvd3V0y/3rCb9KFbJqgFNHYwW1kj84HiJd9I+rpAF1v9FhrKMojruVAItW
 6XbM0up+QurHBrSef5NABdr6kC2Z6HWFDgKpbg2B+1y4LZu+z7Pp5+vR1WFRk358EDxF
 geiA8bVlnj0f3etlB5Riq8ho5MPAKyeuy2Z02HtRNOfXOldc+meQnNY6REZqIVZvfRPz
 jPaw==
X-Gm-Message-State: AOJu0Yw60eGz053MCcGVJEIqA8js78PI7ydZoTbtA7djJWJRpkpilHwP
 X5QevexrarRNNoiTEX4WsyPoEvEjcz5BwxM//u3AjtWv0KQvzqQnpN4=
X-Google-Smtp-Source: AGHT+IHHxE93UCO7it0aSc8aZ63eoVnJmMAHID8XkGzFzEhAjj5FVOh0xErO97O0wDxkiJ8tBTBr4LQcTYpiy1k2Y/A=
X-Received: by 2002:a05:6870:c685:b0:1d0:e372:6cf8 with SMTP id
 cv5-20020a056870c68500b001d0e3726cf8mr7581411oab.2.1699861194030; Sun, 12 Nov
 2023 23:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
 <20231028155936.1183342-4-stanislaw.gruszka@linux.intel.com>
In-Reply-To: <20231028155936.1183342-4-stanislaw.gruszka@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 13 Nov 2023 08:39:42 +0100
Message-ID: <CAKMK7uHiPvFOLFUHqdoKKupdx4t3FnDZH-wDXhaihKfz+KfHOQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] accel/ivpu: Stop job_done_thread on suspend
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This conflicts with the kthread change in 6.7-rc1 6309727ef271
("kthread: add kthread_stop_put")

Please double-check that the conflict resolution I've done in drm-tip
is correct and then ask drm-misc/accel maintainers to backmerge -rc2
to bake this in properly. Adding them as fyi.
-Sima


On Sat, 28 Oct 2023 at 18:00, Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> Stop job_done thread when going to suspend. Use kthread_park() instead
> of kthread_stop() to avoid memory allocation and potential failure
> on resume.
>
> Use separate function as thread wake up condition. Use spin lock to assure
> rx_msg_list is properly protected against concurrent access.
>
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c |  2 ++
>  drivers/accel/ivpu/ivpu_ipc.c | 17 +++++++++++++++--
>  drivers/accel/ivpu/ivpu_job.c | 20 ++++++++++++++++----
>  drivers/accel/ivpu/ivpu_job.h |  2 ++
>  4 files changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 064cabef41bb..60277ff6af69 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -378,6 +378,7 @@ int ivpu_boot(struct ivpu_device *vdev)
>         enable_irq(vdev->irq);
>         ivpu_hw_irq_enable(vdev);
>         ivpu_ipc_enable(vdev);
> +       ivpu_job_done_thread_enable(vdev);
>         return 0;
>  }
>
> @@ -389,6 +390,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>         disable_irq(vdev->irq);
>         ivpu_ipc_disable(vdev);
>         ivpu_mmu_disable(vdev);
> +       ivpu_job_done_thread_disable(vdev);
>
>         ret = ivpu_hw_power_down(vdev);
>         if (ret)
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index d069d1e1f91d..270caef789bf 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -202,6 +202,20 @@ ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct v
>         return ret;
>  }
>
> +static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
> +{
> +       int ret = 0;
> +
> +       if (IS_KTHREAD())
> +               ret |= (kthread_should_stop() || kthread_should_park());
> +
> +       spin_lock_irq(&cons->rx_msg_lock);
> +       ret |= !list_empty(&cons->rx_msg_list);
> +       spin_unlock_irq(&cons->rx_msg_lock);
> +
> +       return ret;
> +}
> +
>  int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>                      struct ivpu_ipc_hdr *ipc_buf,
>                      struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
> @@ -211,8 +225,7 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>         int wait_ret, ret = 0;
>
>         wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
> -                                                   (IS_KTHREAD() && kthread_should_stop()) ||
> -                                                   !list_empty(&cons->rx_msg_list),
> +                                                   ivpu_ipc_rx_need_wakeup(cons),
>                                                     msecs_to_jiffies(timeout_ms));
>
>         if (IS_KTHREAD() && kthread_should_stop())
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 6e96c921547d..a245b2d44db7 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -590,6 +590,11 @@ static int ivpu_job_done_thread(void *arg)
>                                 ivpu_pm_schedule_recovery(vdev);
>                         }
>                 }
> +               if (kthread_should_park()) {
> +                       ivpu_dbg(vdev, JOB, "Parked %s\n", __func__);
> +                       kthread_parkme();
> +                       ivpu_dbg(vdev, JOB, "Unparked %s\n", __func__);
> +               }
>         }
>
>         ivpu_ipc_consumer_del(vdev, &cons);
> @@ -610,9 +615,6 @@ int ivpu_job_done_thread_init(struct ivpu_device *vdev)
>                 return -EIO;
>         }
>
> -       get_task_struct(thread);
> -       wake_up_process(thread);
> -
>         vdev->job_done_thread = thread;
>
>         return 0;
> @@ -620,6 +622,16 @@ int ivpu_job_done_thread_init(struct ivpu_device *vdev)
>
>  void ivpu_job_done_thread_fini(struct ivpu_device *vdev)
>  {
> +       kthread_unpark(vdev->job_done_thread);
>         kthread_stop(vdev->job_done_thread);
> -       put_task_struct(vdev->job_done_thread);
> +}
> +
> +void ivpu_job_done_thread_disable(struct ivpu_device *vdev)
> +{
> +       kthread_park(vdev->job_done_thread);
> +}
> +
> +void ivpu_job_done_thread_enable(struct ivpu_device *vdev)
> +{
> +       kthread_unpark(vdev->job_done_thread);
>  }
> diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
> index aa1f0b9479b0..a8e914e5affc 100644
> --- a/drivers/accel/ivpu/ivpu_job.h
> +++ b/drivers/accel/ivpu/ivpu_job.h
> @@ -61,6 +61,8 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev);
>
>  int ivpu_job_done_thread_init(struct ivpu_device *vdev);
>  void ivpu_job_done_thread_fini(struct ivpu_device *vdev);
> +void ivpu_job_done_thread_disable(struct ivpu_device *vdev);
> +void ivpu_job_done_thread_enable(struct ivpu_device *vdev);
>
>  void ivpu_jobs_abort_all(struct ivpu_device *vdev);
>
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
