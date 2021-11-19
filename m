Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93A456F78
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 14:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECF76F8FE;
	Fri, 19 Nov 2021 13:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E236F8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 13:19:59 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id r23so8588411pgu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 05:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIx8aAtrNrpHm8OWpCkJNADibB+h5hdt9mPSxfe3frQ=;
 b=NBOPOh1UgyA0xwXBnfw/SMnAlqEUiz5NamwbuQAdR86j+M49xfYPj6hPk90eVAqXkg
 Wm7TljjkNACGgV/VE28cM1mKpEeoY22sfNhxzZEHC6FToVOVJukRr2YSBwm4w/Lw7ymn
 HyUV4bCPvRTy50/2wdbJ+/zdZaC+G84XFtAg9G7yYrnBUd3Ev+URz3r23urTPghrAjq6
 Hi3VDMvO7h91SaMAANXvV8NaJW7DoI+BDb64wiODq2re9SnrpmoVpwCkZSFuq4Ad4x1M
 WGIM85JKRvRevR3APYHonPgDNAPm03EUOSfX36z4MxvBZGUZm1aJ7j1DUZhR/wuVcCH2
 3sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIx8aAtrNrpHm8OWpCkJNADibB+h5hdt9mPSxfe3frQ=;
 b=4fp3M5Dw+rat0m5WSbiECIf868AMuf0+DZjdaiGXO+Q4RboWH0uJKBj83qtpYm8r1E
 RyPPPLCHOjsmNFlD4i4Tzw/azwaRgQg+XAU89kHwZ/HP/BWulEZgpeHMF/6KFKf3/hLh
 QYuiPkq/sBeufHB4u5EMwUWDQJGzrWk+1L4Inm0ONUoySA9muZQUhvca1d/1T3Qq7iag
 iSpLCUH4UKcVQJtimTPXq7Fv8Rvvw0txofUdkd2dTBnKp5aYc38y8sZ+tauy6K3dhwql
 n+gW1UXx/q+K06JhPoeDjHBlDgtoyFVvHCO3uk2JvZyo117FebMX4Y6d0P+AO0OflqoN
 TcGA==
X-Gm-Message-State: AOAM530/53yWIwlRCg9zhbGmUdL8wnbn22HB42Qth1ByotnYBTBmUkRj
 maOBRfIfJeGtoTDF6W8W4L9aZd5j/+6CEdwHe2rC6A==
X-Google-Smtp-Source: ABdhPJzIJUQL/YO5ivPl8HQZn3UZcAgecn/QrTLCZHfeWyXnPXA+Zl+OFAICaMhmDozxatXYDSFCYS1upGv0jdxNJnY=
X-Received: by 2002:a63:555e:: with SMTP id f30mr17240737pgm.110.1637327999454; 
 Fri, 19 Nov 2021 05:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
 <20211102093618.114928-2-angelogioacchino.delregno@collabora.com>
 <d2fe91c8-ab29-7706-80f4-fe6619f07327@collabora.com>
 <286beb55-00db-ba76-0a51-900d59e2ab34@collabora.com>
In-Reply-To: <286beb55-00db-ba76-0a51-900d59e2ab34@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Nov 2021 14:19:48 +0100
Message-ID: <CAG3jFyvF7JAm8X42+f2u+ycqdsHLfNH2YebxYSjJJSBdAbc1aw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: parade-ps8640: Move real poweroff
 action to new function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, jonas@kwiboo.se,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Angelo,

On Wed, 10 Nov 2021 at 13:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 10/11/21 13:44, Dafna Hirschfeld ha scritto:
> >
> >
> > On 02.11.21 11:36, AngeloGioacchino Del Regno wrote:
> >> In preparation for varying the poweron error handling in function
> >> ps8640_bridge_poweron(), move function ps8640_bridge_poweroff() up
> >> and also move the actual logic to power off the chip to a new
> >> __ps8640_bridge_poweroff() function.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/gpu/drm/bridge/parade-ps8640.c | 37 ++++++++++++++------------
> >>   1 file changed, 20 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
> >> b/drivers/gpu/drm/bridge/parade-ps8640.c
> >> index 8c5402947b3c..41f5d511d516 100644
> >> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> >> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> >> @@ -293,6 +293,26 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> >>       return 0;
> >>   }
> >> +static void __ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> >> +{
> >> +    gpiod_set_value(ps_bridge->gpio_reset, 1);
> >> +    gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> >> +    if (regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> >> +                   ps_bridge->supplies)) {
> >> +        DRM_ERROR("cannot disable regulators\n");
> >> +    }
> >
> > That '{' is redundant
> >
> > Thanks,
> > Danfa
> >
>
> Hi Dafna,
> the braces were added as a way to increase human readability.

Not to bikeshed this, but the kernel style guide is clear about this.
No unneeded braces should be used where a single statement will do.
