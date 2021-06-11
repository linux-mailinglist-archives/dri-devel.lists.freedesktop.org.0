Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53D3A4992
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 21:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30F66F3CB;
	Fri, 11 Jun 2021 19:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A4E6F3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 19:45:09 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id a15so3461106qtx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 12:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+zltXrlokDR6aEz3MSD5AaZ+/B1A6IvYPaBHs/lMpI=;
 b=PC510Bg8QJ7pOM5BN87EP8x/PnrQVXe+tYw1foUULzDf34lC0QcVW3OJNJACp7r3Um
 rP+Ng/TqdYE2Ty/h1cgenY+sh23jadqmO5rojNF0/moYsj2n1HYpXaDZ++5GPL3kXa0z
 +vPJRPPH5kxozmZv0wICET+dNRpxJ6ye6RIAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+zltXrlokDR6aEz3MSD5AaZ+/B1A6IvYPaBHs/lMpI=;
 b=jN3nb9iYl48S/TJ2ZcRWknRaXaRJ/wXfjc89+jW+wnnuA4xYfhvAGtxzxz+suqh4w3
 eM9ODTFEKN5QyHD3iWu/QvZA5J4cLNncpqDT520/tdyjpOq+pdPww5w8pgZmnkUMOQT1
 TADYP3rf7xaaylLn0HlnDDO3oQU8Z4j2DwboWMp91dD0u5TZiKJ49WrQ2O3HTjLRAn4g
 QxmfmmsIg5v95KoQO4z0Mmt6wfyTxWH9qugnFv1E10cCO6pRtZrDn+yilJA9Iwg7bTM5
 t7rE8l+yfX7ywnDOVLXEGAgFDO5XiVVv2iFD3wwOvGF4HzC7pKhx+ve56Ty//bQ1QDr3
 oaUw==
X-Gm-Message-State: AOAM532d5/LEI3XxinN8NBI9pltrdqTDY4Wb/L+EnS4ftN1fz4GBPrvr
 Y733CC3jPis37+hBxU2JJxAR8jhjzV6/Pg==
X-Google-Smtp-Source: ABdhPJzoH6DF6g9tIeOh9y296YVd69j9XwFa5ULVP6WhNX0eIENpTZEINrtL9/ueLraKrerjx3BLcQ==
X-Received: by 2002:ac8:1008:: with SMTP id z8mr5234542qti.232.1623440708171; 
 Fri, 11 Jun 2021 12:45:08 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id z3sm5125552qkj.40.2021.06.11.12.45.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 12:45:08 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id g38so5848225ybi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 12:45:07 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr7635962ybk.79.1623440288458;
 Fri, 11 Jun 2021 12:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210611171747.1263039-1-dianders@chromium.org>
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Jun 2021 12:37:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTsCvrudDgS2_kX-9e3v+fXVu0yDfzVV+On2_5=JT4=A@mail.gmail.com>
Message-ID: <CAD=FV=XTsCvrudDgS2_kX-9e3v+fXVu0yDfzVV+On2_5=JT4=A@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Sandeep Panda <spanda@codeaurora.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 11, 2021 at 10:18 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The primary goal of this series is to try to properly fix EDID reading
> for eDP panels using the ti-sn65dsi86 bridge.
>
> Previously we had a patch that added EDID reading but it turned out
> not to work at bootup. This caused some extra churn at bootup as we
> tried (and failed) to read the EDID several times and also ended up
> forcing us to use the hardcoded mode at boot. With this patch series I
> believe EDID reading is reliable at boot now and we never use the
> hardcoded mode.
>
> High level note: in this series the EDID reading is driven by the
> panel driver, not by the bridge chip driver. I believe this makes a
> reasonable amount of sense since the panel driver already _could_
> drive reading the EDID if provided with the DDC bus and in future
> planned work we'll want to give the panel driver the DDC bus (to make
> decisions based on EDID) and the AUX bus (to control the
> backlight). There are also planned patches from Laurent to make
> ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
> chip will still be in charge of reading the EDID, but it's not hard to
> make this dynamic.
>
> This series is the logical successor to the 3-part series containing
> the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
> if refclk") [1].
>
> This patch was tested against drm-misc-next commit f42498705965
> ("drm/panfrost: Fix missing clk_disable_unprepare() on error in
> panfrost_clk_init()") on a sc7180-trogdor-lazor device.
>
> At v10 now, this is ready to land and I plan to commit it shortly. All
> patches have reviews and Laurent has said over IRC he doesn't object
> it it landing.

I've pushed this to drm-misc-next. I know it's only been a few hours
since I posted it to the lists, but it's the same as v9 that's been
sitting there for a while, except for checking the result of kazalloc
that Lyude noticed (thanks!). I'm not aware of anyone else planning to
add reviews and presume that if they were going to speak up they'd
have done it by now.

While landing, the "dim" tools pointed out two whitespace issues in
patch #4 which I fixed while applying.

Thanks to everyone for all the reviews and help in getting this
whipped into shape!

-Doug
