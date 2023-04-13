Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFE6E0969
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8F10EA8B;
	Thu, 13 Apr 2023 08:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C010EA8B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:54:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-947a47eb908so153861366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681376068; x=1683968068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yBQOF/vga6NMKTa9AUKod4wW5m1XLq+qhlQTRx+ZaCs=;
 b=dOVAi8hJY628d8gc6tf0YupNBwWvWkp0leRka2RgNVLD/72Kw3Ar31mH7pOo2ST+sW
 i6Ts/k2sP19N4iiQnWNJesI8oB16aLoF4kiUmwgM79LZJovplVPKM6FR7FuVCIxkZTxC
 f0JP/B7fqAp0W6Z5gd4rzkWHyNo/0kBoGfEko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376068; x=1683968068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBQOF/vga6NMKTa9AUKod4wW5m1XLq+qhlQTRx+ZaCs=;
 b=ihjblM6KnP6G6lyRqd1iz+WY/GrC+RNPwcAx9Ykxvki1NHeIewXCDqbESz+7NsHbmx
 v5Y16EfiEle3/YIbgmqs8RqhegkKMgK7iZoBP4KtR4IllCu6aQjWYGhJEyR/VtECRopd
 Qpxd03AMNHkc74rI5qb0uxF6oescC/NR4C3dmw7Vd7R2+sEZMAdvGOiOkD+mQHTokcir
 7kgrbU2vfF5ekj1DdP76hCenEj57nzDohHxKzGnPjhJfpbi4+aixs6PXFSF3+tINqN7a
 Go9RqCxVUEWrDqwSw4cU7AqZ0oCo+E8VjJWMrZ/zRKu2/O5EpsUDJ1xkXMOkh6Yn99u9
 pH2g==
X-Gm-Message-State: AAQBX9d5Q3OHpNPGonsWlREmRv/DuFYV2CLzBbxerE1HSqQeIgCCRlAM
 dovBx7Bupg55A1+88dtSpwxDmg==
X-Google-Smtp-Source: AKy350aSAc9GWJjxL/kPlQbVGytNV9sUpXgKmErOCNLbjvrK2++PhSUHTI+sliHIVK/DcLX0EQwCFA==
X-Received: by 2002:a17:906:74c7:b0:92f:27c2:13c0 with SMTP id
 z7-20020a17090674c700b0092f27c213c0mr2017934ejl.6.1681376068344; 
 Thu, 13 Apr 2023 01:54:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ji12-20020a170907980c00b0094e1272bd12sm640044ejc.159.2023.04.13.01.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 01:54:27 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:54:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 2/9] video/aperture: use generic code to figure out
 the vga default device
Message-ID: <ZDfDQjzx23M/0A7U@phenom.ffwll.local>
References: <20230406132109.32050-1-tzimmermann@suse.de>
 <20230406132109.32050-3-tzimmermann@suse.de>
 <85282243-33a6-a311-0b50-a7edfc4c4c6e@gmx.de>
 <ZDVwa44NvIXWKWrv@phenom.ffwll.local>
 <83acd60f-4a42-25a9-afee-ca7919ee42a9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83acd60f-4a42-25a9-afee-ca7919ee42a9@gmx.de>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 05:25:47PM +0200, Helge Deller wrote:
> On 4/11/23 16:36, Daniel Vetter wrote:
> > On Fri, Apr 07, 2023 at 10:54:00PM +0200, Helge Deller wrote:
> > > On 4/6/23 15:21, Thomas Zimmermann wrote:
> > > > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > 
> > > > Since vgaarb has been promoted to be a core piece of the pci subsystem
> > > > we don't have to open code random guesses anymore, we actually know
> > > > this in a platform agnostic way, and there's no need for an x86
> > > > specific hack. See also commit 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
> > > > drivers/pci")
> > > > 
> > > > This should not result in any functional change, and the non-x86
> > > > multi-gpu pci systems are probably rare enough to not matter (I don't
> > > > know of any tbh). But it's a nice cleanup, so let's do it.
> > > > 
> > > > There's been a few questions on previous iterations on dri-devel and
> > > > irc:
> > > > 
> > > > - fb_is_primary_device() seems to be yet another implementation of
> > > >     this theme, and at least on x86 it checks for both
> > > >     vga_default_device OR rom shadowing. There shouldn't ever be a case
> > > >     where rom shadowing gives any additional hints about the boot vga
> > > >     device, but if there is then the default vga selection in vgaarb
> > > >     should probably be fixed. And not special-case checks replicated all
> > > >     over.
> > > > 
> > > > - Thomas also brought up that on most !x86 systems
> > > >     fb_is_primary_device() returns 0, except on sparc/parisc. But these
> > > >     2 special cases are about platform specific devices and not pci, so
> > > >     shouldn't have any interactions.
> > > 
> > > Nearly all graphics cards on parisc machines are actually PCI cards,
> > > but the way we handle the handover to graphics mode with STIcore doesn't
> > > conflicts with your planned aperture changes.
> > > So no problem as far as I can see for parisc...
> > 
> > Ah I thought sticore was some very special bus, if those can be pci cards
> 
> STI stands for "Standard Text Interface" [1], which is a API of ROM functions
> to output text chars on a console. It's comparable to the text output functions
> in a PC-BIOS on x86 and dependend on the ROM it drives any supported card which has
> a parisc ROM. So, STI supports cards on PCI & AGP busses, as well on older GSC busses.
> [1] https://parisc.wiki.kernel.org/images-parisc/e/e3/Sti.pdf
> 
> > underneath then I guess some cleanup eventually might be a good idea? For
> > anything with a pci bus it's rather strange when vgaarb and
> > fb_is_primary_device() aren't a match ...
> 
> There is no VGA on parisc, so there is no conflict. Cards come either with
> a parisc STI ROM to support text mode, or they will only be used as secondary
> cards only.  The graphics mode is only done in userspace by specific drivers, e.g.
> by the X11 server in HP-UX.
> Even on x86 the BIOS will only show text output if the graphics card comes
> with a VGA-compatible BIOS.

tbf after reading vt.c and fbcon.c some more I'm pretty sure my patch is
nonsense. As sure as you can be with vt/fbcon :-/

Since it sounds like it's a driver bug, maybe a patch to do a pr_warn in
register_framebuffer if there's no mode? I read a pile of code around
modedb.c right now, and there's a lot of things that silently assume that
you always have a mode. So would be good thing to check.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
