Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C86FB97A
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAB410E038;
	Mon,  8 May 2023 21:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0910E038
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:23:56 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ba1cde4ee59so3543075276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683581035; x=1686173035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jGQCX8Vl6J+teZGmxFzw1k6uuzeGq3x6M1Mg+KmvWU=;
 b=I88Y+UwW/ecdrdJYEYRQu84hQHEaAlwkBoqcY2OuiSC/fZd9XNJTetBoDsbTnL/mhS
 ZuE4HjGiHTZs634+rfTp1iWzyZKxHdtSgv1t0C8ngfs2JYKt0bUVW/j15pBp6NAhiKGR
 YKmwGJJP8/qagETAIGdZY8zpYZupX+SXkHtE5vyFWjBqJto4kUrgIwRuXcz+TO0lUGq8
 jMoSb6nX6bsJ4RBVQ5uYeqbPfz4tAm1FZBC0TrKwbGYr/DvRxfNR9D2rEu/sfehNSTkM
 zB4rT2OYkz5xjtBQkWRiDNoPPlQrctV8Ddiw1tEWVD53tZvZTnDKuAro4Tcxf0urL0Ic
 bzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683581035; x=1686173035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jGQCX8Vl6J+teZGmxFzw1k6uuzeGq3x6M1Mg+KmvWU=;
 b=OFhhFipog0id0ZwoCkdwcz4Bpij5Iu501DK32wP6X3NtLlXALdUlxNsklQvc5vCsLY
 KrODqY/S/yk3R4cSl5VrGPRG8n2AIJTnM5VV6EIK0Xo9igI03zRgSlEx9zphf7qyA5GZ
 sEHpFs7z1rcDQErY1MtnWLtVsUJpDDTv8SyPiII/R6U3DfRArkObqDqIfbCCnwqEk2Ih
 2JZtzI+nHiq+U8rjlKNoalGhglQ3FyBgW1HwOvFr+5+6Qk84mDa7MiFJUWlDStfL99CK
 JucwqBJiSfeZLeNtzrQwiCugajrSoJkOeKBVEQHXvIMHIAhYE4YftHWskXd82MJ2n1s8
 2WpQ==
X-Gm-Message-State: AC+VfDxngP/6MvSTGnZ+wLe4OqGnkSI076NEiE+78YDrMlGoC8nrW8Un
 X1w3WMYKeNcq0SLIfdnmZjIIhBPm9rznTtmgiHvspw==
X-Google-Smtp-Source: ACHHUZ7rm8jz+s02nlAbnve92YjRuDz/1QELgf4UleY+8kKnTxtAJt2R2YQqJHyvz+tJndbn/SLgLqnkCbtBYasX8ws=
X-Received: by 2002:a25:215:0:b0:ba2:77e:e5f8 with SMTP id
 21-20020a250215000000b00ba2077ee5f8mr12026435ybc.1.1683581035348; 
 Mon, 08 May 2023 14:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
 <ZFVGMiuRT+e2eVXw@google.com>
In-Reply-To: <ZFVGMiuRT+e2eVXw@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 23:23:44 +0200
Message-ID: <CACRpkdZUXOTOK9CObdXuHQx4PMD3ykMKco8X5ijchkZ8cEmQvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-spi@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 8:08=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > -     return !gpio_get_value(ts->gpio_pendown);
> > +     return !gpiod_get_value(ts->gpio_pendown);
>
> This needs to be
>
>         return !gpiod_get_value_raw(ts->gpio_pendown);

There is no such function. The gpio descriptor runpath simply assumes that
device trees can be trusted.

> I looked at various DTSes we have and they use a mix of active high and
> active low annotations, so we have to go with the "raw" variant for now,
> and then update to normal one once we update bad DTSes.

I just sighed and fixed all the device trees :D

Yours,
Linus Walleij
