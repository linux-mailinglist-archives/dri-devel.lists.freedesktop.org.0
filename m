Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F33207AE
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 00:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612696E1A7;
	Sat, 20 Feb 2021 23:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FC96E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=oMktDWRKXyoBFa7CtiuawGTrjQqJNKUNw1j4Qpf7tLQ=; b=KrW9CdHrNeeaD0CH7+mhlWCYHf
 RHtbrBLi0NpdCZ2uUDqeblPvzZRxHCqjFKNewXGfpM8R0LeLCpyE9TmWC/JQKSNBSpVkfJVSr1pMz
 lsPGkv7QyPeM/Ifw/KmCpTeEpm7Dghjp1WutT+ILL0nWyPHqfo+wi2y20Gem3JQw28PbjaGsArQ04
 bjO2BYQvTKeOFNofeJnFSd3zpXYL2WdvJkQqBcn30ez9HWB3ySBOZn91kklXWCSFlR4V3glxiNl5Y
 nrzLiOhKczeLrtf3xnwcu+T3UEQa93XKNot2+DY0iUjxaEPZkhGTA13BQl9Ka9xK8oOM2jUPx+UQ5
 HinEZHog==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDbkE-0004ZU-3j; Sat, 20 Feb 2021 23:33:02 +0000
Subject: Re: [PATCH] video: fbdev: pm2fb: avoid stall on fb_sync
To: Tong Zhang <ztong0001@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210220230248.320870-1-ztong0001@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
Date: Sat, 20 Feb 2021 15:32:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210220230248.320870-1-ztong0001@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 2/20/21 3:02 PM, Tong Zhang wrote:
> pm2fb_sync is called when doing /dev/fb read or write.
> The original pm2fb_sync wait indefinitely on hardware flags which can
> possibly stall kernel and make everything unresponsive.
> Instead of waiting indefinitely, we can timeout to give user a chance to
> get back control.

Is this a real problem or theoretical?
Does someone still use this driver?


> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  drivers/video/fbdev/pm2fb.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
> index 27893fa139b0..8578c64a0c54 100644
> --- a/drivers/video/fbdev/pm2fb.c
> +++ b/drivers/video/fbdev/pm2fb.c
> @@ -183,12 +183,23 @@ static inline void pm2v_RDAC_WR(struct pm2fb_par *p, s32 idx, u32 v)
>  
>  #ifdef CONFIG_FB_PM2_FIFO_DISCONNECT
>  #define WAIT_FIFO(p, a)
> +#define WAIT_FIFO_TIMEOUT(p, a) (0)
>  #else
>  static inline void WAIT_FIFO(struct pm2fb_par *p, u32 a)
>  {
>  	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a)
>  		cpu_relax();
>  }
> +static int inline void WAIT_FIFO_TIMEOUT(struct pm2fb_par *p, u32 a)

drop      void       ^^^
It's already "int".
Did you compile this?

> +{
> +	int timeout = 10000;
> +	while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a) {
> +		cpu_relax();
> +		if (--timeout==0)

spaces around ==

> +			return 1;
> +	}
> +	return 0;
> +}
>  #endif
>  
>  /*
> @@ -1031,15 +1042,27 @@ static int pm2fb_blank(int blank_mode, struct fb_info *info)
>  static int pm2fb_sync(struct fb_info *info)
>  {
>  	struct pm2fb_par *par = info->par;
> +	int timeout_sync = 10000;
> +	int timeout_fifo;
>  
> -	WAIT_FIFO(par, 1);
> +	if (WAIT_FIFO_TIMEOUT(par, 1))
> +		goto end;
>  	pm2_WR(par, PM2R_SYNC, 0);
>  	mb();
>  	do {
> -		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0)
> +		timeout_fifo = 10000;
> +		while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0) {
>  			cpu_relax();
> -	} while (pm2_RD(par, PM2R_OUT_FIFO) != PM2TAG(PM2R_SYNC));
> +			if (--timeout_fifo==0)

spaces around ==

> +				goto end;
> +		}
> +		if (pm2_RD(par, PM2R_OUT_FIFO) == PM2TAG(PM2R_SYNC))
> +			break;
> +	} while (--timeout_sync>0);

spaces around >

>  
> +end:
> +	if ((!timeout_sync) || (!timeout_fifo))
> +		printk_ratelimited(KERN_WARNING "pm2fb: sync timeout!\n");
>  	return 0;
>  }
>  
> 


thanks.
-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
