Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E38669BBE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05410EA1B;
	Fri, 13 Jan 2023 15:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF07610EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5Ec9VEpxL0HdQ3ys6pNHqMik91oFBgfMANcke80xD/A=;
 b=mNsL6p20VOs74QKIu8snpBt8lWcWR1uguGQk7ru7ofSMp35A1oCHYta7HJUwcGkPn561uhzGtVVJb
 YEwpoJYI/4DSAA9rsapANR3CEi09F9aHr9g5WxkajAP5W6jnF//3HmrSMDtPprhJVlOSbs6u1fVfXI
 +fRVLa8bFfuNyAYAn8oPQC16RAjHav49Z6s8lJU7F0qwlzMRQhTJnhj3j8SWLPQiZ2UhdCV86FnMA7
 +sxRCet5Cx5uBOySOCGPlr9jgr9tQUQzf7MbRfHdOS0wxSgByTW8EqYRNfe28hl8LH0r0p9Tjihwgn
 mW32T+trR0jdFN7na/nuSwgivwn/j9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5Ec9VEpxL0HdQ3ys6pNHqMik91oFBgfMANcke80xD/A=;
 b=6cLlDT99AqkJuJaJoLKjJ3jWirKVmctGHXRyb6MZW9SNOTVHZRCTbGjd2HjbqxlOIr/XgibkTrpQj
 cH+L7k4DQ==
X-HalOne-ID: 5f693b70-9355-11ed-a136-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 5f693b70-9355-11ed-a136-7703b0afff57;
 Fri, 13 Jan 2023 15:17:23 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:17:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/panel: st7703: Avoid full proxy f_ops for st7703
 debug attributes
Message-ID: <Y8F2AQdzVEdmeWGU@ravnborg.org>
References: <Y73JRnLQ3RHSwLiO@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y73JRnLQ3RHSwLiO@ubun2204.myguest.virtualbox.org>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 01:53:34AM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Anyone up for testing this change?
I have never dealt with debugfs so dunno if the chnage will work or not.

	Sam

> ---
> Note: Patch compile tested only.
> 
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 86a472b01360..22ed7e2b0e00 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -510,15 +510,14 @@ static int allpixelson_set(void *data, u64 val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(allpixelson_fops, NULL,
> -			allpixelson_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(allpixelson_fops, NULL, allpixelson_set, "%llu\n");
>  
>  static void st7703_debugfs_init(struct st7703 *ctx)
>  {
>  	ctx->debugfs = debugfs_create_dir(DRV_NAME, NULL);
>  
> -	debugfs_create_file("allpixelson", 0600, ctx->debugfs, ctx,
> -			    &allpixelson_fops);
> +	debugfs_create_file_unsafe("allpixelson", 0600, ctx->debugfs, ctx,
> +				   &allpixelson_fops);
>  }
>  
>  static void st7703_debugfs_remove(struct st7703 *ctx)
> -- 
> 2.34.1
> 
> 
