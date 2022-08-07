Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60C58B9E8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 08:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE892D35;
	Sun,  7 Aug 2022 06:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840FF930CA
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 06:53:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 439A160DDF;
 Sun,  7 Aug 2022 06:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD489C433C1;
 Sun,  7 Aug 2022 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659855199;
 bh=1rYnTrs8I+byhJUYy1LkYsWKoVp5KrJVR6dYtv8Vmns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+CoSJGNVIdkrVFDrhcI5xDcQ26g4ahZYt48v/0JnrfwwtzFxzlvGMlUYbp9lg4l2
 7Cu3gJZ8YISWrf5+pwl4mOEanmykz2H2/MAEnDe1IzYaFHrRRZ4l64u7laKd7dI1cL
 inrk+YcYvwRxXEnrhhsW7slK8v309gDbKzyuqovQ=
Date: Sun, 7 Aug 2022 08:53:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markuss Broks <markuss.broks@gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Message-ID: <Yu9hWu8IseJlpCUK@kroah.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <YuKfnAjB4gV0ki4A@kroah.com>
 <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
 <YuKkxb7u3piHytJ8@kroah.com>
 <27b40940-b8a7-2755-1ef5-e97d6b35dd2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27b40940-b8a7-2755-1ef5-e97d6b35dd2a@gmail.com>
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

On Sat, Aug 06, 2022 at 07:26:07PM +0300, Markuss Broks wrote:
> Hi Greg,
> 
> On 7/28/22 18:01, Greg Kroah-Hartman wrote:
> > On Thu, Jul 28, 2022 at 05:52:04PM +0300, Markuss Broks wrote:
> > > Hi Greg,
> > > 
> > > On 7/28/22 17:39, Greg Kroah-Hartman wrote:
> > > > On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:
> > > > > Add early console support for generic linear framebuffer devices.
> > > > > This driver supports probing from cmdline early parameters
> > > > > or from the device-tree using information in simple-framebuffer node.
> > > > > The EFI functionality should be retained in whole.
> > > > > The driver was disabled on ARM because of a bug in early_ioremap
> > > > > implementation on ARM.
> > > > > 
> > > > > Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> > > > > ---
> > > > >    .../admin-guide/kernel-parameters.txt         |  12 +-
> > > > >    MAINTAINERS                                   |   5 +
> > > > >    drivers/firmware/efi/Kconfig                  |   6 +-
> > > > >    drivers/firmware/efi/Makefile                 |   1 -
> > > > >    drivers/firmware/efi/earlycon.c               | 246 --------------
> > > > >    drivers/video/fbdev/Kconfig                   |  11 +
> > > > >    drivers/video/fbdev/Makefile                  |   1 +
> > > > >    drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
> > > > >    8 files changed, 327 insertions(+), 256 deletions(-)
> > > > >    delete mode 100644 drivers/firmware/efi/earlycon.c
> > > > >    create mode 100644 drivers/video/fbdev/earlycon.c
> > > > 
> > > > That should be a rename, not a delete/create, right?
> > > 
> > > Should this change be split into two separate commits,
> > > one for moving the file and the second for making changes?
> > 
> > Git will show a rename and modification properly, if you use -M to git
> > format-patch, so it should be fine.
> 
> It appears that there are so many changes Git would refuse to make it a
> "move" no matter what I do. What should be done here: should it be two
> separate commits for move/change or should it just be kept as delete/create?

One commit to move the file, and then add your changes on top of it
might be the easiest to review, right?

thanks,

greg k-h
