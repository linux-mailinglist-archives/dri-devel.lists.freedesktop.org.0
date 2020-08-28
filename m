Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CD1255BEB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 16:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614826E446;
	Fri, 28 Aug 2020 14:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4956E446
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:05:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i10so1467746ljn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=peoAMhin340g8hfujS0m2ecCBCi8hVoacuqHhCFz4m8=;
 b=wnRuOp88vxN4lXK4sfBVZy9DYmyxBdGcOPdLP35yzgUkT9VXxZetgT5ohQXAnunZkt
 SoEe8EdsMihiNH44I3YIFiBLpyEGQ1Cm6fXh5tbK9SaIDuuKnQItWv+2abAZkytC3VNa
 G3SLv7kCUiM3zgv/CbSlY9DMB5N6Nig6xc4EGouM+Hyz9HOwA5P1S2c5cXGUSolaGT46
 ealsDnAifQV3i/bpYOac3L0nP9U8+PexkVEw66IpXAf9TbsqqBZ3jdfSNXpu3k5paoXs
 GC6jCNGMPuSQEceIIK2+Gj8e4iuyrieyHdN4Tr24FDzHoxH35Ogc7yl8zrugGsOCtGk8
 Twuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peoAMhin340g8hfujS0m2ecCBCi8hVoacuqHhCFz4m8=;
 b=g3UnXJazITvhvfzdR6iXKjBEzfTZ0SRad4ulNGZiccij3FFUiYIVgeUIYr8B8ZFiB2
 Cpm4Z/Lnmg9Yc7VsG+SNS8z6Q+7+4EY4BNIwuJCuCy4EmNOOJUjm17FL6ySYn4SpkYN9
 yx3/KAEiZeEnwf/aGE40IYUBMDwb41Nh1QC6z6KmWcuJMhNlK4DfjDHsvBgRb/BdWGb6
 uqafKVE2qBsGBhojTa0PtizJ73j/Av2NuL7oRBGWzNmohBakg/G0Vlpm8Kl3yZT1Es3B
 uOwbWV+91A1g3C+oNyXy5YwDS4gRe/TqnFpQ0BxFCx0+Vc1+j8MgbUP+bSC9ORRwbZHB
 Xh+w==
X-Gm-Message-State: AOAM530zzOb5xM7f2tz+acoDv0DOWMSUutMH/F6CIPxF4/suxkn/1XjJ
 7WGl/6N7ndoLOC/v7vyTuu5Nml2XU8HKks8HP2v6pg==
X-Google-Smtp-Source: ABdhPJyZK+nyo5nTYz3NzSKuoc28bBQ5aH56BgFuYIxHsyIWvpg2GG1PynT6PAdWZQLdLlwBIDygqkN4EcQix8MSwgI=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr1005540ljb.283.1598623531997; 
 Fri, 28 Aug 2020 07:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200827071107.27429-1-krzk@kernel.org>
 <20200827071107.27429-2-krzk@kernel.org>
In-Reply-To: <20200827071107.27429-2-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:05:21 +0200
Message-ID: <CACRpkdbFJxfF6wGPAw_jEA0bYzT7JBYZOWEb1PbVc1iT8uJJrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/tve200: Fix handling of platform_get_irq() error
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
> Fixes: 179c02fe90a4 ("drm/tve200: Add new driver for TVE200")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
