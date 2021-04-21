Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB0366436
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 06:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36C86E038;
	Wed, 21 Apr 2021 04:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBE36E038
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 04:00:36 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id u22so9519796vsu.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 21:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xt+GQvk7UCjysn06gj5L/SQBPrigIvE1NOz7WEy+AKw=;
 b=VgyYsPvlKTLCdXiNCI1aub4fGEWqdkN23cKPeOzsX+dG28L8FX+/LiDEbJVpS/LRYr
 aB4g7gVd3K63q01YAYXFBarfY7cAe89HoHGF8io6yuPolR+YLTpkODOc7T8T5eSzxNbN
 a2sF3SDLXGHkMlZU8mBkZF2xAhghXgR7K2X4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xt+GQvk7UCjysn06gj5L/SQBPrigIvE1NOz7WEy+AKw=;
 b=OgBsrtedmRn6qugEFGLHnfIvem0/s0I8YHJxkSZrz0kKAl6XghjrUKy4sGjvsV93Me
 iulXrCf0cNrfTbkvGmyfHMl+3FWhfP6jwWHhtvleyu8X/72Mg8SH4xzFskuOXCeGCZuo
 +dugsaIX2mDJeLdfsP0Zi9ddgK91NN8+GCk7jry55KdS3I0tuOccKbx4FLKvHd7DPQLu
 HK6brWo/Ng2zNiapaGK+H9vW+05LpKSY1lr/FUTF8U5FhlcKNdc0V/ONRedcYfIo/RSC
 RpSypADG4jeDo25855S9Ahjsz/sv4/7LvobpCfvWPBbfbJvRRiqnrFqXgDdWHSL9rUFt
 1+1A==
X-Gm-Message-State: AOAM530oa0iqxrTlUGJ2TMWqcmR/Ry1FyMqQotczkaqeX5O7+jQZBdxg
 mQAhOQGXTayjs/qzmE+4LM9RE6vGUQSsORokuDMQKQ==
X-Google-Smtp-Source: ABdhPJx8sqi7yyCbZtsqWkPAetpn+zmApPCR4F96SUihvi7LBsId0jAdkje9hdf8VwGHUya1KDTYm2FJ2kYtrRm/mtE=
X-Received: by 2002:a67:efd1:: with SMTP id s17mr10253276vsp.16.1618977635719; 
 Tue, 20 Apr 2021 21:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210421001908.813625-1-drinkcat@chromium.org>
 <20210421081831.v12.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
In-Reply-To: <20210421081831.v12.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 21 Apr 2021 12:00:24 +0800
Message-ID: <CANMq1KBfg1SKM1iC+EUXjCiA-f9p=JSBvkp3h3eygH2aZfCAng@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Fei Shao <fshao@chromium.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Kristian Kristensen <hoegsberg@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Argh sorry I messed up the rebase and this doesn't even build...

I'll send v13.

On Wed, Apr 21, 2021 at 8:19 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> GPUs with more than a single regulator (e.g. G72 on MT8183) will
> require platform-specific handling for devfreq, for 2 reasons:
>  1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
>     does not support multiple regulators, so we'll need custom
>     handlers.
>  2. Generally, platforms with 2 regulators have platform-specific
>     constraints on how the voltages should be set (e.g.
>     minimum/maximum voltage difference between them), so we
>     should not just create generic handlers that simply
>     change the voltages without taking care of those constraints.
>
> Disable devfreq for now on those GPUs.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>
> (no changes since v9)
>
> Changes in v9:
>  - Explain why devfreq needs to be disabled for GPUs with >1
>    regulators.
>
> Changes in v8:
>  - Use DRM_DEV_INFO instead of ERROR
>
> Changes in v7:
>  - Fix GPU ID in commit message
>
> Changes in v6:
>  - devfreq: New change
>
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 47d27e54a34f..aca3bb9a12e4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -92,9 +92,19 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>         struct thermal_cooling_device *cooling;
>         struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>
> -       ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> -                                        pfdev->comp->num_supplies);
> -       if (ret) {
> +       if (pfdev->comp->num_supplies > 1) {
> +               /*
> +                * GPUs with more than 1 supply require platform-specific handling:
> +                * continue without devfreq
> +                */
> +               DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
> +               return 0;
> +       }
> +
> +       opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> +                                             pfdev->comp->num_supplies);
> +       if (IS_ERR(opp_table)) {
> +               ret = PTR_ERR(opp_table);
>                 /* Continue if the optional regulator is missing */
>                 if (ret != -ENODEV) {
>                         DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> --
> 2.31.1.368.gbe11c130af-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
