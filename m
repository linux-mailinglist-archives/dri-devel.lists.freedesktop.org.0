Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB83197520
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9B26E08A;
	Mon, 30 Mar 2020 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85A6E0AF
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 09:28:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,319,1580770800"; d="scan'208";a="442805364"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Mar 2020 11:28:33 +0200
Date: Sun, 29 Mar 2020 11:28:33 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: fbtft: Replace udelay with
 preferred usleep_range
In-Reply-To: <20200329092204.770405-1-jbwyatt4@gmail.com>
Message-ID: <alpine.DEB.2.21.2003291127230.2990@hadrien>
References: <20200329092204.770405-1-jbwyatt4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sun, 29 Mar 2020, John B. Wyatt IV wrote:

> Fix style issue with usleep_range being reported as preferred over
> udelay.
>
> Issue reported by checkpatch.
>
> Please review.
>
> As written in Documentation/timers/timers-howto.rst udelay is the
> generally preferred API. hrtimers, as noted in the docs, may be too
> expensive for this short timer.
>
> Are the docs out of date, or, is this a checkpatch issue?
>
> Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
> ---
>  drivers/staging/fbtft/fb_agm1264k-fl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
> index eeeeec97ad27..019c8cce6bab 100644
> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> @@ -85,7 +85,7 @@ static void reset(struct fbtft_par *par)
>  	dev_dbg(par->info->device, "%s()\n", __func__);
>
>  	gpiod_set_value(par->gpio.reset, 0);
> -	udelay(20);
> +	usleep_range(20, 20);

usleep_range should have a range, eg usleep_range(50, 100);.  But it is
hard to know a priori what the range should be.  So it is probably better
to leave the code alone.

julia

>  	gpiod_set_value(par->gpio.reset, 1);
>  	mdelay(120);
>  }
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20200329092204.770405-1-jbwyatt4%40gmail.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
