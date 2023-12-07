Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB5809119
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 20:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A99410E95E;
	Thu,  7 Dec 2023 19:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A2810E95E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 19:14:58 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so1284874e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701976494; x=1702581294;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ge3Rk2B21QhsOmEMG5m3LjdIZh1PEMQWoh/W4fwv0Lg=;
 b=Asr7XHO6Jh61LgdTbOBTMxvh4WYzO4iAXh5gkxFw22slwuSIji7wsSQCuHLJ0tnIff
 fwwgKcRow6L2cHIznRVplukrQ1B4VUQBc88h5mD0ydeJ52F5uRBFAvPuL5UJfine9nFx
 Mru4Ykr/ofpksKeoJnVoCN2QXuNH0jH6lqIIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701976494; x=1702581294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ge3Rk2B21QhsOmEMG5m3LjdIZh1PEMQWoh/W4fwv0Lg=;
 b=aGSRhd1j+2qtKSpfiZ0M7zGmMhcVhzyV/bVz/OJOst/L+6d2VGr2oxD/+mJ86NTskR
 XNild0ow9s9szgM2oSRMveVVHPCuBwawTZep6tghrPbHGmL1uKfVMKtI2yNzhnwrJSUB
 spU7JQomVF8UD1uCN8A03vIF5aTGEj9FwZMpeUwT9o8UPND+lixcHFMEuSQhv2JHfDIK
 NqWL7DEs1Eb3x+nnb9+hqbrBDS+xe9KeHadW1ksP3Irb4m8y7WP4c+LkrNEUjhIJ39PI
 4ERzcDWoJm3GwYE57+amYBUdmAVhfCcNgRAOs+Baw33kC78jQDPly7LU8MjY/9Xvyufl
 vXow==
X-Gm-Message-State: AOJu0YxUBJdHIDzTYrebjN6HRhMWNJ9HMwJImgyAgQNmNwxAKaSMfffR
 A9tcZeLIlryTbofKR9WM6BeP5BP+0eyCNM9hLAYDgg==
X-Google-Smtp-Source: AGHT+IFTOonpRsdmQ9YymtJJynCmJKAO++dezLPGF+9749ap6847ZH4BQgjP36bK4ZdX5uNLPSumsA==
X-Received: by 2002:a05:6512:12c2:b0:50b:f8b5:8275 with SMTP id
 p2-20020a05651212c200b0050bf8b58275mr2050038lfg.69.1701976493941; 
 Thu, 07 Dec 2023 11:14:53 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 k19-20020a508ad3000000b0054ce1061c84sm143892edk.77.2023.12.07.11.14.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 11:14:53 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40c2db0ca48so8915e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 11:14:53 -0800 (PST)
X-Received: by 2002:a05:600c:364b:b0:40c:1e46:508e with SMTP id
 y11-20020a05600c364b00b0040c1e46508emr8036wmq.0.1701976492706; Thu, 07 Dec
 2023 11:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
 <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
 <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
In-Reply-To: <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 11:14:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
Message-ID: <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 7, 2023 at 10:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Thu, Dec 07, 2023 at 10:23:53AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium=
.org> wrote:
> > >
> > > These panels are used by Mediatek MT8173 Chromebooks but we can't fin=
d
> > > the corresponding data sheets, and these panels used to work on v4.19
> > > kernel without any specified delays.
> > >
> > > Therefore, instead of having them use the default conservative timing=
s,
> > > update them with less-conservative timings from other panels of the s=
ame
> > > vendor. The panels should still work under those timings, and we can
> > > save some delays and suppress the warnings.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++=
++
> > >  1 file changed, 31 insertions(+)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Repeating my comments from v1 here too, since I expect this patch to
> > sit on the lists for a little while:
> >
> >
> > This is OK w/ me, but it will need time on the mailing lists before
> > landing in case anyone else has opinions.
>
> Generally speaking, I'm not really a fan of big patches that dump
> whatever ChromeOS is doing ...
>
> > Specifical thoughts:
> >
> > * I at least feel fairly confident that this is OK since these panels
> > essentially booted without _any_ delays back on the old downstream
> > v4.19 kernel. Presumably the panels just had fairly robust timing
> > controllers and so worked OK, but it's better to get the timing more
> > correct.
>
> ... especially since you have to rely on the recollection of engineers
> involved at the time and you have no real way to test and make things
> clearer anymore, and we have to take patches in that are handwavy "trust
> us, it's doing the right thing".
>
> I'd really prefer to have these patches sent as they are found out.

It's probably not clear enough from the commit message, but this isn't
just a dump from downstream 4.19. What happened was:

1. Downstream chromeos-4.19 used the "little white lie" approach. They
all claimed a specific panel's compatible string even though there
were a whole pile of panels out there actually being used. Personally,
this was not something I was ever a fan of (and I wasn't personally
involved in this project), but it was the "state of the art" before
the generic panel-edp. Getting out of the "little white lie" situation
was why I spent so much time on the generic edp-panel solution
upstream.

2. These devices have now been uprevved to a newer kernel and I
believe that there were issues seen that necessitated a move to the
proper generic panel-edp code.

3. We are now getting field reports from our warning collector about a
whole pile of panels that are falling back to the "conservative"
timings, which means that they turn on/off much more slowly than they
should.

Pin-yen made an attempt to search for panels data sheets that matched
up with the IDs that came in from the field reports but there were
some panels that he just couldn't find.

So basically we're stuck. Options:

1. Leave customers who have these panels stuck with the hardware
behaving worse than it used to. This is not acceptable to me.

2. Land Pin-yen's patch as a downstream-only patch in ChromeOS. This
would solve the problem, but it would make me sad. If anyone ever
wants to take these old laptops and run some other Linux distribution
on them (and there are several that target old Chromebooks) then
they'd be again stuck with old timings.

3. Land a patch like this one that at least gets us into not such a bad sha=
pe.

While I don't love this patch (and that's why I made it clear that it
needs to spend time on the list), it seems better than the
alternatives. Do you have a proposal for something else? If not, can
you confirm you're OK with #3 given this explanation? ...and perhaps
more details in the commit message?


I would also note that, hopefully, patches like this shouldn't be a
recurring pattern. Any new Chromebooks using panel-edp will get
flagged much earlier and we should be able to get real/proper timings
added. I believe that we've also added a factory test so that
(assuming it doesn't get ignored by someone) devices that aren't
supported don't even make it out of the factory.

> Also, the fact that the 4.19 kernel mentionned in the commit log is
> actually a downstream tree needs to be made much clearer.

Yeah, that would help too.
