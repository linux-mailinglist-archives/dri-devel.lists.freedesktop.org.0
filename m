Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75E21462D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 15:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65FA6E02A;
	Sat,  4 Jul 2020 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399CE6E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 13:41:20 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B194C20026;
 Sat,  4 Jul 2020 15:41:17 +0200 (CEST)
Date: Sat, 4 Jul 2020 15:41:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200704134115.GA755192@ravnborg.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
 <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
 <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=3GLR1-XzZKwA:10 a=2Bvo7i-APzZpiiyVkC0A:9
 a=iyIOAsMQKWBWs_df:21 a=5sHLvZY-hUYu8ohq:21 a=CjuIK1q_8ugA:10
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark.

On Sat, Jul 04, 2020 at 02:09:38PM +0100, Mark Cave-Ayland wrote:
> On 04/07/2020 12:11, Mark Cave-Ayland wrote:
> 
> > According to gdbstub the destination address in $g3 looks like this:
> > 
> > Breakpoint 1, 0x00000000007ad8e4 in cfb_imageblit ()
> > (gdb) i r $g3
> > g3             0x100220000      4297195520
> > 
> > 
> > The 0x100220000 address still isn't right. On sun4u the PCI address space is mapped
> > at physical address 0x1fe00000000 and adding these two together gives 0x1ff00220000
> > which seems closer, but still not the correct framebuffer address 0x1ff22000000 which
> > is reported at boot:
> > 
> > [    9.007161] [drm] Found bochs VGA, ID 0xb0c5.
> > [    9.007840] [drm] Framebuffer size 16384 kB @ 0x1ff22000000, mmio @ 0x1ff23000000.
> 
> As a comparison, I took the last known good commit 7a0483ac4ffc~1: "drm/bochs: add
> basic prime support" and added some debug in cfb_imageblit() to allow me to pick out
> p->screen_base:
> 
> (gdb) i r $o1
> o1             0x1ff22000000    2195298713600
> 
> When running git master with your patch in the same way I get a completely different
> value:
> 
> (gdb) i r $o1
> o1             0x100050000      4295294976
> 
> Does p->screen_base need to be initialised differently when using the cfb helpers?

I think what is happening is that the bochs driver request a shadow copy
for the frambuffer. And with the change to fbops we now use the cfb_
functions to write to the shadow framebuffer - which is not in any IO
space. So this does not work.

So maybe all we need is the fix in drm_fb_helper_dirty_blit_real().
If you try to undo the change so fbops is set to &drm_fbdev_fb_ops,
but keep the fix in drm_fb_helper_dirty_blit_real() how does it then
behave?

I did not find time to follow your instructions to test this myself with
qemu - sorry.

	Sam


> 
> 
> ATB,
> 
> Mark.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
