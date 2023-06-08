Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A8728595
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AC810E5E8;
	Thu,  8 Jun 2023 16:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259C10E5E8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:42:58 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-33b4552e55cso2486645ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686242576; x=1688834576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lm0NPXeSllB+Ruuyhki9CYskDouHV5Cnz0fcBZ5jUqQ=;
 b=K4FAGvdKbjiRCZ7l+ULgQOTHauvt6a/dkof0Dghh8W3nEmON2lxBYX5PXcNV3uOVnH
 MxZoEOzTS7UX2KkQX/W41tEsx75tPzTwXhDO0OXbgH6uELjgcQojNt2X7wcmfG+LpP4h
 k6MsBIr+FDNwmHH6eULX0tekQQaO7dxJ8eV/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686242576; x=1688834576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lm0NPXeSllB+Ruuyhki9CYskDouHV5Cnz0fcBZ5jUqQ=;
 b=Zv+VZU+uf8S7x3BT0eIp3Qqb9+2QdjLsSUveQK1pth+/OROHbVdng9ngvfKMRAEfsW
 yvsOc3jdbCqftT5el3kA1IcyuxYSSIJq0E0iMRYsLP8ycBTtMkEKaGkSMvFnC108qjfZ
 rkBvKXP/fpQtJVAEJPZmU+DSKUxBjSpHP4WKvT0tPKg3cHC38p/W4Qr164BJWWROjlx3
 JahapOrvcrnBMwGlvZ3sjFi9SAHqvzPpKUe1S1/8FRRzdjZW3gc1G2t4m2BrBR+Ocil+
 xqYYp/Kx5q5zJTpu2ZLz+clOlk4g1VAfsuKXyW8Py/T/bwFct822UEr6VwmW5vfEy9v1
 KZRA==
X-Gm-Message-State: AC+VfDwH7WX5ohyazC9R7aJW+96u1h1+jS5nq3enmo0AvvoaKMR9PTkA
 5oiXZpXVYPOCMMldD7TnXP1K9P0uSK9J4+h+OCuSVQ==
X-Google-Smtp-Source: ACHHUZ4UOjWj8ue7C59v0z0OKnRjuNwhh6LXfURwSOLBJfW1WllaTnYvCqezgifP+CMury5Rtt82UQ==
X-Received: by 2002:a05:6e02:1b0d:b0:33c:5709:a142 with SMTP id
 i13-20020a056e021b0d00b0033c5709a142mr1911354ilv.3.1686242576643; 
 Thu, 08 Jun 2023 09:42:56 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171]) by smtp.gmail.com with ESMTPSA id
 t19-20020a02c913000000b004161a1fbb06sm369249jao.121.2023.06.08.09.42.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 09:42:55 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so115085ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:42:55 -0700 (PDT)
X-Received: by 2002:a05:6e02:214a:b0:32a:f2a9:d1b7 with SMTP id
 d10-20020a056e02214a00b0032af2a9d1b7mr139231ilv.10.1686242575095; Thu, 08 Jun
 2023 09:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
In-Reply-To: <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:42:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
Message-ID: <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
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

On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
>
> On Jun 07 2023, Douglas Anderson wrote:
> >
> > As talked about in the patch ("drm/panel: Add a way for other devices
> > to follow panel state"), we really want to keep the power states of a
> > touchscreen and the panel it's attached to in sync with each other. In
> > that spirit, add support to i2c-hid to be a panel follower. This will
> > let the i2c-hid driver get informed when the panel is powered on and
> > off. From there we can match the i2c-hid device's power state to that
> > of the panel.
> >
> > NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> > of / manage the power state of the i2c-hid device, even though my
> > first instinct said that would be the way to go. Specific problems
> > with using pm_runtime():
> > * The initial power up couldn't happen in a runtime resume function
> >   since it create sub-devices and, apparently, that's not good to do
> >   in your resume function.
> > * Managing our power state with pm_runtime meant fighting to make the
> >   right thing happen at system suspend to prevent the system from
> >   trying to resume us only to suspend us again. While this might be
> >   able to be solved, it added complexity.
> > Overall the code without pm_runtime() ended up being smaller and
> > easier to understand.
>
> Generally speaking, I'm not that happy when we need to coordinate with
> other subsystems for bringing up resources...

Yeah, I'd agree that it's not amazingly elegant. Unfortunately, I
couldn't find any existing clean frameworks that would do what was
needed, which is (presumably) why this problem hasn't been solved
before. I could try to come up with a grand abstraction / new
framework, but that doesn't seem like a great choice either unless we
expect more users...


> Anyway, a remark inlined (at least):
>
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> >
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
> >  1 file changed, 81 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i=
2c-hid-core.c
> > index fa8a1ca43d7f..368db3ae612f 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -38,6 +38,8 @@
> >  #include <linux/mutex.h>
> >  #include <asm/unaligned.h>
> >
> > +#include <drm/drm_panel.h>
> > +
> >  #include "../hid-ids.h"
> >  #include "i2c-hid.h"
> >
> > @@ -107,6 +109,8 @@ struct i2c_hid {
> >       struct mutex            reset_lock;
> >
> >       struct i2chid_ops       *ops;
> > +     struct drm_panel_follower panel_follower;
> > +     bool                    is_panel_follower;
> >  };
> >
> >  static const struct i2c_hid_quirks {
> > @@ -1058,6 +1062,34 @@ static int i2c_hid_core_initial_power_up(struct =
i2c_hid *ihid)
> >       return ret;
> >  }
> >
> > +static int i2c_hid_core_panel_prepared(struct drm_panel_follower *foll=
ower)
> > +{
> > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid, p=
anel_follower);
> > +     struct hid_device *hid =3D ihid->hid;
> > +
> > +     /*
> > +      * hid->version is set on the first power up. If it's still zero =
then
> > +      * this is the first power on so we should perform initial power =
up
> > +      * steps.
> > +      */
> > +     if (!hid->version)
> > +             return i2c_hid_core_initial_power_up(ihid);
> > +
> > +     return i2c_hid_core_resume(ihid);
> > +}
> > +
> > +static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *f=
ollower)
> > +{
> > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid, p=
anel_follower);
> > +
> > +     return i2c_hid_core_suspend(ihid);
> > +}
> > +
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

Happy to put it behind a Kconfig. I'll plan on that for v3. I'll stub
the functions out if there is no Kconfig, but plan to still leave
structure members just to avoid uglifying the sources too much.


> Actually, I'd be even more happier if it were in a different compilation
> unit. Not necessary a different module, but at least a different file.

I suspect that it's not worth it, but I'll do this if you feel
strongly about it.

I guess the simplest way I can think of to move this to its own file
would be to put the whole private data structure (struct i2c_hid) in a
private header file and then add prototypes for i2c_hid_core_resume()
and i2c_hid_core_suspend() there. Then I could add something like
i2c_hid_core_handle_panel_follower() that would have all the
registration logic. I'd still need special cases in the core
suspend/resume/remove code unless I add a level of abstraction. While
the level of abstraction is more "pure", it also would make the code
harder to follow.

Unless I hear a strong opinion (or if this series changes
significantly), I'll plan to keep things in the same file and just use
a Kconfig.
