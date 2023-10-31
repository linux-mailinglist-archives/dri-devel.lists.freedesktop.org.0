Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2B7DC4CE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 04:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B8510E3E2;
	Tue, 31 Oct 2023 03:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17710E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 03:19:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5090cc340a3so4096762e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 20:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698722338; x=1699327138;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNQLwo49Px+6WCj/W2NTIYzN6i7OOT1g2UlISqpXweI=;
 b=GZ2N9IzOUK9ad9+81oNrDSqopQI339BVT9j/anMLKmfH/Z1nvKJlMEVQaIaJ41ZOrm
 baM8i3zvls3hUVXqvuxSvQFBbF7FKKcO4bMWqmb7VVlQDA0F+p+iN3zlPbjTzqjuH7SR
 +SeqposyJM+jVZnbPz1I3T0Cl8yNNhtqWLuYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698722338; x=1699327138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNQLwo49Px+6WCj/W2NTIYzN6i7OOT1g2UlISqpXweI=;
 b=muqc1qTQdBMrU/liqWIIuizvhlRX1QqlmWiYUANX8anQ6fwcqVERhdYuO9m6smEZeM
 /9kVPMRuQaDm5gOI+l9dmCAHyvjiMB3I66ZWLQ/1sVcHIgos/Cl2BeYVUzcQqVz7fPNG
 ZPcyy1fsCK+tam+QrN0mYmHx29SPan1H7bcE8mlAqQenVPSx1BDkql5nPZ86hZM6nchw
 Cbsiuo7S7AfYwDNURpcStl55t7tBE26DZiBgEzyCGIKI1D0SB+mF8PakfxTdnxIZlmk1
 Uw9Lfc3nvMF7BdcfSU+u+y0GezpBZ8c0J8MLj63G1xEA1xiE3fPQBlvBvtdeeHJJaAQX
 kcFg==
X-Gm-Message-State: AOJu0YyVvIEeznk4PruBEmHLquA5KWg3UBJePo+N0bgbwpaBzO7Z01Q/
 fC9IE+jlB9o7FdwMnf/kVtRhbPfkaWtrxKu1noBDxg==
X-Google-Smtp-Source: AGHT+IG70+RAy2D5Z99ro2HsB5kY+gz5hD4sy61Te8tVYIoK+ihDLf3y0canUC3TaqjFMHD0D2J28xsHskYVMTUQ5Ec=
X-Received: by 2002:ac2:4435:0:b0:500:a378:db71 with SMTP id
 w21-20020ac24435000000b00500a378db71mr8153669lfl.57.1698722337994; Mon, 30
 Oct 2023 20:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
 <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Oct 2023 11:18:46 +0800
Message-ID: <CAGXv+5EhRUz6qptSzhzbcq4-qQKDzN5xFtS0WMNUCOH5JSL0Jw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 9:23=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Currently, the GPU is being internally powered off for runtime suspend
> and turned back on for runtime resume through commands sent to it, but
> note that the GPU doesn't need to be clocked during the poweroff state,
> hence it is possible to save some power on selected platforms.
>
> Add suspend and resume handlers for full system sleep and then add
> a new panfrost_gpu_pm enumeration and a pm_features variable in the
> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
> enable this power saving technique only on SoCs that are able to
> safely use it.
>
> Note that this was implemented only for the system sleep case and not
> for runtime PM because testing on one of my MediaTek platforms showed
> issues when turning on and off clocks aggressively (in PM runtime),
> with the GPU locking up and unable to soft reset, eventually resulting
> in a full system lockup.
>
> Doing this only for full system sleep never showed issues in 3 days
> of testing by suspending and resuming the system continuously.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
>  2 files changed, 68 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 28f7046e1b1a..2022ed76a620 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pf=
dev)
>         panfrost_job_enable_interrupts(pfdev);
>  }
>
> -static int panfrost_device_resume(struct device *dev)
> +static int panfrost_device_runtime_resume(struct device *dev)
>  {
>         struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
>
> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
>         return 0;
>  }
>
> -static int panfrost_device_suspend(struct device *dev)
> +static int panfrost_device_runtime_suspend(struct device *dev)
>  {
>         struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
>
> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *de=
v)
>         return 0;
>  }
>
> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
> -                             panfrost_device_resume, NULL);
> +static int panfrost_device_resume(struct device *dev)
> +{
> +       struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> +               ret =3D clk_enable(pfdev->clock);
> +               if (ret)
> +                       return ret;
> +
> +               if (pfdev->bus_clock) {
> +                       ret =3D clk_enable(pfdev->bus_clock);
> +                       if (ret)
> +                               goto err_bus_clk;
> +               }
> +       }
> +
> +       ret =3D pm_runtime_force_resume(dev);
> +       if (ret)
> +               goto err_resume;
> +
> +       return 0;
> +
> +err_resume:
> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_=
clock)
> +               clk_disable(pfdev->bus_clock);
> +err_bus_clk:
> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
> +               clk_disable(pfdev->clock);
> +       return ret;
> +}
> +
> +static int panfrost_device_suspend(struct device *dev)
> +{
> +       struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D pm_runtime_force_suspend(dev);
> +       if (ret)
> +               return ret;
> +
> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> +               clk_disable(pfdev->clock);
> +
> +               if (pfdev->bus_clock)
> +                       clk_disable(pfdev->bus_clock);
> +       }
> +
> +       return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) =3D {
> +       RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_r=
untime_resume, NULL)
> +       SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resu=
me)
> +};
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 1ef38f60d5dc..d7f179eb8ea3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -25,6 +25,14 @@ struct panfrost_perfcnt;
>  #define NUM_JOB_SLOTS 3
>  #define MAX_PM_DOMAINS 5
>
> +/**
> + * enum panfrost_gpu_pm - Supported kernel power management features
> + * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> + */
> +enum panfrost_gpu_pm {
> +       GPU_PM_CLK_DIS,
> +};
> +
>  struct panfrost_features {
>         u16 id;
>         u16 revision;
> @@ -75,6 +83,9 @@ struct panfrost_compatible {
>
>         /* Vendor implementation quirks callback */
>         void (*vendor_quirk)(struct panfrost_device *pfdev);
> +
> +       /* Allowed PM features */
> +       u8 pm_features;

Nit: I'd just use bitfields. They are easier to set and get without
extra macros, and the naming would be self-explanatory. Unless you
expect a need to do mask checking (though the compiler might be able
to optimize this).

ChenYu

>  };
>
>  struct panfrost_device {
> --
> 2.42.0
>
