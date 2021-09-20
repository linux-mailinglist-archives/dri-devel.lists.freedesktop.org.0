Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36685412822
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408D6E88D;
	Mon, 20 Sep 2021 21:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448FF6E88D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 21:38:05 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id a10so47702184qka.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0sMXVJD/qM1ZuMvbaI6gTOYJ9VpknbVlhhM0u7mejc=;
 b=dqxJA24uvAfZPUBpFHKmJEIZgdzPyGPS0Sq6uvZjU0gc6erEbkuQ4zhpwP4QD8z72u
 sw1LryOdbgCoGAlU671GWf8D56poCdkftvi5n9UVH0kydllWBUbg1UpLhPhtIlsWyTEf
 1ut3yazIIgePgREspkn/NXAfNWrUlqhMj1SEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0sMXVJD/qM1ZuMvbaI6gTOYJ9VpknbVlhhM0u7mejc=;
 b=sPFuvwCKW838himQKv4rxAKCPiRGzb0jCPs3fw7Y5AQ5qkbHAerupOQVPvD1U4v9hX
 q7PZepbFeL0yZcf+ZsoVT1hR6120jtmmz1knhIG4mxxt/8i+tPjBC1YT5a1AzeT5KQJt
 FSQKbul5j6yRUwIViF8Sub3W7UKRWI+XK/8LUlhp3aLU+O6MHPRm9N7gNvMfgaDwtPwj
 UizdsuWKidIzumSJXqgc9fouGAzn1oqf7YbX6M5wssp/LVAKGgFjjIFHVzfPAoVwjbc+
 VvzgxOotpBAvd6vC79YiX4xKcwkUM7x13ZO54srQrpYWR/dgCynAwlvIF8L3U5pK/tqA
 CliQ==
X-Gm-Message-State: AOAM530dIYWsD7GgTAfmtuaTO4Lyx7Wns3DLtPrgX0FMSIrttk5GkOiJ
 ZI1fz2pV0FdSeoD1X0R+Irxs6XRKUhzFZw8VJB//dw==
X-Google-Smtp-Source: ABdhPJyQjSb2H6udbpCD2GbTsqMT8sJOFWWkAqxky55HqdLzQrvRxx7S/aqKxyKWBV2AQNiIWArMAu4QAzyNU6Trgt8=
X-Received: by 2002:a25:2f42:: with SMTP id v63mr34378682ybv.388.1632173884292; 
 Mon, 20 Sep 2021 14:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210918102058.v5.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210918102058.v5.2.Ifcb5df5de5b1cead7c99e0f37b044ef5cfc69eda@changeid>
 <YUZMNIYbT7KL3qJR@ravnborg.org>
In-Reply-To: <YUZMNIYbT7KL3qJR@ravnborg.org>
From: Philip Chen <philipchen@chromium.org>
Date: Mon, 20 Sep 2021 14:37:53 -0700
Message-ID: <CA+cxXh=OixYPzE_ui=22seumFpKigTcK3hvNtrfN4oa0SFdtOw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi Sam,

On Sat, Sep 18, 2021 at 1:29 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Philip,
> On Sat, Sep 18, 2021 at 10:21:17AM -0700, Philip Chen wrote:
> > Implement the first version of AUX support, which will be useful as
> > we expand the driver to support varied use cases.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
>
> Patch is:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>
> please consider a few follow-up patches:
> 1) Replace deprecated drm_bridge_funcs with the _atomic_ variants.
> 2) Replace the deprecated drm_bridge_chain_pre_enable() with the atomic
>    variant.
> 3) Use pr_() and dev_() logging in favour of DRM_ logging.
>    DRM_ logging is deprecated these days and do not belong in bridge
>    drivers anyway.
>
> Maxime has a few patches pending for this driver - it would be great if
> you could look them up and review them.
> Maybe you can get some review in feedback.

Yes, I'll do.
Thanks for reviewing.

>
>         Sam
>
