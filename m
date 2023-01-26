Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3D67D6FB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357A10E2BB;
	Thu, 26 Jan 2023 20:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 526 seconds by postgrey-1.36 at gabe;
 Thu, 26 Jan 2023 00:58:58 UTC
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509C10E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 43C6D20153;
 Thu, 26 Jan 2023 01:51:31 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Okn7r1ewCpFJ; Thu, 26 Jan 2023 01:51:31 +0100 (CET)
Received: from begin (adijon-658-1-86-31.w86-204.abo.wanadoo.fr
 [86.204.233.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 0F8EC20145;
 Thu, 26 Jan 2023 01:51:31 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pKqUE-00HVSI-2C;
 Thu, 26 Jan 2023 01:51:30 +0100
Date: Thu, 26 Jan 2023 01:51:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbcon: Check font dimension limits
Message-ID: <20230126005130.t4krica4lfv3p6sc@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126004921.616264824@ens-lyon.org>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:58:31 +0000
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
Cc: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(FYI, the UB was already a problem before my big-font patch submission,
the checks I add here are already making sense in previous versions
anyway)

Samuel Thibault, le jeu. 26 janv. 2023 01:49:12 +0100, a ecrit:
> blit_x and blit_y are uint32_t, so fbcon currently cannot support fonts
> larger than 32x32.
> 
> The 32x32 case also needs shifting an unsigned int, to properly set bit
> 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> as reported on
> 
> http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com
> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing
> 
> Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> ===================================================================
> --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
>  	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>  		return -EINVAL;
>  
> +	if (font->width > 32 || font->height > 32)
> +		return -EINVAL;
> +
>  	/* Make sure drawing engine can handle the font */
> -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
> -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
> +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))
>  		return -EINVAL;
>  
>  	/* Make sure driver can handle the font length */
> 
> 
