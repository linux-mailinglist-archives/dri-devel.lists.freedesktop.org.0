Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B05B1166
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 02:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD610E912;
	Thu,  8 Sep 2022 00:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6103A10E911
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 00:40:23 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-127d10b4f19so14526883fac.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 17:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=62Ut1/c3cJ2eC3GmfWAKZ1TzeGNyZJ7+Cm7wnqN9r7M=;
 b=Up+BpYurfwNR/Mi7uvG+ka1mkw0pp8TamacP9nijLL3NDU4fhu2KFXifTCBM1suYQP
 Sh5kEprrgp6xpuvbdxrzlENdFQLdtFCUt7UA/EDtsyk1vDOWViWSDmFljUdpmlgK+Tv2
 yzt32u9QIZYga9+c8PO8uH2T1/B+mzYB1iM1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=62Ut1/c3cJ2eC3GmfWAKZ1TzeGNyZJ7+Cm7wnqN9r7M=;
 b=ZTiGYRMaBWPE32QIOPWM74akKzauvwSZrdvYA0erWu8JLuqyXstKYRdZcXJ10FhefF
 g30fwQ0SbDf5TZUfcBPwZQVEbQiYgUkbAeLCSl/V6T16CbZYLnUqRxMcEwITyznRm8DU
 5zC3f89GrRDt/Wvl6dN5tndVbTvbfGY9b/c0baAV10+5uw3owVKh/kuz06i0XtMYrXhE
 dCtHbJTrLjgNgfbo1VjJFYFI4bjmRawpdJs7Z4G8Xx2TfAcv5P9JY570uPZ6N2Ns3t1G
 uaWvuG+5lOrvKT0wrGeJeBJceRUtwQudb4zduyZ7/iJCy7TbguNhpGhUfqHhX8uFlgOb
 758w==
X-Gm-Message-State: ACgBeo1zUgjKyRpQyr8lSps3ULq0Ip8OynPbStkyt5uCRmw/HLvSfuWJ
 kzh2yQLFXd+l+JEVXc2fwM1T+/szkbyhGuXmOWXjc1egJYo=
X-Google-Smtp-Source: AA6agR49Hhxv2DcaNITucmAmy/tQYIg8aUvCl5UCyFM1LZ+moqmC48Zcb/V7yprqhvfySLxljb1oOxQjE35nV5d/XmA=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr432433oik.0.1662597622442; Wed, 07 Sep
 2022 17:40:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:40:22 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 19:40:21 -0500
Message-ID: <CAE-0n52ak-GLKdc2QYV9y2PeQN8ZQej24JGSEFx5pqFd=ONjLw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/msm/dp: switch to using platform_get_irq()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-09-01 02:15:26)
> There is little point in using irq_of_parse_and_map(). Switch to plain
> and usual platform_get_irq() for parsing the DP IRQ line.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3173e6962a78..40c7f91abec9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1243,8 +1243,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> -       if (!dp->irq) {
> +       dp->irq = platform_get_irq(dp->pdev, 0);
> +       if (dp->irq < 0) {
>                 DRM_ERROR("failed to get irq\n");

Can drop the error as well because platform_get_irq() prints an error on
failure.
