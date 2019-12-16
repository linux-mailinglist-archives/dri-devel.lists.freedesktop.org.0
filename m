Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB0120255
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE236E48B;
	Mon, 16 Dec 2019 10:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20996E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:27:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so6189161ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kc8cYBIPzK7WSX6Dhpknsv+Az7sG/90zzv4gmeMoX/I=;
 b=W8eY0lMy6Qgx6i4PCyCCiBvKfrdmAknD/ElHqjjw1MmaCLGGVpfqimMzwD1KrZptEq
 SmGOOMB6K3EOysXDm1NJibNn3lksuBlHSOBZrz7e9YSXZZ0/0O6PP09e6gPdiqPt3m5B
 Mzcdx5+SQBHVInfd1/jdFHaDUeTp0P1+OMJdM1fjj5O8gEMcfmVDBZX0mnqwtI0FHoC+
 +JUpPJrkD3KtCHDJhkPV8xNvd5tGBAAQXPgmTaEpRRoIKPhM13zRhxUl2XeCnablcB1K
 ZJsSS4yXSWQpyFNu04ukz20OTdBlqcQ4In2zbgGsTFzFdFnwdgDL7N3EYLh7dEwVzQDp
 aAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kc8cYBIPzK7WSX6Dhpknsv+Az7sG/90zzv4gmeMoX/I=;
 b=KGnBZ8S542sO1RpSzZEifiwKoIskKFhz3DRB1yNYpd4k86BJ+jCtOu20/zKa5H6y3I
 DL9Av4pGAVojet7DqwxlT13HG+05fWBo5wYjHrEQEZfzmwwwJFTdsH8jlNk/z4MkSC7U
 wlZHrsPQn45NtbLBxipgPt1JqMqAmRaXlx1ivFqphISCG+szBiq7arRBVQrsZ6ZMj66z
 5BpgaOEh5W3WeZZpoaYs1HilCipRqKDRK7Aqd5zVYS8mLPvCcXunouaT2Nloi1wM6Jmu
 yPzzM0XULEzJoKSHQ35REpC2jdsBiqBsvrA2A99FO7qyfe9hxBGazJOaWhuLAhsi8VmB
 zESA==
X-Gm-Message-State: APjAAAXn/T8N3SN7TS9eeCoAQNGwkziOrjDIW3+EDk1KEm0LcG3KqnYJ
 UW0xguKhg7Soj8O1ZfTPs0tINSOdAG+MRZOJBEC/7g==
X-Google-Smtp-Source: APXvYqxyqyrkWKlQ1gXsP1WttRxjmUxJOJGIdWOtatnGZNr2dHpk3W2tQ6LrXKWaSo/Xkh46gNIkzci0Gfo9VddG5bc=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr18792305ljg.251.1576492069993; 
 Mon, 16 Dec 2019 02:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-3-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-3-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 11:27:38 +0100
Message-ID: <CACRpkdYWi5dX8jRBoJmrA3Mrig-JUKw+qq5gth2veY3EyUALqQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/i915/dsi: Move poking of panel-enable GPIO to
 intel_dsi_vbt.c
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

> On some older devices (BYT, CHT) which may use v2 VBT MIPI-sequences,
> we need to manually control the panel enable GPIO as v2 sequences do
> not do this.
>
> So far we have been carrying the code to do this on BYT/CHT devices
> with a Crystal Cove PMIC in vlv_dsi.c, but as this really is a shortcoming
> of the VBT MIPI-sequences, intel_dsi_vbt.c is a better place for this,
> so move it there.
>
> This is a preparation patch for adding panel-enable and backlight-enable
> GPIO support for BYT devices where instead of the PMIC the SoC is used
> for backlight control.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The kernel looks prettier after than before and it seems correct so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
