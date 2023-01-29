Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1D67FFCC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 16:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B34210E093;
	Sun, 29 Jan 2023 15:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9853C10E093
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 15:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E60B620101;
 Sun, 29 Jan 2023 16:04:33 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4_rJgW-ZcYF; Sun, 29 Jan 2023 16:04:33 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 889D7200F9;
 Sun, 29 Jan 2023 16:04:33 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pM9EP-00Gy4h-0I;
 Sun, 29 Jan 2023 16:04:33 +0100
Date: Sun, 29 Jan 2023 16:04:33 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] fbcon: Check font dimension limits
Message-ID: <20230129150433.gmdmger2ah63nsg7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org>
 <3bcd9911-5fdd-2a1a-0a76-55e1b8f7642a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bcd9911-5fdd-2a1a-0a76-55e1b8f7642a@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>,
 gregkh@linuxfoundation.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jiri Slaby, le jeu. 26 janv. 2023 10:02:55 +0100, a ecrit:
> On 26. 01. 23, 1:49, Samuel Thibault wrote:
> > Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> > ===================================================================
> > --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> > +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> > @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
> >   	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
> >   		return -EINVAL;
> > +	if (font->width > 32 || font->height > 32)
> > +		return -EINVAL;
> > +
> >   	/* Make sure drawing engine can handle the font */
> > -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
> > -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> > +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
> > +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))
> 
> So use BIT() properly then? That should be used in all these shifts anyway.
> Exactly to avoid UB.

Right, I'll use that in next version.

Samuel
