Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E196DDE17
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C658B10E56E;
	Tue, 11 Apr 2023 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512F10E56E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:36:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f05f61adbeso1576365e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681223790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F/9s4MmBtHe5NsXKH5rsLF1epbFuabZfYBtz2rgF3IM=;
 b=AmK+ahYjvW6kcPI+mQhwW8Y+6uTX+p+DedJ4+XA7DXU/ms+JuRXcnfZNXaardwQqvD
 omIQWsGFb5a6X0Jz/KzGa+xx3SOV0eokfeDpfRppsTp41xyU8QY+T708i2wn/nIl6Hcn
 qt6f4PBGTeqm84d54siqW6hzbkWAscgeGzHQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/9s4MmBtHe5NsXKH5rsLF1epbFuabZfYBtz2rgF3IM=;
 b=h1JzIPqQkrMNOwUWbWHe0s5TUD0u2MmFHcBCMTx5lHW4Y6bNcONqPvkgS3vuRHD1DF
 bcvYybpgtjsk8rE3zn+fDI/VI7KBn/39DDyTuJ8MSskD0Hne/HxOkmFqmpRLt7CeL9S8
 hyZMBIVHQl1I6cPA6JqOGz2QrxoVSAFLmRNgkQ7DmmUgDvTWhJTkz2YoBgqvKXHKB+Xq
 oZjiTyTVcbEKeIyrjJYQYf7hEogtuHi6zx068lcmG20/AdyvMI3YRt1WsRU9fYCdkZIf
 NiCefNSGSd50zt8Ae0ln2rjaLX6LopZ1lhhIoMG8JniPbdmJk3VTMjyop49tWquaFScQ
 qXNw==
X-Gm-Message-State: AAQBX9fjD7f7T03KhzaMAOaHNx2cWO1j+6FubrrYDBcgNo6f3Nx0HnEb
 tuQd9RnENpJgmQmcJRTpugBVTw==
X-Google-Smtp-Source: AKy350ZhwGv7Q0l6A1XUuXwX4y+iD6ltzBT4TmO43D5j7OgvC2eOzix0bm6ngX4Kwlgmlg1Fl/4AfA==
X-Received: by 2002:a05:600c:1c1e:b0:3f0:5a8c:fee4 with SMTP id
 j30-20020a05600c1c1e00b003f05a8cfee4mr8043334wms.4.1681223790085; 
 Tue, 11 Apr 2023 07:36:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c315200b003ef6708bc1esm21612534wmo.43.2023.04.11.07.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:36:29 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:36:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 2/9] video/aperture: use generic code to figure out
 the vga default device
Message-ID: <ZDVwa44NvIXWKWrv@phenom.ffwll.local>
References: <20230406132109.32050-1-tzimmermann@suse.de>
 <20230406132109.32050-3-tzimmermann@suse.de>
 <85282243-33a6-a311-0b50-a7edfc4c4c6e@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85282243-33a6-a311-0b50-a7edfc4c4c6e@gmx.de>
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

On Fri, Apr 07, 2023 at 10:54:00PM +0200, Helge Deller wrote:
> On 4/6/23 15:21, Thomas Zimmermann wrote:
> > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Since vgaarb has been promoted to be a core piece of the pci subsystem
> > we don't have to open code random guesses anymore, we actually know
> > this in a platform agnostic way, and there's no need for an x86
> > specific hack. See also commit 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
> > drivers/pci")
> > 
> > This should not result in any functional change, and the non-x86
> > multi-gpu pci systems are probably rare enough to not matter (I don't
> > know of any tbh). But it's a nice cleanup, so let's do it.
> > 
> > There's been a few questions on previous iterations on dri-devel and
> > irc:
> > 
> > - fb_is_primary_device() seems to be yet another implementation of
> >    this theme, and at least on x86 it checks for both
> >    vga_default_device OR rom shadowing. There shouldn't ever be a case
> >    where rom shadowing gives any additional hints about the boot vga
> >    device, but if there is then the default vga selection in vgaarb
> >    should probably be fixed. And not special-case checks replicated all
> >    over.
> > 
> > - Thomas also brought up that on most !x86 systems
> >    fb_is_primary_device() returns 0, except on sparc/parisc. But these
> >    2 special cases are about platform specific devices and not pci, so
> >    shouldn't have any interactions.
> 
> Nearly all graphics cards on parisc machines are actually PCI cards,
> but the way we handle the handover to graphics mode with STIcore doesn't
> conflicts with your planned aperture changes.
> So no problem as far as I can see for parisc...

Ah I thought sticore was some very special bus, if those can be pci cards
underneath then I guess some cleanup eventually might be a good idea? For
anything with a pci bus it's rather strange when vgaarb and
fb_is_primary_device() aren't a match ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
