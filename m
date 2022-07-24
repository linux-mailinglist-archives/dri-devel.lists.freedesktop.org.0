Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E320B57F67E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 20:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DC418A59D;
	Sun, 24 Jul 2022 18:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FCF10FDF9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 18:36:31 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b25so7152256qka.11
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wl/2xuR1FSVoYZqi9XBz2dRU0jfQCtDOMxaQ1Job+Ok=;
 b=u4w8iJGNfRAHU94jWVELBxl4ZnyxoJ7o8Gau5gdKPKa1TQVZGCXImgMwL57flKOPZ+
 14ltA960GUXdzpHKb/1P4y31e8ZpCt5sZx2Mi3hNfJSwvr/IDCpTIrPW0CLZUckN+RBc
 SvDFwZaCC3Vr/5xT5A28HNbSL+5PcP1shWJxJGfET8ykBki07asgGfQmPg4Vyt02F3KF
 9d3vgi2UbOgbDDtjX33rFhxXIwMWFKL++BeuBsDAxmCVslSECt4F2UQgL8DVzIauIBVC
 A68Dcwk8wQM45DbLsubBUBU3GUBZN3ZAdetWs/5Hm54YXdC/1ph7xW9LFLNrk1l/6Fo0
 7Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wl/2xuR1FSVoYZqi9XBz2dRU0jfQCtDOMxaQ1Job+Ok=;
 b=PgM8DsfzkiXrlchX1r/FQnCQOPE+rcgS88crs3nJR1gxnoRdZ4fCSiRImATL5Eg/85
 OX+UOrRgraGvWXBZ1EA5k730q5VHY9bE1BTCKqhIvceXdh1071LOtjewjR9YOe6W0VZT
 qGq2LcF3hzaPYy13rBt4U1IopcFgrLkV+G+AFf7M51n2Dr/Q9ap2R0Wh46JDzR3sSZcz
 421lUh2ri9PXrsEUwBfj5HiB+90v7zDRY0rHWKJtgUDoJdG3NY/iLH2hYG4q/a565Qzw
 8XlcyVHm8hB2y+D9Ez3yfgNdSWSa1GoLC5oiTzueUavlkM22tILCDj2TsVEiZ1hpxK+1
 zU5Q==
X-Gm-Message-State: AJIora8DegTogVrXkPCPIy43awIPZlLnhsFT/IowLIpbhiSMq09Vk7jB
 w8wfmyHs9h0AHPGPxCndPoXcvALbkucQEUHW5awYuA==
X-Google-Smtp-Source: AGRyM1sycUYjr9Dv3D144+Q+yeg3sms9wYD3QwxDt/z3nE2qx/wYDp3yHfzn7PdzSIxmj8L1dfNPR8eWNNSRq9NyHpE=
X-Received: by 2002:a05:620a:4305:b0:6a9:3829:c03 with SMTP id
 u5-20020a05620a430500b006a938290c03mr6474913qko.363.1658687790809; Sun, 24
 Jul 2022 11:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220724111327.1195693-1-javierm@redhat.com>
