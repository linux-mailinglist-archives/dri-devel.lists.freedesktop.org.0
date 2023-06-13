Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455272E7C5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 18:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C217110E3C3;
	Tue, 13 Jun 2023 16:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BB910E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 16:05:03 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b3451b3ea9so1770551fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686672301; x=1689264301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpvBukCW5szqrqAUwk8OFwEaxItlFEJC9hZkX293WdQ=;
 b=SSKyUMB88KdjPpR9wfOCCHmQuaSYYSd12m5cl3IgsD2rd2/vleLb21cPzY92I8KGOG
 yj6x/Zc9DR+bmEDwnRprZwE+zJZ98xKQRBPzMu1wS1JJ+3Rk3DSTcUVEbv8jT4dfMtcA
 NJZkrK+xzhgd+NzPpJB9Dm6Tw//yDyfO4+mkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686672301; x=1689264301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpvBukCW5szqrqAUwk8OFwEaxItlFEJC9hZkX293WdQ=;
 b=LyZ62bh8YyTBBJzm7SOlOGn0WX9v7iOv1jTfTFON1RuEVrwv+iP9/KoE9akSVi3SUc
 mVb9LtyZSkowhAsimsaFwuDibGsOGftbDy1QM2GpKYTP1CuHUcqLR3s9seGlmH56SKMU
 6LOPLOafxW7IjgMJKcUcUhaQ+eH65PF/ls9YNnXkJbhZX3ge7NFqEkkxm7Xo10lMtbHb
 36e1zB5SlE0qgqAO7H4jtQKcjt80SXe9Cxwcl200M+V6KzMVgtDnUVEOLqjGI05qPoiy
 9RdffsQaKVuzNEjh21bSaY4m3VKN4+La/Z5RQi9Q79YA6p8PobaI/7zUYkFrBHOCj7BJ
 lpdw==
X-Gm-Message-State: AC+VfDwHsLaBqF4IJXJdAWMNo0FRyEhsFu7QZhjUk9Nry3sYGadXJK2C
 Lqph5H27dKbLPPnfmQDEoWDkGMvAnVRoji+v6dWA08Vh
X-Google-Smtp-Source: ACHHUZ59gD0oJCKwimeP3BZdhnmfwyiUNpsPhK9w/GCUr+JcgUf99NwbH4r9oxJcp02hiNQo19ZKLg==
X-Received: by 2002:a2e:701a:0:b0:2af:3147:86c8 with SMTP id
 l26-20020a2e701a000000b002af314786c8mr4537397ljc.16.1686672300478; 
 Tue, 13 Jun 2023 09:05:00 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002ac82a995fcsm2208216ljn.23.2023.06.13.09.05.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 09:05:00 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f14865fcc0so3252e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:05:00 -0700 (PDT)
X-Received: by 2002:a50:9f0f:0:b0:514:95d4:c2bb with SMTP id
 b15-20020a509f0f000000b0051495d4c2bbmr99881edf.2.1686671812516; Tue, 13 Jun
 2023 08:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
 <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
 <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
 <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
 <boqzlmbrp5rvepmckkqht4h5auspjlbt5leam4xivy7a4bqxnj@iuxxhooxcphk>
In-Reply-To: <boqzlmbrp5rvepmckkqht4h5auspjlbt5leam4xivy7a4bqxnj@iuxxhooxcphk>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jun 2023 08:56:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
Message-ID: <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
To: Maxime Ripard <mripard@kernel.org>
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
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 13, 2023 at 5:06=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > > What I'm trying to say is: could we just make it work by passing a bu=
nch
> > > of platform_data, 2-3 callbacks and a device registration from the pa=
nel
> > > driver directly?
> >
> > I think I'm still confused about what you're proposing. Sorry! :( Let
> > me try rephrasing why I'm confused and perhaps we can get on the same
> > page. :-)
> >
> > First, I guess I'm confused about how you have one of these devices
> > "register" the other device.
> >
> > I can understand how one device might "register" its sub-devices in
> > the MFD case. To make it concrete, we can look at a PMIC like
> > max77686.c. The parent MFD device gets probed and then it's in charge
> > of creating all of its sub-devices. These sub-devices are intimately
> > tied to one another. They have shared data structures and can
> > coordinate power sequencing and whatnot. All good.
>
> We don't necessarily need to use MFD, but yeah, we could just register a
> device for the i2c-hid driver to probe from (using
> i2c_new_client_device?)

I think this can work for devices where the panel and touchscreen are
truly integrated where the panel driver knows enough about the related
touchscreen to fully describe and instantiate it. It doesn't work
quite as well for cases where the power and reset lines are shared
just because of what a given board designer did. To handle that, each
panel driver would need to get enough DT properties added to it so
that it could fully describe any arbitrary touchscreen, right?

Let's think about the generic panel-edp driver. This driver runs the
panel on many sc7180-trogdor laptops, including coachz, lazor, and
pompom. All three of those boards have a shared power rail for the
touchscreen and panel. If you look at "sc7180-trogdor-coachz.dtsi",
you can see the touchscreen currently looks like this:

ap_ts: touchscreen@5d {
    compatible =3D "goodix,gt7375p";
    reg =3D <0x5d>;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;

    interrupt-parent =3D <&tlmm>;
    interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;

    reset-gpios =3D <&tlmm 8 GPIO_ACTIVE_LOW>;

    vdd-supply =3D <&pp3300_ts>;
};

