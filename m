Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F92A1CD2
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 10:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0366E9AC;
	Sun,  1 Nov 2020 09:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19D6E9AC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 09:22:20 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AAF35804F6;
 Sun,  1 Nov 2020 10:22:17 +0100 (CET)
Date: Sun, 1 Nov 2020 10:22:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Deepak R Varma <mh12gx2825@gmail.com>
Subject: Re: [PATCH] drm/panel: st7703: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20201101092216.GB1166694@ravnborg.org>
References: <20201030033150.GA275009@my--box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030033150.GA275009@my--box>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=S4BYaaioAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=P2jyfWBKOuCc-NuxQl4A:9 a=CjuIK1q_8ugA:10 a=NWVoK91CQyQA:10
 a=gP6mnyLQ4wGU0PyH625T:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Deepak

On Fri, Oct 30, 2020 at 09:01:50AM +0530, Deepak R Varma wrote:
> Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
> function in place of the debugfs_create_file() function will make the
> file operation struct "reset" aware of the file's lifetime. Additional
> details here: https://lists.archive.carbon60.com/linux/kernel/2369498
> 
> Issue reported by Coccinelle script:
> scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>

Based on discussions triggered by other patches doing the same
replacement I will ignore this patch for now.
If the conclusions are that this is indeed the right thing to do then
please let us know so we can apply this patch.

Thanks,
	Sam

> ---
> Please Note: This is a Outreachy project task patch.
> 
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index c22e7c49e077..89b71d4f810d 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -502,15 +502,14 @@ static int allpixelson_set(void *data, u64 val)
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
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
