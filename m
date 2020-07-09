Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9E21A3F6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B34C6EAB1;
	Thu,  9 Jul 2020 15:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419FB6EAB1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 15:44:50 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0768D207FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594309490;
 bh=aGxVb1DpozV7hPF11M4DsBqQ/F4gMscLyOHG8dL9j04=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0k7684PoUgEkh6vKt/lEAefEnXoyZuetBeD96YkehKeEcFfnG5FYX2cJeuDYTvxBU
 0UBwgrAxPCBHFrUeYigmgahHtSPX7eYVfI/gFc90zIDh3ysx3itLamOGDB18wZAOZJ
 EL2u8W+FVfqRRAvGV/P/gpYxQFxiMxitMzaCBIjQ=
Received: by mail-oi1-f172.google.com with SMTP id t4so2222271oij.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 08:44:50 -0700 (PDT)
X-Gm-Message-State: AOAM531+goI5CNVjmOiM3P9/0sli4pjU3s8pls00m1giVStfjLsSgnn/
 FqlmCgg1gjlxx+UK10O1To4Dz+5PnCcwZt4v9Q==
X-Google-Smtp-Source: ABdhPJzl0mWTn/pDt1A80BbL1boJ6ERwIXyk6Ru4V8uvWhGSAzZj8kyuTd/RKd9//s92FUEqZO+4e/a//gzXkCx19Ik=
X-Received: by 2002:aca:4844:: with SMTP id v65mr614541oia.152.1594309489279; 
 Thu, 09 Jul 2020 08:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200614062730.46489-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200614062730.46489-1-navid.emamdoost@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Jul 2020 09:44:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL=+ToP1w3m8GdK0K0o8ER2eYSiM5ffuFVxyMsZns4gqA@mail.gmail.com>
Message-ID: <CAL_JsqL=+ToP1w3m8GdK0K0o8ER2eYSiM5ffuFVxyMsZns4gqA@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: fix ref count leak in panfrost_job_hw_submit
To: Navid Emamdoost <navid.emamdoost@gmail.com>
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
Cc: wu000273@umn.edu, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Navid Emamdoost <emamd001@umn.edu>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 12:27 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> in panfrost_job_hw_submit, pm_runtime_get_sync is called which
> increments the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7914b1570841..89ac84667eb1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -147,11 +147,10 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>
>         ret = pm_runtime_get_sync(pfdev->dev);
>         if (ret < 0)
> -               return;
> +               goto out;

If the get failed, I don't think we want to do a put.

>
>         if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> -               pm_runtime_put_sync_autosuspend(pfdev->dev);
> -               return;
> +               goto out;
>         }
>
>         cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
> @@ -184,6 +183,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>                                 job, js, jc_head);
>
>         job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);

So we start the job here and then...

> +out:
> +       pm_runtime_put_sync_autosuspend(pfdev->dev);

...turn off clocks/power here. Typically, you'd be fine as autosuspend
has a delay by default, but userspace is free to change the delay to
0.

> +       return;
>  }
>
>  static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