In "sc7180-trogdor-lazor.dtsi" we have:

ap_ts: touchscreen@10 {
    compatible =3D "hid-over-i2c";
    reg =3D <0x10>;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;

    interrupt-parent =3D <&tlmm>;
    interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;

    post-power-on-delay-ms =3D <20>;
    hid-descr-addr =3D <0x0001>;

    vdd-supply =3D <&pp3300_ts>;
};

In both cases "pp3300_ts" is simply another name for "pp3300_dx_edp"

So I think to do what you propose, we need to add this information to
the panel-edp DT node so that it could dynamically construct the i2c
device for the touchscreen:

a) Which touchscreen is actually connected (generic hid-over-i2c,
goodix, ...). I guess this would be a "compatible" string?

b) Which i2c bus that device is hooked up to.

c) Which i2c address that device is hooked up to.

d) What the touchscreen interrupt GPIO is.

e) Possibly what the "hid-descr-addr" for the touchscreen is.

f) Any extra timing information needed to be passed to the touchscreen
driver, like "post-power-on-delay-ms"

The "pinctrl" stuff would be easy to subsume into the panel's DT node,
at least. ...and, in this case, we could skip the "vdd-supply" since
the panel and eDP are sharing power rails (which is what got us into
this situation). ...but, the above is still a lot. At this point, it
would make sense to have a sub-node under the panel to describe it,
which we could do but it starts to feel weird. We'd essentially be
describing an i2c device but not under the i2c controller it belongs
to.

I guess I'd also say that the above design also need additional code
if/when someone had a touchscreen that used a different communication
method, like SPI.


So I guess the tl;dr of all the above is that I think it could all work if:

1. We described the touchscreen in a sub-node of the panel.

2. We added a property to the panel saying what the true parent of the
touchscreen was (an I2C controller, a SPI controller, ...) and what
type of controller it was ("SPI" vs "I2C").

3. We added some generic helpers that panels could call that would
understand how to instantiate the touchscreen under the appropriate
controller.

4. From there, we added a new private / generic API between panels and
touchscreens letting them know that the panel was turning on/off.

That seems much more complex to me, though. It also seems like an
awkward way to describe it in DT.


> > In any case, is there any chance that we're in violent agreement
>
> Is it even violent? Sorry if it came across that way, it's really isn't
> on my end.

Sorry, maybe a poor choice of words on my end. I've heard that term
thrown about when two people spend a lot of time discussing something
/ trying to persuade the other person only to find out in the end that
they were both on the same side of the issue. ;-)


> > and that if you dig into my design more you might like it? Other than
> > the fact that the panel doesn't "register" the touchscreen device, it
> > kinda sounds as if what my patches are already doing is roughly what
> > you're describing. The touchscreen and panel driver are really just
> > coordinating with each other through a shared data structure (struct
> > drm_panel_follower) that has a few callback functions. Just like with
> > "hdmi-codec", the devices probe separately but find each other through
> > a phandle. The coordination between the two happens through a few
> > simple helper functions.
>
> I guess we very much agree on the end-goal, and I'd really like to get
> this addressed somehow. There's a couple of things I'm not really
> sold on with your proposal though:
>
>  - It creates a ad-hoc KMS API for some problem that looks fairly
>    generic. It's also redundant with the notifier mechanism without
>    using it (probably for the best though).
>
>  - MIPI-DSI panel probe sequence is already fairly complex and fragile
>    (See https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#s=
pecial-care-with-mipi-dsi-bridges).
>    I'd rather avoid creating a new dependency in that graph.
>
>  - And yeah, to some extent it's inconsistent with how we dealt with
>    secondary devices in KMS so far.

Hmmmm. To a large extent, my current implementation actually has no
impact on the DRM probe sequence. The panel itself never looks for the
touchscreen code and everything DRM-related can register without a
care in the world. From reading your bullet points, I guess that's
both a strength and a weakness of my current proposal. It's really
outside the world of bridge chains and DRM components which makes it a
special snowflake that people need to understand on its own. ...but,
at the same time, the fact that it is outside all the rest of that
stuff means it doesn't add complexity to an already complex system.

I guess I'd point to the panel backlight as a preexisting design
that's not totally unlike what I'm doing. The backlight is not part of
the DRM bridge chain and doesn't fit in like other components. This
actually makes sense since the backlight doesn't take in or put out
video data and it's simply something associated with the panel. The
backlight also has a loose connection to the panel driver and a given
panel could be associated with any number of different backlight
drivers depending on the board design. I guess one difference between
the backlight and what I'm doing with "panel follower" is that we
typically don't let the panel probe until after the backlight has
probed. In the case of my "panel follower" proposal it's the opposite.
As per above, from a DRM probe point of view this actually makes my
proposal less intrusive. I guess also a difference between backlight
and "panel follower" is that I allow an arbitrary number of followers
but there's only one backlight.

One additional note: if I actually make the panel probe function start
registering the touchscreen, that actually _does_ add more complexity
to the already complex DRM probe ordering. It's yet another thing that
could fail and/or defer...

Also, I'm curious: would my proposal be more or less palatable if I
made it less generic? Instead of "panel follower", I could hardcode it
to "touchscreen" and then remove all the list management. From a DRM
point of view this would make it even more like the preexisting
"backlight" except for the ordering difference.

-Doug
