Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B720A43E853
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 20:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F8B6E99F;
	Thu, 28 Oct 2021 18:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE896E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:27:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id n67so9347256iod.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+G6CdJ3zT0nfkzpCxbjyGyIXPvxmC0KG1xFQgJK82Go=;
 b=gej7DeSlFNmwR+cz6LTfAGp06TY2sDf6NZOIOME9jn3HgYQhzy9SFGbRebGw8lfvGI
 oxjFP3vHtgrPiLdUZgPnJiNk6N8URKVTiHRioJhz7pLc/+R9kAOtqHO8VKUG/2jVvrf3
 POI2t4wjgtRL0WeCYTQwN0KmnspDjRtMrsScU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+G6CdJ3zT0nfkzpCxbjyGyIXPvxmC0KG1xFQgJK82Go=;
 b=Hu8KK2BtmseMeYqxa3Gou/J2g4lhJma1jCFhNQ6dfkdvdbLzwGOpHx7h7oZ7dl6niS
 YFBdokk4lPNN8jZT+p2/BzwKcl6aYRuSOBqsbUhSV4gY/72Wryf9HkAAD/BdAqqDVLaS
 ZejCzfIORrI/DsiK5LWD1P1r82maAroYzNIo+Dhxk63FUtwdEEskglVHdDlSOm+dMfIl
 LTD2hxkqK/LPM8+UVR5tMZVcZfPbD/ydRcjji65UbwP5QdJshQ/V/LgxOM2G5uRV8qBc
 u2g22Mhaxbc/N4GVgahWDBpiZqoNrIV5Q9r7qLTYsKuWGhUFZtKQVXbyE35F8AwFg1ox
 iQ1w==
X-Gm-Message-State: AOAM53370NqjMVZ1WstVtw2andtHPC2G4k1aC7rcWtFyG8XCKukVlumB
 Hap/ubLzXBUcxPsYxs5LZQ7ItXKi2UzUxw==
X-Google-Smtp-Source: ABdhPJwrN8/kaMecZCV3UFe0XFMC2agFgz/XoUfvspV3VpOzezZgTJY4Sr2Uh2EcnseLp2any1olfw==
X-Received: by 2002:a5e:c90f:: with SMTP id z15mr4029054iol.103.1635445636211; 
 Thu, 28 Oct 2021 11:27:16 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id z16sm1767765iow.42.2021.10.28.11.27.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 11:27:14 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id i12so1748488ila.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 11:27:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:: with SMTP id
 i9mr4114797ilv.142.1635445633346; 
 Thu, 28 Oct 2021 11:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211026220848.439530-1-lyude@redhat.com>
 <20211026220848.439530-4-lyude@redhat.com>
In-Reply-To: <20211026220848.439530-4-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Oct 2021 11:27:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXJA0DoCBOG+fzqv-5rYP4mWQE-HPxH9DxCVWgnuS4Dw@mail.gmail.com>
Message-ID: <CAD=FV=VXJA0DoCBOG+fzqv-5rYP4mWQE-HPxH9DxCVWgnuS4Dw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/dp: Disable unsupported features in
 DP_EDP_BACKLIGHT_MODE_SET_REGISTER
To: Lyude Paul <lyude@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Satadru Pramanik <satadru@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Oct 26, 2021 at 3:09 PM Lyude Paul <lyude@redhat.com> wrote:
>
> As it turns out, apparently some machines will actually leave additional
> backlight functionality like dynamic backlight control on before the OS
> loads. Currently we don't take care to disable unsupported features when
> writing back the backlight mode, which can lead to some rather strange
> looking behavior when adjusting the backlight.
>
> So, let's fix this by ensuring we only keep supported features enabled for
> panel backlights - which should fix some of the issues we were seeing from
> this on fi-bdw-samus.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index ada0a1ff262d..8f2032a955cf 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -3372,7 +3372,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
>                 return ret < 0 ? ret : -EIO;
>         }
>
> -       new_dpcd_buf = dpcd_buf;
> +       /* Disable any backlight functionality we don't support that might be on */
> +       new_dpcd_buf = dpcd_buf & (DP_EDP_BACKLIGHT_CONTROL_MODE_MASK |
> +                                  DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE);

My first thought when reading the above was: if we're masking so much
stuff out, why do we bother reading the old value back out at all?

I guess the two places you use the old value for are:

1. You avoid setting the "DP_EDP_PWMGEN_BIT_COUNT" if the backlight
was already configured for DPCD mode.

2. You avoid writing the register if you didn't change it.

I would actually argue that use #1 is probably a bug. If you're
worried about the firmware leaving the backlight configured in a
strange way, it could very well have left the backlight configured in
DPCD mode but set a different "bit count" than you want, right? Maybe
you should just always set the bit count?

Use #2 is fine, but does it buy you anything? Are writes to the DCPD
bus somehow more expensive than reads? ...or maybe you're expecting
that a display will glitch / act badly if you write the same value
that's already there?


So I guess my instinct here is that you should avoid reading all
together and just program the value you want.

-Doug
