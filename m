Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61372A3E71
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF896EBD0;
	Tue,  3 Nov 2020 08:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EAB6E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:59:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 13so12220829pfy.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=q5hRvg/6DcxtLnxjORl58B2jfVZHXF3KMM5lzOgdOn8=;
 b=WXN69DxJRYJaU89iA6C2pmGpQL77jy5U0jrVQodzYXRCCdAdOg9KwFE3ExQf0m4LHw
 xW51LYrHhEISI2WyLtV5h0ymbtc652jMW0sVwFZGuATC9s/0gqElIq6FJShqYlVee7yP
 NmmIyz4G6EWyvZ+upWJY8R9WH678D/3vZ2yA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=q5hRvg/6DcxtLnxjORl58B2jfVZHXF3KMM5lzOgdOn8=;
 b=WQAWCQl10gm8cucHkAApDuz8DAkHqt5h57q70UoUbCx5oTruZ4+svzprBCUWbeYU9K
 SyHMxx7qrUeFhuwShaBBfRWt+2qOzsQjssJFRpausUE3odeBGdW16ETf6OCx8wgOA+4V
 AFbNqG4m0wUv6TAjnB7MtC0vSnfrJIQnT3pi1b8ZMggQzTvCZK0igCjzXNrNLBs5yJza
 4rfRgJ1JHvviVF5TQtvqEaGK+J9oMI2XZ8HBlSH3x9kFlP68yqlFejUqdg3EBlqgzLby
 g0jDVfP1Qtg1DkBEbkh7YFRlAn1EwxR0pRe+2ar4GvIBmnBE4TMZa0+UTS2c+P8sSVFO
 vwOQ==
X-Gm-Message-State: AOAM532rTuZJn0Tk3lXSeaR48IJpClalmFYGo3JTiZocQps/KCJVf6Lr
 qPwDq64T3wVzfJV1wMfeCqmO7g==
X-Google-Smtp-Source: ABdhPJwnIySJ6epBGGGPfeprbUrDnqAx9bdhANANxFSbp8CC2E/eKgMoO1YKlBDE6hCkoXzIyXYzmw==
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr14585323pgm.159.1604350790604; 
 Mon, 02 Nov 2020 12:59:50 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w19sm10682371pff.76.2020.11.02.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:59:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201030232253.11049-1-khsieh@codeaurora.org>
References: <20201030232253.11049-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: deinitialize mainlink if link training failedo
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 02 Nov 2020 12:59:48 -0800
Message-ID: <160435078857.884498.13223713108695196370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-10-30 16:22:53)
> DP compo phy have to be enable to start link training. When
> link training failed phy need to be disabled so that next
> link trainng can be proceed smoothly at next plug in. This

s/trainng/training/

> patch de initialize mainlink to disable phy if link training

s/de/de-/

> failed. This prevent system crash due to
> disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
> also perform checking power_on flag at dp_display_enable() and
> dp_display_disable() to avoid crashing when unplug cable while
> display is off.
> 
> Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link train
> 

Drop newline please.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can you send this as a patch series? There were three patches sent near
each other and presumably they're related.

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cee161c8ecc6..904698dfc7f7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1468,6 +1468,29 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>         return ret;
>  }
>  
> +static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
> +{
> +       struct dp_io *dp_io;
> +       struct phy *phy;
> +       int ret = 0;

Please drop this initialization to 0.

> +
> +       dp_io = &ctrl->parser->io;
> +       phy = dp_io->phy;
> +
> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);

As it's overwritten here.

> +       if (ret)
> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> +
> +       phy_power_off(phy);
> +       phy_exit(phy);
> +
> +       return -ECONNRESET;

Isn't this an error for networking connections getting reset? Really it
should return 0 because it didn't fail.

> +}
> +
>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>  {
>         int ret = 0;
> @@ -1648,8 +1671,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>         if (rc)
>                 return rc;
>  
> -       while (--link_train_max_retries &&
> -               !atomic_read(&ctrl->dp_ctrl.aborted)) {
> +       while (--link_train_max_retries) {
>                 rc = dp_ctrl_reinitialize_mainlink(ctrl);
>                 if (rc) {
>                         DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
> @@ -1664,6 +1686,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                         break;
>                 } else if (training_step == DP_TRAINING_1) {
>                         /* link train_1 failed */
> +                       if (!dp_catalog_hpd_get_state_status(ctrl->catalog))
> +                               break;          /* link cable unplugged */
> +
>                         rc = dp_ctrl_link_rate_down_shift(ctrl);
>                         if (rc < 0) { /* already in RBR = 1.6G */
>                                 if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
> @@ -1683,6 +1708,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>                         }
>                 } else if (training_step == DP_TRAINING_2) {
>                         /* link train_2 failed, lower lane rate */
> +                       if (!dp_catalog_hpd_get_state_status(ctrl->catalog))

Maybe make a function called dp_catalog_link_disconnected()? Then the
comment isn't needed.

> +                               break;          /* link cable unplugged */
> +
>                         rc = dp_ctrl_link_lane_down_shift(ctrl);
>                         if (rc < 0) {
>                                 /* end with failure */
> @@ -1703,6 +1731,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>          */
>         if (rc == 0)  /* link train successfully */
>                 dp_ctrl_push_idle(dp_ctrl);
> +       else
> +               rc = dp_ctrl_deinitialize_mainlink(ctrl);

So if it fails we deinitialize and then return success? Shouldn't we
keep the error code from the link train attempt instead of overwrite it
with (most likely) zero? I see that it returns -ECONNRESET but that's
really odd and seeing this code here means you have to look at the
function to figure out that it's still returning an error code. Please
don't do that, just ignore the error code from this function.

>  
>         return rc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3eb0d428abf7..13b66266cd69 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -529,6 +529,11 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         if (ret) {      /* link train failed */
>                 hpd->hpd_high = 0;
>                 dp->hpd_state = ST_DISCONNECTED;
> +
> +               if (ret == -ECONNRESET) { /* cable unplugged */
> +                       dp->core_initialized = false;
> +               }

Style: Drop braces on single line if statements.

> +
>         } else {
>                 /* start sentinel checking in case of missing uevent */
>                 dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
> @@ -794,6 +799,11 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>  
>         dp_display = g_dp_display;
>  
> +       if (dp_display->power_on) {
> +               DRM_DEBUG_DP("Link already setup, return\n");
> +               return 0;
> +       }
> +
>         rc = dp_ctrl_on_stream(dp->ctrl);
>         if (!rc)
>                 dp_display->power_on = true;
> @@ -826,6 +836,9 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>  
>         dp_display = g_dp_display;
>  
> +       if (!dp_display->power_on)
> +               return -EINVAL;
> +
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
> 
> base-commit: fd4a29bed29b3d8f15942fdf77e7a0a52796d836

What is this commit?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
