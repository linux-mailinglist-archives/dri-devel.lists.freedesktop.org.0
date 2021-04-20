Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D23661D3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 00:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEDC6E8F7;
	Tue, 20 Apr 2021 22:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081A6E8F7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 22:01:05 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p16so16491528plf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=v8dPsnj7LVPAJqreP5fUXlj6CsjITq45zlynre8tQwU=;
 b=LCxqTfbSUo+aGA+zS74bOqNZKleN1jR/KQ6Ydc9QI8CWZrJ7b8/jS5nRk+IwTvzAiH
 5L3S9FdMPWBdAo7bb2vUFaED/Nkw41491VBPTrcvR8cHYMjQWAJpIdAyAN6d5xVzIYIE
 90jbX4aAOFGiKGl4qH+nF1hv8rgFS4hGi8sQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=v8dPsnj7LVPAJqreP5fUXlj6CsjITq45zlynre8tQwU=;
 b=pWsxY33sqjdzcgd3VZin+Z4Y1j1a7WPNnmxpg7gD5Fe+a11Pz7jdqJ1sl5M5AGhizV
 8qU9wOGTKjm94UUbgu2b6oWE4r50FHTENvI4HLhQ1c1vIK1Lq8f8UUbftV/HfGJHdlX8
 uhcuCHspE4vbv47boeuaox3Zz2aYeYicbUvXffUlUZYHD7A1BA831R9QmmeBUWlyTpDE
 eR29RzR2f6l3Z35bPAlqMzJaBZu4PtmjFOOxte6FWDCcWXMbw93l+oxbtPfGGqEoLskH
 lQwFwP/2oa04579TEk5Dpfz1HCUYn+J/UmJ08sEzEtCgbj7UKBvSHpvjUmI14am2B3SR
 X5aA==
X-Gm-Message-State: AOAM5312RgVJmvfKyd8U6Rs1dF6PN6Ws3mqLaFGpEkiFVIzn/4oOC+Wp
 CYhnmcy08PNT/ACspSfZVMT8BA==
X-Google-Smtp-Source: ABdhPJw39iivqaEsGNyvaKDr7/Mbo/adR7cFLGbc1hXX8DChY41Jiy/BZY3aZAztF1khmi7IFjahHA==
X-Received: by 2002:a17:902:e5d1:b029:eb:7ec2:648e with SMTP id
 u17-20020a170902e5d1b02900eb7ec2648emr29213086plf.30.1618956064553; 
 Tue, 20 Apr 2021 15:01:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:bf8b:4b8b:2315:3719])
 by smtp.gmail.com with ESMTPSA id b10sm45714pfb.27.2021.04.20.15.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 15:01:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: service only one irq_hpd if there are
 multiple irq_hpd pending
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 20 Apr 2021 15:01:02 -0700
Message-ID: <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, khsieh@codeaurora.org,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-16 13:27:57)
> Some dongle may generate more than one irq_hpd events in a short period of
> time. This patch will treat those irq_hpd events as single one and service
> only one irq_hpd event.

Why is it bad to get multiple irq_hpd events in a short period of time?
Please tell us here in the commit text.

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..0a7d383 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -707,6 +707,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>  
> +       /* only handle first irq_hpd in case of multiple irs_hpd pending */
> +       dp_del_event(dp, EV_IRQ_HPD_INT);
> +
>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>         if (ret == -ECONNRESET) { /* cable unplugged */
>                 dp->core_initialized = false;
> @@ -1300,6 +1303,9 @@ static int dp_pm_suspend(struct device *dev)
>         /* host_init will be called at pm_resume */
>         dp->core_initialized = false;
>  
> +       /* system suspended, delete pending irq_hdps */
> +       dp_del_event(dp, EV_IRQ_HPD_INT);

What happens if I suspend my device and when this function is running I
toggle my monitor to use the HDMI input that is connected instead of some
other input, maybe the second HDMI input? Wouldn't that generate an HPD
interrupt to grab the attention of this device?

> +
>         mutex_unlock(&dp->event_mutex);
>  
>         return 0;
> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>         /* stop sentinel checking */
>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>  
> +       /* link is down, delete pending irq_hdps */
> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
> +

I'm becoming convinced that the whole kthread design and event queue is
broken. These sorts of patches are working around the larger problem
that the kthread is running independently of the driver and irqs can
come in at any time but the event queue is not checked from the irq
handler to debounce the irq event. Is the event queue necessary at all?
I wonder if it would be simpler to just use an irq thread and process
the hpd signal from there. Then we're guaranteed to not get an irq again
until the irq thread is done processing the event. This would naturally
debounce the irq hpd event that way.

>         dp_display_disable(dp_display, 0);
>  
>         rc = dp_display_unprepare(dp);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
