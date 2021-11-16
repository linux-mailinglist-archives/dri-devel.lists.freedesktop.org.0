Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B145396A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 19:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2A46E0D5;
	Tue, 16 Nov 2021 18:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53E86E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:31:09 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id i12so77564ila.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 10:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1EViyUHQdSut6g+RY4rG3RX+9KMNh10G4tRFHz9NG9E=;
 b=BPlylCR84zbphWWF7YUzdn4WkJmgNf/MrOQz/jFWkfQ9bdYeyGwjDpcFolSsS3egOe
 8X/fCkqeL2w5C4MYsBNhuj/7w/970bRxMisig2Bd3UUXBUHNRAA7a6/Ow3S4dkSEsswr
 dk630OUIqnhLds9oSGFMgYz8tM0D4JR8gRkKLuaMISRSh282560nfqfSSf6Muiaa3EKK
 de6oUD6qfQdBZYk+S/n4AeYIfoVt+xAbPphoDbukYetQD/dnNeGcMi15nTm4BXgaTbyu
 H8/e/qZ/n6+EudcD8Jox7vFxLYdohLimBZYEa9C2tVX0dMEmOgpUzTpTkFGYvdt0YmJ2
 XGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1EViyUHQdSut6g+RY4rG3RX+9KMNh10G4tRFHz9NG9E=;
 b=4E/TkF0CA9Kh/AfgzW+/0BPO5ZFlNUnGmdjblu+HbCFY+mOlrvl9qC8iWzx68/aazF
 ApZrfR+2QDwYsRue8gz6cqm/qMNUgUUU3zAypL+xkcIJH3B2+X8yCaiGXcZ8S92LjeGz
 Wv2AkOHKKiTc9kkNqYgAzvv485/SIOFq7tSuFaxi4M11xRMD8B4G9lraZubMfQbmCUQm
 zS7FH+EV1cBJ2tg3zy2Cw40XRl1iK32czjBa0KA+tqIJ3RInI+Q0JdCkBKw/Bs/TZWfo
 JQsKgsxCiQ3sEwWrl6NdM54tA91Xvpfd8W457paEn1RvDIL0U+VkSJg/MNwuDe7T24pu
 Ycuw==
X-Gm-Message-State: AOAM533xnJ9RXt+xPtZrrch0P2bCUBbrATmSd7H6sAj/qqLvV5YOQ8sA
 ulThI80sWVnTkuCegzS3mDiuPm7MlJcSiDq/ZclNjg==
X-Google-Smtp-Source: ABdhPJzOKDJ98X1OJQtFLiL6PuZPZvNI9s+5gIkGORkhTGagdy3QHFC93lEmQFbr1bq8pi3PmWdmQK2SEkSuhCUfKaE=
X-Received: by 2002:a05:6e02:1445:: with SMTP id
 p5mr5940397ilo.105.1637087469025; 
 Tue, 16 Nov 2021 10:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20211116155545.473311-1-robdclark@gmail.com>
In-Reply-To: <20211116155545.473311-1-robdclark@gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 17 Nov 2021 00:00:33 +0530
Message-ID: <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
 harder
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> drm_sched_job_add_dependency() could drop the last ref, so we need to do
> the dma_fence_get() first.
>

It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_ad=
d_implicit_dependencies v2")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Applies on top of "drm/scheduler: fix drm_sched_job_add_implicit_dependen=
cies"
> but I don't think that has a stable commit sha yet.
>
>  drivers/gpu/drm/scheduler/sched_main.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 94fe51b3caa2..f91fb31ab7a7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -704,12 +704,13 @@ int drm_sched_job_add_implicit_dependencies(struct =
drm_sched_job *job,
>         int ret;
>
>         dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> -               ret =3D drm_sched_job_add_dependency(job, fence);
> -               if (ret)
> -                       return ret;
> -
>                 /* Make sure to grab an additional ref on the added fence=
 */
>                 dma_fence_get(fence);
> +               ret =3D drm_sched_job_add_dependency(job, fence);
> +               if (ret) {
> +                       dma_fence_put(fence);
> +                       return ret;
> +               }
>         }
>         return 0;
>  }
> --
> 2.33.1
>
