Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17D7BA8EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 20:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18510E177;
	Thu,  5 Oct 2023 18:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30F110E177
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 18:19:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-536b39daec1so2255774a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696529948; x=1697134748;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eAmFswOZzw3jH3oWLXVAcDuqGgICG6iPkOHsm6WtUk=;
 b=muIezKJLX3JAy4juFMauod+jorgt8CLDXVzLkoinSCJ7+srS7xrOyo5+yRZIqgN+Gd
 FfdcASZyCg94v7JMLtJNs3FKXDjdWx14K118+Y/ptgiiGd0rIAhpG9gVdY9fsKbuOsep
 RhX39y/pekQz+Yx0wzZkL9U9mZbFMMFuFUbik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696529948; x=1697134748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eAmFswOZzw3jH3oWLXVAcDuqGgICG6iPkOHsm6WtUk=;
 b=OL5L6+x49a+InPork6Vve4L5maaR1rPFx0miCjgEp9HwOem1V7U8Z2xmi2hUXl9KQd
 n7Kzo9TJgg3knn0tnH6btpZca7TYn/kASwZFGKK6ix1a1H9ZlMho1rb+6pHA4PzhSGKF
 ud18VEhK/8alIbFvh9RzuC3xv6xMD6d03R+iryp1kV3GRohhlwHaR3HU2gAqnfYTpUUL
 qyfVZJnhCVHZnmm9fTdNRA1HFfUWf80AYqxQB0nllECLSTTbCW7+/LnY3HS7u1Y6GdkP
 XdUXWNIkVH4FCZ18klVdx5uAwOXrxd+E7IaekOtcV96TZj0yvKTJBchu87pK09FHmt+z
 JdqA==
X-Gm-Message-State: AOJu0YymI9hmwI1YhJ9uBWJH50R5v3Rs2bu2CuE3Wr7MvLEKrzDpInUE
 nGAzTii7m8Q7GbURG+pRUsH0eoeTOJNj3NqiutAHm5HZ
X-Google-Smtp-Source: AGHT+IFi7fcMB+kmF6jCyTZKZz3995kIHI4Bw6wkuo2yaiYaUfUQ77T3o8dC7mK6qNf3BULNJgggww==
X-Received: by 2002:a17:906:5357:b0:9ae:7681:f62a with SMTP id
 j23-20020a170906535700b009ae7681f62amr6103016ejo.44.1696529947869; 
 Thu, 05 Oct 2023 11:19:07 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 o23-20020a17090611d700b00991e2b5a27dsm1583680eja.37.2023.10.05.11.19.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 11:19:07 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-536ef8a7dcdso1735a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 11:19:07 -0700 (PDT)
X-Received: by 2002:a1c:4b18:0:b0:405:320a:44f9 with SMTP id
 y24-20020a1c4b18000000b00405320a44f9mr82899wma.5.1696529473685; Thu, 05 Oct
 2023 11:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
 <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
In-Reply-To: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Oct 2023 11:10:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
Message-ID: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
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
 jitao.shi@mediatek.com, Anton Bambura <jenneron@protonmail.com>,
 neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com,
 quic_jesszhan@quicinc.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > > panel-simple") I moved a pile of panels out of panel-simple driver
> > > into the newly created panel-edp driver. One of those panels, however=
,
> > > shouldn't have been moved.
> > >
> > > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> > > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > > panel is hooked up with LVDS. Furthermore, searching for datasheets I
> > > found one that makes it clear that this panel is LVDS.
> > >
> > > As far as I can tell, I got confused because in commit 88d3457ceb82
> > > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> > > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> > > downstream ChromeOS trees, it seems like some Mediatek boards are
> > > using a panel that they call "auo,b116xw03" that's an eDP panel. The
> > > best I can guess is that they actually have a different panel that ha=
s
> > > similar timing. If so then the proper panel should be used or they
> > > should switch to the generic "edp-panel" compatible.
> > >
> > > When moving this back to panel-edp, I wasn't sure what to use for
> > > .bus_flags and .bus_format and whether to add the extra "enable" dela=
y
> > > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > > backlight when power on"). I've added formats/flags/delays based on m=
y
> > > (inexpert) analysis of the datasheet. These are untested.
> > >
> > > NOTE: if/when this is backported to stable, we might run into some
> > > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > > jacuzzi: Move panel under aux-bus") this panel was used by
> > > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > > know what to suggest for that other than someone making up a bogus
> > > panel for jacuzzi that's just for the stable channel.
> > >
> > > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight wh=
en power on")
> > > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-si=
mple")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > I haven't had a snow or peach-pit hooked up for debugging / testing
> > > for years. I presume that they must be broken and hope that this fixe=
s
> > > them.
> >
> > We could avoid backport breakages by avoiding to backport this to any k=
ernel
> > that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi:=
 Move
> > panel under aux-bus")... because creating a dummy panel to get two wron=
gs
> > right is definitely not ok.
>
> Sure, except that leaves us with ... a breakage. :-P
>
> Although I haven't tested it, I have a hard time believing that
> exynos5250-snow and exynos5420-peach-pit will work properly with the
> panel defined as an eDP panel. That means that they will be broken. If
> someone cared to get those fixed in a stable backport then we'd be
> stuck deciding who to break. If you have any brilliant ideas then I'm
> all ears.
>
> ...then again, I presume this has been broken since commit
> 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> things still limp along and sorta work even though the panel is
> defined incorrectly?

I dug out a exynos5250-snow out of my pile and booted postmarket OS on
it, which was shockingly easy/pleasant (kudos to those involved!). I
found that it was booting a kernel based on 6.1.24. Digging into
sysfs, I found that indeed it appeared to be using the "panel-edp"
driver, so I guess it is limping along with the wrong driver and wrong
flags...

It wasn't totally clear for me how to build a new kernel and deploy it
for postmarket OS, so I wasn't able to confirm this change. I've CCed
the person listed on the postmarket OS wiki though to see if they have
any insight.

In any case, it sounds as if things are working well enough on older
OSes, so maybe we can just skip trying to do any stable backport on
this. It still seems like we should land it, though, since the current
state of the world seems pretty broken. Anyone willing to give a
Reviewed-by or Acked-by tag?

-Doug
