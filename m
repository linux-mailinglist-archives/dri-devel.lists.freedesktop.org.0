Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5C7DFEAA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 06:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52910E07D;
	Fri,  3 Nov 2023 05:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ABD10E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 05:12:59 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso24002181fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698988377; x=1699593177;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nn1qLD9vHXNL2fzUzW9TiHQVVHyoRzfM0xQyXA2NHEA=;
 b=E/VbLpmaKBjbBPSWq9jhf/grE3u/PsTMEDxgqAhj2k40X1eDY0WnW9OZ62ViunpMr7
 JkJ1aI1rG+VszksUkrJAhoD/+XNYrB3X/rXHHMBSFeCcqmEI1Od4Vj0NVh/fw8ZWyVnI
 ABdBs/4ZgEljB+MZ8Fcf6RCsOln4eUxvnm4zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698988377; x=1699593177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nn1qLD9vHXNL2fzUzW9TiHQVVHyoRzfM0xQyXA2NHEA=;
 b=s9x7sPbho09uNZ3LincZaT9TbQ1zsxUUxjDvXpJMJkFIyuj/pLSXf/bFb4q5Mge+KW
 U0amnw5X2wx4eVc2G6Vnpk9jQ3aDCFKT7SOxocfdAuWOwrHUTluqtqFvF78AeSa1lwPF
 dKfusjhvgo/rOwc4IvQWFj2E5VdjuKjxkSfW4vjwKmEqsRrFt8/RZTXMJeSndjI19wHO
 9DXy/oHnCmrzFems69Ybg5KB+3KQC0XzD4cl0OCBWCjrIDrJD5MGhrn51y8bcT3L9ZL0
 sdLylLqt3uKwSd1m5z70ZPVqpMFF66bj22bCPMoQfm+x6HoTABNb2754z8MxKIu1YcBK
 wWsA==
X-Gm-Message-State: AOJu0YzqxMn+vo9B2S2Ql6fah+e6rDp2ogVA91JYx87acNcfbX/b3LE/
 GfmESQud3IWg7wjBIS9ZQMpCEZkWUd1vvQHI2l2jSmEqbrCLtpDQk7M=
X-Google-Smtp-Source: AGHT+IF9MB1uceS9yyoXZyzYv0UhO0V7UARkFbRH7bMYHXMlG9qVjbGvMAAM+itJTqlyKhS9ktxlCfTUKb740JWY4ms=
X-Received: by 2002:a05:6512:3b8c:b0:509:4ab2:3635 with SMTP id
 g12-20020a0565123b8c00b005094ab23635mr3359299lfv.59.1698988376012; Thu, 02
 Nov 2023 22:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Nov 2023 13:12:44 +0800
Message-ID: <CAGXv+5FHwhQuDf+JCSPg_q+eV1Qb37e6bN7djO5GUSbB5pBv_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/panfrost: Implement ability to turn on/off GPU
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

On Thu, Nov 2, 2023 at 10:26=E2=80=AFPM AngeloGioacchino Del Regno
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
> issues when turning on and off clocks aggressively (in PM runtime)
> resulting in a full system lockup.
>
> Doing this only for full system sleep never showed issues during my
> testing by suspending and resuming the system continuously for more
> than 100 cycles.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>
> Note: Even after fixing the panfrost_power_off() function, I'm still
> getting issues with turning off the clocks at .runtime_suspend() but
> this time, instead of getting a GPU lockup, the entire SoC will deadlock
> bringing down the entire system with it (so it's even worst!) :-)

IIRC the power domain controller also manages some bus isolation bits
that prevent SoC lockup when the clock is disabled. Would reversing
the runtime PM calls and the clock calls help?

ChenYu

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
>  };
>
>  struct panfrost_device {
> --
> 2.42.0
>
