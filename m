Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23D76EC64
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF7810E1C1;
	Thu,  3 Aug 2023 14:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738C10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:23:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE88D60002;
 Thu,  3 Aug 2023 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691072597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WigczEMMTc5Fj5bj+faQESZsB+aGJTcyPagITF/pmxY=;
 b=XjAqWjU3YM6OupJueg341MbbHR+kSvxhVRh4NzJ7iVOuCrkGtMNOuTqiQHND8vi+OsApxN
 E34AFHY3ZIoUgUGxTjpo+FhF8FAyNp/wgHjCUpx9kuE0haptJUxwJ28UuFZ4Oi4G+EGwxY
 fS53Q/r+sOUyXu6pX/OYKLMqtu3o3/nV4mx7E2jxdX3uMtURK76ZwmXaubEOp69Su0QU+D
 wVqnN6weJTPw1mnfkCVJNpVLXGC8Kzb1Gh+x01Xu4GDuBKrEtOaEiptpFh6TyxAiLT8Ejf
 6SE/D5LaKBeRjjjBeMDOVMmspp784xsfhxk817FEde8AHGxPaXRfjMEwQljoyA==
Date: Thu, 3 Aug 2023 16:23:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/panel-simple: Add Innolux G156HCE-L01 panel entry
Message-ID: <20230803162314.122fab64@booty>
In-Reply-To: <20230731210258.256152-2-marex@denx.de>
References: <20230731210258.256152-1-marex@denx.de>
 <20230731210258.256152-2-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, 31 Jul 2023 23:02:58 +0200
Marek Vasut <marex@denx.de> wrote:

> Add support for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
> dual-link LVDS TFT panel. Documentation is available at [1].

Interesting, I'm bringing up this exact panel right now and found your
patch.

> The middle frequency is tuned slightly upward from 70.93 MHz
> to 72 MHz, otherwise the panel shows slight flicker.

Using 70.93 MHz here does not show any flickering. I even tried going
in the opposite direction and set 70 MHz, and to use different
backlight settings, all without any flickering.

Do you think you might be using a defective device? Would you have a
chance of testing another sample?

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 396a22177c674..417dd69054fc1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2377,6 +2377,37 @@ static const struct panel_desc innolux_g121x1_l03 = {
>  	},
>  };
>  
> +static const struct display_timing innolux_g156hce_l01_timings = {
> +	.pixelclock = { 120000000, 144000000, 150000000 },

In case the 144 MHz clock is kept, I'd add a comment here to clarify
the reason for diverging from the datasheet without the need for git
log.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
