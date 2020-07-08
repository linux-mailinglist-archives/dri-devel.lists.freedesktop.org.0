Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E7219911
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA446E9C6;
	Thu,  9 Jul 2020 07:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA96E192
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:15:02 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id b13so14127399uav.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRjZHkXkzEhGi5hn40XGl/e6qRsBuLGR/qEVHC0USyI=;
 b=kWdjRAoBMkPAyyXi7TjFmQ+d90N4uv7q74fpybzzAATLpMH1LQ5ZZjZptmLJkGPV3+
 T9W2iTQ4XblKDTZM8pOPFoUqFJpat2uLf429wvt28z1lPMBo123+CguPP7H8O6EBkRRB
 d2SB1fITZM5qk8pL0UO91/p3nx9FC12I7sTSwk+GZbF5bYo+iIbvZYANX2mC2p2rs6Cn
 WqY6jGzhIHlea/vA6v3BxbMisLtmkAPIwuY/QKhQEe+NGULedBMlI5nNMJBIOYnuLvKJ
 tGC5xxXH/KxM2OUhp8IXZaSAmpZt74dCV1mSYs8Z2PDZqbTVvcQsMclPhPl65tNtbKs+
 y/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRjZHkXkzEhGi5hn40XGl/e6qRsBuLGR/qEVHC0USyI=;
 b=XFiC+6OQvRL1rOl4yRcXC5hTe5hVJ62mjDlz6z+g8iz+sfglRst6ZXs2buv5spdi4B
 7XWZUmVwsltVrlydspVMQDmlhEuqfFWaHavEknX82LwCV8gzmNdBQjyCD381Y12w7VXQ
 h2z6gdj9rdFI5OPG1gzga+fvclCD/6OBReqowo8sIuK7Ght087NdxQJeNlaPSiXnVpCj
 iOsZD208tCFKcmqW0yvZyGQo4GzrTw1CqQNH3ZlHOFZ+2JG88BM5b3XLZEtpoBXoVKzc
 lJ9Q/96AJPbdBqyJxbjazalfRKfmCZIFxFsu1I26ujYDALe+jnfXK0HX/ZyVZD4CMaHf
 g9jQ==
X-Gm-Message-State: AOAM533PD39ivN6FgOnq8EwAj1ikNFiN1YbkY6ybbSAVyPsulBw94ZHf
 hdZXDtBIJa3BCOHurU1H7xVdu76FPg5CLtERf6SKMw==
X-Google-Smtp-Source: ABdhPJxLLkk6MK3Csm05jxcjimKiHzWE2ysQXqtuXdKjKHF2mURJuz9XqEp53Da5aTh2O3WgXZAW3cg1bFm+PfC0F4E=
X-Received: by 2002:ab0:15a4:: with SMTP id i33mr6683213uae.85.1594199701485; 
 Wed, 08 Jul 2020 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200706144713.1123-1-yuzenghui@huawei.com>
In-Reply-To: <20200706144713.1123-1-yuzenghui@huawei.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Wed, 8 Jul 2020 17:14:49 +0800
Message-ID: <CAKoKPbzjJa74b8kayVguLJF_PVzPD4jOfvnUJ-pr3HmytLiGAw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon/hibmc: Move drm_fbdev_generic_setup() down
 to avoid the splat
To: Zenghui Yu <yuzenghui@huawei.com>
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, wanghaibin.wang@huawei.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zenghui,
Thanks for fixing this.
Applied to drm-misc-fixes.

Best,
-Xinliang

On Mon, 6 Jul 2020 at 22:53, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> The HiSilicon hibmc driver triggers a splat at boot time as below
>
> [   14.137806] ------------[ cut here ]------------
> [   14.142405] hibmc-drm 0000:0a:00.0: Device has not been registered.
> [   14.148661] WARNING: CPU: 0 PID: 496 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x15c/0x1b8
> [   14.158787] [...]
> [   14.278307] Call trace:
> [   14.280742]  drm_fbdev_generic_setup+0x15c/0x1b8
> [   14.285337]  hibmc_pci_probe+0x354/0x418
> [   14.289242]  local_pci_probe+0x44/0x98
> [   14.292974]  work_for_cpu_fn+0x20/0x30
> [   14.296708]  process_one_work+0x1c4/0x4e0
> [   14.300698]  worker_thread+0x2c8/0x528
> [   14.304431]  kthread+0x138/0x140
> [   14.307646]  ret_from_fork+0x10/0x18
> [   14.311205] ---[ end trace a2000ec2d838af4d ]---
>
> This turned out to be due to the fbdev device hasn't been registered when
> drm_fbdev_generic_setup() is invoked. Let's fix the splat by moving it down
> after drm_dev_register() which will follow the "Display driver example"
> documented by commit de99f0600a79 ("drm/drv: DOC: Add driver example
> code").
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c29e5b8..544b9993c99e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -307,8 +307,6 @@ static int hibmc_load(struct drm_device *dev)
>         /* reset all the states of crtc/plane/encoder/connector */
>         drm_mode_config_reset(dev);
>
> -       drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> -
>         return 0;
>
>  err:
> @@ -355,6 +353,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>                           ret);
>                 goto err_unload;
>         }
> +
> +       drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +
>         return 0;
>
>  err_unload:
> --
> 2.19.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
