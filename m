Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E461D938
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 10:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415610E136;
	Sat,  5 Nov 2022 09:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A7C10E135;
 Sat,  5 Nov 2022 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QO/uh1tfrB1vZ/birVU9li3LJoDhOtqTeKkjmuQEcpU=; b=f8PZKPFaPnsa8knKT47i9fE0mj
 aPMGaxO8zVXZyxJw7hhyjdY4uvNrXmbqRHSafTyZWk/g8BzjhCu914LSe3zgUxxIsg+6gYlyIIyO7
 lDHZlOIyJGF9WsoQWnE4Cl/1UtZdjggV34hs38KfCrXqNmSrljZff2IkB7ocrp4Gy9K/dCuaeFeuj
 DkWey3994d15MZEeU9o/P8W8QrYdwL7LQnJEIG6Z+t8EQgXAN2Ksnf9RirKKbjp92ni2CIiIrgqw4
 WqLxmEJSQtVJTAm5xnBVPkhwwKPnnmMnofe+rOmye/FM633hokTlk13EMWHPa/1DhC6+Im2uTGbWs
 QLgtsy7w==;
Received: from [2a01:799:95a:cb00:749c:a195:60ac:1a6b] (port=61208)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1orFsN-0003Pc-4Z; Sat, 05 Nov 2022 10:54:07 +0100
Message-ID: <4b97cc9b-4143-2a2f-f431-a7ea83a2e945@tronnes.org>
Date: Sat, 5 Nov 2022 10:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4a 31/38] timers: drm: Use timer_shutdown_sync() for on
 stack timers
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
References: <20221105060024.598488967@goodmis.org>
 <20221105060200.540142479@goodmis.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221105060200.540142479@goodmis.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 05.11.2022 07.00, skrev Steven Rostedt:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Before a timer is released, timer_shutdown_sync() must be called.
> 
> Link: https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/
> 
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>

>  drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 7c6dc2bcd14a..08429bdd57cf 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -272,7 +272,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
>  
>  	usb_sg_wait(&ctx.sgr);
>  
> -	if (!del_timer_sync(&ctx.timer))
> +	if (!timer_shutdown_sync(&ctx.timer))
>  		ret = -ETIMEDOUT;
>  	else if (ctx.sgr.status < 0)
>  		ret = ctx.sgr.status;
