Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01851E9A86
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 23:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2989789F3B;
	Sun, 31 May 2020 21:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF789F38;
 Sun, 31 May 2020 21:27:05 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id j8so4162180ybj.12;
 Sun, 31 May 2020 14:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9R6dVyOeXrAbjNA/B3IIGOCdujTvIeVldj32RQubxr8=;
 b=ovfRk/NleZHoHT7Yd3jtetDN/3l3N1H730cVxdzCsFWsLWEQXtrult0KjWGOQOHVQz
 Lgb7zZkAZboDsF5+4OKjfPqsgQybBM/BQ0s4/DFQ3uba3eLnFN0AnzhHTUWAuMLvuu6x
 MyWn31djYZAPKNIuhCAStLK5v43z3VeLLAH47kzAFKnXbM5GSm2oOLEvsMmDLuAbARJm
 5w8igNNBinNE0akPd37aaVIQ1TZtItiaYfc/2U2EV2OjgG8PqgRxpXeA18oZoVF6AJ88
 3hqs6R5CV9EDWasOqPUwi3cCw9mEnXlVcdc9CR6GIpYfdULtm1MWXBlvmnGJyYs09GFa
 uAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9R6dVyOeXrAbjNA/B3IIGOCdujTvIeVldj32RQubxr8=;
 b=rzYhRzEH+kZ8x0buK/3XH1Aas9gUW/thjMw+lfPPUs6x6StvpeaTj3hRr+t18CgNRA
 O4KsiwOwMmJeWdsA8vGgB3rAtUuFYj3r9lqw6xUaOLs1PHFM/M5RSxrEJwgxhidj8U8Q
 IsQaDdsfAGHCX6Jx5C4/ssztqksbo8lmH9hBPdKc4gTnC1MXbGa1MNf2if35DYYTdSRA
 RSth8OA/Xv08ittsCJjC0zF8/bM8IQz0SkP7koOzztDHjSQr9/uwIZIh2NWuYLDVm2WV
 gOv6f3iYawQn2UNjXirSuQWBXWHNcSl7i3SUhi7K7HOjq1hctzy3LWEjg7pWWigzqaOi
 Wsaw==
X-Gm-Message-State: AOAM5303/76qHz/NqCPD8yzt2jkA2JqiyROpuV2tTXFVn04Wz3xLQRsr
 /wGKzENhkGGav8HZKcEqUJ01vdOX7+lO0Mh8yMU=
X-Google-Smtp-Source: ABdhPJwRLxg7L3fKQd+F9YCNmDDUNHYElr7ybkypr5S2lY45mveAfg0flKbDgvApEAG1lSwZLNs8XPodr58A0Eg9u6Y=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr28689573ybp.268.1590960424282; 
 Sun, 31 May 2020 14:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 1 Jun 2020 07:26:53 +1000
Message-ID: <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 May 2020 at 19:42, Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When gk20a_clk_ctor() returns an error code, pointer "clk"
> should be released. It's the same when gm20b_clk_new()
> returns from elsewhere following this call.
This shouldn't be necessary.  If a subdev constructor fails, and
returns a pointer, the core will call the destructor to clean things
up.

Ben.

>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> index b284e949f732..a5aeba74d3b7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> @@ -1039,7 +1039,7 @@ gm20b_clk_new(struct nvkm_device *device, int index, struct nvkm_clk **pclk)
>         ret = gk20a_clk_ctor(device, index, &gm20b_clk, clk_params,
>                              &clk->base);
>         if (ret)
> -               return ret;
> +               goto out_free;
>
>         /*
>          * NAPLL can only work with max_u, clamp the m range so
> @@ -1067,8 +1067,8 @@ gm20b_clk_new(struct nvkm_device *device, int index, struct nvkm_clk **pclk)
>                 nvkm_warn(subdev, "no fused calibration parameters\n");
>
>         ret = gm20b_clk_init_safe_fmax(clk);
> -       if (ret)
> -               return ret;
>
> -       return 0;
> +out_free:
> +       kfree(clk);
> +       return ret;
>  }
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
