Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA0584283
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 17:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D6810F8E0;
	Thu, 28 Jul 2022 15:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEFD10F433
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 15:01:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AEF1B82483;
 Thu, 28 Jul 2022 15:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0B4C433C1;
 Thu, 28 Jul 2022 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659020487;
 bh=AnGfT+ICsOyh5alSICQ2W481AGcoHD5Y+3Yjrk8MoK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWDZDXIRbUZ/IoBQeMzzoHOc5I2XHIwsTCKOeb2aQomZWw6DzieJDUzQEbGaqLe+0
 GuKlglVyhlolxfqdliF2m8KVh6DVDom4+rgyjGJ2nPulYrYgxdsVOFP7ZsA6/8nN09
 7rHvsufLcp53MTiIJcJGydPBj/k+wfMofQWXFGSo=
Date: Thu, 28 Jul 2022 17:01:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markuss Broks <markuss.broks@gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Message-ID: <YuKkxb7u3piHytJ8@kroah.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <YuKfnAjB4gV0ki4A@kroah.com>
 <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Wei Ming Chen <jj251510319013@gmail.com>,
 phone-devel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 05:52:04PM +0300, Markuss Broks wrote:
> Hi Greg,
> 
> On 7/28/22 17:39, Greg Kroah-Hartman wrote:
> > On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:
> > > Add early console support for generic linear framebuffer devices.
> > > This driver supports probing from cmdline early parameters
> > > or from the device-tree using information in simple-framebuffer node.
> > > The EFI functionality should be retained in whole.
> > > The driver was disabled on ARM because of a bug in early_ioremap
> > > implementation on ARM.
> > > 
> > > Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> > > ---
> > >   .../admin-guide/kernel-parameters.txt         |  12 +-
> > >   MAINTAINERS                                   |   5 +
> > >   drivers/firmware/efi/Kconfig                  |   6 +-
> > >   drivers/firmware/efi/Makefile                 |   1 -
> > >   drivers/firmware/efi/earlycon.c               | 246 --------------
> > >   drivers/video/fbdev/Kconfig                   |  11 +
> > >   drivers/video/fbdev/Makefile                  |   1 +
> > >   drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
> > >   8 files changed, 327 insertions(+), 256 deletions(-)
> > >   delete mode 100644 drivers/firmware/efi/earlycon.c
> > >   create mode 100644 drivers/video/fbdev/earlycon.c
> > 
> > That should be a rename, not a delete/create, right?
> 
> Should this change be split into two separate commits,
> one for moving the file and the second for making changes?

Git will show a rename and modification properly, if you use -M to git
format-patch, so it should be fine.
