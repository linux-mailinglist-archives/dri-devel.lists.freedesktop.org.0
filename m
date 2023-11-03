Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C27DFFDC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 09:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC0110E4F2;
	Fri,  3 Nov 2023 08:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B57410E4F2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 08:58:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so2306293e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699001924; x=1699606724;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpja5pDDFxtVY86Bh/msPN1vq4hMql2vt1zs/3+McHU=;
 b=IqP3rhytrFylj1PaGZG3O4ZM4ZEGyuMSJRIMkJufsM38iwQa/6UFFfk+Ywr3noNHwl
 U5acTDjRA5o68C7xlx3WChCnh4mwNxrq2S4Apx5i0UpDOTDv71qOIXGwno5rHa2LxmNL
 HPk8eQ+/wWiIUyxupsGLLDqAZWeBJvEKZAkTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699001924; x=1699606724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpja5pDDFxtVY86Bh/msPN1vq4hMql2vt1zs/3+McHU=;
 b=nITqm7RcoMWcNy7I0ueSu1D6+sXp6RUlLLGHx8SdV8kiXFT25QiPXmcMevPLWu/QKS
 wMZdJaeL8H84rrMN6CdttDACqvCOR1cHCTZoEnZqHWO9sf28WBtK6cE0KS6myf4hQnPC
 XMgMtKZLm51OQKXpmwa3XAYjUP8ucMzNRwKWc+w565n6GQcJ4YgqAnNrs1I/RShFZuDt
 WsDPTAdfH0OLh84ZRJKPO47KslMoLfInn+K071xuCyxrJzIHbbkJ3Lfgj/Ju4dHGyAph
 Y5lotawn28qcIDKXMjLWZNdXtAlqCWINSxZm2Z6Z0L0R5lkoumtaER3FDQ4QBkBZQqyX
 Zsmw==
X-Gm-Message-State: AOJu0YydYtzLxNhDY799O3sgDCq3yUozhIuXs0yB10JIaOUS922iMGng
 b/zxXYcD5/VYwhB1+GT5N5alz8h13+cX2X93PPG2KA==
X-Google-Smtp-Source: AGHT+IECy7AraONKdQn+XwWDJPrpeClg9sVBr+83yBLkEAupT9WQiihp/He8w49fGlKVEtuTNALrHXiKFHWZNi77tY8=
X-Received: by 2002:a19:430d:0:b0:507:9d70:b297 with SMTP id
 q13-20020a19430d000000b005079d70b297mr14535011lfa.60.1699001924308; Fri, 03
 Nov 2023 01:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FHwhQuDf+JCSPg_q+eV1Qb37e6bN7djO5GUSbB5pBv_A@mail.gmail.com>
 <71826cf2-460d-48d1-85d3-735646db1e2a@collabora.com>
In-Reply-To: <71826cf2-460d-48d1-85d3-735646db1e2a@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Nov 2023 16:58:33 +0800
Message-ID: <CAGXv+5FzYrthgjbDU4WFtY-kyLUK14NZQn5OO9mUyrLeYB+vJA@mail.gmail.com>
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

