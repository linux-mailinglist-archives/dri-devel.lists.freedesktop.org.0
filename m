Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C184120257
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4C06E487;
	Mon, 16 Dec 2019 10:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940336E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:28:22 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h23so6190977ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cu1+Hou8B++1NEwHbXDIcfHUJVKmIeBKoDLkmWPOXCI=;
 b=kiHB4903z0YwS4JpJ1gi73s6446AzmG+vycJ0iyY97WttaKy2iGzEj3edupk5Ytma4
 sCWlfm/Rxehb/LtxMP5pO00Ufe/6xX1+VMPoaDeUggEsVuap1N9u4sw7ssD3nbDI/zFh
 dN0zfPlhE1/4zMCaBTzL/gd9KQ3DvH4mEM32gjjNxRSpoB6R1nRyhA3M6oK/nQo8S0NQ
 IxawwPGhTYhsIrtUIcc1o6o8DCCkp8JVlAAqXKt4UrN8hIBxIyWOi9e1SeoGO6OAwRyX
 KOtMAorX9TkHU5jRK9asVCmhp7qr+l3dHawUJqq667yore78GofGrl8Kxmz4Z39tnvKd
 72fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cu1+Hou8B++1NEwHbXDIcfHUJVKmIeBKoDLkmWPOXCI=;
 b=YN3PjNhscM8ZP474f7i3bP2pIHFsqeIHH1CBkSCiSmQEy5MUs5gR6cOv7078+KUwkl
 3MemC3iWkRT3T+P0z38ri2ryUgiOdbThHl32R5J23qIxwOs0akUDxQjGPhVqSf3V4WBj
 Et/+le+u2CFp3aqymmTqGK4Qbd1xtpIg2a+4H6WU4f6vURocrQDu2Fr7+7p7ojOn4TWn
 psiFliyNGZVGriJbG89oWsg+wpgV/XIjFUAt2ZVkQEja+flo1EG9gnN6N8QBWjFIEiiD
 cZsDyHPmkKXwvx3M2Nshsm67PUrPhD0nQNfJQ17T1b2rmBOqf1ssEL9+0wKUeTI8kunB
 6UcQ==
X-Gm-Message-State: APjAAAV+//gftQdMEYo61NIkXue7BCAmA5bkUvo6lPL4+f+BBIvi01PC
 emyVPUVqqfcAdS8VQQ5WZ4QmJX49HoEkTiRFirzrhg==
X-Google-Smtp-Source: APXvYqzIK3/hH2FPyLoT1jp9cAXyv3Rqw/xnQY9Cr/V3d9Y+7lqo0CgT1RLffzK4WqPw4AE1exyAkY88bA5xiNu7h+g=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr18088445ljh.42.1576492100956; 
 Mon, 16 Dec 2019 02:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-4-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-4-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 11:28:09 +0100
Message-ID: <CACRpkdYpg-fE3Kf=VSKpC1VaCzHjt5n31jfqOgRgWzFZ9HYtsA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
 LCD is initially off
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> When the LCD has not been turned on by the firmware/GOP, because e.g. the
> device was booted with an external monitor connected over HDMI, we should
> not turn on the panel-enable GPIO when we request it.
>
> Turning on the panel-enable GPIO when we request it, means we turn it on
> too early in the init-sequence, which causes some panels to not correctly
> light up.
>
> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingly.
>
> This fixes the panel not lighting up on a Thundersoft TST168 tablet when
> booted with an external monitor connected over HDMI.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
