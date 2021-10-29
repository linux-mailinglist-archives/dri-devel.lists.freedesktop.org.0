Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2574400BA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 18:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725756E9FE;
	Fri, 29 Oct 2021 16:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FE06E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:55:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i5so9520554wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9vJPcSbPLO7NfU0Ls6mVi7jOviGY9vm6tatJcjMExs=;
 b=CzihUPbiAJpBZyWWtjZ7IdT/CG7h9VI2FEf8IbvTMCQekwhaJSL8Gf/1BEBeyaDSgZ
 d2QYxjePqckZRujXjntZjiKuJvNLE/JhM1kt6TNXh9BvoQ5oEcYezhSfbJ2VSM8+c4ov
 mSuQiB2ehZngeh+fdATwmzbTMbNIJaCNgmqrlPCckWQtaFR0t1Y13kYmPE34apr+3EKQ
 f1bzItKYViT4a9usRNJWvDXEWZeWNWwiomErX9UZUdahsBINOuVJ5qwghzmPdCNSR1Cl
 +7WhalDqmXo9o/QnO73xoEt1wiPG1G9KdDdhgAK/ad1YWyFZ2V4w/bwfi8Ud43eSKldy
 A21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9vJPcSbPLO7NfU0Ls6mVi7jOviGY9vm6tatJcjMExs=;
 b=v3UyMlDNsqAUEoSeT2U1nr2f3E+5ZmuQERWb9e8FGrDCwz+Pw+OUlUhZrktFv6oXrD
 c6HMnNbdQRvfkgBrA7I7KNGU/OPPIMBWXwMY7cNcMeOl32fJqx4PZe6dMk4bljvPx417
 dB3Op9Y6O0UVaXuJDX73dIGCzQiYFqeOnqgktROEGP4jWtpCLgDUXoK2/NhYYo0RhvSG
 BpWypqSuVVng6EpFAoqTBt79Qgjnez9bwARo6cTs7844UXd+6JkC8jjZQeH7Ub63Amry
 6SEXqHcet8fePMGTg25h0V1zhMOyZx3ijLu0yTujnfOlLsaZiSsWHxYPhnwRCsoZ6TSq
 qX1w==
X-Gm-Message-State: AOAM532tPkh83hpTA6CpRXHuFj1FGPVb9or1E0V4QxBUMQrGMDx+aUaf
 Wp+mt0N6RMyF5qgcP26FOS+eZIYVGQjKSiujOsM=
X-Google-Smtp-Source: ABdhPJzoQtwON+pjaqzIt16kK0/i80B+sZ5OLf0ZYarOLkk70Fag7712UVfnlBaW+YRp0t5vHQ5yOjPzFcfw8jkusoE=
X-Received: by 2002:a1c:2b85:: with SMTP id
 r127mr20691607wmr.134.1635526539897; 
 Fri, 29 Oct 2021 09:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181240.213806-1-paul@crapouillou.net>
 <20211026181240.213806-5-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-5-paul@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Fri, 29 Oct 2021 18:55:28 +0200
Message-ID: <CAFsFa8446UokrOkce_owwULgdhz_HMaWWj=jZ_witPQyZZSNcQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 4/6] drm/ingenic: Set DMA descriptor chain
 register when starting CRTC
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie <paul@boddie.org.uk>,
 list@opendingux.net, 
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>

On Tue, Oct 26, 2021 at 8:13 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Setting the DMA descriptor chain register in the probe function has been
> fine until now, because we only ever had one descriptor per foreground.
>
> As the driver will soon have real descriptor chains, and the DMA
> descriptor chain register updates itself to point to the current
> descriptor being processed, this register needs to be reset after a full
> modeset to point to the first descriptor of the chain.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5dbeca0f8f37..cbc76cede99e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -186,6 +186,10 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
>
> +       /* Set address of our DMA descriptor chain */
> +       regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
> +       regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
> +
>         regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>                            JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
>                            JZ_LCD_CTRL_ENABLE);
> --
> 2.33.0
>
