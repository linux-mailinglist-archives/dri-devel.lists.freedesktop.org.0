Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFE29F0D5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D356E8C9;
	Thu, 29 Oct 2020 16:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F076E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 16:11:23 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b3so1817157vsc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0lmuE6RR3dhx0tK+loCxehAgyFNZWus4zKcvrq/a24=;
 b=c4n8wyrP3vlNQPilsWu9vKqsJGfZS8wahksMfrJ7rGMn9SebslvVzpHL1QvVP8Kkk0
 r15i5okYMIBlkgnrGCzn5fGybIoXW/2YDlB/3KynBPOYl7OxIWX67hWjnL+Rwr0Ngo2D
 3iMpMaHecSvq/RZDhhk4HqXoxDDD/X+SWxDnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0lmuE6RR3dhx0tK+loCxehAgyFNZWus4zKcvrq/a24=;
 b=HJF0UL4lW8fvzNR0N/BhBs5SOCfdJD2wg/p0ZerWBHzSM1d45S0JqenbLyJrMmkj/n
 K+KN1UU/WJemNT2ZxicyQbPIEomi61IR0FniRfqIYdRe/+7vAe8qlywU5KOlJpK9qEDJ
 dXsOs7RDIIWvhZ8inBQYNrVS7YeR2lLPFsYFADTyAaqPugAdV1rljt8qHllZ+X3mlW5b
 iHzD/11o+WDWccWE3BSswYeNqgZ/UKdEIaQ+nYo9YYzhwZ+Q0Jww9sP49rY4FxlKe6UY
 n7UV0rbmp6A0nQaVoji/bwoBDsYtRcOkEBzDlf1T8P1BhU0ETh6QhqxFg+a0UfnRBw7r
 G9zw==
X-Gm-Message-State: AOAM532+iuVVX/qPtIUn2zNaiOH/WgginHX3y2EhuvkqX1jmevt6i8zs
 PgpodA6cnCAI2SHGsoDwddHFmnH2WYmRnw==
X-Google-Smtp-Source: ABdhPJylshi1O4uCRk8+CBgZmqoJxihDnHcxM67BiQsEhq08ymBSo5m56OLdo0BmpcWPpor3qt05tw==
X-Received: by 2002:a67:1e01:: with SMTP id e1mr3873037vse.49.1603987882217;
 Thu, 29 Oct 2020 09:11:22 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id h7sm369623vke.55.2020.10.29.09.11.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:11:21 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id u202so823115vkb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:11:21 -0700 (PDT)
X-Received: by 2002:a1f:8d91:: with SMTP id p139mr3942003vkd.9.1603987880886; 
 Thu, 29 Oct 2020 09:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-3-swboyd@chromium.org>
In-Reply-To: <20201029011154.1515687-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2020 09:11:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWT=Pp4cyBvLfHSoNbR=aX_O5zaiErY--t0C9Fg-pNgg@mail.gmail.com>
Message-ID: <CAD=FV=WWT=Pp4cyBvLfHSoNbR=aX_O5zaiErY--t0C9Fg-pNgg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: ti-sn65dsi86: Make polling a busy loop
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

On Wed, Oct 28, 2020 at 6:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> There's no reason we need to wait here to poll a register over i2c. The
> i2c bus is inherently slow and delays are practically part of the
> protocol because we have to wait for the device to respond to any
> request for a register. Let's rely on the sleeping of the i2c controller
> instead of adding any sort of delay here in the bridge driver.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Since we already did some early reviews off-list, it's not a surprise
that I have no comments.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
