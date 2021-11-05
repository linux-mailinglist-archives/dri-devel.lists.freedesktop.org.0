Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4193446A1E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9247F6EBB7;
	Fri,  5 Nov 2021 20:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D568F6EB50
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:49:43 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id f10so10734145ilu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNiSOY3Ex2kKhYTAI345g/wYTliLswlFSNFOE/JFxUQ=;
 b=MENF/AIiOuREajqRtDDqrgQlsyhpEjqOb/pon3tRfk3CFVTv2GFQ3zI2vcKlgz91PO
 WV3YSeYDvnBONNN7YCC8mPyNQrf4htW6TIDX/iojmhApTcDix7Dnismyo7IZy+Wpvszk
 vFouOed3KfvXCXHfhdsL1IexhB2dtFoXtazvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNiSOY3Ex2kKhYTAI345g/wYTliLswlFSNFOE/JFxUQ=;
 b=g7Beh6bty5N/FYs+/NUvWlnXFYNgu3pKXYsfOuJM+8OlJtajGC9Las1wcE42l0uiV7
 r0S+JwnfJ0+qPSznw+oKvUBEpf8Mm00KKOvDXTyHMMRRLwtj/+QGGuIqXIpP4A0dMiuC
 MYY5HHtuetxQRyI6am77ps/U0TdHRrUprs1FKJAnUSptIHtPijwwVFvftoFT3h9sdk8v
 Yr6l1cstqNM5EK9E805D2sfdOzx8G7wU5F7V/2FdMdwRmCRiNQu9Uvt/FDAUemSZ7YWC
 W94G0+HNZViBqSgkYTvDBYBmGbm4j7km2nYtFmFysmrmPO5V3Uw3pO9d50ssqggh55Ox
 DfQw==
X-Gm-Message-State: AOAM531YQWFldKNQxibA2tp2YbBq7UmnLFr25N4+DqpUKrEhSdXcKBDN
 BiPC3X6tI2/QqFlx3P1toT7lW1CcyPv2Dg==
X-Google-Smtp-Source: ABdhPJxJ7Im1OCWVXR54FCXqlfAglZ6n093YjvTGHYSUnE/e1+Ts7/D4NXrgWGuhi5g5jEVBroAATw==
X-Received: by 2002:a05:6e02:170a:: with SMTP id
 u10mr13282046ill.251.1636145382931; 
 Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id v4sm4283734iol.32.2021.11.05.13.49.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id z206so12220366iof.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr1196799ioo.136.1636145381818; 
 Fri, 05 Nov 2021 13:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211103210402.623099-1-robdclark@gmail.com>
 <20211103210402.623099-2-robdclark@gmail.com>
In-Reply-To: <20211103210402.623099-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 13:49:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBkGMXPvuLaQ0n2V3UgAQajvYg=dPwZNx-TnpXMV1bvw@mail.gmail.com>
Message-ID: <CAD=FV=WBkGMXPvuLaQ0n2V3UgAQajvYg=dPwZNx-TnpXMV1bvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 3, 2021 at 1:59 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index b24e5475cafb..427c55002f4d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -158,6 +158,33 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
>         devfreq_suspend_device(gpu->devfreq.devfreq);
>  }
>
> +static void set_target(struct msm_gpu *gpu, unsigned long freq)
> +{
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       unsigned long min_freq, max_freq;
> +       u32 flags = 0;
> +
> +       /*
> +        * When setting the target freq internally, we need to apply PM QoS
> +        * constraints (such as cooling):
> +        */
> +       min_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
> +                                        DEV_PM_QOS_MIN_FREQUENCY);

Chatted with Rob offline about this, but to document on the lists for
those playing at home: the above function isn't exported to modules,
so this will fail with "allmodconfig".

In general this isn't the right approach here. I believe that the
right approach is to boost with freq_qos_update_request() and then
kick off a timer to stop boosting after a fixed period of time.


-Doug
