Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AB26DE42
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD2E6EC3B;
	Thu, 17 Sep 2020 14:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4216EC3B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:30:37 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e23so2066816otk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTlT4PWKtMiVfzP4h3yKiT9sWg6WUiYWtRhp8MrH1+Y=;
 b=kVSRBYzlrc52Q8mhPMqStVA5qDHuRSpsSIJ/6Ck0wtDKulVH15euh3Er3SQtZFBUg0
 UONYKdjyVHcwq7QH1kYGYLm1D2kUVofU5/oYWhiWdhot2mo71Zzf++QXQw1qIUKO1OMn
 jVtnRzCIferahzqquKPz1Z+DGwlZ1sFhciQpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTlT4PWKtMiVfzP4h3yKiT9sWg6WUiYWtRhp8MrH1+Y=;
 b=kwQzKv+/5Vp+YEjCgDU5OnwCleezod8sdXDu/PE9BXkb0DsVsWHpxpogXG3mG69UdL
 qgewp/JJKHvuROQklr1MBF4+G39SB/Q+LIxgyaf+tBDOwt68CGAAY9+MmwgyYor1qEfp
 ew3eVsCOtk4l6TSf1RnGKAH1n2KHV6tj7O3rqX3SmHn2vUTYxSFsrJfU5UyW0rq5Lt7Z
 YiVdUxQIusXH9AwUuWF7ZA2gbAffUEOm2N428pQnuf47eER4RUdEbvveEpUYTUtDwZtV
 lnmxLXNtmgkGjzWwNH76bFb8w2jcwwt9NeifjQuDoNUfy7wpGyyOpVEvM5mxeKn21TBs
 98TA==
X-Gm-Message-State: AOAM532aIlxcnx/l1v5vqf0wb7ePBlMCuM1vXQInpohNT1klH5eCuAvN
 JClNqO6Vh1F1ZgY+R5rgIBotVbVpsySM5McA2lXbz4ReqbAMHw==
X-Google-Smtp-Source: ABdhPJzmGlY5vRXbTuV1N8M54HoS0wlytY659ewiH49cAU5Co7rPDRfY1d7dCb6KbhQcvXAoYxGQh7OWXZj6XGAT+tU=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr20935578otq.188.1600353037035; 
 Thu, 17 Sep 2020 07:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200917142145.ipcxb2zo4up357t2@smtp.gmail.com>
In-Reply-To: <20200917142145.ipcxb2zo4up357t2@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Sep 2020 16:30:26 +0200
Message-ID: <CAKMK7uHqNpyyhm_ayvzxY1nsFTqnreUjZ0cEG5FiMpZNTWhYMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vgem: validate vgem_device before exit operations
To: Melissa Wen <melissa.srw@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 4:21 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> This patch adds a check for the vgem_device before handling it.
>
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Seems reasonable. Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index cb884c890065..119ca887cb8a 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -472,7 +472,14 @@ static int __init vgem_init(void)
>
>  static void __exit vgem_exit(void)
>  {
> -       struct platform_device *pdev = vgem_device->platform;
> +       struct platform_device *pdev;
> +
> +       if (!vgem_device) {
> +               DRM_INFO("vgem_device is NULL\n");
> +               return;
> +       }
> +
> +       pdev = vgem_device->platform;
>
>         drm_dev_unregister(&vgem_device->drm);
>         devres_release_group(&pdev->dev, NULL);
> --
> 2.28.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
