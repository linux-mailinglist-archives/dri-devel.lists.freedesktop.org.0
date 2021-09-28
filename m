Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482B41B88C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6136E981;
	Tue, 28 Sep 2021 20:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B006E97D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:42:36 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso70805otu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uegvCqgF33M3moNAXxbTAqPKWgE2zUFv3rJPDnCK318=;
 b=bTGLeyAqVm4yvVybxFMvfr82sU4tDikUIegRQQB2zrmSWA2/zpvsM79ITuVnhLIS3y
 cy0ov0MHqaZXUa48g1wwmcKzX/Ym9dC6tBedVGhUrduILDfeVkl3Anc9L3hLXRQrT2FW
 X0cQtuXqNiJzsuCZRMczREtR8wOuChTM/babo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uegvCqgF33M3moNAXxbTAqPKWgE2zUFv3rJPDnCK318=;
 b=ZZwDPmYcTwhFv2lDX1SEx0H8+qjTqME0do376WON5HoG4qv0fNpTL0r9d6KOqsJ5FS
 CKm3xs+4qoXcl1HeZj5WMLFFvSmLOgPwhcDOsreyHP9Fp7fBRMQr8NGIMJNSIH/ab0p2
 Xdpz1jdb0KrutVTbaERfCJ3Cndh0fYVCjEVKfRkeeQaMwvkIeHJuzEZGVVU7mkqs2Rzv
 43LQs0GjeaHBfz8tQhKx8Ny3JO1nyeQzlgHux6TMQQCv2cF/m6rLjMhaE0lFbSWiQtQP
 uWMTSowfmocTM1Ayd2mU5mg1cZn1yj7e1oQtIltkHpUEHxgOQ8SbnENCzn4kOmJOMMag
 MDiA==
X-Gm-Message-State: AOAM531FiZgpmfWUUrSrfZTN8QOjYUWzjzqzS88Ufgc19q1F7KX4LQ9J
 GkzNWda7CEvWCYFel9a8sQFX0Ml46cw/JZL/AwxXiQ==
X-Google-Smtp-Source: ABdhPJzbrReCsPak9qtP+xmmFsOIy27/pz5auaxnHNLOf59z46/3FuUj4GNV6gNgUU6sLbKtpPIPTPQA/PZ66xgDUdU=
X-Received: by 2002:a05:6830:358:: with SMTP id
 h24mr6640507ote.159.1632861755401; 
 Tue, 28 Sep 2021 13:42:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Sep 2021 13:42:34 -0700
MIME-Version: 1.0
In-Reply-To: <1632845472-29276-1-git-send-email-khsieh@codeaurora.org>
References: <1632845472-29276-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 28 Sep 2021 13:42:34 -0700
Message-ID: <CAE-0n53qPN_ujrs8ABnvdUWgg7mKvcgZBaNq3Os17i7iPKnoTA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: only signal audio when disconnected detected
 at dp_pm_resume
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-09-28 09:11:12)
> Only signal audio when disconnected detected at dp_pm_resume since
> connected status will be signaled to audio at next plugin handler.

Please add more details. This says what the patch does but it would be
better if it included why it is important. Does it fix something?
There's a fixes tag so it must fix something. Is it bad to signal audio
plug change on resume when it hasn't actually changed from last time?
Why is that bad? What if the cable is unplugged and then plugged in
before resume? Does audio still get signalled in that case?

>
> Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0e543a03..6f13008 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1356,14 +1356,14 @@ static int dp_pm_resume(struct device *dev)
>          * can not declared display is connected unless
>          * HDMI cable is plugged in and sink_count of
>          * dongle become 1
> +        * also only signal audio when disconnected
>          */
> -       if (dp->link->sink_count)
> +       if (dp->link->sink_count) {
>                 dp->dp_display.is_connected = true;
> -       else
> +       } else {
>                 dp->dp_display.is_connected = false;
> -
> -       dp_display_handle_plugged_change(g_dp_display,
> -                               dp->dp_display.is_connected);
> +               dp_display_handle_plugged_change(g_dp_display, false);
> +       }
