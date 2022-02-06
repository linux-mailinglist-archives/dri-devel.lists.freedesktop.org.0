Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB304AB1A4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A5C10E4D3;
	Sun,  6 Feb 2022 19:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437EE10E69C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:26:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id e3284930-8782-11ec-ac19-0050568cd888;
 Sun, 06 Feb 2022 19:27:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 014B5194BDB;
 Sun,  6 Feb 2022 20:26:52 +0100 (CET)
Date: Sun, 6 Feb 2022 20:26:50 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/panel: JDI LT070ME05000 remove useless warning
Message-ID: <YgAg+lklFqPhVgS8@ravnborg.org>
References: <20220206190702.450643-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206190702.450643-1-david@ixit.cz>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Sun, Feb 06, 2022 at 08:07:02PM +0100, David Heidelberg wrote:
> Do as most of panel and in case of deffered probe, don't print error.
> 
> Fixes warning:
> panel-jdi-lt070me05000 4700000.dsi.0: cannot get enable-gpio -517
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> index ea0e7221e706..b5c0b51dc146 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> @@ -408,7 +408,8 @@ static int jdi_panel_add(struct jdi_panel *jdi)
>  	jdi->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(jdi->enable_gpio)) {
>  		ret = PTR_ERR(jdi->enable_gpio);
> -		dev_err(dev, "cannot get enable-gpio %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "cannot get enable-gpio %d\n", ret);
>  		return ret;
>  	}

Thanks for submitting a fix for this.
Please look into the use of dev_err_probe() for this as this is the
preferred way to fix it now.

	Sam
