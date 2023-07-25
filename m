Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64017623B1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C5C10E3F8;
	Tue, 25 Jul 2023 20:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0E10E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:41:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso9133900e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690317676; x=1690922476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDQQ0x4yX7qC7HV6JyhQDa1Oq53Li9ajB2nF2Gu9ICA=;
 b=kMf/RUV/HVIMsWp9I2NqzC2T8Fl3zRsCFJJi15uZ14B8Xj7X9N6IHquo6esnlNU7PU
 d7wEJsVnmBungsjtXEcrTFumBs+x5Unq7MN3dBEUeeAp/lq2DFa2vJ9VuJIW3v2gYV72
 JC99G+gxIb8x2GAXYhS/WH3mTANaApVV0UpSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317676; x=1690922476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDQQ0x4yX7qC7HV6JyhQDa1Oq53Li9ajB2nF2Gu9ICA=;
 b=G1dSSGzfUcmZxhK36v/9SHZ45MyvdeW6B+TVqi8f+tkDkHtm2em5+Woz2L2WnMLXKh
 yfu0Pr7Au9YQbetppb9gX7CML6Zx/6UW5tJ7HkcTsxaWGiY3vxUtzqcZiMxFc9DLFU9/
 gYYrt3YFePmpmH3NLDuaK3zDE1PKay0oHJyq5ZUE5slH+BrcTMnCLcH7BYAUzVGL8MBs
 nFuyKmG2nJvHTTwk6YDkWZLcpcgfkA0+AwKWi275/ZSSHNCImWl3lPgvd+6+lqRq8w1w
 Jqn88sA2d/95LPqTHB9bFNglldKRvbiHZ9EOiXfIjcbtX9gtJbCm2WYCWrcYhS3Ou/Hv
 GD8w==
X-Gm-Message-State: ABy/qLajH0ylku8trlZwRTWpCzQegri16UC9lZDsuGIOXrNmrCqUC2NJ
 p0mqtn85GBuZP8cEyVhzcqy59+tDYk96FsplTrvHWN1s
X-Google-Smtp-Source: APBJJlH22zCSgX+jgR3YO5Rr8xpSupShLPZsnwMetXwubSrysjRQQg0c2rfz8M8dfW+wYTTMbYYDYg==
X-Received: by 2002:a05:6512:202c:b0:4f7:69b9:fa07 with SMTP id
 s12-20020a056512202c00b004f769b9fa07mr1811lfs.45.1690317675677; 
 Tue, 25 Jul 2023 13:41:15 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 q16-20020aa7cc10000000b0051e0eba608bsm7879345edt.19.2023.07.25.13.41.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 13:41:15 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-521e046f6c7so689a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:41:14 -0700 (PDT)
X-Received: by 2002:a50:ccc4:0:b0:521:d274:fc81 with SMTP id
 b4-20020a50ccc4000000b00521d274fc81mr183614edj.2.1690317674563; Tue, 25 Jul
 2023 13:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
 <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com>
 <CAD=FV=UUdc5xi-HoOye-a1Oki3brcX3V1+=zuxQKLAcrd3iTSA@mail.gmail.com>
In-Reply-To: <CAD=FV=UUdc5xi-HoOye-a1Oki3brcX3V1+=zuxQKLAcrd3iTSA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jul 2023 13:41:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmpH6cB0oZOxbL+TUxjLRf3PM+kKvuYRAZSiEhS4o37A@mail.gmail.com>
Message-ID: <CAD=FV=WmpH6cB0oZOxbL+TUxjLRf3PM+kKvuYRAZSiEhS4o37A@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
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

