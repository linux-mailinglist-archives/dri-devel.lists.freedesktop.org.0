Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0D76B7FE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B53410E409;
	Tue,  1 Aug 2023 14:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1E110E408
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 14:49:50 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9cbaee7a9so72139831fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690901388; x=1691506188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdTZNKuWBX14Fxg/X80zO/y3gXNW8E/QaXttyJc6jPE=;
 b=kk42QCfg0FaZzmZECMdQz19vpGNvk5Yom2UcRBhNv9uxyKmQTjEPweYLvL8sbD8Oi6
 OCkHhgwo2Ox2EUFCwFna/ZUmUWdGGD4y8DB6LBnRuRK9FJjlvDrnexrHqBCOAvf4ac36
 AbrKUjFXu4o8Q38vHhy2qsfub5gf5OQwngxi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690901388; x=1691506188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UdTZNKuWBX14Fxg/X80zO/y3gXNW8E/QaXttyJc6jPE=;
 b=GkMbsdOfHd2uvLN/vAXOlzwCgB6IT23scPOSjoZCosFChgJqateZy4BuDu83QCOcaL
 2DIUY8bKrMO/SsNscndo2Ea+1tmbNep5X0HcGZc/eJBdZeF9kmDQ5GoOKxrYTT31XjhU
 uB7pA/LrZOdXRmHbQPSy8GH1eR41hNCHz4NQaOtKImZeeYau3TJ9BR9qeZ16HO7PS7yz
 Y8sasiia8/IvFlBjkmY9VK/XwdVtAHiorOxbvuMdtMXQXUZxqlkAFZ45gz3u7swNIR4W
 QrCUlzGZym0XDRnjrb4jnahHmV8d74tbttTvyJwbFiXNTKNfa+wZOrpa5MtsOKJ30YDh
 e2zQ==
X-Gm-Message-State: ABy/qLaZn+XgCpwuDDa5y/AjkYJ6i5qv74lzivUxUv69ia1rFqCkec+f
 4cOdcmwAlZjQ6aUzl3C1UAjPHOlr3G1MqCQni/iYhw==
X-Google-Smtp-Source: APBJJlG/HmSSaivSuGY7l2LMOhqM8lMYGzjaowKqFSv0pnDlioxFnQdaJR04fcK/guC24OSC/N2tKA==
X-Received: by 2002:a2e:3817:0:b0:2b6:da66:2d69 with SMTP id
 f23-20020a2e3817000000b002b6da662d69mr2614151lja.28.1690901387704; 
 Tue, 01 Aug 2023 07:49:47 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 h19-20020a17090634d300b009890e402a6bsm7833808ejb.221.2023.08.01.07.49.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 07:49:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-521e046f6c7so11410a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 07:49:47 -0700 (PDT)
X-Received: by 2002:a50:8747:0:b0:521:d274:fc81 with SMTP id
 7-20020a508747000000b00521d274fc81mr305414edv.2.1690901366612; Tue, 01 Aug
 2023 07:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org>
 <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
 <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Aug 2023 07:49:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VC2yuubPgWcQqVOZnGUaPKFSRwK68okxf7M7JO5gm1PA@mail.gmail.com>
Message-ID: <CAD=FV=VC2yuubPgWcQqVOZnGUaPKFSRwK68okxf7M7JO5gm1PA@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
To: Benjamin Tissoires <bentiss@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 28, 2023 at 10:24=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Fri, Jul 28, 2023 at 8:31=E2=80=AFAM Benjamin Tissoires <bentiss@kerne=
l.org> wrote:
> >
> > On Jul 27 2023, Douglas Anderson wrote:
> > >
> > > The big motivation for this patch series is mostly described in the p=
atch
> > > ("drm/panel: Add a way for other devices to follow panel state"), but=
 to