In-Reply-To: <20220724111327.1195693-1-javierm@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Jul 2022 21:36:19 +0300
Message-ID: <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Jul 2022 at 14:13, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Drivers' .remove and .shutdown callbacks are executed on different code
> paths. The former is called when a device is removed from the bus, while
> the latter is called at system shutdown time to quiesce the device.
>
> This means that some overlap exists between the two, because both have to
> take care of properly shutting down the hardware. But currently the logic
> used in these two callbacks isn't consistent in msm drivers, which could
> lead to kernel oops.
>
> For example, on .remove the component is deleted and its .unbind callback
> leads to the hardware being shutdown but only if the DRM device has been
> marked as registered.
>
> That check doesn't exist in the .shutdown logic and this can lead to the
> driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
> been properly initialized.
>
> A situation like this can happen if drivers for expected sub-devices fail
> to probe, since the .bind callback will never be executed. If that is the
> case, drm_atomic_helper_shutdown() will attempt to take mutexes that are
> only initialized if drm_mode_config_init() is called during a device bind.
>
> This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
> shutdown hook in case GPU components failed to bind"), but unfortunately
> it still happens in some cases as the one mentioned above, i.e:
>
> [  169.495897] systemd-shutdown[1]: Powering off.
> [  169.500466] kvm: exiting hardware virtualization
> [  169.554787] platform wifi-firmware.0: Removing from iommu group 12
> [  169.610238] platform video-firmware.0: Removing from iommu group 10
> [  169.682164] ------------[ cut here ]------------
> [  169.686909] WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0
> ...
> [  169.775691] Hardware name: Google CoachZ (rev3+) (DT)
> [  169.780874] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  169.788021] pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
> [  169.793205] lr : drm_modeset_lock_all_ctx+0x48/0x3d0
> [  169.798299] sp : ffff80000805bb80
> [  169.801701] x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000
> [  169.809025] x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030
> [  169.816349] x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800
> [  169.823674] x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034
> [  169.830998] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
> [  169.838322] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
> [  169.845646] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  169.852971] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
> [  169.860295] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  169.867619] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0
> [  169.874944] Call trace:
> [  169.877467]  drm_modeset_lock_all_ctx+0x3c4/0x3d0
> [  169.882297]  drm_atomic_helper_shutdown+0x70/0x134
> [  169.887217]  msm_drv_shutdown+0x30/0x40
> [  169.891159]  platform_shutdown+0x28/0x40
> [  169.895191]  device_shutdown+0x148/0x350
> [  169.899221]  kernel_power_off+0x38/0x80
> [  169.903163]  __do_sys_reboot+0x288/0x2c0
> [  169.907192]  __arm64_sys_reboot+0x28/0x34
> [  169.911309]  invoke_syscall+0x48/0x114
> [  169.915162]  el0_svc_common.constprop.0+0x44/0xec
> [  169.919992]  do_el0_svc+0x2c/0xc0
> [  169.923394]  el0_svc+0x2c/0x84
> [  169.926535]  el0t_64_sync_handler+0x11c/0x150
> [  169.931013]  el0t_64_sync+0x18c/0x190
> [  169.934777] ---[ end trace 0000000000000000 ]---
> [  169.939557] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
> [  169.948574] Mem abort info:
> [  169.951452]   ESR = 0x0000000096000004
> [  169.955307]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  169.960765]   SET = 0, FnV = 0
> [  169.963901]   EA = 0, S1PTW = 0
> [  169.967127]   FSC = 0x04: level 0 translation fault
> [  169.972136] Data abort info:
> [  169.975093]   ISV = 0, ISS = 0x00000004
> [  169.979037]   CM = 0, WnR = 0
> [  169.982083] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000
> [  169.988697] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
> [  169.995669] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> ...
> [  170.079614] Hardware name: Google CoachZ (rev3+) (DT)
> [  170.084801] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  170.091941] pc : ww_mutex_lock+0x28/0x32c
> [  170.096064] lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
> [  170.101254] sp : ffff80000805bb50
> [  170.104658] x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000
> [  170.111977] x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018
> [  170.119296] x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800
> [  170.126615] x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034
> [  170.133933] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
> [  170.141252] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
> [  170.148571] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  170.155890] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
> [  170.163209] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  170.170528] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018
> [  170.177847] Call trace:
> [  170.180364]  ww_mutex_lock+0x28/0x32c
> [  170.184127]  drm_modeset_lock_all_ctx+0x1b0/0x3d0
> [  170.188957]  drm_atomic_helper_shutdown+0x70/0x134
> [  170.193876]  msm_drv_shutdown+0x30/0x40
> [  170.197820]  platform_shutdown+0x28/0x40
> [  170.201854]  device_shutdown+0x148/0x350
> [  170.205888]  kernel_power_off+0x38/0x80
> [  170.209832]  __do_sys_reboot+0x288/0x2c0
> [  170.213866]  __arm64_sys_reboot+0x28/0x34
> [  170.217990]  invoke_syscall+0x48/0x114
> [  170.221843]  el0_svc_common.constprop.0+0x44/0xec
> [  170.226672]  do_el0_svc+0x2c/0xc0
> [  170.230079]  el0_svc+0x2c/0x84
> [  170.233215]  el0t_64_sync_handler+0x11c/0x150
> [  170.237686]  el0t_64_sync+0x18c/0x190
> [  170.241451] Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)
> [  170.247704] ---[ end trace 0000000000000000 ]---
> [  170.252457] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [  170.260654] Kernel Offset: 0x495d77c00000 from 0xffff800008000000
> [  170.266910] PHYS_OFFSET: 0xffffcd8500000000
> [  170.271212] CPU features: 0x800,00c2a015,19801c82
> [  170.276042] Memory Limit: none
> [  170.279183] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Fixes: 623f279c7781 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> Changes in v2:
> - Take the registered check out of the msm_shutdown_hw() and make callers to check instead.
> - Make msm_shutdown_hw() an inline function.
> - Add a Fixes: tag.
>
>  drivers/gpu/drm/msm/msm_drv.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 1ed4cd09dbf8..6deecb13a31c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -190,6 +190,20 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>         return 0;
>  }
>
> +/*
> + * Shutdown the hw if we're far enough along where things might be on.
> + * If we run this too early, we'll end up panicking in any variety of
> + * places. Since we don't register the drm device until late in
> + * msm_drm_init, drm_dev->registered is used as an indicator that the
> + * shutdown will be successful.
> + *
> + * This function must only be called if drm_dev->registered is true.
> + */
> +static inline void msm_shutdown_hw(struct drm_device *dev)
> +{
> +       drm_atomic_helper_shutdown(dev);
> +}

Now there is no point in having this as a separate function. Could you
please inline it?

> +
>  static int msm_drm_uninit(struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> @@ -198,16 +212,9 @@ static int msm_drm_uninit(struct device *dev)
>         struct msm_kms *kms = priv->kms;
>         int i;
>
> -       /*
> -        * Shutdown the hw if we're far enough along where things might be on.
> -        * If we run this too early, we'll end up panicking in any variety of
> -        * places. Since we don't register the drm device until late in
> -        * msm_drm_init, drm_dev->registered is used as an indicator that the
> -        * shutdown will be successful.
> -        */
>         if (ddev->registered) {
>                 drm_dev_unregister(ddev);
> -               drm_atomic_helper_shutdown(ddev);
> +               msm_shutdown_hw(ddev);
>         }
>
>         /* We must cancel and cleanup any pending vblank enable/disable
> @@ -1242,10 +1249,8 @@ void msm_drv_shutdown(struct platform_device *pdev)
>         struct msm_drm_private *priv = platform_get_drvdata(pdev);
>         struct drm_device *drm = priv ? priv->dev : NULL;
>
> -       if (!priv || !priv->kms)
> -               return;
> -
> -       drm_atomic_helper_shutdown(drm);

It might be worth repeating the comment here.

> +       if (drm && drm->registered)
> +               msm_shutdown_hw(drm);
>  }
>
>  static struct platform_driver msm_platform_driver = {


-- 
With best wishes
Dmitry
