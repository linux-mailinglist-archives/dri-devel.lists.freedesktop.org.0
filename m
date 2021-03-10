Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B0334970
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFCC6E39B;
	Wed, 10 Mar 2021 21:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8156E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 11:44:18 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n132so17578760iod.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 03:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=op8MuAs4SRxmTKVvah22QByz3q7Mi3iArZEjUk+Thxk=;
 b=tbZ0SW438zSVkyxkrUhPs282MdsJiT0nydSL1+q+VaeYCp1wR8gU7zUe/TUlSYglgs
 iIIIODc35S1SjI7uAF2/h03PXLNXux2vFLXcDxyq/ltPNbSZZ+PQHSXmj/FRCFuqxbto
 lxjj5dWzSescFEfPuLEUc5QVzR9hZEli26Wt4Q5IAuiWYr35c/1Xe+qihbPXQ9JSDBqH
 YPQ8wM3w5MZBkLolu9DGVN443g1F1hXK4D9B1/hjCnDMAeLrNQDuck9jIUCkskFy6Ezb
 /0N+E/Ry/VxfIWVLKcCCb5RLWGmjPoNitIV/QJL26I8g429kqEVv8PTtGYxzzuTnST9l
 yKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=op8MuAs4SRxmTKVvah22QByz3q7Mi3iArZEjUk+Thxk=;
 b=POrGZY1/tovNCreDD2Fvf9g7/T1kcVzjWbnb+EHUfl7US2U9AB9J3H0IXCkS1uB1Pa
 ar6F35+IUpzAR5PenhMqiiB+0bUIk2CqfyyqWcUrDjrbUY9oIOLywXOh8IRmPRmegGMX
 LcprMz43ttHW3CZGn5Rt8d1epneraYR3SWqu7FaHmgtLCuhEecd6iasR/HUSwu7aTjE9
 XnPVX7lE6xcRUuc2JOpDphx6GT1pZae8sAJvMzeR/mxcfKjbF9SVCYk+JLwP9zw3NGbA
 ljvubJRwjjUZpeE/XsFbMhJe8f91r/fXjEguOz5luptkaZWXTlGapGuhdhJmrtLyis/+
 XSeQ==
X-Gm-Message-State: AOAM532zqFHWZn6pdbfmn6g4wyOm9E97Uc1HlKPS2QtSh3kPwZIloo7X
 BMOcXFWQYZ9WBJyIYYy+vnSZFu6BunsC9FIQDrs=
X-Google-Smtp-Source: ABdhPJz5M2eWPKf4NxOL+8DZYRTGWBX7CV9I1yHd6MspCfR/Ca1EfgXEzeeymZdkKrLM+bP4UCLuaOhuoetCi1bJpNg=
X-Received: by 2002:a5e:a519:: with SMTP id 25mr1857796iog.3.1615376658157;
 Wed, 10 Mar 2021 03:44:18 -0800 (PST)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
 <159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com>
In-Reply-To: <159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Mar 2021 19:43:42 +0800
Message-ID: <CAL9mu0KBKVufGx96=_5dWokC0uJBW35TnFxEofXA44QhpEK6-g@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Approved-At: Wed, 10 Mar 2021 21:07:59 +0000
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hua Dillon <dillonhua@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 thierry.reding@gmail.com,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

still need more expert to review, so just a gentle ping for this patch

On Wed, May 27, 2020 at 4:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting dillon.minfei@gmail.com (2020-05-27 00:27:30)
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > stm32's clk driver register two ltdc gate clk to clk core by
> > clk_hw_register_gate() and clk_hw_register_composite()
> >
> > first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> > second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> >
> > both of them point to the same offset of stm32's RCC register. after
> > kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> > is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> >
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
