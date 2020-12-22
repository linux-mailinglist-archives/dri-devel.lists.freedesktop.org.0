Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640A2E0A10
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 13:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0676E329;
	Tue, 22 Dec 2020 12:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570636E329
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 12:34:34 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id x23so2927232oop.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tr+V9UKVzYs4ysPzLGuYM79WqlxZSfPeKFIlvL2ZGZM=;
 b=NiLpbTOYygjIY9aIZ1BYsTVq9S6t2u0VhSeIajW0kSFp/eCwdMTvTnMSAzbRCJsya1
 rvpSRlxbmpizlSxy2AoFthtbjiIPyk2oAcvGZzlT6kLCwEeyuHnZvo0nfZHzVyz7E8ZS
 bVzAzOy73q07GDUE+DJk3I6X5xNO2gsSIzB4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tr+V9UKVzYs4ysPzLGuYM79WqlxZSfPeKFIlvL2ZGZM=;
 b=lUNQEqg0d76raOtMfWVowAwAiWi4b/fP+dSiwmkAqRMv5yATmIY4U/+8061hiEQaF3
 afrvcfWH778JUliM7ft+SlFykeQRP7gzP1Yc4gY8QWX6U1n0/VZyA2mMccJIS81OVSL5
 plgBTzigpjtYH/wU/bEfOYZ7hm9y35jA6lT8tU+V8bJAiHVSSaT0qYNeZPrXEE5aluMG
 Ug/EHy3/YkNGrQPidsReYfCvbqNG7BxyVkf76lF8cfecZyzes+A+tttCrsYrN+Wkazwm
 dGVWVyC0F5dsaNfyZw5C2SGMqPMDErYkI5uAf4xbgyR3CiQhjaJJXg1aDbn5vzNooe8p
 m+bQ==
X-Gm-Message-State: AOAM5304gRK1JVhpCT/qMMgOpsLTxnQNKfxY30WGJ5mojI+J/ZgJpzgS
 FVeK/jDnWqIb5hbgsEKin+kUY6TeXP+inABrHogagw==
X-Google-Smtp-Source: ABdhPJypAj/udMv3GjHOEyanFde0rNqQ75gxPXTn/dxDCKrDw0+ZxswjGJBM38z7nuTjzJbxsMmBwAtwG4sP6tXBi/M=
X-Received: by 2002:a4a:11c2:: with SMTP id 185mr14836279ooc.85.1608640473605; 
 Tue, 22 Dec 2020 04:34:33 -0800 (PST)
MIME-Version: 1.0
References: <1608638156-7879-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1608638156-7879-1-git-send-email-tiantao6@hisilicon.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Dec 2020 13:34:22 +0100
Message-ID: <CAKMK7uGpvnmAH0GGfM0G_UgnqvwUWsyQuTwVvJ870fpqxgeSxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Remove drm_dev_put in hibmc
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 12:56 PM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Hibmc use the devm_drm_dev_alloc function in hibmc_pci_probe, if
> hibmc_pci_probe returns non-zero, devm_drm_dev_alloc will call
> devm_drm_dev_init, which will call devm_drm_dev_init_release to
> release drm_dev_put. There is no need for hibmc to call
> drm_dev_put separately.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

lgtm, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 7159018..0d4e902 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -332,13 +332,13 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>         ret = pcim_enable_device(pdev);
>         if (ret) {
>                 drm_err(dev, "failed to enable pci device: %d\n", ret);
> -               goto err_free;
> +               goto err_return;
>         }
>
>         ret = hibmc_load(dev);
>         if (ret) {
>                 drm_err(dev, "failed to load hibmc: %d\n", ret);
> -               goto err_free;
> +               goto err_return;
>         }
>
>         ret = drm_dev_register(dev, 0);
> @@ -354,9 +354,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>
>  err_unload:
>         hibmc_unload(dev);
> -err_free:
> -       drm_dev_put(dev);
> -
> +err_return:
>         return ret;
>  }
>
> --
> 2.7.4
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
