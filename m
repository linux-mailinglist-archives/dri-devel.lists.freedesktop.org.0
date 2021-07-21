Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102FD3D0FB3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766626E862;
	Wed, 21 Jul 2021 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444116E817
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:40:16 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id s23so2830314oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z7UkEptjvInHKXG2zHRwBqlKv4cVFdQoOtseise/qIs=;
 b=G0U7OVjiiUVeiKxwMmwlfo7aD7fHtiHJrT8NrP788+2IRmDNxZeusBtL4+8xntrEfe
 Cr2QhruE/ysNEzq+WbzxdfKhBbKD2Ag3VyR7mUKRnRx6mv+cFGk58fYaeXzY8CNhDsc2
 oBYQqAK+9oVUUN6NvNKbZCBEHon85dy7xkSzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z7UkEptjvInHKXG2zHRwBqlKv4cVFdQoOtseise/qIs=;
 b=Pj0756ni49Wa2yHgidE6S5HGlh8Y+klQ2ciKiY17vvUF7wWUj1LftOdEtDkzEAX5Zq
 rmtamjD3a9bFKJWyTw2CKc6hzNpwR+cwBKAqPqdG+ZFxAQk1KXHT32CPEam07rAh/ahn
 kEppVJzhmNQ4JJaM6Ik5e9U8PZU42h0zPSZor9r40RQGuNNDd9REiZxXhe3nuFDOmnxN
 m0+sTbdlOH2zqhcyxMs4Mt6fORf51liXtBtjGWo01OIi8fMeMPzAlWSabvz0Q2Op1oq0
 kuX5Jmie2kAhrd9JPNCKKGE06MQ3v3c/DZxf/uohkeXg1P2wDkCAayGsz4QVDQOPcrLV
 Z52A==
X-Gm-Message-State: AOAM533roMY8RZ46od2R8EDd9itCh8Y2uJD0iZbWlmwhQC7uCeln+w1i
 TLshClvGEQbriXwkszXNCAaTurjPPUcdo9xwtt1UsA==
X-Google-Smtp-Source: ABdhPJyw9hbcxBWtaBfrj5MECbnJoFCG8fR8nWdxwWzHaAdOBQwpiAH4KSqHZzPH01nxiasPhRttAu1UHIEJhlWei8E=
X-Received: by 2002:aca:b902:: with SMTP id j2mr25262845oif.128.1626874815669; 
 Wed, 21 Jul 2021 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210721131704.10306-1-tzimmermann@suse.de>
In-Reply-To: <20210721131704.10306-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 15:40:04 +0200
Message-ID: <CAKMK7uGU4OpQt9s75K6e5Z=WsruhtWunPJ9g-sME0ZUiF4R0Tw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon/hibmc: Remove variable 'priv' from
 hibmc_unload()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Feng Chen <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 3:17 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The variable 'priv' got introduced in commit 39a364a19e03
> ("drm/hisilicon/hibmc: Convert to Linux IRQ interfaces") by accident.
> It's unused; remove it. Fixes a compiler warning.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 39a364a19e03 ("drm/hisilicon/hibmc: Convert to Linux IRQ interfaces")
> Reported-by: Dave Airlie <airlied@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index f73a8e0ea12e..610fc8e135f9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -249,7 +249,6 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
>
>  static int hibmc_unload(struct drm_device *dev)
>  {
> -       struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
>
>         drm_atomic_helper_shutdown(dev);
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
