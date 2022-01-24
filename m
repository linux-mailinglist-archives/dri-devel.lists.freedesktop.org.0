Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFB4994BD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 22:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB2F10EB08;
	Mon, 24 Jan 2022 21:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124AB10E5EE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 21:04:20 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso24038685otf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JYiLYol9mvWoC/k9SlBNW3f4S6peoi+xmexnQLDaAHc=;
 b=HsuuTxhscaoAqtQaDrdwBqOr+pYZMN4w2SA8Q7gzbGeDVQlpfcRDDYbqoI1eGaw4HH
 tqzC8Rw8Wq9AFXlLETHFjUOJ/Kd57+8avtXJcdQl+Zk2xnWWSjvNGfjrKmB1mjc9h3G/
 J51AFEegRcmcOXWbI+rmYoSKJy7YCRzp/zMxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JYiLYol9mvWoC/k9SlBNW3f4S6peoi+xmexnQLDaAHc=;
 b=hnwV9eRFg6bnplcqD4mcjFwklwJdtax5Dsbv4MytUGrizW7b/AlvvtBw5tW1WAU2HP
 rCe/v4qHIM8ZwFpWjNdldMbV2zKTk4muaZ+wzjAC9eD01TxxkX9Ye75DsZifTfs37hjj
 51n9BWoxt7bs7PRv6TP2Wc2/jN9hcdwMA2yLJctgYs8Cer+zYIZHrnoJ6uRPnItTHnHf
 qc+9j4a8+hqDELJwB2lyQ6WEoHuJLcWOUKJaIbHymDt+1K952QKkOVSbKZ+2fXApl1In
 AZRHFipRZenF9jWZyKX6EGQevgP/1zuStjcdk2WRDchOJ1lM67rErYyX8iSzhnhgprHP
 6VNQ==
X-Gm-Message-State: AOAM530iQYkC4OmlMHecxJviffQPNLvdPe8wLEqA4h2qaFN/kqwgY0xf
 ZcNcCT2ehAt7EwKMk+ywO5i7MPNtoygnOs7eWGPgJQ==
X-Google-Smtp-Source: ABdhPJzWss7XOnvh73u3Bx1WcknT+UoYuzDwWnibDZtvmdSPqZExl7hcfY2zpEl1b5NjqqKETJt01WEhiJ/eialMpxs=
X-Received: by 2002:a05:6830:30ba:: with SMTP id
 g26mr6213128ots.159.1643058259360; 
 Mon, 24 Jan 2022 13:04:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 13:04:18 -0800
MIME-Version: 1.0
In-Reply-To: <1643057170-10413-1-git-send-email-quic_khsieh@quicinc.com>
References: <1643057170-10413-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 24 Jan 2022 13:04:18 -0800
Message-ID: <CAE-0n53nFcMzuKfqVRac6PRTkoPrftXL+uVK56ZQsHVWHmivkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: always add fail-safe mode into connector mode
 list
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 12:46:10)
> Some of DP link compliant test expects to return fail-safe mode
> if prefer detailed timing mode can not be supported by mainlink's
> lane and rate after link training. Therefore add fail-safe mode
> into connector mode list as backup mode. This patch fixes test
> case 4.2.2.1.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Any Fixes tag? I also wonder why this isn't pushed into the DP core code
somehow. Wouldn't every device need to add a 640x480 mode by default?

> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 3b02922..7743b45 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -221,6 +221,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 if (drm_add_modes_noedid(connector, 640, 480))
>                         drm_set_preferred_mode(connector, 640, 480);
>                 mutex_unlock(&connector->dev->mode_config.mutex);
> +       } else {
> +               /* always add fail-safe mode as backup mode */
> +               mutex_lock(&connector->dev->mode_config.mutex);
> +               drm_add_modes_noedid(connector, 640, 480);
> +               mutex_unlock(&connector->dev->mode_config.mutex);
>         }
>
>         if (panel->aux_cfg_update_done) {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
