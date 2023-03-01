Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73A6A655C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 03:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7732B10E08F;
	Wed,  1 Mar 2023 02:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024EC10E08F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 02:16:24 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-536c02c9dfbso327344417b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 18:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MpqcIMBd2WSo0/P0DK6pbtSqbDc0TAI/eMMDgcg1TZQ=;
 b=NxPgCw/vamDZoC6wAFY0CZZqhAvRE+6GNrf2IQJUd2JkSWZXKVWV6kKpgWwEb0OuPo
 XaKvab+cusGgfUSMfwVgqQI2Mk0z6Tfd+sjDxIlar069TnmcHsII29VV8FuC/59XvDAE
 jmYzB8uOdfJfkn1912xcPkXrd2AQuW8/A8iqVeqIdXj/iqEcDgUBFKODKvYN8vqqY0YL
 GbW+3X/wGZvvZx08fiQ4cYhUBmV9UERTg9cBw+xYTdo9ox/4Wm9CPaGVhSeMNh9r6at9
 pKRnPlfhCB9BO4u9vkXsoV/nTL2UaKR6kuF+HpVeIpHCUXEuEMx4Z7gRdPYb75bX/L7A
 G7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpqcIMBd2WSo0/P0DK6pbtSqbDc0TAI/eMMDgcg1TZQ=;
 b=PBdwOBvun7Hi4S+2Y0Fv+dnC8t8+aXyAWypYen4Ys7uq0YT0rlba8PRBGuzJBtxTqd
 Olnm3XTVQ2usD2NPtwORmwIelKprwdnc1BBmNUZhpi/3bofhpma+WiJ26/xK9FjQ286N
 wxOduq7IbB02oZnVi3o/zFKTCGhoAdIAKltFKixFNvvxL3ZokG17tXb6BtdYrpnqehIf
 ffKKWkDEg3bFv/93CusJQVBu9DfIFqBWP3jT4cUV/aFBqZqgXEgAUnYc098+7BGf+Mob
 tBp9X0x+wOWjlhYgyQNXDjqCoOlMT+bPrvNymy74eHjVy1cQMAz2pF2ILuCA9abb6SaW
 uGTQ==
X-Gm-Message-State: AO0yUKXiqkiP1agD7h+NIV5l9OGKrtz5/7nS8z1jROEIZK/5CVHqOdvP
 3qUQa3RGc7CFaW5cn0H4SmxAPLUPEccABSeO2I3OZQ==
X-Google-Smtp-Source: AK7set9Lp1Gh0mv/hx+7TRqP5+gdVfavRb+ucnWIMkd1Ht+MXDm9xptjUJoSoQMr+b9FBRyoF4PG1TI0vTGM/G+2nhA=
X-Received: by 2002:a81:b609:0:b0:52f:24ac:9575 with SMTP id
 u9-20020a81b609000000b0052f24ac9575mr2900807ywh.3.1677636984029; Tue, 28 Feb
 2023 18:16:24 -0800 (PST)
MIME-Version: 1.0
References: <1677629817-18891-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1677629817-18891-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Mar 2023 04:16:12 +0200
Message-ID: <CAA8EJpquZAhn+HswNxardN1fE8Zu1CKrCU5EiX=B8mGWuxfWnQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Mar 2023 at 02:17, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There is a reboot/suspend test case where system suspend is forced
> during system booting up. Since dp_display_host_init() of external
> DP is executed at hpd thread context, this test case may created a
> scenario that dp_display_host_deinit() from pm_suspend() run before
> dp_display_host_init() if hpd thread has no chance to run during
> booting up while suspend request command was issued. At this scenario
> system will crash at aux register access at dp_display_host_deinit()
> since aux clock had not yet been enabled by dp_display_host_init().
> Therefore we have to ensure aux clock enabled by checking
> core_initialized flag before access aux registers at pm_suspend.

Can a call to dp_display_host_init() be moved from
dp_display_config_hpd() to dp_display_bind()?

Related question: what is the primary reason for having
EV_HPD_INIT_SETUP and calling dp_display_config_hpd() via the event
thread? Does DP driver really depend on DPU irqs being installed? As
far as I understand, DP device uses MDSS interrupts and those IRQs are
available and working at the time of dp_display_probe() /
dp_display_bind().

>
> Changes in v2:
> -- at commit text, dp_display_host_init() instead of host_init()
> -- at commit text, dp_display_host_deinit() instead of host_deinit()
>
> Changes in v3:
> -- re arrange to avoid commit text line over 75 chars
>
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bde1a7c..1850738 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -460,10 +460,12 @@ static void dp_display_host_init(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> -       dp_power_init(dp->power, false);
> -       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> -       dp_aux_init(dp->aux);
> -       dp->core_initialized = true;
> +       if (!dp->core_initialized) {
> +               dp_power_init(dp->power, false);
> +               dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> +               dp_aux_init(dp->aux);
> +               dp->core_initialized = true;
> +       }
>  }
>
>  static void dp_display_host_deinit(struct dp_display_private *dp)
> @@ -472,10 +474,12 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> -       dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
> -       dp_aux_deinit(dp->aux);
> -       dp_power_deinit(dp->power);
> -       dp->core_initialized = false;
> +       if (dp->core_initialized) {
> +               dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
> +               dp_aux_deinit(dp->aux);
> +               dp_power_deinit(dp->power);
> +               dp->core_initialized = false;
> +       }
>  }
>
>  static int dp_display_usbpd_configure_cb(struct device *dev)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
