Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E692B5B55
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22C6E15C;
	Tue, 17 Nov 2020 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE566E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 01:00:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b63so12239288pfg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
 b=QIK29EeQBxKfUcrXB/o0zASZ0enH3DTfkTyOtmZv/6Kul0xepHNOrP6vcXrexOXTZr
 Jf7WPzyY+x36w8kkS6fijV02icwrKxoMEsT1/hK/7Xh4GJpYHbrJ1Lqf4YHYmRAKzw+2
 pQRmRF1jExMSGgLX1pwTHAY5KixKcCiArNfhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
 b=oPHVmQGDL4FdUqpUYHyYNbDbS2HWHPl0bBza7RvJjX86158aHuyOHJg4HGVtDMQyCm
 cBgfs2hTQE1mZxoWFYrEEtUUT+0ssVmBjR8CUPRPxdW3EwepEqS/qXQ5d5AjX9YZHZ0K
 SfGTlwHdvHtIETBksexOFUFgSiB7fJEy37A8443keWIlBypZVWN15ZwjjNf6y7WgXilZ
 oxfle7bgcQeU4OlHSEU2rcos7r1rbaL57UVjtHRtJg/y2ThnFhn8/Xa8CNICrXa3Uvze
 LWvulehIc+Lbq3e7FUM34cwmuCR79xaybnpKqSvnlJ5Q+DhXvL3opGrl8ETyTl9H58fS
 L4sQ==
X-Gm-Message-State: AOAM532hMTKsu4kwufDcvhMLpqOov4cHV2WEw/ixM0UevWhczbML68XX
 qzn5lRC35rmPtry57E16yfrC3Q==
X-Google-Smtp-Source: ABdhPJzohwSM2vGqzunfEj57/N7SS+yFjY7d2u20TWgXUDIMq5bsYUDz2+kVu7HVvVFWXPnuOH+lQw==
X-Received: by 2002:a63:565d:: with SMTP id g29mr1448743pgm.249.1605574815376; 
 Mon, 16 Nov 2020 17:00:15 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id i6sm641469pjt.49.2020.11.16.17.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:00:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201113222639.18786-1-khsieh@codeaurora.org>
References: <20201113222639.18786-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: fix connect/disconnect handled at ir_hdp
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 16 Nov 2020 17:00:12 -0800
Message-ID: <160557481298.60232.17821932910000059522@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-11-13 14:26:39)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 27e7e27b8b90..4e84f500b721 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -279,13 +279,25 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
>         drm_helper_hpd_irq_event(connector->dev);
>  }
>  
> -static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> -                                           bool hpd)
> +
> +static void dp_display_set_encoder_mode(struct dp_display_private *dp)
>  {
> -       static bool encoder_mode_set;
>         struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
>         struct msm_kms *kms = priv->kms;
> +       static bool encoder_mode_set;

Can this be stored in the dp_display_private structure instead? No
singletons please.

> +
> +       if (!encoder_mode_set && dp->dp_display.encoder &&
> +                               kms->funcs->set_encoder_mode) {
> +               kms->funcs->set_encoder_mode(kms,
> +                               dp->dp_display.encoder, false);
>  
> +               encoder_mode_set = true;
> +       }
> +}
> +
> +static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> +                                           bool hpd)
> +{
>         if ((hpd && dp->dp_display.is_connected) ||
>                         (!hpd && !dp->dp_display.is_connected)) {
>                 DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
> @@ -491,17 +487,29 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
>                 if (sink_request & DS_PORT_STATUS_CHANGED) {
> -                       /* same as unplugged */
> -                       hpd->hpd_high = 0;
> -                       dp->hpd_state = ST_DISCONNECT_PENDING;
> -                       dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> -               }
> -
> -               rc = dp_display_handle_irq_hpd(dp);
> -
> -               if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
> -                       hpd->hpd_high = 1;
> -                       dp->hpd_state = ST_CONNECT_PENDING;
> +                       if (dp_display_is_sink_count_zero(dp)) {
> +                               DRM_DEBUG_DP("sink count is zero, nothing to do\n");
> +                               if (dp->hpd_state != ST_DISCONNECTED) {
> +                                       hpd->hpd_high = 0;
> +                                       dp->hpd_state = ST_DISCONNECT_PENDING;
> +                                       dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +                               }
> +                               rc = -ENOTCONN;
> +                       } else {
> +                               if (dp->hpd_state == ST_DISCONNECTED) {
> +                                       hpd->hpd_high = 1;

This else and then if can be an else if, right?

> +                                       dp->hpd_state = ST_CONNECT_PENDING;
> +
> +                                       rc = dp_display_process_hpd_high(dp);
> +                                       if (rc) {
> +                                               hpd->hpd_high = 0;
> +                                               dp->hpd_state = ST_DISCONNECTED;
> +                                       }
> +                               }
> +                       }
> +               } else {
> +                       if (!dp_display_is_ds_bridge(dp->panel))
> +                               rc = dp_display_handle_irq_hpd(dp);
>                 }
>         }
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
