Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D75A006A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AF3BE41D;
	Wed, 24 Aug 2022 17:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D910BE46A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 17:30:39 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11dca1c9c01so4812380fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
 b=fcQ5BKX6CF1pB0Q5K+QtelbSTU2ihxqxPUnaPzIVR0MQ/vdL6bmvl5OMW4nPfeQxcI
 xjTPKRTjCubgelgY+XlCapqkiKrgDLZc9Iv5SNleO0KO7Xz048d0ap823yKYrg0UJOiT
 m2Rf5yz4zgPncnzKbEPPJipiprzWzx6yl5n2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
 b=zUzvXq/mUs79AuNZZR4EA32HcJjeOwLAjrKoIVtxV2+JYzo6NgKjcFlnYTCXC3eX8O
 pMfN54jNo79Ldol8xSkNYeQiHKTVeHL243HqcINecPJEmTuDKsnvcfZmXH4ijVd6tA7x
 0SgtbAjHp0wArDcwaoTGKUEKxbwbNLimsPEQTWYzDWhzGDlQ3JFLxzreRr0YraetitJd
 DOtYtVKjRNooU6PPA4uYjVQ751B01lEv5+nUrFIFUnElFryRsmSVbKuKXGhx/C7GAGQX
 HSCknGQP7Rze3qyuhqbKo4FPfbXqZzVrqxrefCZnjk+06MHoUSm9UhcV9FyGqSNvFUbX
 q8tQ==
X-Gm-Message-State: ACgBeo03Qb3SwNc8Ifuf9lU3Zpomm7mPw++D2zxDsmNXvsV2pj7xQ6QF
 O0oxzYlbGFWYEr7fvi0DxG0n/J/VLt1rXuSKDWo/3A==
X-Google-Smtp-Source: AA6agR7QDhwW4ErLZ7pKcygsrPIJ67UAWeCMGbJtFeUUkR9yxPnuX6YfLksltT67IRMFVnSMhpLZXdZbOmpszg5JuT8=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr91633oab.0.1661362239159; Wed, 24 Aug
 2022 10:30:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:30:38 -0500
MIME-Version: 1.0
In-Reply-To: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 24 Aug 2022 12:30:38 -0500
Message-ID: <CAE-0n50wZkb5sYcZ2g+4L3S7OAYAti+5GEaBDZfANyOJCF3JzA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-24 10:22:31)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> eviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing an R.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7257515..676279d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -431,7 +431,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>
>         if (rate == link_rate_hbr3)
>                 pixel_div = 6;
> -       else if (rate == 1620000 || rate == 270000)
> +       else if (rate == 162000 || rate == 270000)

BTW

  $ git grep 162000 -- drivers/gpu/drm/msm/dp/
  drivers/gpu/drm/msm/dp/dp_catalog.c:    else if (rate == 1620000 ||
rate == 270000)
  drivers/gpu/drm/msm/dp/dp_ctrl.c:
ctrl->link->link_params.rate = 162000;
  drivers/gpu/drm/msm/dp/dp_ctrl.c:       case 162000:

We really should have a #define for these things. Can you send a
different followup patch that makes something like HBR3_KHZ, HBR2_KHZ,
etc. and then replaces these bare numbers throughout the driver? That
would prevent this from happening again. This one liner can and should
be backported to stable trees.
