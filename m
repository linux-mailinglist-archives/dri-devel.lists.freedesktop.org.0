Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075046EE05
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8010E57B;
	Thu,  9 Dec 2021 16:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EE689739
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 05:54:37 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so1453677ooj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ySPyFFqtdyuBIHLLUyShef42vTuQW5UVEw4YMSFTCGs=;
 b=fcOFBaKN8igGFkv5Hq4B7LT8hZS+vXtlE7scQQo7aB4iwIcYau2OHRYW5Hr8XJtXdY
 FPxqyzqqLvqLUKNKzo55KbG2bwgwxVsHz5NfdwiuH2UTcoA//BK4vw2rotjNxRBdIYjS
 tXawiWlofuozRlbcisqruXLxzXU4PeKNd8N7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ySPyFFqtdyuBIHLLUyShef42vTuQW5UVEw4YMSFTCGs=;
 b=owtqPmHOGdg/MSK42pogUv0fKLnWHnaLAOSkJn1+f34twt5pTq63OEwhOH4Twhyl/M
 C3tdMUowT3yZsZFJbG/LzMsUu6JYPkftWpi8gYBTQpye5d2BLKhxV2c0xzf0Xhb+7oGc
 mtJIOoY9DaXPQ6lqVenPrdMmGtvSsSdu/kmi0qzsr413jSWkw+BzT/hPqOY/eBFKsvCK
 6jU50M/ha2dfrZ+IvNnJABWcqkddYDbmJQQh+s1V88ENFnwEzoke/hutCrEPh72+WvqA
 AY+AtZ7XXKfFxkVJgvj9d3OYPuwe2xHAxJdsnM1qvHxJaG0zrWiv82hVbOLTcvwQiky8
 vMHA==
X-Gm-Message-State: AOAM530EODUGSSRQPLTZSXW/OpZaxUWsVVtj72hbpM/q1rr5ceFgDTju
 S94KWjidzuH6+WTbq+CfALNKp++My3eYhx59HQDRCi3R06w=
X-Google-Smtp-Source: ABdhPJzfm1mjganFNfDgL21KPQZnDL2HCeKKT5S1lwgHg6taD+gRMfe1My60dFjkJru25ZQx0pTSz4jer+PE/I2RKY0=
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr2340150oos.25.1639018897050; 
 Wed, 08 Dec 2021 19:01:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Dec 2021 19:01:36 -0800
MIME-Version: 1.0
In-Reply-To: <1638985262-2072-1-git-send-email-quic_khsieh@quicinc.com>
References: <1638985262-2072-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Dec 2021 19:01:36 -0800
Message-ID: <CAE-0n51FCOwPeWz=SFaRY58J3=yGnKdE5aHMCGx-tzK_CVEUQQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-08 09:41:02)
> Add checking aux read/write status at both dp_link_parse_sink_count()
> and dp_link_parse_sink_status_filed() to avoid long timeout delay if
> dp aux read/write failed at timeout due to cable unplugged.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Changes in v5:
> -- rebase on msm-next branch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>

Remove this newline please.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 +++++++++---
>  drivers/gpu/drm/msm/dp/dp_link.c    | 19 ++++++++++++++-----
>  2 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3d61459..0766752 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -692,9 +692,15 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
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

This part of the commit isn't described in the commit text. Can you add
some more details in the commit text about this?

> +               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +               if (ret == -ECONNRESET) { /* cable unplugged */
> +                       dp->core_initialized = false;
> +               }
>         }
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>
