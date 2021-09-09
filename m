Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CD405D25
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3A8890B2;
	Thu,  9 Sep 2021 19:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BD4890B2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 19:07:29 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bd1so3879087oib.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=G9dUwShNMYXGB/q/uN2ZV/y+8anbGGrbXrA5U+GWj0U=;
 b=J8M7gukBXOlqt3Qnk31Q/m/ukBjBf1I/WS/7vLoRa+D9UXZq+f9y5yKYXdXwYeCBCf
 ouIae5n5sKyOyhlFRPVhPd+0KvljOC/l0hPIZBdBOnuDCrFzsKYkSa4h0G6b4PWLj5eQ
 9LdRco6AX1+ILrX7tkkdL/3R6Lu7UvVmdNEJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=G9dUwShNMYXGB/q/uN2ZV/y+8anbGGrbXrA5U+GWj0U=;
 b=7DuLh0dJoTlnC2AaajM0c0pUHEaWHU+Q/8zOAaVzksihfqFdyRkvz6quA1v1rHglsD
 V6Z8VRG9jMVd8RMT1Q8FXdeeUh0DfCLwA6cfEahXCBLBNhTvI8EWvp2gZqPrKsBgAJCf
 ERvcylBIy2UCeiaI57YKLC2tDJOh7gVhje2eICI0XB9CHAoDW31QTk6O9GMpiR4qMTno
 nqsxP7gbwz6KYpgbh0Dq57u+dtVtHizDL21setT7Dx5TwH1DlXoDz7Hl43c9khSWavWG
 aDEvVQPFr+ry6Q6Erde7cIM2EmODKIuf3OFHPUiDX1l3p1sUaAuy3yGlMVsQr1neB//m
 T8bg==
X-Gm-Message-State: AOAM533wLg/StMY5gBnwUSAYdJWcibEWik1oC1t2zVXXRHcOU1gjABxD
 0ecNfxuBXncpa1tnpWF2nXhuhFfu6E/MoryHM6/lug==
X-Google-Smtp-Source: ABdhPJxJW90rSg2/mqU/5eSBp78t7+FgcJqlRJKB1JjXXrdPRkQ4+IhgmV3AW6jJQq/kWgnx5TMjNWhEaEQNQlb8gD4=
X-Received: by 2002:a05:6808:909:: with SMTP id
 w9mr1131951oih.164.1631214448523; 
 Thu, 09 Sep 2021 12:07:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Sep 2021 12:07:27 -0700
MIME-Version: 1.0
In-Reply-To: <CA+cxXhnPd1Z_HVjgM8b0wskASF-ZGuvYDh0quiVMwKFhKVx-JA@mail.gmail.com>
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
 <CAE-0n50mp5F79iJ+zVrbt4ZP7V+UUOcVQe9H3TwEcFFyZWMoNA@mail.gmail.com>
 <CA+cxXhnPd1Z_HVjgM8b0wskASF-ZGuvYDh0quiVMwKFhKVx-JA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 9 Sep 2021 12:07:27 -0700
Message-ID: <CAE-0n51s2MmOthCUSm0+KNBnWmNV=Zzf6eWhYJBme4LpMUUcAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Quoting Philip Chen (2021-09-09 11:15:27)
> On Wed, Sep 8, 2021 at 3:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-09-08 11:18:06)
> >
> > > +
> > > +       data = (len - 1) & AUX_LENGTH_MASK;
> > > +       regmap_write(map, PAGE0_AUX_LENGTH, data);
> > > +
> > > +       if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
> > > +               ret = regmap_noinc_write(map, PAGE0_AUX_WDATA, buf, len);
> > > +               if (ret < 0) {
> > > +                       DRM_ERROR("failed to write PAGE0_AUX_WDATA");
> >
> > Needs a newline.
> Adding an empty line here doesn't look like a common Linux style?
> Could you point me to any similar instances in the Linux codebase?

Sorry. I meant on the DRM_ERROR message itself. Add a newline.
