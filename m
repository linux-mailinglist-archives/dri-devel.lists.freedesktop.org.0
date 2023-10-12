Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D357C735B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 18:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7507F10E503;
	Thu, 12 Oct 2023 16:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6091710E503
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 16:45:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso208137166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697129123; x=1697733923;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB7Wf5LgsYf36+k+zhs9TduHabjcJcCiXT3QAGky0tQ=;
 b=FbrLah/HCZXxBf+vuPb5jWJC2dip/r1I5uAN4jdlDRXFXIAlcXjaWQ7y2Hgplbi/p2
 ifZcuJiLlec8sLmJc3ldY2WK1+JwoML3/p46FCAtgNVPYzDGDO5jOHOJP/LPKtrCZ31z
 TgyZyKZfgzN7TnMNTpNw4K8Lt/Lucm/QvyAoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129123; x=1697733923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB7Wf5LgsYf36+k+zhs9TduHabjcJcCiXT3QAGky0tQ=;
 b=SyoEfZMd5OeyOqtsvr6F7Coy9RwnVieIU9oC0zH12R7CBQCEi5JlfENZSmtkPaBA0J
 jHiImTt6N5M1heKpgj1PgsAWunfxQKg+4r7nmZRZZ2MSaIwPYikJOJ6Fv0gBz4RSvPHU
 vYdkrgtZ3W5DIe2qbzDYT+XCz93kg2T33m/5LUZzSYN+9O6nA/LPqkg8BSFM2sHaxevO
 33ogSwObKbP3ijmPRYUEgOpiLIZPox/chJujJ686sDgqIKBpqso92To1iK3pEb7RMscq
 XTyCpSnOpwZGXY+9IWTHDF+A9jicicJjzUUf27NqEO+7u6nsIyuJIBdTj9PMtmrlwd1K
 gPBQ==
X-Gm-Message-State: AOJu0YwHdTK9v8uAHyKFy1jElHFoztqKRgb8NGwZeDaAiO5Tr/xunoOp
 8rRjEhy888P8xhh3YTIF+LstubYuKya8gttQFDLzuQ==
X-Google-Smtp-Source: AGHT+IG0g8mqVk6FomGyPdnGIwNHYqRQzCacVvUWvMFP/CXUrWc091Zb38xxnRrezbo68PmEAkH0AQ==
X-Received: by 2002:a17:906:53c8:b0:9ae:522e:8f78 with SMTP id
 p8-20020a17090653c800b009ae522e8f78mr20316814ejo.74.1697129122792; 
 Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 cd16-20020a170906b35000b00991faf3810esm11408255ejb.146.2023.10.12.09.45.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so325e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
X-Received: by 2002:a05:600c:3c96:b0:3f6:f4b:d4a6 with SMTP id
 bg22-20020a05600c3c9600b003f60f4bd4a6mr262956wmb.7.1697129121865; Thu, 12 Oct
 2023 09:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
 <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
 <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
 <c3380c97-1b8c-5a68-168e-fc6150701365@postmarketos.org>
In-Reply-To: <c3380c97-1b8c-5a68-168e-fc6150701365@postmarketos.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Oct 2023 09:45:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WAYYv5h6oWWhEJHyZesE5cguBqVufCmK6s4gvMeNkCWg@mail.gmail.com>
Message-ID: <CAD=FV=WAYYv5h6oWWhEJHyZesE5cguBqVufCmK6s4gvMeNkCWg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to
 panel-simple
To: Anton Bambura <jenneron@postmarketos.org>
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
 jitao.shi@mediatek.com, Anton Bambura <jenneron@protonmail.com>,
 neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com,
 quic_jesszhan@quicinc.com, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Oct 8, 2023 at 1:52=E2=80=AFPM Anton Bambura <jenneron@postmarketos=
.org> wrote:
>
>
> On 10/5/23 21:10, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> >> Hi,
> >>
> >> On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>> Il 26/09/23 00:00, Douglas Anderson ha scritto:
> >>>> In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> >>>> panel-simple") I moved a pile of panels out of panel-simple driver
> >>>> into the newly created panel-edp driver. One of those panels, howeve=
r,
> >>>> shouldn't have been moved.
> >>>>
> >>>> As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> >>>> B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used i=
n
> >>>> exynos5250-snow and exynos5420-peach-pit where it's clear that the
> >>>> panel is hooked up with LVDS. Furthermore, searching for datasheets =
I
> >>>> found one that makes it clear that this panel is LVDS.
> >>>>
> >>>> As far as I can tell, I got confused because in commit 88d3457ceb82
> >>>> ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> >>>> Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> >>>> downstream ChromeOS trees, it seems like some Mediatek boards are
> >>>> using a panel that they call "auo,b116xw03" that's an eDP panel. The
> >>>> best I can guess is that they actually have a different panel that h=
as
> >>>> similar timing. If so then the proper panel should be used or they
> >>>> should switch to the generic "edp-panel" compatible.
> >>>>
> >>>> When moving this back to panel-edp, I wasn't sure what to use for
> >>>> .bus_flags and .bus_format and whether to add the extra "enable" del=
ay
> >>>> from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> >>>> backlight when power on"). I've added formats/flags/delays based on =
my
> >>>> (inexpert) analysis of the datasheet. These are untested.
> >>>>
> >>>> NOTE: if/when this is backported to stable, we might run into some
> >>>> trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> >>>> jacuzzi: Move panel under aux-bus") this panel was used by
> >>>> "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> >>>> know what to suggest for that other than someone making up a bogus
> >>>> panel for jacuzzi that's just for the stable channel.
> >>>>
> >>>> Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight w=
hen power on")
> >>>> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-s=
imple")
> >>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>> ---
> >>>> I haven't had a snow or peach-pit hooked up for debugging / testing
> >>>> for years. I presume that they must be broken and hope that this fix=
es
> >>>> them.
> >>> We could avoid backport breakages by avoiding to backport this to any=
 kernel
> >>> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzz=
i: Move
> >>> panel under aux-bus")... because creating a dummy panel to get two wr=
ongs
> >>> right is definitely not ok.
> >> Sure, except that leaves us with ... a breakage. :-P
> >>
> >> Although I haven't tested it, I have a hard time believing that
> >> exynos5250-snow and exynos5420-peach-pit will work properly with the
> >> panel defined as an eDP panel. That means that they will be broken. If
> >> someone cared to get those fixed in a stable backport then we'd be
> >> stuck deciding who to break. If you have any brilliant ideas then I'm
> >> all ears.
> >>
> >> ...then again, I presume this has been broken since commit
> >> 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> >> on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> >> things still limp along and sorta work even though the panel is
> >> defined incorrectly?
> > I dug out a exynos5250-snow out of my pile and booted postmarket OS on
> > it, which was shockingly easy/pleasant (kudos to those involved!). I
> > found that it was booting a kernel based on 6.1.24. Digging into
> > sysfs, I found that indeed it appeared to be using the "panel-edp"
> > driver, so I guess it is limping along with the wrong driver and wrong
> > flags...
> >
> > It wasn't totally clear for me how to build a new kernel and deploy it
> > for postmarket OS, so I wasn't able to confirm this change. I've CCed
> > the person listed on the postmarket OS wiki though to see if they have
> > any insight.
> Tested it on peach-pit using linux-next with this patch applied. Panel
> still works and "dmesg | grep panel" returns panel_simple instead of
> panel_edp.
>
> Tested-by: Anton Bambura <jenneron@postmarketos.org>

Pushed to drm-misc-fixes:

ad3e33fe071d drm/panel: Move AUX B116XW03 out of panel-edp back to panel-si=
mple

-Doug
