Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC4501F69
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 02:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF06D10E517;
	Fri, 15 Apr 2022 00:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0710E3DC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 00:02:55 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q129so7086976oif.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 17:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lFXIXGhjvQiAzcJjIJPH2ZocTakW8F4DCyIRzI8kZmQ=;
 b=a4UWMC3Ccy7fIO00COl5o++pPXzAJXp59uvvch6NqUugy5OUGyM4dqnLcYCxTtGTFs
 Exo5iNPWolW/pq+nOr9yCp7r5sCLhqMJnPCFdnFrD5QjBf8Qbyc/O8pcq8lKkzxRciu5
 DB5F212L1L9QUmqGCIfD5Cb2uIcmq/xP98dEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lFXIXGhjvQiAzcJjIJPH2ZocTakW8F4DCyIRzI8kZmQ=;
 b=YyYuFEVFUhKgUmTqpmN9xE0x6T9PfksetmNluP2gkEksfsQw4B9uYSGLqKDKbzSuGq
 aCkyoLisodjaWkugY/Tsx+5q4zQuqkWWR8wYD/k6GQGoyEgugfPFuxFsaK6d6zk2g1BK
 ouu/J84fS6SoCR1kVLS1kqTOms9DP5artihCy6zvCXdqVPVErXSVd2bZsGzersT8cJjr
 8Ta5XaG2XnfRJBySOps8pKT37b2Csb7JTtjGxuhO2SEgXa1wEod5RWTnUm6WDJmZpqYx
 pai/1Vv76y/rYtTldDX9Te1xBJcdH/lQYDlmJYwSYonmbhkz5u8evq8ov2kvUEYQX2Dk
 U8KA==
X-Gm-Message-State: AOAM531yLHqTwwt3vS8DrkRQNaQvM09iCMA020KGeyj4jSbVcbk5eaHw
 +3CurC+HrcqIkdzJO0XhiyUae90b/UkWiRjKcQokqQ==
X-Google-Smtp-Source: ABdhPJwI9zofyRE9RWr2YAteFhCYNo1cf6Ca5LBeolyDphWIQ4e7AZhm56lnYdqGmBbQIaHvNgr0o138d2iJdeIDoco=
X-Received: by 2002:a05:6808:10d4:b0:2fa:5fa6:e9c4 with SMTP id
 s20-20020a05680810d400b002fa5fa6e9c4mr467095ois.193.1649980974816; Thu, 14
 Apr 2022 17:02:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:02:54 -0700
MIME-Version: 1.0
In-Reply-To: <1649973079-5916-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649973079-5916-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 17:02:54 -0700
Message-ID: <CAE-0n53jz9EZ=ry3+zh7KgyYLcF5dQoKeBwcXDQzq8wagyzRvg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: stop event kernel thread when DP unbind
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
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-14 14:51:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..baba95d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -230,6 +231,18 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +

One too many newlines

> +static void dp_hpd_event_thread_stop(struct dp_display_private *dp_priv)
> +{
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +}

This can move after the start function?

> +
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
