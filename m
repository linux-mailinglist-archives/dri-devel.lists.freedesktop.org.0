Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8F36F3A9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 03:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B3D6E40A;
	Fri, 30 Apr 2021 01:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06B96E40A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:27:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n138so107861893lfa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 18:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
 b=mWr/LU95sxRmIHn3zRMbluegyGD2oe6oRt4d/eRVIdu7KE3Hz+geRyAZlmU7D5TMAP
 hBhqnVuVTVgUAhM0ZWa+OwuRT9bQbE3RnlfSljIXyeQtbRVE3csRBOvTZ2UblLcRM1QC
 xxs3hrrGH/TOp0oQcLOkEQIwojDLhahdEkZ6uo900/o8WZPZ19oj42KYditGQucez/as
 vUnwQLP3c6V6Z++gJIjubVeNlKS9+vW3LkRRxu3vS1WvzgEP3ZR5H+scAq2iwSyMhr+x
 AmUwvYqwpyzEIbU+VnqL+66wxLgWtk7TUMbBixNYKsUb9BMpCwEI2TAVauzbB6jQtiw3
 Iexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
 b=T049Diarvdgh1hscXTn/CeTq3Zk700jB5TwMV5mVwvTRGlp6fMGCKAEI1HTSypU2+Y
 /7ISR3FMmTXrk1lxBxYvoXLs/hkPnz1syI68RPKTEJhRB12cQM6k22JKSzbs/cS7xEcI
 kLy1/0NVU/PclW0sVttdIfoKbbycH+gw/0+AFkBtIo7G9Us6lUBn2BDxflRVZzfuz7Xa
 N/0Hgilvq1C61UgZgpTrN/QVsW3IZ85sgsB0MfBi0VO37j6vFYuHGMkJ5naPieTf6yWL
 dTGtWmlFAZpZSl1li2rWsUf8jLFvGLq9JRSohWS7vonoWj9nYlKtP+LA6qIT3wiUO7vz
 LBVw==
X-Gm-Message-State: AOAM530t3qh2RnTpvGcL6DGyhqSLqxi1m0qilbSKYgwu0ux7SL+MVcHK
 z6x6w7dnUd2+R6fd2uN8MOrTZif51LzSo1Jam6aQ+g==
X-Google-Smtp-Source: ABdhPJzFPmRotZN0fnw8kLXHW0mhRMJ6Y9pLJGkfe+X4ux0/23qoEes3nema+045FI+84RCCCXHVaXcNwdXLrns0we4=
X-Received: by 2002:a05:6512:149:: with SMTP id
 m9mr1218659lfo.157.1619746078186; 
 Thu, 29 Apr 2021 18:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
In-Reply-To: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Apr 2021 03:27:47 +0200
Message-ID: <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 3:25 AM Doug Anderson <dianders@chromium.org> wrote:

> > I think pm_runtime_disable(); need to be added there?
>
> I'm a bit confused. You're saying that I need to add
> pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
> that?

It does, sorry, too late at night :D

I was looking at the previous patch and mixed up which was the
patch and the patch to the patch...

Thanks, apply this!
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
