Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F62F297B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A79E6E0F0;
	Tue, 12 Jan 2021 07:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF436E072
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:54:04 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n10so340166pgl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
 b=PYTOCCGpovAEIhp6SDc7oo7y6LDK0BrdmH5Bo6LK5wdMJMxJPgEfd+o4Ygb8Zm1W6N
 WT12d307T0ug2fNJrkoAHMKl/62zRSABiCuI41DTLqQTmWvAKerQmPYf8hZZ6PZ4IkQg
 8XXC0t3qPdfh8ztVgYLAPMtyOlQzV4bAnFIN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
 b=CA3fInc8E/vTb69eeFWTXU3IpL/Klh/JAipkwTwVov8UTuzSMmEedjQKNMfo7Ky7s2
 kbyRpFDedDlYDUSNSxiEStLQYZzEHek5UdGp3AdyLQdLrBgjaz87BOBptafvsBw2qg7Y
 67QgO8yLUno58lRkWhkCMoR+gorDCjeLC87LVnGVpbe1Zfe0JmjoHVsDxbX59v8HHg5J
 YGBTWmWWBf78af/hUn5jAtGn+QNgm5hzReShsD7kwCAp3WwJMC0JIbovuRnnNAIEMUYY
 f4pf08RYQDKC4vh6p92gu329CWZd4GLWZ37AUYY3XyuyVPqAhJ6p8/7sPIDeqs/LTYJF
 3/iw==
X-Gm-Message-State: AOAM532CP00vGpWQMcsQBfbeTLEPDWkjTCKtzE1PZ2/V/NmOMdWSEsxv
 5t4ORFcPze8G20gb2X1DBSRt2gCSFcdPug==
X-Google-Smtp-Source: ABdhPJxKRGtGDIO3VfXdh7jxqm6nRjvFkD4HG/tJC8VlSrZjMO2GjMyC/nt1FZND08abv6HToCiIrg==
X-Received: by 2002:a65:494f:: with SMTP id q15mr1092942pgs.367.1610394844028; 
 Mon, 11 Jan 2021 11:54:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 5sm419116pff.125.2021.01.11.11.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:54:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd
 handler
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Mon, 11 Jan 2021 11:54:01 -0800
Message-ID: <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-01-07 12:30:25)
> There is HPD unplug interrupts missed at scenario of an irq_hpd
> followed by unplug interrupts with around 10 ms in between.
> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
> irq_hpd handler should not issues either aux or sw reset to avoid
> following unplug interrupt be cleared accidentally.

So the problem is that we're resetting the DP aux phy in the middle of
the HPD state machine transitioning states?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 44f0c57..9c0ce98 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
>         return 0;
>  }
>  
> +/**
> + * dp_catalog_aux_reset() - reset AUX controller
> + *
> + * @aux: DP catalog structure
> + *
> + * return: void
> + *
> + * This function reset AUX controller
> + *
> + * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> + * 
> + */
>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 aux_ctrl;
> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
>         return 0;
>  }
>  
> +/**
> + * dp_catalog_ctrl_reset() - reset DP controller
> + *
> + * @aux: DP catalog structure

It's called dp_catalog though.

> + *
> + * return: void
> + *
> + * This function reset DP controller

resets the

> + *
> + * NOTE: reset DP controller will also clear any pending HPD related interrupts
> + * 
> + */
>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 sw_reset;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e3462f5..f96c415 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>          * transitioned to PUSH_IDLE. In order to start transmitting
>          * a link training pattern, we have to first do soft reset.
>          */
> -       dp_catalog_ctrl_reset(ctrl->catalog);
> +       if (*training_step != DP_TRAINING_NONE)

Can we check for the positive value instead? i.e.
DP_TRAINING_1/DP_TRAINING_2

> +               dp_catalog_ctrl_reset(ctrl->catalog);
>  
>         ret = dp_ctrl_link_train(ctrl, cr, training_step);
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
