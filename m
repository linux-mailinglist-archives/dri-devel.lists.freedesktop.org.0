Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EBB4234FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 02:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B19A6E4AD;
	Wed,  6 Oct 2021 00:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA246E4A5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 00:29:46 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so1021351otb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
 b=eILFxHdQkwHM2kDcZ7UcWGBVC7H2Pu2GtoXIw+Mf1tmpqUPjk0FxN9egL2wcdGHjmQ
 +TKV21OleaafcJGX/LlBIYkxSSU6MkgB7ayxOOdJpYOdNbeXmMUXrv6DIdkyfT7ip8yV
 xevbRV4FwvKdg7BuJcnjAihYLxXU3fqbBhPIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
 b=rFRLtR3EfMVfV4M7f/kcTESHAUzWzXaVqeVw/3yFSAvymORr5LPkNl2kuRGriUYuHF
 d8J60AncSmYUuXlcN3iSPJ6lpzYcWYhSb9/Nv5YLolOCq50FAVXr3l6Gw9Jp2tgmITQW
 s2Eax3JTXoSfezQhVUdQqacxYZhuyo4Doa47KgFZmKESlCs1Qi9ED9CrxXf2ZpyXMSao
 1gpQQBcqWWVsGi1bK0od9gocNkaQxfXIggV77S35ZlFPnPRvELXYtY9XMYELSCmwa31R
 Sj0cu1nXZPr3/8Kewc+pFUn4vMSre43bmsbHZcyDcrsh6kl6S9VjOPG4pkG4dfxnZCKa
 nLwQ==
X-Gm-Message-State: AOAM532DEIFGIMHvOEnEghXQ2IVgi0VLsBXpvbzfJDgQkZj+7yE2FGAa
 JuNZoCCPieLCQJD/pLaOw18AAWqzMLWaWw13QG9YhA==
X-Google-Smtp-Source: ABdhPJxzCxjnxno+e1ko51qFrcaIW6A2GioGxAa2xz6r8QTE5XFA3HZvXeCGDv6WRirQFECvcUk6zhmJwJvvexsKQPo=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr16724345ote.77.1633480185918; 
 Tue, 05 Oct 2021 17:29:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:29:45 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:29:45 -0700
Message-ID: <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per
 controller
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
>
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - New patch
> - Extended msm_dp_config with connector_type, wrapped in inner struct
> - Refactored out of the next patch
> - Pass the connector_type to drm_connector_init(), from yet another patch
> - Dropped double newline and unnecessary {}

BTW, I see that we check for the connector type in debugfs.

$ git grep DRM_MODE_CONNECTOR_DisplayPort -- drivers/gpu/drm/msm/dp/
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)

So do those need to be updated to handle either connector type?