On Fri, Nov 3, 2023 at 4:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 03/11/23 06:12, Chen-Yu Tsai ha scritto:
> > On Thu, Nov 2, 2023 at 10:26=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Currently, the GPU is being internally powered off for runtime suspend
> >> and turned back on for runtime resume through commands sent to it, but
> >> note that the GPU doesn't need to be clocked during the poweroff state=
,
> >> hence it is possible to save some power on selected platforms.
> >>
> >> Add suspend and resume handlers for full system sleep and then add
> >> a new panfrost_gpu_pm enumeration and a pm_features variable in the
> >> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
> >> enable this power saving technique only on SoCs that are able to
> >> safely use it.
> >>
> >> Note that this was implemented only for the system sleep case and not
> >> for runtime PM because testing on one of my MediaTek platforms showed
> >> issues when turning on and off clocks aggressively (in PM runtime)
> >> resulting in a full system lockup.
> >>
> >> Doing this only for full system sleep never showed issues during my
> >> testing by suspending and resuming the system continuously for more
> >> than 100 cycles.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>
> >> Note: Even after fixing the panfrost_power_off() function, I'm still
> >> getting issues with turning off the clocks at .runtime_suspend() but
> >> this time, instead of getting a GPU lockup, the entire SoC will deadlo=
ck
> >> bringing down the entire system with it (so it's even worst!) :-)
> >
> > IIRC the power domain controller also manages some bus isolation bits
> > that prevent SoC lockup when the clock is disabled. Would reversing
> > the runtime PM calls and the clock calls help?
> >
>
> Thanks for the reminder, but I tested that already... that doesn't work.
>
> There's one more thing I tried: on the MFG iospace, there are debug regis=
ters
> that you can poll to check if all bus transactions are finished (so, if t=
he bus
> is idle).
> During local testing, I even hacked in that, and even with the actual bus=
 being
> completely idle, it still freezes... and also checked some more in downst=
ream
> code (for Dimensity 9200, kernel 5.10) if there was any other "trick" tha=
t I
> could make use of, but to no avail.
>
> I'd propose to get at least this power saving upstreamed, then perhaps in=
 the
> future we can somehow revisit this to implement some more aggressive powe=
r
> management code?
> We're still getting a generous power saving with this one, I'd say...
>
> Anyway, I expect us to be effectively able to be more aggressive here, bu=
t I
> also expect that to take quite a bit of time (and probably some help from
> MediaTek as well)...

Sounds good to me.

> Angelo
>
> > ChenYu
> >
> >>   drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++=
--
> >>   drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
> >>   2 files changed, 68 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/=
drm/panfrost/panfrost_device.c
> >> index 28f7046e1b1a..2022ed76a620 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> >> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device =
*pfdev)
> >>          panfrost_job_enable_interrupts(pfdev);
> >>   }
> >>
> >> -static int panfrost_device_resume(struct device *dev)
> >> +static int panfrost_device_runtime_resume(struct device *dev)
> >>   {
> >>          struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> >>
> >> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *d=
ev)
> >>          return 0;
> >>   }
> >>
> >> -static int panfrost_device_suspend(struct device *dev)
> >> +static int panfrost_device_runtime_suspend(struct device *dev)
> >>   {
> >>          struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> >>
> >> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device =
*dev)
> >>          return 0;
> >>   }
> >>
> >> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspen=
d,
> >> -                             panfrost_device_resume, NULL);
> >> +static int panfrost_device_resume(struct device *dev)
> >> +{
> >> +       struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> >> +       int ret;
> >> +
> >> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> >> +               ret =3D clk_enable(pfdev->clock);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               if (pfdev->bus_clock) {
> >> +                       ret =3D clk_enable(pfdev->bus_clock);
> >> +                       if (ret)
> >> +                               goto err_bus_clk;
> >> +               }
> >> +       }
> >> +
> >> +       ret =3D pm_runtime_force_resume(dev);
> >> +       if (ret)
> >> +               goto err_resume;
> >> +
> >> +       return 0;
> >> +
> >> +err_resume:
> >> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->b=
us_clock)
> >> +               clk_disable(pfdev->bus_clock);
> >> +err_bus_clk:
> >> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
> >> +               clk_disable(pfdev->clock);
> >> +       return ret;
> >> +}
> >> +
> >> +static int panfrost_device_suspend(struct device *dev)
> >> +{
> >> +       struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> >> +       int ret;
> >> +
> >> +       ret =3D pm_runtime_force_suspend(dev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> >> +               clk_disable(pfdev->clock);
> >> +
> >> +               if (pfdev->bus_clock)
> >> +                       clk_disable(pfdev->bus_clock);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) =3D {
> >> +       RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_devic=
e_runtime_resume, NULL)
> >> +       SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_r=
esume)
> >> +};
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/=
drm/panfrost/panfrost_device.h
> >> index 1ef38f60d5dc..d7f179eb8ea3 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> >> @@ -25,6 +25,14 @@ struct panfrost_perfcnt;
> >>   #define NUM_JOB_SLOTS 3
> >>   #define MAX_PM_DOMAINS 5
> >>
> >> +/**
> >> + * enum panfrost_gpu_pm - Supported kernel power management features
> >> + * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
> >> + */
> >> +enum panfrost_gpu_pm {
> >> +       GPU_PM_CLK_DIS,
> >> +};
> >> +
> >>   struct panfrost_features {
> >>          u16 id;
> >>          u16 revision;
> >> @@ -75,6 +83,9 @@ struct panfrost_compatible {
> >>
> >>          /* Vendor implementation quirks callback */
> >>          void (*vendor_quirk)(struct panfrost_device *pfdev);
> >> +
> >> +       /* Allowed PM features */
> >> +       u8 pm_features;
> >>   };
> >>
> >>   struct panfrost_device {
> >> --
> >> 2.42.0
> >>
>
