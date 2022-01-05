Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A777485992
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 20:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBD210E19A;
	Wed,  5 Jan 2022 19:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1510E19A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 19:55:29 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s127so564279oig.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JlPJsMW5yVPe7P3RKOvMwPlqeJN1/Nu2FfKIApHsgbo=;
 b=DwPxC3cLLNM8XVTzd55gQ7bhxNML705Ttl/ErwNTDEyJwlW4XJMuoiodES7QQ//mSL
 NqvSpNl3q6yIa44pWFb8gv6RfQh9JDnxYAV18DuYJc10XKzkRm4oMwtHC9HPCapN6hMm
 iqc0/E4iLeL6kOCUEBwGPMA/dnUvUs7BdnY/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JlPJsMW5yVPe7P3RKOvMwPlqeJN1/Nu2FfKIApHsgbo=;
 b=KRr6Cqyb9Ifd2AdMck0oMLcik7qGkgvNWatwFm+EEQDXvLOWLjKR/s0xzoQJwgfTlT
 SaEcuwCVuCul3BjJhWrTmx+z/43ieNt4zHY76puH4IcbwwFBrbxifNhaYyOsa2VQ2eQq
 IE9DOp0QDOTyju2R8DJMEWI9d+n/Zq4BuOXPrbBiohTUA2IDkU+2F3aXxuBX5OhqhosV
 h+1vOReKk40QHDZPwurTF0cWTD0s9L1hYMcfRnc1T3xhF0V0Giw8u4VAQikw4zJCwV/R
 K+JeGdTbOp9BF6kR+0wQqU0ba4KKj8HQKplwNREOSjeND2TVDnWX3kc+ufuFVkNIvV4N
 mYKw==
X-Gm-Message-State: AOAM531XPzSBu0pDIGO9167QYfEkSWXBEL+0YlPA0OczGCS7rt6ICWWS
 mRZVbhYLHs0A6uxjkIzOIORjOF/nkoTXag==
X-Google-Smtp-Source: ABdhPJwAF8V0SHXDOg74NfwC98bgFdShfm3nzIlYmAezTdi1F+QYuaUeJfRbQV5639lcIZHANUAIng==
X-Received: by 2002:aca:1214:: with SMTP id 20mr2229610ois.126.1641412528477; 
 Wed, 05 Jan 2022 11:55:28 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175])
 by smtp.gmail.com with ESMTPSA id z24sm7951856oti.32.2022.01.05.11.55.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 11:55:27 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id be32so498565oib.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 11:55:27 -0800 (PST)
X-Received: by 2002:a05:6808:3097:: with SMTP id
 bl23mr3823157oib.77.1641412527103; 
 Wed, 05 Jan 2022 11:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
In-Reply-To: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 5 Jan 2022 11:55:05 -0800
X-Gmail-Original-Message-ID: <CA+ASDXOEv3xigBaEwtYcGM7Q9uNHrwijoWTHoiLg--UT=vA7TA@mail.gmail.com>
Message-ID: <CA+ASDXOEv3xigBaEwtYcGM7Q9uNHrwijoWTHoiLg--UT=vA7TA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(updating Andrzej's email)

On Fri, Oct 1, 2021 at 2:50 PM Brian Norris <briannorris@chromium.org> wrote:
> If the display is not enable()d, then we aren't holding a runtime PM
> reference here. Thus, it's easy to accidentally cause a hang, if user
> space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
>
> Let's get the panel and PM state right before trying to talk AUX.
>
> Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
> Cc: <stable@vger.kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
> - Fix spelling in Subject
> - DRM_DEV_ERROR() -> drm_err()
> - Propagate errors from un-analogix_dp_prepare_panel()
>
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Ping? Do I need to do anything more here?

Thanks,
Brian
