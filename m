Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005E12C2C4
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884489DC5;
	Sun, 29 Dec 2019 14:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E528996F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 09:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 345CD5209D1;
 Sun, 29 Dec 2019 10:25:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id xV8-l4oTnBLS; Sun, 29 Dec 2019 10:25:12 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id D585B5209D2;
 Sun, 29 Dec 2019 10:25:12 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 96D045209D1;
 Sun, 29 Dec 2019 10:25:12 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 roman.stratiienko@globallogic.com
Subject: Re: [RFC 4/4] drm/sun4i: Update mixer's internal registers after
 initialization
Date: Sun, 29 Dec 2019 10:25:12 +0100
Message-ID: <2960593.5fSG56mABF@jernej-laptop>
In-Reply-To: <20191228202818.69908-5-roman.stratiienko@globallogic.com>
References: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
 <20191228202818.69908-5-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne sobota, 28. december 2019 ob 21:28:18 CET je 
roman.stratiienko@globallogic.com napisal(a):
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> At system start blink of u-boot ghost framebuffer can be observed.
> Fix it.

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Please note that U-Boot to Linux handover may not be without issues. I noticed 
that in some cases, HDMI EDID readout is broken. I guess already initialized 
HDMI controller doesn't like to be reinitialized. Or it may have something to 
do with the fact that U-Boot HDMI driver sets I2C timing and Linux kernel uses 
default one.

Best regards,
Jernej

> 
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index da84fccf7784..b906b8cc464e
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -588,6 +588,9 @@ static int sun8i_mixer_bind(struct device *dev, struct
> device *master, regmap_update_bits(mixer->engine.regs,
> SUN8I_MIXER_BLEND_PIPE_CTL(base), SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> 
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_DBUFF,
> +		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
> +
>  	return 0;
> 
>  err_disable_bus_clk:




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
