Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EA7A4E99
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 18:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66110E098;
	Mon, 18 Sep 2023 16:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9E10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 16:19:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso77248181fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695053989; x=1695658789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbOQzNmAo2PKtDx0msSwuX8Ix4PNWb6iOgapQHbD27Q=;
 b=lCgHwGEtUH/LvGhIHqjcBzUB/VSQUAby2L7/7EKD7F6pHLVfoqH9GGf3T2hffh78oL
 qt0G8LbPdH/JOm1nikLyOBOKzS4PaR54EEp/9LzaGEpsevmqNALvIuwLg0TzFJdUex9c
 AqtxhprExAqPKkl/g/mKEA2ML7JMECtBfjih0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053989; x=1695658789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbOQzNmAo2PKtDx0msSwuX8Ix4PNWb6iOgapQHbD27Q=;
 b=nqG3qaK7kSv94ZqQHGMD0C5pWenK6wjaYk9Ehm/TWAwIIfPuFEKp+uMCeN3QRnXhZ/
 PYQ1RLIffTjpSaD3dmrZkwL13pSrjGjReevjzEzsoybRo4e/p2V3K7Mprmh+ytR3PQk3
 z8SmHvGdrQZiAj5oEykmwge8kJo/Vf3FFMVpBM3Oh1Nl3SzWbCzNIsdx2+JukILKmmoZ
 yfDxBX39KlwoEsi4ghUxIlWqzAa/UZRM3ucA9NRUaIIUj8VWWTHoyLY1H8N6TD32Amba
 Z/0210vU97XqhWf1G1XL5IHxjTvSela8toCC4PFOM4V1VkA3vgb6I3+8WprikUkIKPNA
 2VsQ==
X-Gm-Message-State: AOJu0YyHWdAC0Ik3r8xgy2v0Cj5xi6n5ytutsExFM3xA3TiKHqN4/agw
 TgXEEiohA9WCn9Z848TXOVZL+YF6ben/vkOUGMoqFM08
X-Google-Smtp-Source: AGHT+IEB0fhZWUbrtUW92xwVVQLbYO6PRHs1e3FgDW4LXb1oHnVjs+2XrHfKEbO3ePV704a9L9WW0g==
X-Received: by 2002:a2e:8756:0:b0:2bf:7894:a490 with SMTP id
 q22-20020a2e8756000000b002bf7894a490mr8574157ljj.38.1695053988853; 
 Mon, 18 Sep 2023 09:19:48 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 u14-20020a170906068e00b0099ce025f8ccsm6586848ejb.186.2023.09.18.09.19.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 09:19:48 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso106885e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:19:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3b14:b0:3fe:f32f:c57f with SMTP id
 m20-20020a05600c3b1400b003fef32fc57fmr206022wms.0.1695053987860; Mon, 18 Sep
 2023 09:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Sep 2023 09:19:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
Message-ID: <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 6:21=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This is two patches fixing things I would normally complain about
> in reviews, but alas I missed this one, so I go in and fix it up
> myself.
>
> Discovering that a completely unrelated driver has been merged
> into this panel driver I had to bite the bullet and break it out.
> I am pretty suspicious of the other recently added panel as well.
>
> I am surprised that contributors from manufacturers do not seem
> to have datasheets for the display controllers embedded in the
> panels of their products. Can you take a second look?
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Rebase on drm-misc-next
> - Convert the two newly added Starry panels as well.
> - Break out the obvious ILI9882t-based panel into its own driver.
> - Link to v2: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v2-=
0-457d7ece4590@linaro.org
>
> Changes in v2:
> - Fix a missed static keyword
> - Link to v1: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-=
0-8ac378405fb7@linaro.org
>
> ---
> Linus Walleij (4):
>       drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
>       drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking
>       drm/panel: ili9882t: Break out as separate driver
>       drm/panel: ili9882t: Break out function for switching page
>
>  drivers/gpu/drm/panel/Kconfig                  |    9 +
>  drivers/gpu/drm/panel/Makefile                 |    1 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 3037 ++++++++++--------=
------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  759 ++++++
>  4 files changed, 2067 insertions(+), 1739 deletions(-)

I'm curious what the latest on this patch series is. Is it abandoned,
or is it still on your list to move forward with it? If it's
abandoned, does that mean we've abandoned the idea of breaking
ili9882t into a separate driver?

From looking at things that have landed downstream in the ChromeOS
kernel trees it looks as if additional fixes are getting blocked from
being posted/landed because of the limbo state that this is in.

-Doug
