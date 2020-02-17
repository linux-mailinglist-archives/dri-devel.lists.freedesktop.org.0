Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F01607A6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 02:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5186E3DB;
	Mon, 17 Feb 2020 01:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8646E3DB;
 Mon, 17 Feb 2020 01:20:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so15505490wmh.3;
 Sun, 16 Feb 2020 17:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZuOsBWqGR/J6P3qYbyUpxOiY4OTNviM6Oswc2b07mTA=;
 b=gVRAktaILye8n+mbqfmhURirjsVfqG2q4nOtT/GeqUkCOd1kd/Uj34DA2Q1JFf7a57
 73e/yvG9aa7ZbNEryLbR1xaYweLxVAQ9f8XLKOxBndaTaCj01ovebid95IMiJD0iLAV3
 /Va+PEzoe1p1jFSSOa5P/gZcho8td6rHI8jszCmi2YC6eQAC5Cw7KMiDzaaJRb5vazEh
 /c5Z2hGuODsqbR2+gZjfwku567RASslLZJ8id5E/oRX9LnPvwYCSzcBvBXlOXDs9KYw9
 7XtWvCXlDER99H1dJebmqoy08cdDPjgmibojAh5Cwwqt4PR4hLJ5N9OYaSb7T99zlNXJ
 9k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZuOsBWqGR/J6P3qYbyUpxOiY4OTNviM6Oswc2b07mTA=;
 b=T80fdODtTfjbhZDtRqRphGFpoyLXvO+yrtFSMr/kLE1haSPxpFh5e1MlT//Y4j1hN5
 /hYkoQ1UZEW2OLWq8BDZShZ+6YBUgiqZrfYLpIjN/7SNPqOBXVYxFRufI/moLQ3tK2yV
 Han1WCKXDWpbl1usk6+H+uqcaVjdZhBq9ezGRKk6lVcwu3hVU4W+H8kjaRdpB8aycsoz
 dysnQiH+pmgLq6u/EdHr/7xBZfG8fuN1IsSLs65wb1M7Bry8amaAmqKJciHaKdqOfMaA
 jbYOlGKZRslm4ZvVQOSZUKe0ao4zb3zMzZi7sJSL8Gu75voVcda/iybeKQRsWBFEsy6z
 8uaA==
X-Gm-Message-State: APjAAAUz/F3rAloiYyr7/g46VjBqxU/aCDLc1akiMAhR8H4unKVyaLgP
 rPs0yvuRu9vnvaSgcn+V9zWlIH0yX10xr126SYI=
X-Google-Smtp-Source: APXvYqx6PBWOpIYIYZLMR1Nb2Yc4mw9pfeBqzDwp/d/kSibSFsfc1P+NGYm2h5IY/YBNVroxq/ho+kWtTgAodNjYPi8=
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr14505338wmj.133.1581902437832; 
 Sun, 16 Feb 2020 17:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20200215035026.3180698-1-anarsoul@gmail.com>
In-Reply-To: <20200215035026.3180698-1-anarsoul@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 17 Feb 2020 09:20:26 +0800
Message-ID: <CAKGbVbvEDYJ19KVWXN0k-5niXLjmPYvxGJQ2-3GWTyYyFkH0Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix recovering from PLBU out of memory
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Sat, Feb 15, 2020 at 11:50 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> It looks like on PLBU_OUT_OF_MEM interrupt we need to resume from where we
> stopped, i.e. new PLBU heap start is old end. Also update end address
> in GP frame to grow heap on 2nd and subsequent out of memory interrupts.
>
> Fixes: 2081e8dcf1ee ("drm/lima: recover task by enlarging heap buffer")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_gp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
> index d1e7826c2d74..325604262def 100644
> --- a/drivers/gpu/drm/lima/lima_gp.c
> +++ b/drivers/gpu/drm/lima/lima_gp.c
> @@ -224,8 +224,13 @@ static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
>         }
>
>         gp_write(LIMA_GP_INT_MASK, LIMA_GP_IRQ_MASK_USED);
> +       /* Resume from where we stopped, i.e. new start is old end */
> +       gp_write(LIMA_GP_PLBU_ALLOC_START_ADDR,
> +                f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
> +       f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2] =
> +               f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size;
>         gp_write(LIMA_GP_PLBU_ALLOC_END_ADDR,
> -                f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size);
> +                f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
>         gp_write(LIMA_GP_CMD, LIMA_GP_CMD_UPDATE_PLBU_ALLOC);
>         return 0;
>  }
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
