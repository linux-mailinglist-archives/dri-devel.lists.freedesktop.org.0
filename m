Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C19366287
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010E16E92D;
	Tue, 20 Apr 2021 23:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570836E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 23:38:53 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 31so12454212pgn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=rUEcOAL+JdYx7iw/rsaYqBg6P/fDtNoMJwsAvdMr4k8=;
 b=ZtpSHHCa3/J8Q01BlM9ud01JiqjG6VpT4jrLH7nfoh0ZpIi8KROK+UzYFdOnAHv64Y
 CPOB9aO3tqTwU+EzkIGARznb+Fck3IRcGC/40Qx1xaqQSg93VSjQwgwG6CVyaSvLvI7Q
 I9dscI7B21TE96Aa8oufyl1VbcaTs4vfL2n5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=rUEcOAL+JdYx7iw/rsaYqBg6P/fDtNoMJwsAvdMr4k8=;
 b=avn2FU014gIegNWejJtvIzc/kmz33LT5aPOr4h6+KZH3VsVFydlZD5muZpbg+y7odS
 5Ht7b3/LqxTXpwx3GXi+2sb+oRBYFtMKFOfUzCIJfc3Fuh5nz8v1wTjvIozz1274yw5x
 4MmJmb4v1CFooFLtqI56l+CVWDKaqdWfZIwLgOgk6pBx50SWPQto11qJ/BuRLyzjEpz/
 GAGLPmb51MMFTpe6lFaqiqIMeAacOgALgWxQevKjgdYBJXvaMsAPdof+nDufbsb2tTvo
 4L9dlndYhMlNMqECt65xTy+PAcCqM+hWK+hN/oIPCZghF6JEdYwaUin7mFq4uA/sAQnk
 FgBg==
X-Gm-Message-State: AOAM5329TxHOLQlohkiYWCDKmImxLMlfTBP70GBqClJq8RzKQxwDGFku
 VaRnzz0A3P1gksxxTWl8Ylnlqw==
X-Google-Smtp-Source: ABdhPJwaJs4WZDLFNWzbOxVCZx4k6HAurBhLbnuarykRH3zTa6CzwurH2yeUCrWudlUlo0Eph/iupQ==
X-Received: by 2002:a17:90a:9509:: with SMTP id t9mr7754936pjo.3.1618961932968; 
 Tue, 20 Apr 2021 16:38:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:bf8b:4b8b:2315:3719])
 by smtp.gmail.com with ESMTPSA id r3sm111567pfl.159.2021.04.20.16.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 16:38:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618594731-556-1-git-send-email-khsieh@codeaurora.org>
References: <1618594731-556-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: check main link status before start
 aux read
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 20 Apr 2021 16:38:50 -0700
Message-ID: <161896193053.46595.7590816467281538002@swboyd.mtv.corp.google.com>
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

Quoting Kuogee Hsieh (2021-04-16 10:38:51)
> Maybe when the cable is disconnected the DP phy should be shutdown and
> some bit in the phy could effectively "cut off" the aux channel and then
> NAKs would start coming through here in the DP controller I/O register
> space. This patch have DP aux channel read/write to return NAK immediately
> if DP controller connection status is in unplugged state.
> 
> Changes in V3:
> -- check core_initialized before handle irq_hpd
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
>  drivers/gpu/drm/msm/dp/dp_link.c    | 20 +++++++++++++++-----
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>  
>         mutex_lock(&aux->mutex);
>  
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret = -ETIMEDOUT;
> +               goto unlock_exit;
> +       }
> +

This still makes me concerned. Any possibility to not do this and have
the phy cut the connection off and have this transfer timeout
immediately?

>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
>  
>         /* Ignore address only message */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1784e11..db3f45e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -571,7 +571,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                 dp->hpd_state = ST_DISCONNECTED;
>  
>                 if (ret == -ECONNRESET) { /* cable unplugged */
> -                       dp->core_initialized = false;
> +                       DRM_ERROR("dongle unplugged = %d\n", ret);

Is this a debug message?

>                 }
>  
>         } else {
> @@ -711,9 +711,15 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>  
> -       ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> -       if (ret == -ECONNRESET) { /* cable unplugged */
> -               dp->core_initialized = false;
> +       /*
> +        * dp core (ahb/aux clks) must be initialized before
> +        * irq_hpd be handled
> +        */
> +       if (dp->core_initialized) {
> +               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +               if (ret == -ECONNRESET) { /* cable unplugged */
> +                       DRM_ERROR("dongle unplugged = %d\n", ret);

Another debug message?

> +               }
>         }
>  
>         mutex_unlock(&dp->event_mutex);
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..53ecae6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
>         return 0;
>  }
>  
> -static void dp_link_parse_sink_status_field(struct dp_link_private *link)
> +static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>  {
>         int len = 0;
>  
>         link->prev_sink_count = link->dp_link.sink_count;
> -       dp_link_parse_sink_count(&link->dp_link);
> +       len = dp_link_parse_sink_count(&link->dp_link);
> +       if (len < 0) {
> +               DRM_ERROR("DP parse sink count failed\n");
> +               return len;
> +       }
>  
>         len = drm_dp_dpcd_read_link_status(link->aux,
>                 link->link_status);
> -       if (len < DP_LINK_STATUS_SIZE)
> +       if (len < DP_LINK_STATUS_SIZE) {
>                 DRM_ERROR("DP link status read failed\n");
> -       dp_link_parse_request(link);
> +               return len;
> +       }
> +
> +       return dp_link_parse_request(link);
>  }
>  
>  /**
> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_link)
>  
>         dp_link_reset_data(link);
>  
> -       dp_link_parse_sink_status_field(link);
> +       ret = dp_link_parse_sink_status_field(link);
> +       if (ret) {
> +               return ret;
> +       }
>  
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -- 

Can you split this part off into another patch? It seems to stand on its
own as it makes the code more robust to transfer errors in the sink
parsing code.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
