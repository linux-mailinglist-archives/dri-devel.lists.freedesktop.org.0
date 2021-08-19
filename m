Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2973F1AEB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA2A6E835;
	Thu, 19 Aug 2021 13:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0125.hostedemail.com
 [216.40.44.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092086E835
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:51:27 +0000 (UTC)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id D56531801BD9B;
 Thu, 19 Aug 2021 13:51:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id ED88A17276; 
 Thu, 19 Aug 2021 13:51:24 +0000 (UTC)
Message-ID: <0a2ea4e54d7bfd61b45cc070eee6b62e8da82190.camel@perches.com>
Subject: Re: [PATCH] drm/bridge/tc358767: make the array ext_div static
 const, makes object smaller
From: Joe Perches <joe@perches.com>
To: Colin King <colin.king@canonical.com>, Andrzej Hajda
 <a.hajda@samsung.com>,  Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Aug 2021 06:51:23 -0700
In-Reply-To: <20210819133839.10745-1-colin.king@canonical.com>
References: <20210819133839.10745-1-colin.king@canonical.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: ED88A17276
X-Spam-Status: No, score=1.31
X-Stat-Signature: xtq9wskgg9q5yk38hqm1ujdryh91ffcd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18LudW2irYBHTNEvn3FXoPtQaMsnxKJhc4=
X-HE-Tag: 1629381084-16190
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

On Thu, 2021-08-19 at 14:38 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array ext_div on the stack but instead it
> static const. Makes the object code smaller by 118 bytes:
> 
> Before:
>    text    data    bss     dec    hex filename
>   39449   17500    128   57077   def5 ./drivers/gpu/drm/bridge/tc358767.o
> 
> After:
>    text    data    bss     dec    hex filename
>   39235   17596    128   56959   de7f ./drivers/gpu/drm/bridge/tc358767.o

Why is text smaller and data larger with this change?

> 
> (gcc version 10.3.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 23a6f90b694b..599c23759400 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -468,7 +468,7 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>  	int div, best_div = 1;
>  	int mul, best_mul = 1;
>  	int delta, best_delta;
> -	int ext_div[] = {1, 2, 3, 5, 7};
> +	static const int ext_div[] = {1, 2, 3, 5, 7};
>  	int best_pixelclock = 0;
>  	int vco_hi = 0;
>  	u32 pxl_pllparam;


