Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171EF23F72E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 12:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14516E1F8;
	Sat,  8 Aug 2020 10:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900726E1F8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 10:03:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g6so4667004ljn.11
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bY1+ejRUfvb0F6yLEgYZXgNa6+RS7H+Cj3Ozktz76Ak=;
 b=ccv9h6USbtcK84tfnxpM/1A65JH98BtuqSHvoScMkohJrwk8oA6V56doPVEcJ2xduS
 y+QNWK2Qeseqwwtdv23/Khvg1bPT6ycN9D6OnL29t/D4Bn8xpoLo5hcwY2Ygetq4y77j
 Yi55Jk3byY1OEC19NMpdEvBMkuK6LEMsGXQeb1GSr2N4GGsKPGRwhz0f0P//EjKK+OIR
 k9tseFdEU587+mKlgqpriBp/m6Si9ns+HPYP1LFoyeIgQcW3/RNeAFuspkHgeix6MNaB
 pOg0jUApmDETyYQwttq55/6EuMcGD3xDt4zrBvkCZgL9I15moXUwe6kgtuJCxBHPsOBX
 P4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bY1+ejRUfvb0F6yLEgYZXgNa6+RS7H+Cj3Ozktz76Ak=;
 b=dyqVJ3ZQwN5FgJNDuj/M8Vj2AeLHd7xaRlLv0MP/LT8v0enWBBiKK64xNkdFRG2FE4
 qbyIOFra4zRqi9FXpNilDry2gO6PaO8o5VZVzClxlzbVfSkFHsCJJf9OF/ELo4dHakPR
 cw1oicHlkMs6RxC2sqsaaPKi4g4T96C5APmJXbR5qNyk8ZOkmg1fFA7+g3L1QBvnArgY
 RbIJ9zFwiLQjsnYrUPv0o+gp2r+cafSBHKs0CNKt1Lnq/YoSmQrR3IM0XkDHDyQoFkcR
 aI1sCPTOZ/lNwQAiLHtnXZZF/a20Sb7j7FMkuNq5Ibc9ZOitsTOqBFvEMPcLEKSVYtQN
 6+7g==
X-Gm-Message-State: AOAM530e6wPwH4e8okCOdAt4VmN+pk83e6wcWXuDCgdBJlBxmgCJ80n1
 TEXnutvE5aRFYLJ2I84m4qJBNhk563LdyAl8n9TKgQ==
X-Google-Smtp-Source: ABdhPJwuJPAqktxjBFGxY96W/VTkQGdCMa/9Rk3OIIqqV4JkPDK5r8c4vPqTueq7bOurPhNR4mhJNIK3Fc7L6F/CIgk=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr7382164ljc.338.1596880998831; 
 Sat, 08 Aug 2020 03:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200805142808.670451-1-linus.walleij@linaro.org>
In-Reply-To: <20200805142808.670451-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 8 Aug 2020 12:03:08 +0200
Message-ID: <CACRpkdYuJMxEBhkraGZFPzRCReytU+J=bD0W+saVcjaaEpjgvA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-notatek-nt35510: Fix enable/disable sequence
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 4:28 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The driver was relying on only prepare()/unprepare() to
> enable/disable the display.
>
> This does not work because prepare() will be called
> before the DSI host/bridge is ready to send any DSI
> commands and disable() will be called after the DSI
> host/bridge is disabled and thus unable to send any
> DSI commands.
>
> Move all DCS command sending to the enable() and
> disable() callbacks, as is proper.

Ahem this is against how all panel drivers are written.
Surely the DSI host must be up and running at
prepare() and unprepare() time.

I take this patch back to the drawing table.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
