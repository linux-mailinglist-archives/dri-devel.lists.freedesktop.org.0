Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7E811929
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 17:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1A10E2C8;
	Wed, 13 Dec 2023 16:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8F10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 16:23:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so9921689a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702484612; x=1703089412;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gsdEQAXsgtznujqAEAvqQItQWpAu92BPfR9s82X+6vY=;
 b=E2lu0yA5fBsnN4y4kyWV3L/jEHZ4blDY4VpccBReJWJA+fBC8hpG0KYyPQ0DO2O/pJ
 olZ4xqnMCbo9JCEUKCXVb4dWxnrNsXYSUMIXAzKuaEkQZFBNgK0fWa23kluPzkju/I70
 HwxoUhBMlofhojHbJfFl1qHx5bx4j5hc42xe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702484612; x=1703089412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gsdEQAXsgtznujqAEAvqQItQWpAu92BPfR9s82X+6vY=;
 b=LIyAurZN7WtLScM1nOcRRwT1/j81dF7mfPky0G+je5hMgxKMq6iGBhybumIMOQPJ7O
 w0O+bnPj+FNP3TBEBec5UDfrWpo67bCyrmo2Yf/jyZUixjcfHw659m1QtHLo+wmsELK1
 HF5g/YB5BgxPLkDpkKWaB0fmb6ZfF+QP4QKW9yWD4Syk2cn1Dphy0vhUMO9Jy42qdaN4
 DBT7HfUFzgvbfNaXpn22geKlUzMv1tt/p6hjZQW4mXkiwvWOJadLjQLpICL+ZtSkqTf3
 gz91bfKa8X0+booi7Bh/0bucI7XLkrQkdIZXWLPXAp99h31XxBrME3KNXSyoI+Uw9PDy
 wrTQ==
X-Gm-Message-State: AOJu0YznJ3sISP//7MdV0w/NGRWGWKNzkRbX9Hysp4B1Wk/FaT32y7Xa
 ALJCyjKpYsdG9dbmbjDjgJeUM7NJEnKDSGqxZSXPTE5I
X-Google-Smtp-Source: AGHT+IHVm4eg4cb7kbBcMUGTlX6AozvuEwlUolwOhrKFWTSeWfPdscXXR2hRxlwS3PrfYQg3k3PJLw==
X-Received: by 2002:a17:907:1dd4:b0:a19:a1ba:8cdd with SMTP id
 og20-20020a1709071dd400b00a19a1ba8cddmr3567920ejc.123.1702484612622; 
 Wed, 13 Dec 2023 08:23:32 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 fb4-20020a1709073a0400b00a1c76114fcesm8045461ejc.218.2023.12.13.08.23.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 08:23:32 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40c32bea30dso74745e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:23:31 -0800 (PST)
X-Received: by 2002:a05:600c:5113:b0:40b:4221:4085 with SMTP id
 o19-20020a05600c511300b0040b42214085mr424914wms.1.1702484610953; Wed, 13 Dec
 2023 08:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
 <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
 <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
 <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
 <cplpgkl5b3nrtdhxauleep6zo2rwic7h7fiwr4wnvrwk6uzxgw@dcgknug2gsaa>
In-Reply-To: <cplpgkl5b3nrtdhxauleep6zo2rwic7h7fiwr4wnvrwk6uzxgw@dcgknug2gsaa>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Dec 2023 08:23:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UiF9d5C=da64dj_JnGWuO_vGUg1hgzXSQd0x+pFpe23w@mail.gmail.com>
Message-ID: <CAD=FV=UiF9d5C=da64dj_JnGWuO_vGUg1hgzXSQd0x+pFpe23w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
To: Maxime Ripard <mripard@kernel.org>, Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 13, 2023 at 7:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > > > Repeating my comments from v1 here too, since I expect this patch t=
o
> > > > sit on the lists for a little while:
> > > >
> > > >
> > > > This is OK w/ me, but it will need time on the mailing lists before
> > > > landing in case anyone else has opinions.
> > >
> > > Generally speaking, I'm not really a fan of big patches that dump
> > > whatever ChromeOS is doing ...
> > >
> > > > Specifical thoughts:
> > > >
> > > > * I at least feel fairly confident that this is OK since these pane=
ls
> > > > essentially booted without _any_ delays back on the old downstream
> > > > v4.19 kernel. Presumably the panels just had fairly robust timing
> > > > controllers and so worked OK, but it's better to get the timing mor=
e
> > > > correct.
> > >
> > > ... especially since you have to rely on the recollection of engineer=
s
> > > involved at the time and you have no real way to test and make things
> > > clearer anymore, and we have to take patches in that are handwavy "tr=
ust
> > > us, it's doing the right thing".
> > >
> > > I'd really prefer to have these patches sent as they are found out.
> >
> > It's probably not clear enough from the commit message, but this isn't
> > just a dump from downstream 4.19. What happened was:
> >
> > 1. Downstream chromeos-4.19 used the "little white lie" approach. They
> > all claimed a specific panel's compatible string even though there
> > were a whole pile of panels out there actually being used. Personally,
> > this was not something I was ever a fan of (and I wasn't personally
> > involved in this project), but it was the "state of the art" before
> > the generic panel-edp. Getting out of the "little white lie" situation
> > was why I spent so much time on the generic edp-panel solution
> > upstream.
> >
> > 2. These devices have now been uprevved to a newer kernel and I
> > believe that there were issues seen that necessitated a move to the
> > proper generic panel-edp code.
> >
> > 3. We are now getting field reports from our warning collector about a
> > whole pile of panels that are falling back to the "conservative"
> > timings, which means that they turn on/off much more slowly than they
> > should.
> >
> > Pin-yen made an attempt to search for panels data sheets that matched
> > up with the IDs that came in from the field reports but there were
> > some panels that he just couldn't find.
> >
> > So basically we're stuck. Options:
> >
> > 1. Leave customers who have these panels stuck with the hardware
> > behaving worse than it used to. This is not acceptable to me.
> >
> > 2. Land Pin-yen's patch as a downstream-only patch in ChromeOS. This
> > would solve the problem, but it would make me sad. If anyone ever
> > wants to take these old laptops and run some other Linux distribution
> > on them (and there are several that target old Chromebooks) then
> > they'd be again stuck with old timings.
> >
> > 3. Land a patch like this one that at least gets us into not such a bad=
 shape.
> >
> > While I don't love this patch (and that's why I made it clear that it
> > needs to spend time on the list), it seems better than the
> > alternatives. Do you have a proposal for something else? If not, can
> > you confirm you're OK with #3 given this explanation? ...and perhaps
> > more details in the commit message?
>
> I don't have a specific comment, it was more of a comment about the
> process itself, if you write down what's above in the commit message ...

Pin-yen: can you take a whack at summarizing some of the above in the
commit message and sending out a v3?
