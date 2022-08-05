Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164958A431
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 02:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CA293650;
	Fri,  5 Aug 2022 00:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Fri, 05 Aug 2022 00:34:22 UTC
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD76AABB74
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 00:34:22 +0000 (UTC)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2750T200009896;
 Thu, 4 Aug 2022 19:29:02 -0500
Message-ID: <e92ea74fefd5110d2c1dbcea454d5ec8d2cadcf8.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
 geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Date: Fri, 05 Aug 2022 10:29:01 +1000
In-Reply-To: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
 <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-27 at 10:41 +0200, Thomas Zimmermann wrote:
> 
> > > +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
> > > +					       struct device_node *of_node,
> > > +					       u64 fb_base)
> > > +{
> > > +	struct drm_device *dev = &odev->dev;
> > > +	u64 address;
> > > +	void __iomem *cmap_base;
> > > +
> > > +	address = fb_base & 0xff000000ul;
> > > +	address += 0x7ff000;
> > > +
> > 
> > It would be good to know where these addresses are coming from. Maybe some
> > constant macros or a comment ? Same for the other places where addresses
> > and offsets are used.
> 
> I have no idea where these values come from. I took them from offb. And 
> I suspect that some of these CMAP helpers could be further merged if 
> only it was clear where the numbers come from.  But as i don't have the 
> equipment for testing, I took most of this literally as-is from offb.

Ancient black magic :-) Old ATI mach64 chips had the registers sitting
at the end of the framebuffer. You can find an equivalent in
drivers/video/aty/atyfb_base.c:atyfb_setup_generic():

	raddr = addr + 0x7ff000UL;

Cheers,
Ben.

