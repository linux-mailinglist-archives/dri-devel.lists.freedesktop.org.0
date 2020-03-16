Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA43187034
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 17:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8D6E484;
	Mon, 16 Mar 2020 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104206E479;
 Mon, 16 Mar 2020 16:38:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b18so18238476edu.3;
 Mon, 16 Mar 2020 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HuM304MO1/ZB/qBf9QvuGFLVkiNetb4DHuULLR29UtE=;
 b=O1R/Tuy99Uc2SMTzuIKISJ/DTcWfVOeEI4FdK6RqhILSd5TF1DjAYyJgFm8/AhUesc
 +I8ejSy7gf7oG7/kjM5XSFMzBCGPX8sGlqjMQSSimZvPCzGsrh826EV7pnsqovO8nJjE
 0zolCX1BriW0+9ibBo5cxyHBD4XOGikQ1+N+FTBmzE6ULxFWxYMiC5X5jwDMbdfarO6O
 4nrp8L6yZP8Mr9hk1Y14ItydygAWMpfi5jKq9N7EhNjDFQtrdS/tKsybGrUfZLRKDUrm
 9j2lrjbcEoXOofU5uEm3K11cNJHAjdgs2vekaP8GXw09xV+kZW/ILzeh5WVYthIVi5s3
 Ct4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HuM304MO1/ZB/qBf9QvuGFLVkiNetb4DHuULLR29UtE=;
 b=oKW3XH9qCv6/q4/B1JrghixIo3pgM2kHrHByvIejXuSsPvFVpCv6Vsj4r5gOGR6yiR
 zHTdSd6PLSspLNkKwhq114qoAwNZeeuvHvu21OtYzDJcZtPENclhZL1BsKcdH4vHueTc
 RbwsHUYj2avbbih/S5uklKqds6AW5SRrrN0C+duNXJRcgwFyYuC3/+e0PtOC/YV9zpIs
 Dr3Yv8d2xf44znfyQH2G91b4FYTqcY0oC4GwSPNjQIqm6ZhdJfqvbfjt6mGrcM74G9qt
 YbbzFIFQRrVKxUrGgagD9hsv/0joqGEdgH0w2GKZeVHrCuYNVz1Wwohm1xcPrULHVsF8
 PiOQ==
X-Gm-Message-State: ANhLgQ2baOgpbJQT7pUWjDbeWtWygtJJQ4KP4JnR1SVzLpCChfCfLkR1
 NxH+CHjMtwm1JIgVfa1V3n4lmxoUZDHDkMRUNDhKlOoq
X-Google-Smtp-Source: ADFU+vuMUSlm+j3u+hl4D2E/jIJ+Wy5ofrMVRGh+JieievTTKXTXv7iYStChy+cpuggq64vtIfoppJmk8TZPRcQoWhU=
X-Received: by 2002:a17:906:b888:: with SMTP id
 hb8mr115808ejb.166.1584376691503; 
 Mon, 16 Mar 2020 09:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584356720-24411-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Mar 2020 09:38:01 -0700
Message-ID: <CAF6AEGtKZUODb0gNdx7qdyzKMFnqvRYVbB--1owOsS=chcGgoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 4:05 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 41 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  7 ++++++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  4 files changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index cb08faf..6e103d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -250,6 +251,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct drm_device *dev;
> +       struct msm_drm_private *priv;
> +       struct dpu_kms *dpu_kms;
> +       int i = 0;
> +       struct msm_dsi *dsi;
> +
> +       dpu_kms = to_dpu_kms(kms);
> +       dev = dpu_kms->dev;
> +       if (!dev) {
> +               DPU_ERROR("invalid device\n");
> +               return;
> +       }
> +
> +       priv = dev->dev_private;
> +       if (!priv) {
> +               DPU_ERROR("invalid private data\n");
> +               return;
> +       }

the !dev and !priv checks can be dropped.. these aren't things a user
should hit, and if I screw somethign up in development and hit that
case, I'd rather see a stack trace

otherwise, I think it looks reasonable

BR,
-R

> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +}
> +
>  static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>  {
>         struct drm_encoder *encoder;
> @@ -683,6 +715,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init    = dpu_kms_debugfs_init,
>  #endif
> +       .disable_dpu = _dpu_kms_disable_dpu,
>  };
>
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> @@ -1053,7 +1086,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>         return rc;
>  }
>
> +
> +static int __maybe_unused dpu_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct dev_pm_ops dpu_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dpu_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 55ea4bc2..3d3740e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -154,12 +154,19 @@ static int dsi_dev_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int __maybe_unused dsi_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdss-dsi-ctrl" },
>         {}
>  };
>
>  static const struct dev_pm_ops dsi_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(dsi_pm_suspend_late, NULL)
>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e4b750b..12ec1c6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1038,6 +1038,7 @@ static int msm_pm_suspend(struct device *dev)
>  {
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct msm_drm_private *priv = ddev->dev_private;
> +       struct msm_kms *kms = priv->kms;
>
>         if (WARN_ON(priv->pm_state))
>                 drm_atomic_state_put(priv->pm_state);
> @@ -1049,6 +1050,11 @@ static int msm_pm_suspend(struct device *dev)
>                 return ret;
>         }
>
> +       if (kms->funcs->disable_dpu)
> +               kms->funcs->disable_dpu(kms);
> +
> +       pm_runtime_put_sync(dev);
> +
>         return 0;
>  }
>
> @@ -1067,6 +1073,13 @@ static int msm_pm_resume(struct device *dev)
>
>         return ret;
>  }
> +
> +static int msm_pm_suspend_late(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +       return 0;
> +}
> +
>  #endif
>
>  #ifdef CONFIG_PM
> @@ -1100,6 +1113,7 @@ static int msm_runtime_resume(struct device *dev)
>  #endif
>
>  static const struct dev_pm_ops msm_pm_ops = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend_late, NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
>  };
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..c73a89b 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -126,6 +126,8 @@ struct msm_kms_funcs {
>         /* debugfs: */
>         int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
>  #endif
> +       void (*disable_dpu)(struct msm_kms *kms);
> +
>  };
>
>  struct msm_kms;
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
