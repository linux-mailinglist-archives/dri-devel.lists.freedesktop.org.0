Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F357276438
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 00:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D66EA11;
	Wed, 23 Sep 2020 22:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6876EA11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 22:55:41 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id c63so418071vkb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vlysOyKJkFmadKzqukaQyhHtYSz6cPklZSFksdyIyRg=;
 b=UT6OKO8QO/bCPpV2cyrz5jV7YLF30uiPhGO4zqV3EYySmxbmK3iExKdq2ppzKoAosx
 P8zhEflR6m7/WxBgbMx7L1m+yryJ9p3jL9DImYYnocNB6BEeercvuVcMlAGYUzCimYhH
 fnjXsD5Xs91goRkoT2EN6129Lckn/P+hv96Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlysOyKJkFmadKzqukaQyhHtYSz6cPklZSFksdyIyRg=;
 b=lU1xSUIaanUnVqaapho1k86IawLuA7u5B2Y3BgKGxi6B5Itd8ndiedPeocg4Q2PbBo
 akPUZLVT2X4E1hVKBxGRgZ/W9bAPpmioaJCTbgFI3eZ+yEdZtezxnkq5x7XKcQ4CBaMp
 vW6WB9JvC4Y5Auo5cTwtJMb7h81NSsOMS/tUTz910L2Hua3EuQ/3Ve/f+qdPpzCz5ZuH
 SxOUhkkmsi5TdMvqmPnYvZUtHnbFDWPtY2k2VSqReSFX823H9KWudtmNEyf1w+KQVjIb
 /fOEFkGRQ9AqYqjD03eUzn9eMh+RPX4Jk8aN8ExNfgIP7soFI7CaE2QpRegjQ3QbBlPH
 5eMg==
X-Gm-Message-State: AOAM5328ZOEdLg1RLgg7YI4qFfD+Z1vxukpc2DBkh6xoZlCkeJ8fAFtc
 89sl5ntpPUzADH86Gpfi//PuBor6gOw/4w==
X-Google-Smtp-Source: ABdhPJzvSG/VA6FQWd46+LVOWKoRR6mmrhETxdwsJYfk1RQlOOINwP7FgI0yTHz24STqsLiK9BuDpA==
X-Received: by 2002:a1f:3144:: with SMTP id x65mr2172428vkx.3.1600901740640;
 Wed, 23 Sep 2020 15:55:40 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id l134sm198125vkl.55.2020.09.23.15.55.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 15:55:39 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id e23so984932vsk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:55:39 -0700 (PDT)
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr2079101vsl.34.1600901739443; 
 Wed, 23 Sep 2020 15:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200922203107.2932-1-vicencb@gmail.com>
 <20200922203107.2932-2-vicencb@gmail.com>
In-Reply-To: <20200922203107.2932-2-vicencb@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Sep 2020 15:55:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wjd-OCdR1-vpiApFPnJbSbfQdv88kbAhHaQLLM71a2gg@mail.gmail.com>
Message-ID: <CAD=FV=Wjd-OCdR1-vpiApFPnJbSbfQdv88kbAhHaQLLM71a2gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: rockchip: hdmi: fix clock rounding code
To: Vicente Bergas <vicencb@gmail.com>
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
Cc: crj <algea.cao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 22, 2020 at 1:31 PM Vicente Bergas <vicencb@gmail.com> wrote:
>
> Under certain conditions vop_crtc_mode_fixup rounds the clock
> 148500000 to 148501000 which leads to the following error:
> dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 148501000)
>
> The issue was found on RK3399 booting with u-boot. U-boot configures the
> display at 2560x1440 and then linux comes up with a black screen.
> A workaround was to un-plug and re-plug the HDMI display.
>
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

My rk3288-veyron-minnie is stuck at work (but not plugged in) and it's
Covid times, so I can't easily test this.  ...but it looks fine to me
and makes things more symmetric / clean.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
