Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75FF67FFCB
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 16:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D822310E08F;
	Sun, 29 Jan 2023 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 515 seconds by postgrey-1.36 at gabe;
 Sun, 29 Jan 2023 15:13:11 UTC
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02310E093
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9978F20105;
 Sun, 29 Jan 2023 16:13:09 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Na_C0tx8wxZ8; Sun, 29 Jan 2023 16:13:09 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6FF1E20103;
 Sun, 29 Jan 2023 16:13:09 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pM9Mi-00GyeU-2G;
 Sun, 29 Jan 2023 16:13:08 +0100
Date: Sun, 29 Jan 2023 16:13:07 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fbcon: Check font dimension limits
Message-ID: <20230129151307.o4lsqgmnr2u2k3za@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@knights.ucf.edu>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org>
 <Y9IvBoAbmh27xl4B@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9IvBoAbmh27xl4B@kroah.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: linux-fbdev@vger.kernel.org, Sanan Hasanov <sanan.hasanov@knights.ucf.edu>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greg KH, le jeu. 26 janv. 2023 08:43:02 +0100, a ecrit:
> On Thu, Jan 26, 2023 at 01:49:12AM +0100, Samuel Thibault wrote:
> > blit_x and blit_y are uint32_t, so fbcon currently cannot support fonts
> > larger than 32x32.
> 
> "u32" you mean, right?

Right :)

> > The 32x32 case also needs shifting an unsigned int, to properly set bit
> > 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> > as reported on
> > 
> > http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com
> 
> Odd blank line?

Not sure what you mean? I found it easier to read to put a blank line
between the text and the references.

> > Kernel Branch: 6.2.0-rc5-next-20230124
> > Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> > Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing
> 
> What are all of these lines for?

They provide the references that were set in the original report

http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com

Arguably the "branch" and "config" are not that useful since the bug has
been there for more than a dozen years, but notably the "Reproducer" is
useful to provide a userland program that triggers the UB.

> > Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> > Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> What commit id does this fix?

I though it was there forever, but it seems the check was added in 2007,
so I'll add it in next version.

> Should it go to stable kernels?

Yes. I added stable in Cc of the mail but missed adding it in the text,
I will add it.

> > Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> > ===================================================================
> > --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> > +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> > @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
> >  	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
> >  		return -EINVAL;
> >  
> > +	if (font->width > 32 || font->height > 32)
> > +		return -EINVAL;
> > +
> >  	/* Make sure drawing engine can handle the font */
> > -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
> > -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> > +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
> > +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))
> 
> Are you sure this is still needed with the above check added?  If so,
> why?  What is the difference in the compiled code?

As mentioned by Jiri, yes in the 32 case it's needed otherwise it's UB.

Samuel
