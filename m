Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3547282E1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E510E196;
	Thu,  8 Jun 2023 14:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04B310E196
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 14:39:14 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-77acb944bdfso24911839f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686235152; x=1688827152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bH4ZjQM6aPxK+ZRdt1mqrjgyacqVVtEwfwRuNc+V6F4=;
 b=gNqk40HhHxkcn/ngo1T18Sd2W/SSMWZGxYy50uqyOYywL6MhWWEdXHiDQ2KWIMdHsS
 KoZEjcUZgS8/7hDbFTWNwmuoG966dsnVWLnH60lPlzaV/t4mdDGxIFSumW05ramUdXo/
 nY9r0BeR2gEuKKpVWSz6OMQxNj6IrOIsf5DR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235152; x=1688827152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bH4ZjQM6aPxK+ZRdt1mqrjgyacqVVtEwfwRuNc+V6F4=;
 b=VfVCR/boR7SEW4xe6SFuk57bPArOVJi4fmRSDroQhvcuaxUiVvION0q8D7YiV6VJsi
 Rul4ZwTOucBMXd/zPr6uz4ta5qsSMzOy1ao3pP4taYji0o2s2zcpf+JpjlfhzbAP6XjB
 10nWjpoxGH/2x51X+uSOsiWp0JpRs/Iev6gS+Rd1MVHzlkFhBOatiu5c8f4/Aqu1SNj7
 MNYxHyQWqu9cBCu5bSiLTlZFIoPo+lM2MqwJ195fQnqOtQlkEXHCgrbh/axrPlRo564k
 1uHLA/NeAF5jn0M80XD7jLsiULxuqp17OdlhqpwqL7VBBCrDi5pg7IUDOms50BA3qkPN
 qfzA==
X-Gm-Message-State: AC+VfDwTeEl+PAF2mr1EXQXPX2NeRIvD8BJfnpUkl7VButVHtXN+hhAG
 iFwY3+hHEUheQ62Xgy2O+njysezPiq3D3UwSKkI=
X-Google-Smtp-Source: ACHHUZ5rEJFDNVP5bHrjcJbwIRe1HLFDoXc40Jige6B7uCtJhog2gaVGsosQnpVEePoCeWm04B/c/Q==
X-Received: by 2002:a5d:938f:0:b0:76c:62ab:5d96 with SMTP id
 c15-20020a5d938f000000b0076c62ab5d96mr10468435iol.19.1686235152212; 
 Thu, 08 Jun 2023 07:39:12 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180]) by smtp.gmail.com with ESMTPSA id
 x19-20020a6bfe13000000b007767a221ea0sm401757ioh.11.2023.06.08.07.39.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 07:39:11 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so143445ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b8b:b0:33d:67c9:a486 with SMTP id
 h11-20020a056e021b8b00b0033d67c9a486mr250532ili.26.1686235150817; Thu, 08 Jun
 2023 07:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
In-Reply-To: <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 07:38:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
Message-ID: <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
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

On Thu, Jun 8, 2023 at 12:17=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Douglas,
>
> On Wed, Jun 07, 2023 at 02:49:22PM -0700, Douglas Anderson wrote:
> >
> > The big motivation for this patch series is mostly described in the pat=
ch
> > ("drm/panel: Add a way for other devices to follow panel state"), but t=
o
> > quickly summarize here: for touchscreens that are connected to a panel =
we
> > need the ability to power sequence the two device together. This is not=
 a
> > new need, but so far we've managed to get by through a combination of
> > inefficiency, added costs, or perhaps just a little bit of brokenness.
> > It's time to do better. This patch series allows us to do better.
> >
> > Assuming that people think this patch series looks OK, we'll have to
> > figure out the right way to land it. The panel patches and i2c-hid
> > patches will go through very different trees and so either we'll need
> > an Ack from one side or the other or someone to create a tag for the
> > other tree to pull in. This will _probably_ require the true drm-misc
> > maintainers to get involved, not a lowly committer. ;-)
> >
> > Version 2 of this patch series doesn't change too much. At a high level=
:
> > * I added all the forgotten "static" to functions.
> > * I've hopefully made the bindings better.
> > * I've integrated into fw_devlink.
> > * I cleaned up a few descriptions / comments.
> >
> > This still needs someone to say that the idea looks OK or to suggest
> > an alternative that solves the problems. ;-)
>
> Thanks for working on this.
>
> I haven't seen in any of your commit messages how the panels were
> actually "packaged" together?
>
> Do a panel model typically come together with the i2c-hid support, or is
> it added at manufacture time?
>
> If it's the latter, it's indeed a fairly loose connection and we need
> your work.
>
> If it's the former though and we don't expect a given panel reference to
> always (or never) come with a touchscreen attached,

Thanks for your reply. Let me see what I can do to bring clarity.

In at least some of the cases, I believe that the panel and the
touchscreen _are_ logically distinct components, even if they've been
glued together at some stage in manufacturing. Even on one of the
"poster child" boards that I talk about in patch #3, the early
versions of "homestar", I believe this to be the case. However, even
if the panel and touchscreen are separate components then they still
could be connected to the main board in a way that they share power
and/or reset signals. In my experience, in every case where they do
the EEs expect that the panel is power sequenced first and then the
touchscreen is power sequenced second. The EEs look at the power
sequencing requirements of the panel and touchscreen, see that there
is a valid power sequence protocol where they can share rails, and
design the board that way. Even if the touchscreen and panel are
logically separate, the moment the board designers hook them up to the
same power rails and/or reset signals they become tied. This is well
supported by my patch series.

The case that really motivated my patch series, though, is the case
that Cong Yang recently has been working on. I think most of the
discussion is in his original patch series [1]. Cong Yang's patch
series is largely focused on supporting the "ILI9882T" chip and some
panels that it's used with. I found a datasheet for that, and the
title from the first page is illustrative: "In-cell IC Integrates TFT
LCD Driver and Capacitive Touch Controller into a Two Chip Cascade".
This is an integrated solution that's designed to handle both the LCD
and the touchscreen.


[1] https://lore.kernel.org/lkml/20230519032316.3464732-1-yangcong5@huaqin.=
corp-partner.google.com/


> I guess we can have
> something much simpler with a bunch of helpers that would register a
> i2c-hid device and would be called by the panel driver itself.
>
> And then, since everything is self-contained managing the power state
> becomes easier as well.

Can you give me more details about how you think this would work?

When you say that the panel would register an i2c-hid device itself,
do you mean that we'd do something like give a phandle to the i2c bus
to the panel and then the panel would manually instantiate the i2c-hid
device on it? ...and I guess it would need to be a "subclass" of
i2c-hid that knew about the connection to the panel code? This
subclass and the panel code would communicate with each other about
power sequencing needs through some private API (like MFD devices
usually do?). Assuming I'm understanding correctly, I think that could
work. Is it cleaner than my current approach, though?

I guess, alternatively, we could put the "panel" directly under the
i2c bus in this case. That would probably work for Cong Yang's current
needs, but we'd end up in trouble if we ever had a similar situation
with an eDP panel since eDP panels need to be under the DP-AUX bus.

I guess overall, though, while I think this approach could solve Cong
Yang's needs, I still feel like it's worth solving the case where
board designers have made panel and touchscreens "coupled" by having
them rely on the same power rails and/or reset signals.


-Doug
