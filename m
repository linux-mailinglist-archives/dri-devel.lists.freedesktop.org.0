Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706495B11CA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 03:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B0810E39D;
	Thu,  8 Sep 2022 01:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DEF10E916
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 01:06:59 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-127f5411b9cso9069296fac.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 18:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=7qiAFezc7TDNN8MphEwFX9YLlaU3Z88nj+kfViwya00=;
 b=d/ER7mg4tpjjM7KQFCgy+Aj0wxY6tHlCC/10fJtfyhoQPoRGpBtfcIH0c5wQtZ/GMn
 XQxirnoxgTKNyCR9yzjnD79PqSjQzFjUx3bKiEj44XUlsAVg07dewg7r/BfGEoGfnyJN
 0J9JK7Pqts+JksQKkb952qUcbFEPgbW5ha2AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7qiAFezc7TDNN8MphEwFX9YLlaU3Z88nj+kfViwya00=;
 b=imIAXj7ORfNKWt0OTdAA8nK5K5kSnlwvi5wJDG6sUvt6eJ97upqvgkVUOh17jzz/f4
 Wp06tiBYHMdBgI06dWDbvbNXuEka2cd/SYf6DW5vKJl3h3FVSsA/9qvG8xFb+jPcc3ax
 kNkto3qFcaPPVzg72cmLhLWOgS+AU4cgRwKC5Thmy/zygOy/J7qPFgRtqftjdHY4eYW6
 uWrjrtHCCGVuI6AKv99HQDRo2ys/YOa8IprkT16QW0u8F4raMJlPgdg4hjpIWQZFK63H
 cYdjW9fGGAfxlYqSL2OJrUtlSxZOHFDFJsfemOHJ8mkC7veXFSH0U5QH+gee7YocKcXD
 G4/Q==
X-Gm-Message-State: ACgBeo0KKJbHR+RV8XaVFwsSBYEujAVRX3/cMB4sZqenYuQ5tb3UuxjR
 bJdjgOivKy+CNpyOLsEB11qi6hh5KHCEZcsbJjMdIg==
X-Google-Smtp-Source: AA6agR5lNOwaDGSQuS0zoDB3JL2ylckc5Rw69cwhkyYz/6/a0a2tQp3DqBBClJaQHs8Kvg44kZqbDnrln2Y092hqzp0=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr641174oao.44.1662599218943; Wed, 07 Sep
 2022 18:06:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 20:06:58 -0500
MIME-Version: 1.0
In-Reply-To: <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 20:06:58 -0500
Message-ID: <CAE-0n50JDpYUO10QzGocq0m_irJJ4Ag7zUv_hyPqPOb-2_=RkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/msm: filter out modes for DSI bridge having
 unsupported clock
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-08-29 20:33:08)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 39bbabb5daf6..3a06a157d1b1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -265,6 +265,11 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>         return ret;
>  }
>
> +void msm_dsi_set_max_extpclk(struct msm_dsi *msm_dsi, int max_ext_pclk)

Do we really need a 'setter' API for something like this? Why can't we
directly access the constant value for the max clk in the function that
uses it to limit modes?

> +{
> +        msm_dsi_host_set_max_extpclk(msm_dsi->host, max_ext_pclk);
> +}
> +
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
>  {
>         msm_dsi_host_snapshot(disp_state, msm_dsi->host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 2a96b4fe7839..1be4ebb0f9c8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -93,8 +93,9 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>                                   const struct drm_display_mode *mode);
> -enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode);
> +enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
> +               const struct drm_display_mode *mode,
> +               struct drm_bridge *ext_bridge);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> @@ -109,6 +110,7 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  void msm_dsi_host_destroy(struct mipi_dsi_host *host);
>  int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>                                         struct drm_device *dev);
> +void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk);
>  int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>  int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 57a4c0fa614b..4428a6a66ee1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -172,6 +172,9 @@ struct msm_dsi_host {
>         int dlane_swap;
>         int num_data_lanes;
>
> +       /* max pixel clock when used with a bridge chip */
> +       int max_ext_pclk;

Will pixel clock be negative? What units is this in? Hz?

> +
>         /* from phy DT */
>         bool cphy_mode;
>
> @@ -2076,6 +2079,13 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>         return 0;
>  }
>
> +void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +       msm_host->max_ext_pclk = max_ext_pclk;
> +}
> +
>  int msm_dsi_host_register(struct mipi_dsi_host *host)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> @@ -2548,17 +2558,14 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>         return 0;
>  }
>
> -enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode)
> +static enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> +               const struct drm_display_mode *mode)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>         struct drm_dsc_config *dsc = msm_host->dsc;
>         int pic_width = mode->hdisplay;
>         int pic_height = mode->vdisplay;
>
> -       if (!msm_host->dsc)
> -               return MODE_OK;
> -
>         if (pic_width % dsc->slice_width) {
>                 pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>                        pic_width, dsc->slice_width);
> @@ -2574,6 +2581,29 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>         return MODE_OK;
>  }
>
> +enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
> +                                           const struct drm_display_mode *mode,
> +                                           struct drm_bridge *ext_bridge)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +       /* TODO: external bridge chip with DSI having DSC */
> +       if (msm_host->dsc)
> +               return msm_dsi_host_check_dsc(host, mode);
> +
> +       /* TODO: add same logic for non-dpu targets */
> +       if (!msm_host->max_ext_pclk)
> +               return MODE_OK;
> +
> +       if (ext_bridge) {
> +               if (ext_bridge->ops & DRM_BRIDGE_OP_HPD)

Nitpick: Collapse conditions

	if (ext_bridge && (ext_bridge->ops & DRM_BRIDGE_OP_HPD))

Also, what does HPD have to do with this?

> +                       if (mode->clock > msm_host->max_ext_pclk)
> +                               return MODE_CLOCK_HIGH;
> +       }
> +
> +       return MODE_OK;
> +}
> +
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
>  {
>         return to_msm_dsi_host(host)->mode_flags;
