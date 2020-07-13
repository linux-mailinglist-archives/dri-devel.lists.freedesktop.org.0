Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F821DFE7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 20:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C5B6E580;
	Mon, 13 Jul 2020 18:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DAB6E580
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 18:39:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 05A292003A;
 Mon, 13 Jul 2020 20:39:10 +0200 (CEST)
Date: Mon, 13 Jul 2020 20:39:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200713183909.GA1331493@ravnborg.org>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713162159.GR3278063@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pcZqCyVeAAAA:8 a=20KFwNOVAAAA:8
 a=J1Y8HTJGAAAA:8 a=VwQbUJbxAAAA:8 a=96nuGy9PJbH8bmhdDRIA:9
 a=fKyQknTQEHy6WF0X:21 a=tPGGyZCimvQ9wYR8:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=SGy6VSG0Ue1xmPAwIFl9:22
 a=y1Q9-5lHfBjTkpIzbSAN:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 06:21:59PM +0200, Daniel Vetter wrote:
> On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> > > Mark reported that sparc64 would panic while booting using qemu.
> > > Mark bisected this to a patch that introduced generic fbdev emulation to
> > > the bochs DRM driver.
> > > Mark pointed out that a similar bug was fixed before where
> > > the sys helpers was replaced by cfb helpers.
> > > 
> > > The culprint here is that the framebuffer reside in IO memory which
> > > requires SPARC ASI_PHYS (physical) loads and stores.
> > > 
> > > The current bohcs DRM driver uses a shadow buffer.
> > > So all copying to the framebuffer happens in
> > > drm_fb_helper_dirty_blit_real().
> > > 
> > > The fix is to replace the memcpy with memcpy_toio() from io.h.
> > > 
> > > memcpy_toio() uses writeb() where the original fbdev code
> > > used sbus_memcpy_toio(). The latter uses sbus_writeb().
> > > 
> > > The difference between writeb() and sbus_memcpy_toio() is
> > > that writeb() writes bytes in little-endian, where sbus_writeb() writes
> > > bytes in big-endian. As endian does not matter for byte writes they are
> > > the same. So we can safely use memcpy_toio() here.
> > > 
> > > For many architectures memcpy_toio() is a simple memcpy().
> > > One sideeffect that is unknow is if this has any impact on other
> > > architectures.
> > > So far the analysis tells that this change is OK for other arch's.
> > > but testing would be good.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: sparclinux@vger.kernel.org
> > 
> > So this actually is a problem in practice. Do you know how userspace
> > handles this?
> > 
> > For this patch
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > but I'd like to have someone with more architecture expertise ack this
> > as well.
> > 
> > Best regards
> > Thomas
> > 
> > > ---
> > >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index 5609e164805f..4d05b0ab1592 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> > >  	unsigned int y;
> > >  
> > >  	for (y = clip->y1; y < clip->y2; y++) {
> > > -		memcpy(dst, src, len);
> > > +		memcpy_toio(dst, src, len);
> 
> I don't think we can do this unconditionally, there's fbdev-helper drivers
> using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
> to fix this properly I think.
> 
> What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
> version, for which we don't have any drivers really. But I do think we
> need to differentiate between memcpy and memcpy_tio. That's what this
> entire annoying _cfb_ vs _sys_ business is all about, and also what gem
> vram helpers have to deal with.

I did some more digging - taking notes see where this gets us.

fbdev have a fb_memcpy_tofb macro used in fb_write() that is architecture dependent:
__aarch64__		memcpy_toio
__alpha__		memcpy_toio
__arm__			memcpy_toio
__hppa__		memcpy_toio
__i386__		memcpy_toio
__powerpc__		memcpy_toio
__sh__			memcpy_toio
__sparc__		sbus_memcpy_toio
__x86_64__		memcpy_toio

Others			memcpy

If we then take a closer look at memcpy_toio it is defined like this:
alpha			__raw (optimized based on size / alignment)
arm			optimised memcpy - same as memcpy
arm64			__raw (optimized based on size / alignment)
hexagon			memcpy
ia64			writeb which is little endian so the same as memcpy
m68k			memcpy
mips			memcpy
parisc			__raw (optimized based on size/alignment)
s390			s390 copy operations
sh			direct copies (looks like __raw copies)
sparc			writeb
sparc64			sparc64 copies
x86_64			x86_64 optimies copies (movs assembler)

Others			memcpy

As already analyzed sbus_memcpy_toio and memcpy_toio for sparc64 is the
same. So from the above we can see that fbdev code always uses
memcpy_toio or something equivalent when copying to framebuffer.

The conclusions so far:
- Copying to a framebuffer is correct to use memcpy_toio
- fbdev could have the macro fb_memcpy_tofb replaced by a direct call to
  memcpy_toio - I think the fb_memcpy_tofb macro predates the common
  memcpy_toio macro which explains why this was not used

This does not touch the whole _cfb_ vs _sys_ business.

In video/fbdev/ this is driver specific.
So we could add a fbdev_use_iomem as you suggested on irc som days ago.
This is not strictly necessary for the sparc64 fix but let me try to
come up with a patch anyway.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
