Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFCA4ECF76
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2710E2CD;
	Wed, 30 Mar 2022 22:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F1C10E8EF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 22:16:35 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id s11so19702651qtc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5V3kvEJbyi9F3MHeceyPdx3c1Bu5E1z1aG7KQioCtA=;
 b=Rn4E6fpfodZzBNI9CHionnRmbtXxDFsoLCGl9rf4OHI2zq0q0y9+g6jo5yJe7jn4Xo
 K3XwMD4lfvd2o/Oag+klWSmmknJdJpYjbPccWmsbEbxdhbKRfqy84do86ezAT8PQCBhE
 FZcg4szpZtfucxmQaFZ8Z/jX+Yx6AWg/E253ow4IFaxbxHTEuh2EGe8TUKp9kMrj+dSC
 jTnAAVmVp27czFaUnlMNh8WNEYLAr55F4wj0CcO0Sh3aj3nHpFVXZlQY+ICacfQHKwb3
 IifLZ+eSWVzv9kZ9ilrXlkgtn5UYCP03Li2p4l3d3UoQ394uqnTb6oqWHTG/y+zD0vrh
 52dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5V3kvEJbyi9F3MHeceyPdx3c1Bu5E1z1aG7KQioCtA=;
 b=QsqRXu+2akRdjc8UciDTfwcHKZbgz1v9NaQ0M++hV4R09JDqtOXge30kRYaGngjSsC
 nqSTIgOpZw7Tot3kO1RXLhNeYvDFUD9Tq79iGVS5aB2JmqurHxlGWWMSdX9MlfVsYpgF
 LFiti5f96UB/3l94Wc+i1EWtfy/v0R81iUN3+wi2g5kALMPn9GyDIJrwcpOkQOTbLx24
 hhAzCtL+JMAc7riWjnvsx/taM9Sxsyj+GPdK/+wet/VATMGLoFBN5R2HZ8ASX7BmCGL6
 ubSwAcI90QZdGjnX6n9wLdg6aH7iIhQ161OhkW9ZDpVza9neC/wQfqC31H83TvbwOqIs
 QugA==
X-Gm-Message-State: AOAM533Y3s5wep9uVYclWw9LraDHrl/DtsV57IYFpymVFrXzj93c5RfS
 H5OSjiUJHwE5z8f9eMEbV3cmzQgu1NzXwFHkGE4YoA==
X-Google-Smtp-Source: ABdhPJxsJX49xZHbqWv8eB9xiCa1Z1dl/Fp1c1dn4pZmztEffRMsi66po2a6wqsBsf6w2fFECLcqbpU0iwxo+/WO3MI=
X-Received: by 2002:a05:622a:1314:b0:2e1:d943:c25b with SMTP id
 v20-20020a05622a131400b002e1d943c25bmr1756051qtk.370.1648678594189; Wed, 30
 Mar 2022 15:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Mar 2022 01:16:23 +0300
Message-ID: <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 bjorn.andersson@linaro.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 19:03, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The interrupt register will still reflect the connect and disconnect
> interrupt status without generating an actual HW interrupt.
> The controller driver should not handle those masked interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 3c16f95..1809ce2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -608,13 +608,14 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> -       int isr = 0;
> +       int isr, mask;
>
>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
>                                  (isr & DP_DP_HPD_INT_MASK));
> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
>
> -       return isr;
> +       return isr & (DP_DP_HPD_STATE_STATUS_MASK | mask);

I suspect that the logic is inverted here. Shouldn't it be:

return isr & DP_DP_HPD_STATE_STATUS_MASK & mask;

?

>  }
>
>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
