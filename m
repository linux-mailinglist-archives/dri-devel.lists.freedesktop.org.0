Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE940EBBB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 22:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EBB6E82C;
	Thu, 16 Sep 2021 20:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260776E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:34:13 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id a15so9483674iot.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKdGoRFVr/xOsqOTZ1eLQM7yw4i7V3khOzi95TcJgnE=;
 b=Y8WZDaV2hz12Ge0wgPOBJjF6T4Td5Az39tBFIdOpOhIVzjqm1qPE/JxsIZDXPqezXY
 vDWotK4/xR8U0uIBLb4IUlJKX1ko5gsroVuu574Vzi8v3YcLtDgBZNz/e6oV08JME6Vb
 /3wIMOUcp+AlNR7SpCdXdYMoLFlkOIDDYXNic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKdGoRFVr/xOsqOTZ1eLQM7yw4i7V3khOzi95TcJgnE=;
 b=f9WTQ3F11LkAfkARMai2jogl2tzxkOKw8+my/oLn2rjbz0ag5gMD9VL7Gz1F0VF3tD
 QPRTC6FMh1zREZagp2LMGhM2Cw5WnxROyIlZdV61B19i08v8/qZHL98XZxZ9FxoNXSe1
 lJqgme5h9m7df1E2S/QbMY/NoQ/q7O4+7OeXY7+vFC4OepxJwYR4ywTb8cpHrbgcI88i
 LU42IuKQ3foBsR4uHgl97/0QsDWa64UEfrWKGkFWaN8Gjsw4DCjJlKCoBFuGZcTJAhcE
 AGnaoumeQR09t7t8QTpXHDZ4Q//B9HZd0nTeFvunM0rT5aYrNvPSiOKtjrTzwill+ZgI
 vTiA==
X-Gm-Message-State: AOAM530CptvXnrzlVLh+lKNAHo34ue26KNcAeotM56ATsf958BMqmevs
 XCYoqZ2/LH/ICHHOYx9YyLivqLsLmGJ49w==
X-Google-Smtp-Source: ABdhPJwj5nAQXjvzv78jv2/9u8UbYDTFuZ8QqLtDAkaJyEW1W3yolKmyxuLzUBFni/1MX2kSnSD9Cg==
X-Received: by 2002:a02:77c4:: with SMTP id g187mr4364486jac.56.1631824452005; 
 Thu, 16 Sep 2021 13:34:12 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id q11sm2291672ilg.85.2021.09.16.13.34.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 13:34:11 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id d11so4019378ilc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:34:11 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr3106011ili.142.1631824451177; 
 Thu, 16 Sep 2021 13:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210916202907.18394-1-macroalpha82@gmail.com>
In-Reply-To: <20210916202907.18394-1-macroalpha82@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Sep 2021 13:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBNbFyiy45toCV44rJmT2ZrTbf-bbOrXVJG2ri6bnakw@mail.gmail.com>
Message-ID: <CAD=FV=VBNbFyiy45toCV44rJmT2ZrTbf-bbOrXVJG2ri6bnakw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/rockchip: Update crtc fixup to account for
 fractional clk change
To: Chris Morgan <macroalpha82@gmail.com>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, Chris Morgan <macromorgan@hotmail.com>
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

Hi,

On Thu, Sep 16, 2021 at 1:29 PM Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> After commit 928f9e268611 ("clk: fractional-divider: Hide
> clk_fractional_divider_ops from wide audience") was merged it appears
> that the DSI panel on my Odroid Go Advance stopped working. Upon closer
> examination of the problem, it looks like it was the fixup in the
> rockchip_drm_vop.c file was causing the issue. The changes made to the
> clk driver appear to change some assumptions made in the fixup.
>
> After debugging the working 5.14 kernel and the no-longer working
> 5.15 kernel, it looks like this was broken all along but still
> worked, whereas after the fractional clock change it stopped
> working despite the issue (it went from sort-of broken to very broken).
>
> In the 5.14 kernel the dclk_vopb_frac was being requested to be set to
> 17000999 on my board. The clock driver was taking the value of the
> parent clock and attempting to divide the requested value from it
> (17000000/17000999 = 0), then subtracting 1 from it (making it -1),
> and running it through fls_long to get 64. It would then subtract
> the value of fd->mwidth from it to get 48, and then bit shift
> 17000999 to the left by 48, coming up with a very large number of
> 7649082492112076800. This resulted in a numerator of 65535 and a
> denominator of 1 from the clk driver. The driver seemingly would
> try again and get a correct 1:1 value later, and then move on.
>
> Output from my 5.14 kernel (with some printfs for good measure):
> [    2.830066] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
> [    2.839431] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
> [    2.855980] Clock is dclk_vopb_frac
> [    2.856004] Scale 64, Rate 7649082492112076800, Oldrate 17000999, Parent Rate 17000000, Best Numerator 65535, Best Denominator 1, fd->mwidth 16
> [    2.903529] Clock is dclk_vopb_frac
> [    2.903556] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
> [    2.903579] Clock is dclk_vopb_frac
> [    2.903583] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
>
> Contrast this with 5.15 after the clk change where the rate of 17000999
> was getting passed and resulted in numerators/denomiators of 17001/
> 17000.
>
> Output from my 5.15 kernel (with some printfs added for good measure):
> [    2.817571] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
> [    2.826975] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
> [    2.843430] Rate 17000999, Parent Rate 17000000, Best Numerator 17018, Best Denominator 17017
> [    2.891073] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
> [    2.891269] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
> [    2.891281] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
>
> I have tested the change extensively on my Odroid Go Advance (Rockchip
> RK3326) and it appears to work well. However, this change will affect
> all Rockchip SoCs that use this driver so I believe further testing
> is warranted. Please note that without this change I can confirm
> at least all PX30s with DSI panels will stop working with the 5.15
> kernel.
>
> Upon advice from Doug Anderson <dianders@chromium.org> it was decided
> that we would first check if the clock rate can be set exactly as
> requested, and only if it could not would we then add 999 to it and
> attempt the process again. This way we can preserve the behavior for
> clocks that still need it while resolving the specific issue for the
> PX30 and DSI panels (since it is using a fractional clock).
>
> Changes since v2:
>  - Moved fixes to correct location.
>
> Changes since v1:
>  - Made the addition of 999 conditional based on whether the clock
>    subsystem can set the actual clock rate as requested.
>  - Updated the notes in the fixup routine to reflect this new behavior.
>  - Added reference to original commit, as this has technically been
>    broken since then however only now is it an issue due to the clock
>    changes.
>
> Fixes: 287422a95fe2 ("drm/rockchip: Round up _before_ giving to the clock framework")
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Not worth making a v4 since it can be fixed when applying, but
normally there is no blank line between the "Fixes" and
"Signed-off-by" lines.

Also, for trivial small fixes like this you're expected to carry
forward reviews to the next versions. Here I'll re-add it for you,
though:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
