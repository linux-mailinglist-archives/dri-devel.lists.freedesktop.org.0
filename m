Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6442A90E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 18:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4C489DB7;
	Tue, 12 Oct 2021 16:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B489DB7;
 Tue, 12 Oct 2021 16:04:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e12so68445691wra.4;
 Tue, 12 Oct 2021 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jeJnaeAhRKE6aZq2/elR102N3wqinTxfM30b0/qV3k=;
 b=GhfHUY7JhSAWCXb5np38aS0LUu/0YDs+OQ+lpKtKwef9mK+zdg3h6UNHL4bG/Rh4Ik
 bC287UCf/bI1g5ctwCk2YRa8GdlBoPRWhedipmEUmlRNxAM+xE61UAxfchgrLhG3RLSH
 3qcRwSjDs2dQhnotbdxsibXg8VI5htrPi2PQxpTFGOjFr+AcVWxdabA7/HN8xgfGl7/T
 Yi0zZSAoD2XC16yoZIiStjeG7EjPjZBRgkfX3u+GCUBLx/Esv8gnRQ3WwK3o05zuaiP4
 e7V6HQtMZ9OLPpQ02xeT8ifGNAXx21gCYuEDopf9VKwZpENydNyUm00xNiRiawKhU8jg
 PuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jeJnaeAhRKE6aZq2/elR102N3wqinTxfM30b0/qV3k=;
 b=gtF4FK9TPfbKBRQaC6xHh9thcNSf3P12XBK54y4o9bC4gH+QEWBIOeL44Vtk3q8CaU
 y11ywm0jaMhb6D6SrWz7q7caETJ9zpvCD++bZAh2x0nf8Wmun72ODxGq0Frx9LDV9SeO
 XtWbbGpS75ix8xkJ1g35HivonNanvihUs42c6mIUcBjVtjURdkKjUcvXhNYBscc9l8X0
 nsuxgBm8BHwOyVjZLncD5SEAx2pMuEbyb7pBLHPmFFso+QkltO6iC+MpW0iGpRKLO7xi
 DeeSAo75xRmEQf+ZILd8ZluwovgXE8BaboRTvjl/KM3WSkKYTLVbR3u0WVCKqqVhd9SC
 nutg==
X-Gm-Message-State: AOAM533lZiLiYWcRnOOaYzkO41kFbSyuZJ2YYfJpmMlrwSZi6TDd9wyF
 q09CNN9MZX/oiCNUF9Bs15S34wGpzSlw2uijA2Q=
X-Google-Smtp-Source: ABdhPJwhQTxK0/41CQve4MBdhQJ38btRpZXpz3nXdt/S2R1mzAE/EUACnsT9VH9fRn6Z3s/T2kaMWOh/ft1/95wFFDY=
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr6796873wme.127.1634054685955; 
 Tue, 12 Oct 2021 09:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Oct 2021 09:09:23 -0700
Message-ID: <CAF6AEGvUHmfa-A6awpPBU0yi0v47eDSZkGPyunpQwqR9WuaACQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm: Remove redundant 'flush_workqueue()'
 calls
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, jyri.sarha@iki.fi,
 tomba@kernel.org, VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 10, 2021 at 7:07 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> -       flush_workqueue(E);
>         destroy_workqueue(E);
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For drm/msm:

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 1 -
>  drivers/gpu/drm/msm/edp/edp_ctrl.c    | 1 -
>  drivers/gpu/drm/msm/hdmi/hdmi.c       | 4 +---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c   | 4 +---
>  drivers/gpu/drm/vmwgfx/ttm_memory.c   | 1 -
>  6 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 789acae37f55..06bde46df451 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1733,7 +1733,6 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
>
>         DBG("%s", dev_name(gpu->dev));
>
> -       flush_workqueue(gpu->wq);
>         destroy_workqueue(gpu->wq);
>
>         etnaviv_sched_fini(gpu);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index c86b5090fae6..462ea65ebf89 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1925,7 +1925,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
>         DBG("");
>         dsi_tx_buf_free(msm_host);
>         if (msm_host->workqueue) {
> -               flush_workqueue(msm_host->workqueue);
>                 destroy_workqueue(msm_host->workqueue);
>                 msm_host->workqueue = NULL;
>         }
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index fe1366b4c49f..07129a6e5dbb 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1190,7 +1190,6 @@ void msm_edp_ctrl_destroy(struct edp_ctrl *ctrl)
>                 return;
>
>         if (ctrl->workqueue) {
> -               flush_workqueue(ctrl->workqueue);
>                 destroy_workqueue(ctrl->workqueue);
>                 ctrl->workqueue = NULL;
>         }
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 737453b6e596..5ba7c8f28419 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -61,10 +61,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>          * at this point, hpd has been disabled,
>          * after flush workq, it's safe to deinit hdcp
>          */
> -       if (hdmi->workq) {
> -               flush_workqueue(hdmi->workq);
> +       if (hdmi->workq)
>                 destroy_workqueue(hdmi->workq);
> -       }
>         msm_hdmi_hdcp_destroy(hdmi);
>
>         if (hdmi->phy_dev) {
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 6b03f89a98d4..3ddb7c710a3d 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -186,10 +186,8 @@ static void tilcdc_fini(struct drm_device *dev)
>         if (priv->mmio)
>                 iounmap(priv->mmio);
>
> -       if (priv->wq) {
> -               flush_workqueue(priv->wq);
> +       if (priv->wq)
>                 destroy_workqueue(priv->wq);
> -       }
>
>         dev->dev_private = NULL;
>
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_memory.c b/drivers/gpu/drm/vmwgfx/ttm_memory.c
> index edd17c30d5a5..7f7fe35fc21d 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_memory.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_memory.c
> @@ -468,7 +468,6 @@ void ttm_mem_global_release(struct ttm_mem_global *glob)
>         struct ttm_mem_zone *zone;
>         unsigned int i;
>
> -       flush_workqueue(glob->swap_queue);
>         destroy_workqueue(glob->swap_queue);
>         glob->swap_queue = NULL;
>         for (i = 0; i < glob->num_zones; ++i) {
> --
> 2.30.2
>
