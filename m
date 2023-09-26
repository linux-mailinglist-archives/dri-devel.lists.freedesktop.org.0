Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818587AEE4D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDB10E3ED;
	Tue, 26 Sep 2023 14:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C23210E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:02:15 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so138568121fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695736933; x=1696341733;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
 b=OdgAJ2R/YflxQwI6mj6ShkLtOqppyepen6x7MrCpyKnHMKlbCNAXH7JFStVn2qAF5h
 ArFNO1DYoEcTklGX+KqkjwMVSxNFShH/WXPz8VFVhV/Ah1xanv4A78P5PVp6u4OaeU0J
 hf4+GSTGq0hNn0cxAq0Qba83u81/iJWKJtqEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695736933; x=1696341733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
 b=mJwLSgVTo08C8s1arDSpbfSVHEXi0xJXWWbgmSheS3cD+CWdoIzuf7Yup9EdVS25zm
 qNtxkXhsc01gCkqqLmdUDroZrOG+eWWD7SnIqP6kObPPDKR9/rG6c/R/nN+6Lhr2qkjR
 v2jn0GoCdnbJWa5KPmhcaRVzC4Nm5CTRtcYyiPUwmqCf+20YegVEGaSZ0vPvsSahTVUL
 Rs2lIYG1PwG83e7U0B77yoZAjxjswShBOP2b/MD9LP+cd2f9YamW8fMEATtJ4Cvq3UOF
 lAagLwZ2S/o9G/hC+TKHwu1nd1ayyNfUqj38aC9dBZ2KNlbWT/7OMU8s17oOfFLog8/Q
 P4Qw==
X-Gm-Message-State: AOJu0Yy+jHVm9Z3SoPheLGD/ErVmZVPiNbgeBmeWt3jrYxdTAFdOywhy
 s4A4lsG94cuD8G49KreUsk303tHfc9IlSIfo9L3SxX3N
X-Google-Smtp-Source: AGHT+IEHD3twA7mJBrQvrg6Cy5dD3YwTKPrb2LiCGv0NjCyJw6y+Cu0GzDLgHzKOKUcz1xHeJOxLpw==
X-Received: by 2002:a2e:9ad0:0:b0:2c0:da8:39e4 with SMTP id
 p16-20020a2e9ad0000000b002c00da839e4mr9354030ljj.43.1695736933279; 
 Tue, 26 Sep 2023 07:02:13 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 y14-20020a2e7d0e000000b002c123b976acsm2635282ljc.76.2023.09.26.07.02.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 07:02:13 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50302e8fca8so5894e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:02:12 -0700 (PDT)
X-Received: by 2002:ac2:548e:0:b0:501:a2b4:8ff5 with SMTP id
 t14-20020ac2548e000000b00501a2b48ff5mr54282lfk.7.1695736932511; Tue, 26 Sep
 2023 07:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
In-Reply-To: <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Sep 2023 07:01:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to
 panel-simple
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 jitao.shi@mediatek.com, neil.armstrong@linaro.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 matthias.bgg@gmail.com, quic_jesszhan@quicinc.com,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > panel-simple") I moved a pile of panels out of panel-simple driver
> > into the newly created panel-edp driver. One of those panels, however,
> > shouldn't have been moved.
> >
> > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > panel is hooked up with LVDS. Furthermore, searching for datasheets I
> > found one that makes it clear that this panel is LVDS.
> >
> > As far as I can tell, I got confused because in commit 88d3457ceb82
> > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> > downstream ChromeOS trees, it seems like some Mediatek boards are
> > using a panel that they call "auo,b116xw03" that's an eDP panel. The
> > best I can guess is that they actually have a different panel that has
> > similar timing. If so then the proper panel should be used or they
> > should switch to the generic "edp-panel" compatible.
> >
> > When moving this back to panel-edp, I wasn't sure what to use for
> > .bus_flags and .bus_format and whether to add the extra "enable" delay
> > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > backlight when power on"). I've added formats/flags/delays based on my
> > (inexpert) analysis of the datasheet. These are untested.
> >
> > NOTE: if/when this is backported to stable, we might run into some
> > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > jacuzzi: Move panel under aux-bus") this panel was used by
> > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > know what to suggest for that other than someone making up a bogus
> > panel for jacuzzi that's just for the stable channel.
> >
> > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when=
 power on")
> > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simp=
le")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I haven't had a snow or peach-pit hooked up for debugging / testing
> > for years. I presume that they must be broken and hope that this fixes
> > them.
>
> We could avoid backport breakages by avoiding to backport this to any ker=
nel
> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi: M=
ove
> panel under aux-bus")... because creating a dummy panel to get two wrongs
> right is definitely not ok.

Sure, except that leaves us with ... a breakage. :-P

Although I haven't tested it, I have a hard time believing that
exynos5250-snow and exynos5420-peach-pit will work properly with the
panel defined as an eDP panel. That means that they will be broken. If
someone cared to get those fixed in a stable backport then we'd be
stuck deciding who to break. If you have any brilliant ideas then I'm
all ears.

...then again, I presume this has been broken since commit
88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
things still limp along and sorta work even though the panel is
defined incorrectly?

-Doug