On Mon, Jul 17, 2023 at 11:15=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Benjamin,
>
> On Mon, Jun 26, 2023 at 3:49=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Benjamin,
> >
> > On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_fo=
llower_funcs =3D {
> > > > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > > > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > > > +};
> > >
> > > Can we make that above block at least behind a Kconfig?
> > >
> > > i2c-hid is often used for touchpads, and the notion of drm panel has
> > > nothing to do with them. So I'd be more confident if we could disable
> > > that code if not required.
> >
> > Now that other concerns are addressed, I started trying to write up a
> > v3 and I found myself writing this as the description of the Kconfig
> > entry:
> >
> > --
> > config I2C_HID_SUPPORT_PANEL_FOLLOWER
> > bool "Support i2c-hid devices that must be power sequenced with a panel=
"
> >
> > Say Y here if you want support for i2c-hid devices that need to
> > coordinate power sequencing with a panel. This is typically important
> > when you have a panel and a touchscreen that share power rails or
> > reset GPIOs. If you say N here then the kernel will not try to honor
> > any shared power sequencing for your hardware. In the best case,
> > ignoring power sequencing when it's needed will draw extra power. In
> > the worst case this will prevent your hardware from functioning or
> > could even damage your hardware.
> >
> > If unsure, say Y.
> >
> > --
> >
> > I can certainly go that way, but I just wanted to truly make sure
> > that's what we want. Specifically:
> >
> > 1. If we put the panel follower code behind a Kconfig then we actually
> > have no idea if a touchscreen was intended to be a panel follower.
> > Specifically the panel follower API is the one that detects the
> > connection between the panel and the i2c-hid device, so without being
> > able to call the panel follower API we have no idea that an i2c-hid
> > device was supposed to be a panel follower.
> >
> > 2. It is conceivable that power sequencing a device incorrectly could
> > truly cause hardware damage.
> >
> > Together, those points mean that if you turn off the Kconfig entry and
> > then try to boot on a device that needed that Kconfig setting that you
> > might damage hardware. I can code it up that way if you want, but it
> > worries me...
> >
> >
> > Alternatives that I can think of:
> >
> > a) I could change the panel follower API so that panel followers are
> > in charge of detecting the panel that they follow. Today, that looks
> > like:
> >
> >        panel_np =3D of_parse_phandle(dev->of_node, "panel", 0);
> >        if (panel_np)
> >                /* It's a panel follower */
> >        of_node_put(panel_np);
> >
> > ...so we could put that code in each touchscreen driver and then fail
> > to probe i2c-hid if we detect that we're supposed to be a panel
> > follower but the Kconfig is turned off. The above doesn't seem
> > massively ideal since it duplicates code. Also, one reason why I put
> > that code in drm_panel_add_follower() is that I think this concept
> > will eventually be needed even for non-DT cases. I don't know how to
> > write the non-DT code right now, though...
> >
> >
> > b) I could open-code detect the panel follower case but leave the
> > actual linking to the panel follower API. AKA add to i2c-hid:
> >
> >        if (of_property_read_bool(dev->of_node, "panel"))
> >                /* It's a panel follower */
> >
> > ...that's a smaller bit of code, but feels like an abstraction
> > violation. It also would need to be updated if/when we added support
> > for non-DT panel followers.
> >
> >
> > c) I could add a "static inline" implementation of b) to "drm_panel.h".
> >
> > That sounds great and I started doing it. ...but then realized that it
> > means adding to drm_panel.h:
> >
> > #include <linux/device.h>
> > #include <linux/of.h>
> >
> > ...because otherwise of_property_read_bool() isn't defined and "struct
> > device" can't be dereferenced. That might be OK, but it looks as if
> > folks have been working hard to avoid things like this in header
> > files. Presumably it would get uglier if/when we added the non-DT
> > case, as well. That being said, I can give it a shot...
> >
> > --
> >
> > At this point, I'm hoping for some advice. How important is it for you
> > to have a Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER"?
> >
> > NOTE: even if I don't add the Kconfig, I could at least create a
> > function for registering the panel follower that would get most of the
> > panel follower logic out of the probe function. Would that be enough?
>
> I'd love to send a new version of this patch series, but I'm still
> stuck with the above issue. I'm hoping you might have a minute to
> provide your thoughts. If I don't hear anything, I'll try a v3 where I
> don't have the Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER" but just
> try to pull a little more of the code out of the probe function.

To provide breadcrumbs, I posted the v3 which pulls a bit more code
out of the probe function but is otherwise largely unchanged. The
cover letter for v3 can be found at:

https://lore.kernel.org/r/20230725203545.2260506-1-dianders@chromium.org/
