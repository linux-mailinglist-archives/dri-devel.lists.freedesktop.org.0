Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1F456769
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 02:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9393A6E9D8;
	Fri, 19 Nov 2021 01:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4329C6E075
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:20:18 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u74so18377760oie.8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 17:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+4u6zI2WbzNkx110yW93wXh++h279Kv8lQjw6fsVrvg=;
 b=cGZoDisejQaJ8p+P/87PSoJH1JRVUVt00xJ4d56gfBh0WO2C62Dnh4l0iGvqwXKYjn
 b8BRKi1vQXHXNYLWlfM6Fseenb6r8uKSHsw8dSav4HNu5dNVyNcxN43vt4rQVyirCleK
 QUcD2tndLp69InrIm4SXyHhZ49q2QhVqGBo88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+4u6zI2WbzNkx110yW93wXh++h279Kv8lQjw6fsVrvg=;
 b=ip24Q+k/v6OSI8sUaElRIFnlsbCrgdZHRUVGcIzuWe4sF0uSho8Rz9jr6yB6riuVHK
 wBrhZAAS9HYGzBEni3HNTkU+cSjYBcNzIRQgn/XonoLcKvNofqCLy8zzvZ4Fz8vgNsS1
 R59gDNyEbNFm/A2b4v4wKFRPLGgm+jyJarxMzmRAsBUmrWXfpt+xk38krgcZioxBPT2z
 1NcaOtBCRhLbtipcAZm+SFMB8+TvCjrvo8sxRJSzAhfb3Hzrbhshh2gGQCXpBil4YTct
 IwG063sRNMvY4k7jvHYm67HfLzkqWKYirBr2oLf6+yV/FW3OUs+1ZPTB9KqsMfOx9FYd
 zioA==
X-Gm-Message-State: AOAM5301Myneqh3Zenyc01D/8aytifNOvKYJcSLt4ANjkZj7JGcPEZrG
 on87tRXxHL82XkjfdLRjmtMFpnlVH64Jwp+qi1NTqA==
X-Google-Smtp-Source: ABdhPJw/lFMRDpADbSuVq+e5zkxL2+/msM1iuh9pKofY63E+8BxMAfvDYsKcBUq8mQXD9V67bnHftwapPA2n0wvR65s=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1436004oil.32.1637284817525;
 Thu, 18 Nov 2021 17:20:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Nov 2021 02:20:17 +0100
MIME-Version: 1.0
In-Reply-To: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
References: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 19 Nov 2021 02:20:17 +0100
Message-ID: <CAE-0n505-VcS46WnVARsvuaizePP-3cYEw_rfipfq9Yj7AW=Ow@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
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
 Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-11-09 13:38:13)
> From: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divided the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and suspend.
> Regulators, core clocks and irq are grouped together and enabled at resume
> (or booting up) so that the DP controller is armed and ready to receive HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, code
> clocks and irq are disabled at corresponding suspension.
>
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
>
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>         dp_display_host_init() for eDP
>
> Changes in V4:
> -- rewording commit text to match this commit changes
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

What commit is this patch based on?
