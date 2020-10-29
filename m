Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797929F0D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647C89D67;
	Thu, 29 Oct 2020 16:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727C289D67
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 16:10:43 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id f4so1812114vsk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TpGj3kui/uWkJ5JQ6tLFNod5bmWWhITkgZJTIzMYPtU=;
 b=Cp5WodJ1rDzMKOKwvLW9Vt6q87Cyvqypv9McqhqXK6314eO8APXaRoAM0apTMDSZkd
 NtIqaNOGuuGXSnWejT5xIJm1ctVN+sSadhqardp6jqQ69YdR/bc+8sgfK6KXm80BnZMW
 aNHfnvzU0Pk5Yb/Y44jkpVJ2sVpqiyOJ2jlH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TpGj3kui/uWkJ5JQ6tLFNod5bmWWhITkgZJTIzMYPtU=;
 b=Pdv33etxvKj/MrRONqfkaQJr0/KFZUaT23mIMOdBRSOm8agiB2XM5WqeoWMeNWDvTI
 sepHamC7hzDdnZc1Bbajz4hzYR2QlmjYqPbAaZAia232Zz+iWq1yvQcbRmthDYCZBHJC
 zCGbsfJdysL2e9OFVhPrE1wyEamX7ij6TwHOq404/9/7DUROKgL21KMmWgi1XQpsohUg
 8eWrKj6eAvz49sfcSiATouacD0XrUtfZFK3DF6LMJqQyUgU93XDA9rJcLK5ZhsMJWL+h
 ZSHNaGr9YLpvgByC/TktiQlydKaODirH5yciw/HQJLNYNrDevgQo+6u76PfKVGHv2mRa
 8TOA==
X-Gm-Message-State: AOAM531xDzo8qfgUvq/QEnk8sgaGMK5CFKZaOpPh/jjHGRbfF7UZtKOl
 Jrk0dsMYAPw+WZeXAEdcJWRaA8ZEkT3wWA==
X-Google-Smtp-Source: ABdhPJx/wx96YjHCfPhbmjfV6bWDlL4r2nmXeWC4TbIad/UrvgEOJTAYOrq8aIFwtBdSy0+nOJDIMA==
X-Received: by 2002:a67:7c8b:: with SMTP id x133mr4086266vsc.5.1603987841814; 
 Thu, 29 Oct 2020 09:10:41 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id a190sm385095vka.54.2020.10.29.09.10.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:10:41 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id x11so864658uav.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:10:40 -0700 (PDT)
X-Received: by 2002:ab0:6034:: with SMTP id n20mr3245765ual.90.1603987840438; 
 Thu, 29 Oct 2020 09:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-2-swboyd@chromium.org>
In-Reply-To: <20201029011154.1515687-2-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2020 09:10:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUdYR-R9r9BoHWSoQEejL3P0r+bG1m787tVkNQHhZDuw@mail.gmail.com>
Message-ID: <CAD=FV=UUdYR-R9r9BoHWSoQEejL3P0r+bG1m787tVkNQHhZDuw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Combine register accesses
 in ti_sn_aux_transfer()
To: Stephen Boyd <swboyd@chromium.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 28, 2020 at 6:11 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> These register reads and writes are sometimes directly next to each
> other in the register address space. Let's use regmap bulk read/write
> APIs to get the data with one transfer instead of multiple i2c
> transfers. This helps cut down on the number of transfers in the case of
> something like reading an EDID where we read in blocks of 16 bytes at a
> time and the last for loop here is sending an i2c transfer for each of
> those 16 bytes, one at a time. Ouch!
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>

+Sam Ravnborg has helped land a few changes to this bridge drive in
the past, so maybe good to CC him if you have future spins?

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++---------------
>  1 file changed, 22 insertions(+), 28 deletions(-)

Since we already did some early reviews off-list, it's not a surprise
that I have no comments.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
