Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B173EEC9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 00:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E69110E262;
	Mon, 26 Jun 2023 22:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99C10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 22:49:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51d9695ec29so1866943a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687819788; x=1690411788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dAnLf/XZMv1d7lTmYjxhUjdD/xdtixhtUmJbq4ft4k=;
 b=gHvQ3//8UA2P9RVDmesYBeFBimg9OkR62tmPy4SYEtKHkq+K+Hq8IHGWm6Uejnzydf
 WybcsHl40wkP4rDSpaarqM4inn5qQeN3QSqLJ1RzmEvR3/SxU2l+G9nj2zIcm+QyZexB
 AOfzcdbRZk3U8dNNzTqWrA+/7NR2ynIThovi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687819788; x=1690411788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dAnLf/XZMv1d7lTmYjxhUjdD/xdtixhtUmJbq4ft4k=;
 b=I+AIA6rt3z4udLUHtTv5MgR3pFM/UP8khRD3wlFLsJ+QMLTiWk06nlxYyF/3TkFZ7L
 ejFR8J2zFJVrDZ4AUkklemc4U7WUmbMNFoC7qc4y2FSbFisoplnrg+EDIID5AtdwfoZd
 jH+qr01zYKoWiDi+jUu/LNiDoxORMP32tfFks+OrnLRNwoXA9qzWajgPCS8kbTgaY+0C
 ffuQQtX8e9/6VeF4GUcagTDjP5Eqh/XjLLur/D6CkNDWbGEu85DIXWBNux1dphpFOqBw
 vLkYb9N6i8PHsXhFSlLgSX9ttf9NZV8mS+868Rxc4RXxgYEZrtJBInCpHTJc4IsmU8QV
 fV4w==
X-Gm-Message-State: AC+VfDz/CpcKlArAum8IFXs1GcQloaTpcgkSJRlRzrYkz07sO4zvctpY
 6AIbs8nd+dTHdwIY7WGyp4ZEUZec4pUt1ICYgZSf8Fgi
X-Google-Smtp-Source: ACHHUZ5rhRmgy7AGYwPcJGmItgRbXtLNzm6pAAK8Jf1iVsjwJ0GVCO+AsQ/nfCu43aMCCq42gr21ew==
X-Received: by 2002:aa7:c482:0:b0:51d:419b:3bc6 with SMTP id
 m2-20020aa7c482000000b0051d419b3bc6mr4513532edq.28.1687819788489; 
 Mon, 26 Jun 2023 15:49:48 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 c15-20020a056402100f00b0051a5cf5fcaasm3239307edu.23.2023.06.26.15.49.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 15:49:47 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-514ad92d1e3so1775a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:49:47 -0700 (PDT)
X-Received: by 2002:a50:9fa4:0:b0:51a:1f15:9ddc with SMTP id
 c33-20020a509fa4000000b0051a1f159ddcmr207492edf.6.1687819787201; Mon, 26 Jun
 2023 15:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
In-Reply-To: <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Jun 2023 15:49:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com>
Message-ID: <CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com>
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

Benjamin,

On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_follow=
er_funcs =3D {
> > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > +};
>
> Can we make that above block at least behind a Kconfig?
>
> i2c-hid is often used for touchpads, and the notion of drm panel has
> nothing to do with them. So I'd be more confident if we could disable
> that code if not required.

Now that other concerns are addressed, I started trying to write up a
v3 and I found myself writing this as the description of the Kconfig
entry:

--
config I2C_HID_SUPPORT_PANEL_FOLLOWER
bool "Support i2c-hid devices that must be power sequenced with a panel"

Say Y here if you want support for i2c-hid devices that need to
coordinate power sequencing with a panel. This is typically important
when you have a panel and a touchscreen that share power rails or
reset GPIOs. If you say N here then the kernel will not try to honor
any shared power sequencing for your hardware. In the best case,
ignoring power sequencing when it's needed will draw extra power. In
the worst case this will prevent your hardware from functioning or
could even damage your hardware.

If unsure, say Y.

--

I can certainly go that way, but I just wanted to truly make sure
that's what we want. Specifically:

1. If we put the panel follower code behind a Kconfig then we actually
have no idea if a touchscreen was intended to be a panel follower.
Specifically the panel follower API is the one that detects the
connection between the panel and the i2c-hid device, so without being
able to call the panel follower API we have no idea that an i2c-hid
device was supposed to be a panel follower.

2. It is conceivable that power sequencing a device incorrectly could
truly cause hardware damage.

Together, those points mean that if you turn off the Kconfig entry and
then try to boot on a device that needed that Kconfig setting that you
might damage hardware. I can code it up that way if you want, but it
worries me...


Alternatives that I can think of:

a) I could change the panel follower API so that panel followers are
in charge of detecting the panel that they follow. Today, that looks
like:

       panel_np =3D of_parse_phandle(dev->of_node, "panel", 0);
       if (panel_np)
               /* It's a panel follower */
       of_node_put(panel_np);

...so we could put that code in each touchscreen driver and then fail
to probe i2c-hid if we detect that we're supposed to be a panel
follower but the Kconfig is turned off. The above doesn't seem
massively ideal since it duplicates code. Also, one reason why I put
that code in drm_panel_add_follower() is that I think this concept
will eventually be needed even for non-DT cases. I don't know how to
write the non-DT code right now, though...


b) I could open-code detect the panel follower case but leave the
actual linking to the panel follower API. AKA add to i2c-hid:

       if (of_property_read_bool(dev->of_node, "panel"))
               /* It's a panel follower */

...that's a smaller bit of code, but feels like an abstraction
violation. It also would need to be updated if/when we added support
for non-DT panel followers.


c) I could add a "static inline" implementation of b) to "drm_panel.h".

That sounds great and I started doing it. ...but then realized that it
means adding to drm_panel.h:

#include <linux/device.h>
#include <linux/of.h>

...because otherwise of_property_read_bool() isn't defined and "struct
device" can't be dereferenced. That might be OK, but it looks as if
folks have been working hard to avoid things like this in header
files. Presumably it would get uglier if/when we added the non-DT
case, as well. That being said, I can give it a shot...

--

At this point, I'm hoping for some advice. How important is it for you
to have a Kconfig for "I2C_HID_SUPPORT_PANEL_FOLLOWER"?

NOTE: even if I don't add the Kconfig, I could at least create a
function for registering the panel follower that would get most of the
panel follower logic out of the probe function. Would that be enough?

Thanks!

-Doug
