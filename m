Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92229763BF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 18:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D5610E49A;
	Wed, 26 Jul 2023 16:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11110E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 16:07:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso10300991fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690387666; x=1690992466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Et58EXEmfLq1LIQL5SXUSCkby5ZyaZ1e6VeyOPEhc/Y=;
 b=TfWul6mrGBmzKVdnHp+5d3zuiNmPGgGYfj4cJ9GqsR6PojqY64Qfe23KLEinAP59Ns
 faEHx1uQu3n+uel7aypH9gFcx1U5oQKcCfuxMP0LiTNibqkS296l6pw5wQ2bzIHw5QHN
 ejF8NPlRseXe73xtMlMaYNzCVsfP6MlxWgVNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690387666; x=1690992466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Et58EXEmfLq1LIQL5SXUSCkby5ZyaZ1e6VeyOPEhc/Y=;
 b=VFdmRpy0ZvZwi/E9TZ9Rfi42zJaiAPEfOUet6S6E532oKedG1ka2ctkoc2GiqIlVCH
 bTRVj+h/0K3hj+WDMtGDzdYO+VuX3M3W7Jt4mHRwnyzTz5R8aCb8mrFDUNjPz3qZ1VjG
 cof5XQCUE1Nt/gZv0Dq4Zv1nJvZurVlrgAXFk74jM5sEI7825gG/UQa8HdaKubJNfVBt
 6Ti4clVphu+K2tXkJpfXAZHtp0kBQTKUBzq38PfDrDGSvH4uB29ronZzplg8Sxke+52+
 3lqp6Sl0Y/ROs2Y3TyUndCjntPk7km5sxQE+ORllVRA5tYN8afhfBRjZK4nXHBieXYYE
 SDvA==
X-Gm-Message-State: ABy/qLZyGrezwjzaPL4IdeIBbBgNLo8h5/zEcb2utySyKOKyp9t3PfTy
 gfr3RgNmkxXgtsllY+GroI514CuiYUoM/v05Al42ckM1
X-Google-Smtp-Source: APBJJlHVv0raiRq2szgUydR5HzwhQESzAh3DLtYlexN6iVt5jGUWCdArJ99zyUfEhaowQ7v2nn6wTg==
X-Received: by 2002:a2e:9e98:0:b0:2b9:aac6:7f7b with SMTP id
 f24-20020a2e9e98000000b002b9aac67f7bmr1818223ljk.31.1690387666332; 
 Wed, 26 Jul 2023 09:07:46 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 i17-20020a170906445100b00977eec7b7e8sm9844051ejp.68.2023.07.26.09.07.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 09:07:46 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so12644a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:07:46 -0700 (PDT)
X-Received: by 2002:a50:ccc4:0:b0:506:b280:4993 with SMTP id
 b4-20020a50ccc4000000b00506b2804993mr349749edj.2.1690387645063; Wed, 26 Jul
 2023 09:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
In-Reply-To: <rorhwk3jx72twmqnxqb45uhm7azxxfirvferwyznbhbfmdf7ja@6k6ebhehmsn4>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jul 2023 09:07:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
Message-ID: <CAD=FV=VX=ACR3K+GYAvP8J4ebP4GtTpXQmX21NkJ4BJ7vN+o8w@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] HID: i2c-hid: Support being a panel follower
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

On Wed, Jul 26, 2023 at 1:57=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> > @@ -1143,7 +1208,14 @@ void i2c_hid_core_remove(struct i2c_client *clie=
nt)
> >       struct i2c_hid *ihid =3D i2c_get_clientdata(client);
> >       struct hid_device *hid;
> >
> > -     i2c_hid_core_power_down(ihid);
> > +     /*
> > +      * If we're a follower, the act of unfollowing will cause us to b=
e
> > +      * powered down. Otherwise we need to manually do it.
> > +      */
> > +     if (ihid->is_panel_follower)
> > +             drm_panel_remove_follower(&ihid->panel_follower);
>
> That part is concerning, as we are now calling hid_drv->suspend() when re=
moving
> the device. It might or not have an impact (I'm not sure of it), but we
> are effectively changing the path of commands sent to the device.
>
> hid-multitouch might call a feature in ->suspend, but the remove makes
> that the physical is actually disconnected, so the function will fail,
> and I'm not sure what is happening then.

It's not too hard to change this if we're sure we want to. I could
change how the panel follower API works, though I'd rather keep it how
it is now for symmetry. Thus, if we want to do this I'd probably just
set a boolean at the beginning of i2c_hid_core_remove() to avoid the
suspend when the panel follower API calls us back.

That being said, are you sure you want me to do that?

1. My patch doesn't change the behavior of any existing hardware. It
will only do anything for hardware that indicates it needs the panel
follower logic. Presumably these people could confirm that the logic
is OK for them, though I'll also admit that it's likely not many of
them will test the remove() case.

2. Can you give more details about why you say that the function will
fail? The first thing that the remove() function will do is to
unfollow the panel and that can cause the suspend to happen. At the
time this code runs all the normal communications should work and so
there should be no problems calling into the suspend code.

3. You can correct me if I'm wrong, but I'd actually argue that
calling the suspend code during remove actually fixes issues and we
should probably do it for the non-panel-follower case as well. I think
there are at least two benefits. One benefit is that if the i2c-hid
device is on a power rail that can't turn off (either an always-on or
a shared power rail) that we'll at least get the device in a low power
state before we stop managing it with this driver. The second benefit
is that it implicitly disables the interrupt and that fixes a
potential crash at remove time(). The crash in the old code I'm
imagining is:

a) i2c_hid_core_remove() is called.

b) We try to power down the i2c hid device, which might not do
anything if the device is on an always-on rail.

c) We call hid_destroy_device(), which frees the hid device.

d) An interrupt comes in before the call to free_irq() and we try to
dispatch it to the already freed hid device and crash.


If you agree that my reasoning makes sense, I can add a separate patch
before this one to suspend during remove.



-Doug