> > > quickly summarize here: for touchscreens that are connected to a pane=
l we
> > > need the ability to power sequence the two device together. This is n=
ot a
> > > new need, but so far we've managed to get by through a combination of
> > > inefficiency, added costs, or perhaps just a little bit of brokenness=
.
> > > It's time to do better. This patch series allows us to do better.
> > >
> > > Assuming that people think this patch series looks OK, we'll have to
> > > figure out the right way to land it. The panel patches and i2c-hid
> > > patches will go through very different trees and so either we'll need
> > > an Ack from one side or the other or someone to create a tag for the
> > > other tree to pull in. This will _probably_ require the true drm-misc
> > > maintainers to get involved, not a lowly committer. ;-)
> > >
> > > Version 4 of this series adds a new patch that suspends i2c-hid
> > > devices at remove time even for non panel-followers to make things
> > > consistent. It also attempts to isolate the panel follower code a bit
> > > more as per Benjamin's feedback on v3 and adds an item to the DRM tod=
o
> > > list as per Maxime's request. As per Maxime's response to my v3 cover
> > > letter, I added his Reviewed-by tag to all 10 patches that were part
> > > of v3 (but left it off of the new i2c-hid patch in v4).
> > >
> > > Version 3 of this series was a long time coming after v2. Maxime and =
I
> > > had a very long discussion trying to figure out if there was a beter
> > > way and in the end we didn't find one so he was OK with the series in
> > > general [1]. After that got resolved, I tried to resolve Benjamin's
> > > feedback but got stuck [2]. Eventually I made my best guess. The end
> > > result was a v3 that wasn't that different from v2 but that had a tin=
y
> > > bit more code split out.
> > >
> > > Version 2 of this patch series didn't change too much. At a high leve=
l:
> > > * I added all the forgotten "static" to functions.
> > > * I've hopefully made the bindings better.
> > > * I've integrated into fw_devlink.
> > > * I cleaned up a few descriptions / comments.
> > >
> > > As far as I can tell, as of v4 everyone is on the same page that this
> > > patch series looks like a reasonable solution to the problem and we
> > > just need to get all the nits fixed and figure out how to land it.
> >
> > Thanks a lot for the new version. I like it much more on the HID side:
> >
> > for the HID part:
> > Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
> >
> > I wouldn't mind having this series taken from the drm tree if that is
> > easier. i2c-hid is a low patch rate driver, so having it updated throug=
h
> > DRM should not be an issue.
> >
> > In that case:
> > Acked-by: Benjamin Tissoires <bentiss@kernel.org>
>
> Thanks for your reviews and your help getting this whipped into shape.
>
> Lading through drm makes sense to me. I'm a drm committer, so with
> your Ack I believe it should be fine for me to land the series (minus
> the dts) in drm-misc-next. This series has been around for a while,
> has been reviewed by relevant folks, and the last few changes haven't
> fundamentally changed anything about the design, so I'm not going to
> twiddle my thumbs too long. That being said, I'll still plan to wait
> until early next week (Tuesday?) before landing to allow for any last
> minute shouts.
>
> Given how drm-misc works [1] and the fact that mainline is currently
> at v6.5-rc3 (it will be -rc4 when I land it), I'd expect that these
> commits will find their way into v6.6.
>
> [1] https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

Pushed the first 10 patches to drm-misc-next. Bjorn: whenever it's
convenient you could land patch #11 (the device tree change) into the
Qualcomm tree.

76edfcf430cc HID: i2c-hid: Do panel follower work on the system_wq
96a37bfd232a HID: i2c-hid: Support being a panel follower
5f8838e9405d HID: i2c-hid: Suspend i2c-hid devices in remove
d93d28477222 HID: i2c-hid: Make suspend and resume into helper functions
675cd877c952 HID: i2c-hid: Rearrange probe() to power things up later
a889ee12d53d HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
fbf0ea2da3c7 of: property: fw_devlink: Add a devlink for panel followers
de0874165b83 drm/panel: Add a way for other devices to follow panel state
d2aacaf07395 drm/panel: Check for already prepared/enabled in drm_panel
2ca376ef18f6 dt-bindings: HID: i2c-hid: Add "panel" property to
i2c-hid backed touchscreens

-Doug
