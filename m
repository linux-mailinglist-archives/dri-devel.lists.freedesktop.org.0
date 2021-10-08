Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68F427320
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591A6E108;
	Fri,  8 Oct 2021 21:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695D96E51A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 21:38:06 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z184so12228790iof.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/00gewG7UHvLp0h/Ly/IXeN+qoVZwxiCoqxtVebbaI=;
 b=dQ0efTIPLYgHkP9U3dBEnvmvLY8za0lfnn/jylE/ulZ7zzSc1RBgqjCPWTJbCywGq6
 cpcZej1RcJAyZQ/UhxVaE7tvdYg7DQI/2Els9a0Xjzo6Si3dcWw3ltdvGFRVsCniX3+0
 LABaOfhs3fvNty6v0UECd4B4StXBRl+6QmoiwtXAfBPgIvUqenZJEs+NqDqIM9rGE9Rf
 QhXCblG3djveSWk5T98TPMRXSDvDnmaNIOsPKPZyXJKg4hjzaw+Cv1z4APTMPb1YMLy4
 A3X643heB80Rhlfhmo6o2AFNOf4UfJEKkndgWAky5btmvpHG/9hVh1G1AJGX9Cjolc2i
 WkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/00gewG7UHvLp0h/Ly/IXeN+qoVZwxiCoqxtVebbaI=;
 b=zs4yxpGyCimolnlnZLEtMHZSAjmhVsaktFLT+/O300bLRaM4AIGAaYkK6BwRM/1dfh
 +yTUFRqkttDeY5OZR+p23RRn5QJd8gK3RBHgsrs+IWqJyMryLtO6W5U+CRnzcASvEqyH
 IbwRRq8fbqqzNLkhE2Y5Zgim6bYGrnJ2MdtWY9BI1K1D1wgcYufML2rsbZDBNzTONRTF
 xCbvjC0/09XHBHbROhn0ihzmDuPgI+qBIXNpPkSRGBNCb+RA9fkiHO3cRYgYvkOUqY+T
 hoxxUwliHhb1ZzWabIPQq9EYGdXxljn8XDmmTgTjtV1S9VYn2Av67FeiOxH28Noe5W9s
 +VRw==
X-Gm-Message-State: AOAM53117nlENU3l4CQcouQu9aqV6d6F13hY9VSH2Ra5kPrKEjzrGyWH
 c3uwz2J5nnRHOHC2aBs/WhOjE9zsqu96y/JVGZ5IaA==
X-Google-Smtp-Source: ABdhPJyTKjP0ROPI3lwiR64pOofPrdgty82JjDrOFyBtUPNFTt7D9ijmUlMj5dyBjrcq0P+6VIjSXFzDNz2EEnEXtzw=
X-Received: by 2002:a6b:f915:: with SMTP id j21mr9273745iog.98.1633729085509; 
 Fri, 08 Oct 2021 14:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org> <YV5vIyhy+m+Nx/gQ@ripper>
In-Reply-To: <YV5vIyhy+m+Nx/gQ@ripper>
From: Doug Anderson <dianders@google.com>
Date: Fri, 8 Oct 2021 14:37:52 -0700
Message-ID: <CAD=FV=UZoZ6amH9KfJOMWy9AHfGOuEpCPJYDy5YCtks6WqVkLw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 "Uwe Kleine-K?nig" <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-pwm <linux-pwm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 6, 2021 at 8:51 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 29 Sep 20:05 PDT 2021, Bjorn Andersson wrote:
>
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Any feedback on this?

I feel like Uwe and you have spent enough time on all the math and it
is clearly working well for you, so I continued to not dive deep into
it. However, in general I think this has been spun enough and it's
ready / beneficial to land.

It sounds like Robert has agreed to do the honors (assuming Uwe acks
patch #1) and that suits me fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
