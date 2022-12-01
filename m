Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562263F8BC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 21:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE4F89190;
	Thu,  1 Dec 2022 20:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF98789190
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 20:01:21 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id s8so4169449lfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 12:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cnKiAadCWzadTDUW5J2+0pFHNAVjUw3i6CoGjclarNA=;
 b=ySFIZh52oc9PhTAtIMxv0tVmSr5QegC8amOwxmJ1HZOtrVNbMFnMOiB7rEN/sWpkBu
 Grg3f+akaeypy7LSOUdPTVARtdHWPcY5gzCHcis3zRQrvOFdz/w6g8oyaYy5PNBtef0w
 N/A1pEsfwT49u6TFdy0qen/EKnl3DXaB46tnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnKiAadCWzadTDUW5J2+0pFHNAVjUw3i6CoGjclarNA=;
 b=rfFUJc6l8K68SybBDOKRqsJ/vaEPtina/DwZXlD0zdjbYQo4TEDnuBBThfJx9ESQcl
 6hyuojZGX6m+7sIGqDGfC3xOeCtX86dUluu8jFHD6EpZsPwLx+ZGOCc/iqI8BuuETAeA
 RlIrMDpF/jPfdDnvU4Txd/oITGLoqG2oONVTkQjNn3swtDxI90nyO/E1js+MCLz271UX
 ZyCDvzk2k10lq4LxduHOlTzCEW90r0+W2C5zvGhLcCdjrZroOUjESdKU2oaC+useeOUd
 +0yqc3CdAhVWZEXm5EwkAY+4CnP1RX7Wok/8K1TtayOLEt6CsUz+6X7lMIyX3RdOBu8K
 drLQ==
X-Gm-Message-State: ANoB5pnT4UNhjqhHMUO7m/dyKAnqSGwj5pwmdvTVoMbknRdjrVhycnUm
 TlvSLBf7avYSduPKm91xj5n30UfXIoKsQr3VzWUmJw==
X-Google-Smtp-Source: AA0mqf4oteyggUAiBUqAK/Y2/LaT3zFlOCz6UMCZBjzBntn1f9zdih1UN/5FBLadjkOoPa025xso10AfWbcGSUGjPNU=
X-Received: by 2002:a05:6512:3a96:b0:4b4:f5da:fb28 with SMTP id
 q22-20020a0565123a9600b004b4f5dafb28mr12312904lfu.169.1669924880036; Thu, 01
 Dec 2022 12:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20221111194957.4046771-1-joel@joelfernandes.org>
 <20221111194957.4046771-2-joel@joelfernandes.org>
 <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
 <CAF6AEGtEswqCRXkrd+tWKb_1N1UXgQ=EVMTZAgxxpNcD2vYGHQ@mail.gmail.com>
 <CAEXW_YSKBsVKBqJHB=9dQYV9XboTnsNb10ESJk1S_ia0gyKbuw@mail.gmail.com>
 <CAF6AEGv9nOy6+_xgs3oF5GUKi+JZazS0G0fcviShGCpqzM9eEg@mail.gmail.com>
