Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2746660F9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A865E10E7A9;
	Wed, 11 Jan 2023 16:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AF110E7A0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:51:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so14849050wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LHmBMWU2SWNtjXec6rBQlMkwK624/CHswkgmYXv2n0Y=;
 b=KAWAZcxBA/g537PW2pgy9HHAnsvYTQXGWZXB0mJQ4BwngCM142dMInth0PW7wti3TK
 3EW4rQbKx7wac4KzbfEaKxskWRdxek7SJ64NdG0ZarL+h2pwmVsyzUSHU5dtK/UtCHo+
 HmbJx7zW490VEqBUGE2ibZmrjTk38rz4A+mJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHmBMWU2SWNtjXec6rBQlMkwK624/CHswkgmYXv2n0Y=;
 b=7ZCnQLDeEMLP6vc+XFnwEBGNxXiIqzN4GVtgZ5KyTri6iLxuxc+5vU3Bk4fLP6GUAd
 18yqFkLoK1mdqeXz9y7MmtvrVw/WqCHfwz7fGhpThM0wOIuWNmQGly6mxOcLiHioF04K
 DFhbIBQEBQ2UN6up+Zr2m2S/46gwZ5PRUs8aRG/K150HsEgeTopy3Is1Bh7QO/Y08NtW
 qsskanIOQjG9Mj5efv4e2e9cgPWUuNMr9kSEMGbSD97o1MQUyJ5KL3c2iI02PrnGrt4H
 Y35yeaIFXR12boK9Z0Pi/i3GlkDH/d8fGjOZxOpwO+7a4VAdzxwm6LAMxRxv1+vDTVdr
 ErZw==
X-Gm-Message-State: AFqh2kpNgSnBJP9E2EqeGI9BPQO/I0YFAMh+CByrfvvq++oZ2cs/ftf2
 EnD+XKnEyafBHzIyuTHkCwBYUQ==
X-Google-Smtp-Source: AMrXdXsouhyLK5NqfGbiLX93aqJApozE4UxLS+XTULWdoBQPgskRAiuklAhwFNgIMvCyPHRelTozlw==
X-Received: by 2002:a05:600c:3b23:b0:3da:f37:1253 with SMTP id
 m35-20020a05600c3b2300b003da0f371253mr1312019wms.8.1673455914044; 
 Wed, 11 Jan 2023 08:51:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm25299500wmo.34.2023.01.11.08.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:51:53 -0800 (PST)
Date: Wed, 11 Jan 2023 17:51:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/11] video/aperture: use generic code to figure out the
 vga default device
Message-ID: <Y77pJ/+V2qHeqOjW@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-4-daniel.vetter@ffwll.ch>
 <e0c0e249-30bc-c310-0175-92ea379ef0d6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0c0e249-30bc-c310-0175-92ea379ef0d6@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 04:59:30PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.01.23 um 16:41 schrieb Daniel Vetter:
> > Since vgaarb has been promoted to be a core piece of the pci subsystem
> > we don't have to open code random guesses anymore, we actually know
> > this in a platform agnostic way, and there's no need for an x86
> > specific hack. See also 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
> > drivers/pci")
> > 
> > This should not result in any functional change, and the non-x86
> > multi-gpu pci systems are probably rare enough to not matter (I don't
> > know of any tbh). But it's a nice cleanup, so let's do it.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: linux-pci@vger.kernel.org
> > ---
> >   drivers/video/aperture.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> > index 41e77de1ea82..3d8c925c7365 100644
> > --- a/drivers/video/aperture.c
> > +++ b/drivers/video/aperture.c
> > @@ -324,13 +324,11 @@ EXPORT_SYMBOL(aperture_remove_conflicting_devices);
> >    */
> >   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
> >   {
> > -	bool primary = false;
> > +	bool primary;
> >   	resource_size_t base, size;
> >   	int bar, ret;
> > -#ifdef CONFIG_X86
> > -	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> > -#endif
> > +	primary = pdev == vga_default_device();
> 
> vga_default_device() is part of vgaarb and can return NULL. [1] That new
> test is likely to be incorrect on many systems.
> 
> I suggest to implement a helper like fb_is_primary_device() on x86: it uses
> the default VGA if set, or falls back to the original test. [2]
> 
> It's noteworthy that on most architectures, fb_is_primary_device() returns
> 0. But at least on Sparc [3] and some Parisc [4] machines, it does not.

Afaik these neither do legacy vga nor sysfb, so we should be fine. I'll
augment the commit message.

> I've long wanted to rework this helper anyway. So this is a good
> opportunity.

Hm yeah that sounds like a good thing to copy. I'm honestly not sure
whether it's needed, but at least it shouldn't hurt. I thought at least
that the boot default device should be set on all pci architectures.

I'll also reorder this with the previous patch to avoid the compile fail.
-Daniel

> 
> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/include/linux/vgaarb.h#L69
> [2]
> https://elixir.bootlin.com/linux/latest/source/arch/x86/video/fbdev.c#L14
> [3] https://elixir.bootlin.com/linux/latest/source/arch/sparc/include/asm/fb.h#L18
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/video/console/sticore.c#L1153
> 
> 
> >   	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
> >   		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
