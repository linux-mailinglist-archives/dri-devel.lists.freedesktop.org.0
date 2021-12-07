Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429346BCB7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926D6FEE2;
	Tue,  7 Dec 2021 13:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA17D6FEE2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 13:34:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so2256763wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnIhW+EiXgBXh++RaHcv03R8xX6b3n8BSWI/luNYeWw=;
 b=I9GEaQlsXk7Pguq1MGDK7tYI/dSIz60faYewkn4vQY4uEDQB6StsRidKEQnJaubLdc
 xqWclJMfEMP/j5TVoG0kFkoJrP2sayZGIxPJSQW4Xpsngz8S4fB91BwDNFxJ7jkUfAJW
 YdkZwvLGcH2N6qTnkKfcRpR6kxZt04cH3HpqRhyytNnFTLXW0FaUfRZgDyVzjxwlhqIi
 KmtZaELIsBKmKH3eEIIrHGbvyM7XYie4yzXDLLItHMoRyIJF4mvWUFic0jjljQTvSyJA
 I6MtVPRfKkwUxunRj5mY2KGZTh3rQHC4BIw2aJScT8b527RC2fKkcniEXBCL+MycoFlU
 euUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnIhW+EiXgBXh++RaHcv03R8xX6b3n8BSWI/luNYeWw=;
 b=7vdsdXQ7izpyEPbOyqv9/k1DoRxtMmGvjoShyNvmlpAJsRulCZqczXZkCIansEekHe
 koPNtZVrP/JzUgLWJC96dQsJ+ZnlpqYOuqz6go8/hOB31yaOi8y9DWAsKkYaoM12SNeT
 d2VjzBAEE4m+OTLDXq5dbbQ6QivJz5YVaTDzpxvMY9s6i+r8Bc8Bm0UV3m0WyBFfqRwF
 jryqdrh6SJraeHgPevYy0UR8QU9lKXQcjwk1g5+Zwhe15Oc+/JTh5SJPEdEE3hfV/9UD
 Fkmkljs8Y4YWCHkMxNSWTu71ecmfosdrBcLBZWUHNsXks3mItBmVnHaneZbb5RanqG9q
 XEjw==
X-Gm-Message-State: AOAM532QcUF3R/1Fgx4+UekcFy9jdTdAhx/9Y81GkFhaFv8Aajl9UfMg
 v+Pn+ZbNnYfAjBu76O/L1EjzCUU51tUVJejCnTfutA==
X-Google-Smtp-Source: ABdhPJyv2yQ3lm0VFWed0zW68uiR1DkAIkbvmVjPqUcHIh8lBwPoqIOYg07Na9vQYuTtuytNg9CZfD8F0drmCGHuzeI=
X-Received: by 2002:a05:600c:3846:: with SMTP id
 s6mr7034266wmr.55.1638884082970; 
 Tue, 07 Dec 2021 05:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
 <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
 <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
In-Reply-To: <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Dec 2021 13:34:27 +0000
Message-ID: <CAPY8ntBd1o-OpXAUf3s-OHCHrJ2VOt0HVn9sGOcXRd_2kUYG3g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Dec 2021 at 20:24, Marek Vasut <marex@denx.de> wrote:
>
> On 12/6/21 19:01, Dave Stevenson wrote:
> > Hi Marek
>
> Hi,
>
> >> The TC358767/TC358867/TC9595 are all capable of operating either from
> >> attached Xtal or from DSI clock lane clock. In case the later is used,
> >> all I2C accesses will fail until the DSI clock lane is running and
> >> supplying clock to the chip.
> >>
> >> Move all hardware initialization to enable callback to guarantee the
> >> DSI clock lane is running before accessing the hardware. In case Xtal
> >> is attached to the chip, this change has no effect.
> >
> > This puzzles me as there seem to be a couple of ambiguities over how
> > it would be used.
> >
> > Firstly the DT binding lists the clock as a required property, but
> > there isn't one present if deriving the clock from the DSI clock lane.
>
> That's correct, the clock for the internal PLLs are derived from the DSI
> clock lane.

Does that mean you're creating a dummy clock device?
If it's a required property then presumably yes, but it seems a little
odd as that reflck does not exist.

> > Secondly the datasheet states that the DSI Reference Clock Source
> > Division Selection is done by the MODE1 pin, and switches between
> > HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
> > assumption that HSCK is either 364MHz or 468MHz, thereby ending up
> > with 26MHz. To do this we have to be running DSI in burst mode, but
> > the support for that in DRM is near zero.
>
> Yes, you have to run the DSI clock lane at either of the two clock
> frequencies, that is rather limiting. The DSI has to be running in
> continuous clock mode, this has nothing to do with burst mode, the burst
> mode is a DSI host setting which is supported by most DSI hosts.

OK burst mode is technically dropping the lane to LP mode, and you
don't need that state transition.

To quote the Toshiba datasheet:
"As the clock derived from the
DSICLK has to be fixed at 13, 26, 19.2 or 38.4 MHz, the DSI Host may
need to run DSI clock lane at
higher frequency than needed by frame rate and may have to send the
DSI video mode transmissions in
burst mode (explained in DSI section of this specification) "

So where are you configuring the DSI clock lane to be running at one
of those frequencies? Or are you requiring your panel to be running
with a matching pixel clock?

> > Can I ask how the chip has actually been configured and run in this mode?
>
> REFCLK Xtal disconnected and HSCKBY2/7 MODE0=H MODE1=L , that should be
> all you need. Do you plan to develop a board with this bridge ?

Yes, I have a board with this chip in DSI to DPI mode that I'm trying
to get to work. The intent was to configure it via DSI LP commands
rather than I2C, but currently it's refusing to do anything.

  Dave
