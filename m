Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9326602797
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469C310EB80;
	Tue, 18 Oct 2022 08:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482710E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 08:53:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z97so19452610ede.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6cUtuyqAZibZU8ZlcoM2Kf5pSUlkNWyRzGSfKMSntA=;
 b=PbUrCJyVqCn8cngcRe1mAOGkstzAX95P/axQLi2swj+RhB1rT/8suv4OmXkGOkFt15
 ZFzsusix3T5Zm73q/kK7LMYM9q9Tmdkxz8VxPLYa0vSt19osOgmiF+xSGxZuDxnJmn2U
 av0hyPf+ABTf4JMc/IdxAN2whjLTM/CyNucs0+oP/6DukBvMVu7b/kOWebgk2+BM1GmO
 Fy8q7hsdzRP2WE6S1e6wOdspGYNEXLR4I27SC5HnkMSBDXSYi+LPUyn94FqNCM027HSC
 1XMmpl99tgmHsLw2DoFfA7TNuf0QOxotcyxYIGd7ymFSU9GeJM+XinG/cqp0kJILkLlF
 fe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6cUtuyqAZibZU8ZlcoM2Kf5pSUlkNWyRzGSfKMSntA=;
 b=Lf2gJ/o/rRWQbVqwokHtVusjhkosCKviD+AXDvqbzYAAkCE7+szXC6ObP9mdyUUJ4K
 T3UD/Gt2aqqEQP5HeNxm2FaZ1A7pfCVKWgh9PMnqlQuQiojoc9omQqK6sNliViYlCPCr
 n5zTnLOPHZNfEkXiYsacXhpW+gb3XHUFOonL07SuNunMnX3CnAh9rN8jloG2Avp6hNOJ
 3gfHt30XDm+3lDv7Ebg8p4vv+qojZ8AqlKTjFg6VesZcR698SiHkEobHqFNKnND1Q4+8
 CzD0xV3cP5noX/Fl5h1A3oxoYuiSpAJvl80bQnAuzNJ6/laZydkfX6lFLwEal2tbUoFD
 Dalw==
X-Gm-Message-State: ACrzQf1qvjivVoIV1CWZEVQr0sKQL5tBvAE4beQFU6VWxiDB4wJyu7Uo
 XBGoWboZOwDgfXI8I1hKKnhydlKtqMpjippmf4KVuQ==
X-Google-Smtp-Source: AMsMyM6No38tnXdVisLfgMTaWZxau0xIWaL6AWd4AvL+rmTucfJ+d5OQa4fuGbFRs6k1szOzqjVU8WRkbRIypDsZ4ug=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr1652300edt.172.1666083238052; Tue, 18
 Oct 2022 01:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221012221159.88397-1-marex@denx.de>
In-Reply-To: <20221012221159.88397-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Oct 2022 10:53:47 +0200
Message-ID: <CACRpkdZd_fNYv2sFRJX7nacz1dAp-dAxEzDfTMRKAy4nB6Jbvw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
To: Marek Vasut <marex@denx.de>
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 12:12 AM Marek Vasut <marex@denx.de> wrote:

> The RTNI field is multiplied by 16 and incremented by 512 before being
> used as the minimum number of pixel clock per horizontal line, hence
> it is necessary to subtract those 512 bytes from htotal and then divide
> the result by 16 before writing the value into the RTNI field. Fix the
> calculation.
>
> Fixes: de2b4917843c ("drm/panel/panel-sitronix-st7701: Infer horizontal p=
ixel count from TFT mode")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> ---
> V2: Clamp the htotal to range 512...1008, so RTNI always fits the bitfiel=
d

I tried to apply this to drm-misc-fixes but the branch has not yet
been moved forward to v6.1-rc1.

Yours,
Linus Walleij
