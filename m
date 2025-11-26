Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD3C89B8F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3606F10E13E;
	Wed, 26 Nov 2025 12:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EemWM17I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB8F10E04C;
 Wed, 26 Nov 2025 12:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF713601A0;
 Wed, 26 Nov 2025 12:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F0BC113D0;
 Wed, 26 Nov 2025 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764159582;
 bh=DpblEZ7Jqa5nTEFa+LhpQdaCZW7NNgLiSMt10scqV8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EemWM17IQYzadctzqnkw7jLA2naPmWJMyA7Z/AaTdAsGeRG7p1bEBsSor39UsnAOE
 6HVJ86FsOCdWMlAjfF7vekuwNX04BUsi/SJ2nGUAuYrJqSRRmd3Fh8fchchdEntrXD
 dPUK/gvCUeLRAqgKvaeCpmFzHQ/xS5zpEuPebW/lAp65+GZ+n0yH5dhuaC7V5Vdq76
 dyfl8wLXUSk5GSmghC9D9GVWc/2EoAqlmV3DALm+eLFJrHAUAu7wbgQX2SBZYAJpUy
 RijLrk4UTzsGoIibjCGi03CuOb5iDZRBQlz3BdWO5+it5TX9aqwnqphJjXjnsRm3IR
 IHM6YFw9BgkRw==
Date: Wed, 26 Nov 2025 12:19:36 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org,
 deller@gmx.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jason.wessel@windriver.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nir Lichtman <nir@lichtman.org>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
Message-ID: <aSbwWLTLe0bMhOKV@aspen.lan>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
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

On Tue, Nov 25, 2025 at 07:26:33AM -0800, Doug Anderson wrote:
> On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > <snip>
> > Therefore remove the remaining support for kdb from the DRM drivers
> > and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> > there are no fbdev drivers with kdb support.
> >
> > If we ever want to address kdb support within DRM drivers, a place to
> > start would be the scanout buffers used by DRM's panic screen. These
> > use the current display mode. They can be written and flushed without
> > mode setting involved.
> >
> > Note: kdb over serial lines is not affected by this series and continues
> > to work as before.
> >
> > Thomas Zimmermann (5):
> >   drm/amdgpu: Do not implement mode_set_base_atomic callback
> >   drm/nouveau: Do not implement mode_set_base_atomic callback
> >   drm/radeon: Do not implement mode_set_base_atomic callback
> >   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
> >   fbcon: Remove fb_debug_enter/_leave from struct fb_ops
>
> Personally, I've never worked with kdb over anything other than
> serial, so this won't bother any of my normal workflows. That being
> said, at least as of a year ago someone on the lists was talking about
> using kdb with a keyboard and (presumably) a display. You can see a
> thread here:
>
> http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org
>
> Daniel may also have comments here?

TL;DR - I'm pretty relaxed about these changes... but I'd like
        to know how to test the changes.

Like Doug I only really use kdb via serial but, since I'm maintain
the thing I do occasionally test kdb works on the qemu console. I don't
do it very often though because it's a manual test!

I'd assume that will still work since it won't involve any of the
drivers above. I'm afraid I can't double check that since patch 4
doesn't apply cleanly in v6.18-rc7 (nor to linux-next... and neither
does the base-commit appear in linux-next).

Anyhow, the only testing I do for kgdboc=kms,kdb is to boot an x86-64
defconfig+kgdb+kdb kernel in qemu with something like the following
command line, which FWIW does still work:

    qemu-system-x86_64 -enable-kvm -m 1G -smp 2 \
      -kernel arch/x86/boot/bzImage \
      -monitor none -chardev stdio,id=mon,mux=on,signal=off \
      -serial chardev:mon \
      -initrd rootfs.cpio.gz \
      -append " console=tty0 console=ttyS0,115200 kgdboc=kms,kbd,ttyS0 kgdbwait"

The reason I'm fairly relaxed about changes here is that the kbd driver
only works on PCs with legacy keyboard interfaces. If the kernel is
talking to the keyboard using USB or I2C (which almost all PCs do) then
kdb cannot be used anyway.

So... it would be a "cool project"[1] to get kdb running on
a special interrupt-free I2C mode and with the DRM panic code so you
can do live analysis if your laptop/chomebook crashes. However it is
simply not "real enough" to justify slowing down other developers.


Daniel.


[1] ... but not quite cool enough that I see myself spending time on it
    though!