In-Reply-To: <CAF6AEGv9nOy6+_xgs3oF5GUKi+JZazS0G0fcviShGCpqzM9eEg@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 1 Dec 2022 20:01:08 +0000
Message-ID: <CAEXW_YT=t4H=zaaHGKBmLyOhW3HvXf0u=DrE=1++GhqCXSLXkw@mail.gmail.com>
Subject: Re: [PATCH 2/2] adreno: Detect shutdown during get_param()
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 1, 2022 at 7:33 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Dec 1, 2022 at 10:42 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > On Sat, Nov 12, 2022 at 6:35 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, Nov 11, 2022 at 1:28 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > >
> > > > On 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:
> > > > > Even though the GPU is shut down, during kexec reboot we can have userspace
> > > > > still running. This is especially true if KEXEC_JUMP is not enabled, because we
> > > > > do not freeze userspace in this case.
> > > > >
> > > > > To prevent crashes, track that the GPU is shutdown and prevent get_param() from
> > > > > accessing GPU resources if we find it shutdown.
> > > > >
> > > > > This fixes the following crash during kexec reboot on an ARM64 device with adreno GPU:
> > > > >
> > > > > [  292.534314] Kernel panic - not syncing: Asynchronous SError Interrupt
> > > > > [  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> > > > > [  292.534326] Call trace:
> > > > > [  292.534328]  dump_backtrace+0x0/0x1d4
> > > > > [  292.534337]  show_stack+0x20/0x2c
> > > > > [  292.534342]  dump_stack_lvl+0x60/0x78
> > > > > [  292.534347]  dump_stack+0x18/0x38
> > > > > [  292.534352]  panic+0x148/0x3b0
> > > > > [  292.534357]  nmi_panic+0x80/0x94
> > > > > [  292.534364]  arm64_serror_panic+0x70/0x7c
> > > > > [  292.534369]  do_serror+0x0/0x7c
> > > > > [  292.534372]  do_serror+0x54/0x7c
> > > > > [  292.534377]  el1h_64_error_handler+0x34/0x4c
> > > > > [  292.534381]  el1h_64_error+0x7c/0x80
> > > > > [  292.534386]  el1_interrupt+0x20/0x58
> > > > > [  292.534389]  el1h_64_irq_handler+0x18/0x24
> > > > > [  292.534395]  el1h_64_irq+0x7c/0x80
> > > > > [  292.534399]  local_daif_inherit+0x10/0x18
> > > > > [  292.534405]  el1h_64_sync_handler+0x48/0xb4
> > > > > [  292.534410]  el1h_64_sync+0x7c/0x80
> > > > > [  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
> > > > > [  292.534422]  a6xx_get_timestamp+0x40/0xb4
> > > > > [  292.534426]  adreno_get_param+0x12c/0x1e0
> > > > > [  292.534433]  msm_ioctl_get_param+0x64/0x70
> > > > > [  292.534440]  drm_ioctl_kernel+0xe8/0x158
> > > > > [  292.534448]  drm_ioctl+0x208/0x320
> > > > > [  292.534453]  __arm64_sys_ioctl+0x98/0xd0
> > > > > [  292.534461]  invoke_syscall+0x4c/0x118
> > > > > [  292.534467]  el0_svc_common+0x98/0x104
> > > > > [  292.534473]  do_el0_svc+0x30/0x80
> > > > > [  292.534478]  el0_svc+0x20/0x50
> > > > > [  292.534481]  el0t_64_sync_handler+0x78/0x108
> > > > > [  292.534485]  el0t_64_sync+0x1a4/0x1a8
> > > > > [  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
> > > > > [  292.534635] PHYS_OFFSET: 0x80000000
> > > > > [  292.534638] CPU features: 0x40018541,a3300e42
> > > > > [  292.534644] Memory Limit: none
> > > > >
> > > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > > > > Cc: Ross Zwisler <zwisler@kernel.org>
> > > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > > ---
> > > > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> > > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
> > > > >   drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
> > > > >   3 files changed, 5 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > index f0cff62812c3..03d912dc0130 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device *pdev)
> > > > >   {
> > > > >       struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
> > > > >
> > > > > +     gpu->is_shutdown = true;
> > > > >       WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
> > > > >   }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > index 382fb7f9e497..6903c6892469 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > > > >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > > >
> > > > >       /* No pointer params yet */
> > > > > -     if (*len != 0)
> > > > > +     if (*len != 0 || gpu->is_shutdown)
> > > > >               return -EINVAL;
> > > > This will race with shutdown. Probably, propagating back the return
> > > > value of pm_runtime_get() in every possible ioctl call path is the right
> > > > thing to do.
> > > >
> > > > I have never thought about this scenario. Do you know why userspace is
> > > > not freezed before kexec?
> > >
> > > So userspace not being frozen seems like the root issue, and is likely
> > > to cause all sorts of other whack-a-mole problems.  I guess I'd like
> > > to know if this is the expected behavior?
> >
> > We tried that. Freezing before kexec seems to cause issues for ALSA as
> > Ricardo found:
> > https://lore.kernel.org/lkml/202211281209.mnBLzQ2I-lkp@intel.com/T/
> >
> > That patch is still TBD due to disagreement on the right approach to
> > fix, so I don't think freezing before shutting down devices is viable
> > at the moment.
> >
> > I am checking Ricardo if we can do something like util-linux's
> > shutdown code which sends SIGTERM to all processes:
> > https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/v2.8/login-utils/shutdown.c#273
> > , before issuing the kexec-reboot.
> >
> > Maybe, a more graceful shutdown from kexec-lite, will prevent the
> > kexec-reboot it does from crashing? Though in my view that would still
> > be a small copout instead of fixing the real issue, which is the
> > kernel crashing for any reason.
>
> The problem is that pm_runtime_force_suspend() yanks the rug out from
> under the driver from a runpm PoV.. generally this is ok (as long as
> scheduler kthread is parked) because we don't have to worry about
> userspace ;-)
>
> > > If so, we should probably look at
> > > drm_dev_is_unplugged()/drm_dev_unplug()/etc rather than trying to NIH
> > > that mechanism.  We would need to sprinkle drm_dev_is_unplugged()
> > > checks more widely, and also ensure that the scheduler kthread(s) gets
> > > parked.  But it would be nice to know first if we are just trying to
> > > paper over a kexec bug.
> >
> > Agreed. I think we still patch 1/2 whether the SIGTERM trick mentioned
> > above, works or not. I will await discussions with Ricardo before
> > reposting that one.
>
> Yeah, I think I'm waiting on a v2 of that one ;-)
>

Cool, I will send you a v2 on that shortly then, I think it is good to
do the patch 1/2 change anyway.

:-) Thanks,

 - Joel

> > Cheers,
> >
> >  -- Joel
