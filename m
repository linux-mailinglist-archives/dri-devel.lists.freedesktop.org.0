Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741CBB7DF9
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09E10E95C;
	Fri,  3 Oct 2025 18:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HP6OT+jY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568F410E95C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:18:58 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-74f6974175dso31033067b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759515537; x=1760120337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUQoE2+YrP4Piuppn11V4n/Ge5n4X6vhqEU1SyrhiLY=;
 b=HP6OT+jYQVsfJH2rsPCoN9tBINT4OvuXyWRaleG9ME55oMeVQVJ0V8ATh5ctWsc0W/
 RplRN2WBODbyfgLAFGBRNDMkUVwTaoWDJ3itDswKBUqe8jVNJnzjDSBJYDElDAKfA5gT
 16nR8lGg7ON2/GO2C50IYDd2mbkbRAI055clkF5Yjd0bQ3M7bOJUDneesxNHyDRlroBg
 nOnikAyVU4lO/Q6V8552kLlW65XPPXIhJxsZ1w7HqbunCsnQuMOCc5OZNz5Lo7QQdb2L
 wXxNmsPmwB3EE6fFPo4SgwqgIAqgwWkzLZMSvVESIpIr4CnVkJ5Pv0kULyjwwsbyDI2E
 8YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759515537; x=1760120337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUQoE2+YrP4Piuppn11V4n/Ge5n4X6vhqEU1SyrhiLY=;
 b=M5qmFQ2k9UEzSEKVFBSdv12524ColK61Rldid/1dCHzjye4gvLZE+53t6GefoYGH4A
 kGcj31aS2a7Bm1R3Ma5GL8Euds0MMHZXR05JSBx8fCmDRMNQw2L8NaQzGACDNymSpLDG
 OYthj8mbcXufmOUrVg0i9KGef6KimkZgyRIzSBGHmEwgo8AU4Pz2WeZeHJY9TinMxrjS
 oMMk6MtAooJBj9EhlCAGc//YY/dGm2FdEL3xJu4hWnoD36QFXPXUcuVkCUtziXDUbvFr
 6OGCB1QPVGsY5D7fdG16G1yJlLL5QbJxMT4v7rSkvdEJ+PcpmR6h6Es4AJTBvjxeETLw
 xH0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxTTS1B6hk1jDmFSlLYBYBcl5enFlMTq8zJukCqSBi/aujG0ncQ+qXu2GOGJHaUWyyrgsuLnljeqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7kEMZxjpF9IetzQ2wr1Qc2EP6f1frMfZrSpPL72ROh1LVxItt
 /s+8eT24INDYeRfMWuzIFpRg3E9VwXzZspegLZ3qboSJABFYdFzlxPSrtILUbzy5xhgo4E+O+6A
 /2p1h2kakpBG+/RS8UmfeevXsNfs6r4k=
X-Gm-Gg: ASbGncsv23SBfzmmnx+PY3U4WQY85ybI3+aJw9UfTASFN8TGi+CLE4ewcVZyWe8XGkp
 68kyM1dpCgDXGkgm7zkHmmjT+rBpjuznRMo1DjEGZ6fswtyAbSPZPhYqF1KF669YnCjAFQ+PGYy
 Mp1vYffC7ujJzIKqtE+bV+H7MqxR+CoKXbEiKSLSV54vwHYYgQHbCf3bWXwYfsCOIioc3YgdqZk
 M7aBaNxBSZ8e/9r/8qxDdcDx9Yr3kKdN4SWzLnNIT+vDaezSoFEcnO3RoOyI1TXMdeSLie4jAVO
 msGrapepI5IIiHgrvXI3dg==
X-Google-Smtp-Source: AGHT+IGtLMvtFx4RxHoNIBh2x4X8Ab6Ix6GqGCbCEA5mUc1tZP075IB+GlQMmeZfD4IGoIK1kUGSajZNab9Clue8LXg=
X-Received: by 2002:a53:c043:0:20b0:636:1ee5:7745 with SMTP id
 956f58d0204a3-63b99f36944mr3824334d50.0.1759515537310; Fri, 03 Oct 2025
 11:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com>
 <20250929-mt8196-gpufreq-v5-5-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-5-3056e5ecf765@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 11:18:45 -0700
X-Gm-Features: AS18NWDjAm-QC4ccunNsvz_U1UXKS_05wvPJ1N_78dxhAoW5d44NTw2whZ6ltCU
Message-ID: <CAPaKu7S6_0G4rbRP_nCF0Aw9uy1K8ABqi2z8isvpHcVWkWjJaQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/panthor: call into devfreq for current
 frequency
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 29, 2025 at 12:48=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, panthor keeps a cached current frequency value for when it
> wants to retrieve it. This doesn't work well for when things might
> switch frequency without panthor's knowledge.
>
> Instead, implement the get_cur_freq operation, and expose it through a
> helper function to the rest of panthor.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 33 +++++++++++++++++++++++++=
++----
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
>  drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
>  drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
>  4 files changed, 34 insertions(+), 8 deletions(-)
>
[...]
> +
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +       unsigned long freq =3D 0;
> +       int ret;
> +
> +       if (!pdevfreq || !pdevfreq->devfreq)
> +               return 0;
> +
> +       if (pdevfreq->devfreq->profile->get_cur_freq) {
This and the other two NULL checks above seem unnecessary. But let's
follow other functions and check for pdevfreq->devfreq only.

With that, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> +               ret =3D pdevfreq->devfreq->profile->get_cur_freq(ptdev->b=
ase.dev,
> +                                                              &freq);
> +               if (ret)
> +                       return 0;
> +       }
> +
> +       return freq;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> index b7631de695f7d79456478c87e8af5dc47673cd1d..f8e29e02f66cb3281ed4bb4c7=
5cda9bd4df82b92 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptd=
ev);
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
>
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 9f0649ecfc4fc697a21a8b2fc4dd89c8ecf298df..f32c1868bf6d782d99df9dbd0=
babcea049c917e0 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -214,9 +214,6 @@ struct panthor_device {
>         /** @profile_mask: User-set profiling flags for job accounting. *=
/
>         u32 profile_mask;
>
> -       /** @current_frequency: Device clock frequency at present. Set by=
 DVFS*/
> -       unsigned long current_frequency;
> -
>         /** @fast_rate: Maximum device clock frequency. Set by DVFS */
>         unsigned long fast_rate;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ea4a37b566a8b215f2b7a09c333a696f1dcdb58f..4d59d94c353c3ca76f4b98a41=
1c8f8284efafd08 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -25,6 +25,7 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
>
> +#include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
> @@ -1519,7 +1520,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_=
device *ptdev,
>                 drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats=
.cycles);
>
>         drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate)=
;
> -       drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_fr=
equency);
> +       drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n",
> +                  panthor_devfreq_get_freq(ptdev));
>  }
>
>  static void panthor_show_internal_memory_stats(struct drm_printer *p, st=
ruct drm_file *file)
>
> --
> 2.51.0
>
