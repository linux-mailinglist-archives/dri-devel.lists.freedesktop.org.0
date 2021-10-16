Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C4430514
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 23:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC956E53C;
	Sat, 16 Oct 2021 21:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0E66E53C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 21:39:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d13so869840ljg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OBwBRqq5KQLrzhnPrQyO7xvIoaonE0SA/KfYyvQuktY=;
 b=fnDRmuSVvZUC0Bq3G5tOZPhOKcWBiCGa580G3rDOfQarsXaEnwsgrlMIt6aKFgIz6v
 UAz/NJbRZSdbRzQEqi8gx53n7q0shgOT+WY5dUPtGX82ks9tk2RJSMMjn8XShAbBpXq0
 pjI2ZmwhVRw8fqvoqvF2/VHBsuU/SG2yFjdJhk0niZtWzchC9ZnApGaUT6JeDoTXfXua
 uh4vrRcZw2G6rnuq49pT8JDylRV8f5eYPTWHZnU1WQFVmQFU5nIz6yktXNlW9ub4k1wm
 qRzfiroNp4S33Yg8T6YercIfF+svvAq89G7UFWUc9XTvp2yjrc0wmMdsUZ8tbtuoKQO1
 vfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OBwBRqq5KQLrzhnPrQyO7xvIoaonE0SA/KfYyvQuktY=;
 b=HzRPvp2l43hH9rHrZvXSAYdV73NAKAAjqWLfqvkC0kgGGFVtajrV3Fvp8LR7uvBUaj
 kEDtox576/9WTXfKWM85ojjtaScl6NF908667mhgZB6i/5P2eNYcY4gaUKHtxqMHr4Bm
 iYJV3Gj49UoKqwYj8ChDs3oyMWkU+OA3u+e+gfc10wmdJUY6MlRD1BhKhLb0DO5xZzTc
 Xns+RP3n3/50tFXJk/5224OW5DjJaL36ms7nBTNLxxatQlBi1midiI1kanf0sBZ0aTNB
 dRJ2oMjz9TWqsvISWo5gxwpb2emNFPK9uImOPZIH7SAa1wM8aK0YtwM8FA4XNWIW+tfQ
 l4lg==
X-Gm-Message-State: AOAM53015QVhnbeFRQ3diweRlKgNwC4cNOUkV+pxZnhWoIRMaXdu07hm
 6EZ1wozSW5lt64KHT2hiVtglUiY6i3cRyMt0CWNyIg==
X-Google-Smtp-Source: ABdhPJyKg7Z2wgWoVDp54rrpuJ9WmwwBRUK/pqgHffh4MtKO6JmMkclwQP3cAUNum5VdkmqofosC5QHxHCS/1E8HKJ4=
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr20973513ljb.145.1634420378697; 
 Sat, 16 Oct 2021 14:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211016210402.171595-1-marex@denx.de>
In-Reply-To: <20211016210402.171595-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 16 Oct 2021 23:39:26 +0200
Message-ID: <CACRpkdYcpdD5_ag_M94RTQjkVzLPtQaZP612VU+1F9L_e5_xjw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Optimize reset line toggling
To: Marek Vasut <marex@denx.de>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
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

On Sat, Oct 16, 2021 at 11:04 PM Marek Vasut <marex@denx.de> wrote:

> Current code always sets reset line low in .pre_enable callback and
> holds it low for 10ms. This is sub-optimal and increases the time
> between enablement of the DSI83 and valid LVDS clock.
>
> Rework the reset handling such that the reset line is held low for 10ms
> both in probe() of the driver and .disable callback, which guarantees
> that the reset line was always held low for more than 10ms and therefore
> the reset line timing requirement is satisfied. Furthermore, move the
> reset handling into .enable callback so the entire DSI83 initialization
> is now in one place.
>
> This reduces DSI83 enablement delay by up to 10ms.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
