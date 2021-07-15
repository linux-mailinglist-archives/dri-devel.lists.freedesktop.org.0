Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4973CA11C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 17:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E56E81A;
	Thu, 15 Jul 2021 15:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4396E81A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:05:44 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id s193so5469493qke.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R9XBHwcIdHUxNKVM4wGK0XBk/N9gC6lff9eNP3xp8WY=;
 b=IKakzWP6ML7xBuxkG8r1AUGroQm9EkS34wWZtZi/qPupZNGIx9Y50ImRtszCPvWqtr
 HNjpoZK6U443+FrGhIV7rvo6yEkYmgj+lOu+n4Seg+Rax7o+RsJQYfea7pHvYpi9HS8j
 jvjFt64ikbioYi8gqiKhjGSP3tvZTy10B8AUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R9XBHwcIdHUxNKVM4wGK0XBk/N9gC6lff9eNP3xp8WY=;
 b=ix8fCkmvWI59EEnx2sPEurT4w2krGsT4drYDmbx0Jgs8PTbA3sYXpry9Awwikt/xJh
 DQMo5lSd28AuKBdJpjdPiBEYUILtMaBnHnXIKmgF0r1pgSb4PHysneVyDDNHT0VWGiEA
 jSpOKP7nmwiBoI1l7MLGD69hHOzAgB3qBnNuun8GGJkPfrRYAkgckMPUuVAe3iEBycI0
 UBhOPAJD/SnDatT/lPHqZsFzCAK6wrv0oYQ+2r+XmYhCK+CbO5C5ktGOeJAHW87ug4x+
 NJRIm1ARltJ2mZ1d7LqiZBzPFaFFp95VjhyS8Tw44lO1PxplDB7Aq4jFWZ5Hoa2I5tbX
 rMfA==
X-Gm-Message-State: AOAM531O7bm8pPhjTnhkoD3b71iikEn/jW2EfTHTwUQn398b0mkwQa4m
 J0Eyw1LeNswLYBZUAMLvZMUM85+cV1nhBg==
X-Google-Smtp-Source: ABdhPJyxE2ZZwHIWZwFbEPdnMmGA1k7RL2shKqtICriC7mZrT0DjJvI2T/Xx7zUbKBfFH/d/eAguTQ==
X-Received: by 2002:ae9:ddc4:: with SMTP id r187mr4713181qkf.198.1626361543620; 
 Thu, 15 Jul 2021 08:05:43 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id i123sm962348qkf.60.2021.07.15.08.05.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:05:43 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id r132so9614919yba.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:05:42 -0700 (PDT)
X-Received: by 2002:a05:6902:521:: with SMTP id
 y1mr6092923ybs.32.1626361542520; 
 Thu, 15 Jul 2021 08:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid>
In-Reply-To: <20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jul 2021 08:05:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULfkbw08xH7D1K2HvpiYzQCGFT8oqVAOnpTcdmRTGC3g@mail.gmail.com>
Message-ID: <CAD=FV=ULfkbw08xH7D1K2HvpiYzQCGFT8oqVAOnpTcdmRTGC3g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: Power the panel when probing DP AUX
 backlight
To: Rajeev Nandan <rajeevny@codeaurora.org>, Lyude Paul <lyude@redhat.com>, 
 Robert Foss <robert.foss@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 14, 2021 at 9:34 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> When I tried booting up a device that needed the DP AUX backlight, I
> found an error in the logs:
>   panel-simple-dp-aux: probe of aux-ti_sn65dsi86.aux.0 failed with error -110
>
> The aux transfers were failing because the panel wasn't powered. Just
> like when reading the EDID we need to power the panel when trying to
> talk to it. Add the needed pm_runtime calls.
>
> After I do this I can successfully probe the panel and adjust the
> backlight on my board.
>
> Fixes: bfd451403d70 ("drm/panel-simple: Support DP AUX backlight")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-simple.c | 3 +++
>  1 file changed, 3 insertions(+)

Pushed with Lyude's review to drm-misc-next:

5ead9b5b1575 drm/panel-simple: Power the panel when probing DP AUX backlight
