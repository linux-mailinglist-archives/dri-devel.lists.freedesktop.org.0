Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6BB426E04
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4171E6E077;
	Fri,  8 Oct 2021 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793856E077
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 15:46:44 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 145so8558919pfz.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ctiMOgcKNZbwO+I+bqoe2efiKehJePIhv+cYstntJA=;
 b=wV8L3vXA4wnMlHP7d3ZvnoXIXRXMZHy83oyPI01WT63WO4HeMg59TXqtqkMjJ8Cq5f
 +ykidzi9ffxYunMNLRGqPC4miH6GYlkaGrEpgdF7V1RwvaxIjdOeCX+Qt1X7N1dKlBkg
 uRrLa8DMbtQ4uiAGXXGqM4aEynitnk4bVHeZokSjKJg63i8W4t7OOGwvtwWMGRUPudbE
 YfT+I3P9KPIZ2/rVaRgyhzwAB0M23xNbsaUzDbPcgHFlq0vWkZc01Db6SindT0urkgD6
 GInkOuzUuLk5G2Lc7Mv9KRcsUKtSVQbtVKX3GUMQ8Hpyu4OYLSQsIu3bgjJ1+VdYH2hL
 /4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ctiMOgcKNZbwO+I+bqoe2efiKehJePIhv+cYstntJA=;
 b=BRHpWX0LKKVbhlBCTxIhZSTtw6axV9MFMB1RR0uj0g1f1fSkORjUMPpvYx39cbNK0j
 fso0iERsQhCGdsj0UbkGArHtmgyh7nivAw3PajPLw0dGXrayiog6OFV2VObfPSduVpkk
 KJuSvnpQ7FH/fNl6w4jeARzhMVru8AeStrFw05wsKoqB5y+IDQ4d0ocXqtKgAQw+XMqw
 FveEgGMgBvAsKIhOAdgJZL8aCNekhxwM3R+dPQg4y4rJTzzEThBNcAqqzL+EJqEY78NX
 g8apGlLlFaOCogeIMy34IudM5sDWN2XfbbIn/utgoSTGTacd5xXqnrqSdu43K0+pXFK6
 O5aQ==
X-Gm-Message-State: AOAM531UF2gyItFiNGJammcWIg2lBmUhXuaDIyc0cV5Kjj6hixRhh/sd
 LWRea822orzmKcE2KbJHsb/6bFgG+nxZmMje3jiiSw==
X-Google-Smtp-Source: ABdhPJxCIs63N1AEVoE9JLiVqD8Rt3LAnvm0WoiU5xo+0y+SBYvO324mUTInFk7lVWtwvrA/Z8x2JuqxPbscKJasGn8=
X-Received: by 2002:a63:3643:: with SMTP id d64mr5395570pga.110.1633708004080; 
 Fri, 08 Oct 2021 08:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org> <YV5vIyhy+m+Nx/gQ@ripper>
In-Reply-To: <YV5vIyhy+m+Nx/gQ@ripper>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 8 Oct 2021 17:46:33 +0200
Message-ID: <CAG3jFyuP_QDKP6iUZmte3u4s=HbxBPx2iDTR8uh=Sc=24hguVA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
To: Bjorn Andersson <bjorn.andersson@linaro.org>, 
 "Uwe Kleine-K?nig" <u.kleine-koenig@pengutronix.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-pwm@vger.kernel.org, 
 MSM <linux-arm-msm@vger.kernel.org>, Doug Anderson <dianders@google.com>
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

On Thu, 7 Oct 2021 at 05:51, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
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

I think this series looks good, and passes all of the normal sanity
checks. So I'd like to merge it.

Uwe: Can I have your ack on patch 1?


Rob.
