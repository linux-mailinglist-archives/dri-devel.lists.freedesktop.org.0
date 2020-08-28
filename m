Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7699255BE7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 16:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABA06E454;
	Fri, 28 Aug 2020 14:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548716E454
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:05:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 185so1435118ljj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=laQRo0IXBoxlRUsr9rNJ2izAqPaxJoclO77g1cLJXao=;
 b=uD4QSdK6hO5ieBLz6ebVFwPy3jNa6V9k7enpVeXEEsKLFgH9aua6aN8wr2dAW5QEPY
 2L91KzVAzOjc+tpBpt101DQmX3P5eO/ngLJFTjUVELwsmhDDyuB1Q5/IHtQiKQgPNNGT
 ndkMmRk/qQiJMs0npYgVuZ8Qlbd98UU7JB/tgNadTn0zUtmcucr52jvRJYoFxQikIcyB
 7F1Dnr//0Nfe/JUw+3hUTZNURDYaSSA4V586hhcFYSZoE5RuB/bSo+IfupSpmyINg8mE
 D1VIkQyJqvm+oUnJDfQ/sq2uZ7AV2yMX4ro2xucZ7/2kQyrvi+dml/tkDuGl1pECxbwK
 rDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=laQRo0IXBoxlRUsr9rNJ2izAqPaxJoclO77g1cLJXao=;
 b=o1BXvQZYFjsJIiMcc8t+PtKSYEOSEAxxvwVLgcR7aGmp77QjU8Pt9aYjJxbEWqQAsc
 aP9L+9loqcyzj0/5bmEAstpbMJW/UB7Kgh0HPmniuPx6YNlm8pnXqOfcFfRE7EEoZEL9
 QgnHKLBm3zxYuHewoUO+7CBrI465OTaFGhlWlUEpEy/CdZAlqQPbJEJC4NCJfx23LDlE
 s1HERifOnTdZMfgaMsBEPvO36OwdLoYkqVZos6uwovpyRRxwNwfAVq1+0WH3mjrjcUYL
 xddArROIQSCWzhiyGz22KKJxDakJgd+XQ+KThzOFUwYCJpLRQKI8mQ7R4xvOKFWneRXg
 KAaw==
X-Gm-Message-State: AOAM532+jChdaQCwFqNpD2kvavIfT3rIHaTYtyRcH53ghItM5yFBPkSQ
 ux7BdMK6tlMnB7/BGgXuNFG+lBNiLYFsVlJIUBM3pA==
X-Google-Smtp-Source: ABdhPJyyJ624adHJmQkytow4DYDghT/t6aR0J3mHhUm27rjibPXnfdnqsNPV1YMqF5OlX+vZJV1NgSgZ6OJ+x+2c9KI=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr883960ljc.338.1598623499763; 
 Fri, 28 Aug 2020 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200827071107.27429-1-krzk@kernel.org>
In-Reply-To: <20200827071107.27429-1-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:04:48 +0200
Message-ID: <CACRpkdZ+qLRVpjaYKTjnXLLheTjaSKABEWJhvDvEcSOLgFJVaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix handling of platform_get_irq() error
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 9:11 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
