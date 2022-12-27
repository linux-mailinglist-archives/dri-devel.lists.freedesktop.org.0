Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD7656E0E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 19:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307A410E331;
	Tue, 27 Dec 2022 18:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4AD10E331
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 18:48:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA7A0611D3;
 Tue, 27 Dec 2022 18:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D088C433D2;
 Tue, 27 Dec 2022 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672166893;
 bh=jC+G6KggctyJl19lPvX6acqHjopjAKeOdWYT4ODLTZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lo1YFgc4wMO579CEmwBJteC/WRWHqg6NmNoHdgr2Myntqw6NsJ/QboLSBLlG0/wQl
 GNxFtfJuBD1zNW0kzFB0gkOFhWDXP7vftCIm8u80vENUIrb/sF3LRupDlqdpM7mH8p
 Spu9aRXzzs5wSCaFWUx0HinsGxFdV1WgK4abqeTTyC4fyNYrPd6N5EXj06jxX81NYI
 hl8HBlrrxBvlWkP7lFICUXqtL7HIHU5/Fh8fT8AxhPEir4aAaHqYdTrPahC6IoZctI
 OOIVJmRn7TjXDhhk9ne82b53glBkRNIvZO4zUJaZWpWsVpawEz/rsxgxxNgnkOxk7w
 zNVuI+iJztoZw==
Date: Tue, 27 Dec 2022 11:48:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: make offb driver tristate
Message-ID: <Y6s96iuc3NRN5tS4@dev-arch.thelio-3990X>
References: <20221126000401.25302-1-rdunlap@infradead.org>
 <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
 <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 10, 2022 at 05:35:06PM +0100, Helge Deller wrote:
> On 11/26/22 14:40, Thomas Zimmermann wrote:
> > Am 26.11.22 um 01:04 schrieb Randy Dunlap:
> > > Make the offb (Open Firmware frame buffer) driver tristate,
> > > i.e., so that it can be built as a loadable module.
> > > 
> > > However, it still depends on the setting of DRM_OFDRM
> > > so that both of these drivers cannot be builtin at the same time
> > > nor can one be builtin and the other one a loadable module.
> > > 
> > > Build-tested successfully with all combination of DRM_OFDRM and FB_OF.
> > > 
> > > This fixes a build issue that Michal reported when FB_OF=y and
> > > DRM_OFDRM=m:
> > > 
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'
> > > 
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Michal Suchánek <msuchanek@suse.de>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: linux-fbdev@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> applied.

Is this going to make it to Linus soon? We are now seeing this error in
our CI, which has the configuration describe in this commit.

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/3785609002/jobs/6437398666#step:5:149

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2JUMSmjAoSJoKfl6PPjfU66JGit/build.log

Cheers,
Nathan

> > > ---
> > >   drivers/video/fbdev/Kconfig |    4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > > --- a/drivers/video/fbdev/Kconfig
> > > +++ b/drivers/video/fbdev/Kconfig
> > > @@ -456,8 +456,8 @@ config FB_ATARI
> > >         chipset found in Ataris.
> > >   config FB_OF
> > > -    bool "Open Firmware frame buffer device support"
> > > -    depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> > > +    tristate "Open Firmware frame buffer device support"
> > > +    depends on FB && PPC && (!PPC_PSERIES || PCI)
> > >       depends on !DRM_OFDRM
> > >       select APERTURE_HELPERS
> > >       select FB_CFB_FILLRECT
> > 
> 
> 
