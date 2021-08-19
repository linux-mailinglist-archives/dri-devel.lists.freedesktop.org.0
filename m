Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A43F1EE4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 19:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCA36E9B5;
	Thu, 19 Aug 2021 17:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162F76E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 17:18:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 72690443-0111-11ec-b37b-0050568c148b;
 Thu, 19 Aug 2021 17:18:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 75BA7194B17;
 Thu, 19 Aug 2021 19:18:38 +0200 (CEST)
Date: Thu, 19 Aug 2021 19:18:25 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Colin King <colin.king@canonical.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge/tc358767: make the array ext_div static
 const, makes object smaller
Message-ID: <YR6SYZKXUap/OPtz@ravnborg.org>
References: <20210819133839.10745-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819133839.10745-1-colin.king@canonical.com>
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

Hi Colin,

On Thu, Aug 19, 2021 at 02:38:39PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array ext_div on the stack but instead it
> static const. Makes the object code smaller by 118 bytes:
> 
> Before:
>    text    data    bss     dec    hex filename
>   39449   17500    128   57077   def5 ./drivers/gpu/drm/bridge/tc358767.o
> 
> After:
>    text    data    bss     dec    hex filename
>   39235   17596    128   56959   de7f ./drivers/gpu/drm/bridge/tc358767.o
> 
> (gcc version 10.3.0)

IMO a better argument is that this change prevents any accidental
changes and it align with how we define arrays in many other places.
The compiler may produce a smaller binary but that is just a side-effect
in this case.

	Sam

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 23a6f90b694b..599c23759400 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -468,7 +468,7 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>  	int div, best_div = 1;
>  	int mul, best_mul = 1;
>  	int delta, best_delta;
> -	int ext_div[] = {1, 2, 3, 5, 7};
> +	static const int ext_div[] = {1, 2, 3, 5, 7};
>  	int best_pixelclock = 0;
>  	int vco_hi = 0;
>  	u32 pxl_pllparam;
> -- 
> 2.32.0
