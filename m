Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F887D78F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 01:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FAE112756;
	Sat, 16 Mar 2024 00:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E3112756
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 00:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 85296A02EC;
 Sat, 16 Mar 2024 01:12:52 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYDEp8X74GRV; Sat, 16 Mar 2024 01:12:52 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 689B9A02DF;
 Sat, 16 Mar 2024 01:12:52 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rlHfQ-0000000CQsO-0E7U; Sat, 16 Mar 2024 01:12:52 +0100
Date: Sat, 16 Mar 2024 01:12:52 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbcon: Increase maximum font width x height to 64 x 64
Message-ID: <20240316001251.l3ifu5exkrjmbhoe@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240313165934.557879-1-samuel.thibault@ens-lyon.org>
 <d7ca4ae3-4bcc-49f0-a819-4ad88907b93c@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7ca4ae3-4bcc-49f0-a819-4ad88907b93c@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Helge Deller, le ven. 15 mars 2024 10:35:40 +0100, a ecrit:
> You should have marked this patch with "v2"...

The actual changes were exactly the same.

> On 3/13/24 17:59, Samuel Thibault wrote:
> > This remains relatively simple by just enlarging integers.
> 
> I like the patch, but I still see some u32...
> drivers/video/fbdev/vt8623fb.c:         info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);
> drivers/video/fbdev/arkfb.c:            info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);
> drivers/video/fbdev/core/fbmem.c:               fb_info->pixmap.blit_x = ~(u32)0;
> drivers/video/fbdev/s3fb.c:             info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);

Oops, I missed including these modifications indeed.

> > It wouldn't be that simple to get to the console's 64x128 maximum, as it would
> > require 128b integers.
> 
> How realistic are fonts > 64x64 pixels ?

With 4K displays, 64x128 brings 60x16 text console, which is useful for
people with low vision.

> If they are, using the bitmap_xx functions (include/linux/bitmap.h)
> now instead would be better.

Ok, I have now done this in v2. We'll be able to easily increase the
font size when 8K displays get out :)

Samuel
