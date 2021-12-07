Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036646C0B5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B106893AB;
	Tue,  7 Dec 2021 16:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F64488FF4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:29:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d9so30661794wrw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72W4l2PLCDNR0whDqct7DU8KfmJz94DHzlY6IghILOk=;
 b=VImq4WkauZiyaoy3CJB9v/KKb6sRhlhFaF5nIojt+i0lH6k8aWY//Txpm0P11/+Kc/
 kGUssbVOjx/ieocMfFbz+jVAh1kwXXQqgjHr3oEeCCskh6w7/VsqzdN/4vxkrDToo6z7
 k1LGTN75kCvH+mUJTQ4uMxtiDXMg13M8FYOT7DEFkJnIl5KG7Jp7oyufmHsOQ+qGUsCg
 JJE5ZV6gHZm9E9tE5NpolJQOQ9Nqwh0pXcf4qtSzqza0wUhh45Y59BGuGnFCdBnJVXcY
 +CVAMHXi+68+xXmDHLtQxgBzw3thDUTnrA2I0jRwoRGmeoR3fDt2ZRzrtEOKfGY1Kyjw
 PnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72W4l2PLCDNR0whDqct7DU8KfmJz94DHzlY6IghILOk=;
 b=yXRjUHZKtdz4Ahhj6fYbfYs67PSxSRAj7OWEbMe4W2/LduRpAUy9Pd5kPa2M59reGh
 y/SJ044tJVWS+z3mIdObjiFgvpQ2QaOJbM3i0RJQfj+aWybc52Rsx7yrazsT+bJ0X7gD
 pqKHjeGBvPNkchU+O7shQF92YEJ7XbU404ZmSsvi0tu1hiIpMtCpJc0FfWPyGHdykr7h
 +oVZ+eEP1IvmZGKch/K8Ib+xIYVqVo74kt2IUMqFtdojykVnKQG969BlFEEkCPaWFSrF
 +Meq6eg0rvdtWGFGB2hOTJ+S5FOvO0G7wE8fa/509P1Q7d8gLDm5DvrhG82z0SuQdbX3
 2Rvg==
X-Gm-Message-State: AOAM533CzucGgxD8ItU6HusRZHUbsKdgfKGQR8uOKLBMMN0s+ga6izia
 UNaJaQP1CxafCc6qm8eaQ5yayIy58rYcfSdJbABxvQ==
X-Google-Smtp-Source: ABdhPJyhGZirIBSiHylvuJZ6UjBvgtWyYsuiDJYc7IwnBtNKiZ0B9RltHPBWolh4S7u4blOYk9R1El+bzG9n6UF96zk=
X-Received: by 2002:a5d:4883:: with SMTP id g3mr52354786wrq.590.1638894543844; 
 Tue, 07 Dec 2021 08:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
 <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
 <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
 <CAPY8ntBd1o-OpXAUf3s-OHCHrJ2VOt0HVn9sGOcXRd_2kUYG3g@mail.gmail.com>
 <4ed56b2f-7d00-60bf-180b-fcf13b0ec107@denx.de>
In-Reply-To: <4ed56b2f-7d00-60bf-180b-fcf13b0ec107@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Dec 2021 16:28:48 +0000
Message-ID: <CAPY8ntAknr+8STQj8C7uP2+X_FRNGAhUbZw9jT5vmMVh62rfRw@mail.gmail.com>
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

On Tue, 7 Dec 2021 at 13:59, Marek Vasut <marex@denx.de> wrote:
>
> On 12/7/21 14:34, Dave Stevenson wrote:
>
> Hi,
>
> >>>> The TC358767/TC358867/TC9595 are all capable of operating either from
> >>>> attached Xtal or from DSI clock lane clock. In case the later is used,
> >>>> all I2C accesses will fail until the DSI clock lane is running and
> >>>> supplying clock to the chip.
> >>>>
> >>>> Move all hardware initialization to enable callback to guarantee the
> >>>> DSI clock lane is running before accessing the hardware. In case Xtal
> >>>> is attached to the chip, this change has no effect.
> >>>
> >>> This puzzles me as there seem to be a couple of ambiguities over how
> >>> it would be used.
> >>>
> >>> Firstly the DT binding lists the clock as a required property, but
> >>> there isn't one present if deriving the clock from the DSI clock lane.
> >>
> >> That's correct, the clock for the internal PLLs are derived from the DSI
> >> clock lane.
> >
> > Does that mean you're creating a dummy clock device?
> > If it's a required property then presumably yes, but it seems a little
> > odd as that reflck does not exist.
>
> No. The refclk will become optional, but for that I need some more
> infrastructure work, i.e. some way to communicate the requirements of
> the DSI clock lane to the DSI host.
>
> >>> Secondly the datasheet states that the DSI Reference Clock Source
> >>> Division Selection is done by the MODE1 pin, and switches between
> >>> HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
> >>> assumption that HSCK is either 364MHz or 468MHz, thereby ending up
> >>> with 26MHz. To do this we have to be running DSI in burst mode, but
> >>> the support for that in DRM is near zero.
> >>
> >> Yes, you have to run the DSI clock lane at either of the two clock
> >> frequencies, that is rather limiting. The DSI has to be running in
> >> continuous clock mode, this has nothing to do with burst mode, the burst
> >> mode is a DSI host setting which is supported by most DSI hosts.
> >
> > OK burst mode is technically dropping the lane to LP mode, and you
> > don't need that state transition.
> >
> > To quote the Toshiba datasheet:
> > "As the clock derived from the
> > DSICLK has to be fixed at 13, 26, 19.2 or 38.4 MHz, the DSI Host may
> > need to run DSI clock lane at
> > higher frequency than needed by frame rate and may have to send the
> > DSI video mode transmissions in
> > burst mode (explained in DSI section of this specification) "
> >
> > So where are you configuring the DSI clock lane to be running at one
> > of those frequencies? Or are you requiring your panel to be running
> > with a matching pixel clock?
>
> This is a preparatory patch, so nowhere yet. I forced the clock lane to
> the required clock frequency on the DSI host side thus far. You can
> still configure the chip to derive clock from Xtal, even with DSI as
> data input.

Ah, I'd read too much into the commit text and read it as already
fully implemented with a DSI derived clock instead of refclk. Sorry.

Are you already working on the infrastructure changes, or are they
just vaguely planned?

> >>> Can I ask how the chip has actually been configured and run in this mode?
> >>
> >> REFCLK Xtal disconnected and HSCKBY2/7 MODE0=H MODE1=L , that should be
> >> all you need. Do you plan to develop a board with this bridge ?
> >
> > Yes, I have a board with this chip in DSI to DPI mode that I'm trying
> > to get to work. The intent was to configure it via DSI LP commands
> > rather than I2C, but currently it's refusing to do anything.
>
> I see.
