Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4D6F9DA9
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566610E0B5;
	Mon,  8 May 2023 02:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812610E09F;
 Mon,  8 May 2023 02:11:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8657F61DA2;
 Mon,  8 May 2023 02:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4EEC433EF;
 Mon,  8 May 2023 02:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683511915;
 bh=W+BDWcTwbvNWQBCgt9uZZKh6zOCIi71k2crWd1L3W+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwpOfcoQzugMTe6nrRk10AeVJ9UQT/ItdgdISy7DTqoikrRz7Vrv19tbRp/olkgV8
 UBkjm8j7t9GSZPAgHoCls3WCNgnbSQXRf3ZhOdMELvr3rXsYAfpcEYG5Br5ho9atNt
 Z55/nHxH0BlmftEffctJVa/X4ADi1yAzrawwLAglJRzFJ1EUHjOYOlcV4FxZiBgXjU
 0q3LdRMHxvI7Yt17Ip2XdG0QclnuZjPEgGo93iPi4NuG6a3nBDbIl/QjhmTvpSv4fa
 RbizSWsueFK5ilHy2NvIztJrlGKzTk0eSEzrxhiJOKmAOBO7LUTWPxCnr8zjyMscRS
 2i8vHZAd7BNVw==
Date: Sun, 7 May 2023 19:15:36 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Leonard Lausen <leonard@lausen.nl>
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Message-ID: <20230508021536.txtamifw2vkfncnx@ripper>
References: <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 Nikita Travkin <nikita@trvn.ru>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 01:06:13AM +0000, Leonard Lausen wrote:
> This reverts commit e17af1c9d861dc177e5b56009bd4f71ace688d97.
> 
> Removing the delay of 100 units broke hot plug detection for USB-C displays on
> qcom sc7180 lazor devices. Lazor uses mdss for hot plug detection and declares
> dp_hot_plug_det in the dts. Other sc7180 based devices like aspire1 were not
> affected by the regression, as they do not rely on mdss and dp_hot_plug_det for
> hot plug detection.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> Tested-by: Leonard Lausen <leonard@lausen.nl> # Trogdor (sc7180)
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bde1a7ce442f..db9783ffd5cf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1506,7 +1506,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>  
>         if (!dp_display->is_edp)
> -               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
> +               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);

When booting with the cable connected on my X13s, 100 is long enough for
my display to time out and require me to disconnect and reconnect the
cable again.

Do we have any idea of why the reduction to 0 is causing an issue when
using the internal HPD?

Regards,
Bjorn

>  }
>  
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> -- 
> 2.30.2
