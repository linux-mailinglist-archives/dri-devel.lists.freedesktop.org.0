Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B25AF482
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EACF10E143;
	Tue,  6 Sep 2022 19:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D78C10E143
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:39:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id ay12so7429657wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=Q7k34QMFna+VMCWcVTBpDYwMMQqIocaQ24VXbz0U53E=;
 b=fSlBCXUTu5f+ysIYWkhIOcXEh0jK1dX6We3GoYUzQZD/pi1UP7PLGgh3ddRR5nF4bd
 IXrbHJCXywJEJD1/6lFMXsX2r6MtDTGZWi+ivQLGsdFh0rfWi0HwvRiTFhb2CKJArtDF
 0cOn3TBXU4djET4/KpQEUGdEZGhaaUKc7Vuxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q7k34QMFna+VMCWcVTBpDYwMMQqIocaQ24VXbz0U53E=;
 b=3g9mv33nmPgfXnImMQxBQO7u2PtmQEL3s4zpqKpCFFIjfIoBeiY2/BSOhguWO1oR2S
 dHusb6aGWn8K9sZYs9IUS3QtjsfloXNOB/mtqEsX5GvaT8vOiWXEBtBO1mi4N/ynT5Vk
 stx2SIlIfllhChn33dKCLhWK1fVJqmP3Bz/cS1x+5sjJPZ8DDxINbJaXttJNCsa5XV2Z
 jPSy8ppX7DizjwqrvyzLxlonxJAaapY09FS3lNagPiB4P7VdMY+w7LvF8Y8aWuuA+lZ0
 P/r/D00k4ULJYceojh+9UkrMuOvbAf94U6GM2B1Cp/PPxWCzQy710tMLEN7RS4b89k9y
 Mblg==
X-Gm-Message-State: ACgBeo0JxUVX/83nKfDM3RuxvesAPVeZ+yDVJeKeOIfz5Ye+8cxcey34
 vh3YY/VzxKjsfQwJcZtfl/4/xA==
X-Google-Smtp-Source: AA6agR7dO/5mx+p7Bq5UKEq1+BC5n76RbAm/1S4e5aby/E5HZfLdP8Mmz+/OpcL0OycEbj++i728uQ==
X-Received: by 2002:a05:600c:1554:b0:3a6:23d7:1669 with SMTP id
 f20-20020a05600c155400b003a623d71669mr14922175wmg.70.1662493188711; 
 Tue, 06 Sep 2022 12:39:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e27-20020adf9bdb000000b0021f0ff1bc6csm8083000wrc.41.2022.09.06.12.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:39:48 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:39:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Message-ID: <YxeiAbw0OLb7OP7V@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Ard Biesheuvel <ardb@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Borislav Petkov <bp@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Wei Ming Chen <jj251510319013@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tony Lindgren <tony@atomide.com>, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <YuKfnAjB4gV0ki4A@kroah.com>
 <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
 <YuKkxb7u3piHytJ8@kroah.com>
 <27b40940-b8a7-2755-1ef5-e97d6b35dd2a@gmail.com>
 <Yu9hWu8IseJlpCUK@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yu9hWu8IseJlpCUK@kroah.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
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

On Sun, Aug 07, 2022 at 08:53:14AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Aug 06, 2022 at 07:26:07PM +0300, Markuss Broks wrote:
> > Hi Greg,
> > 
> > On 7/28/22 18:01, Greg Kroah-Hartman wrote:
> > > On Thu, Jul 28, 2022 at 05:52:04PM +0300, Markuss Broks wrote:
> > > > Hi Greg,
> > > > 
> > > > On 7/28/22 17:39, Greg Kroah-Hartman wrote:
> > > > > On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:
> > > > > > Add early console support for generic linear framebuffer devices.
> > > > > > This driver supports probing from cmdline early parameters
> > > > > > or from the device-tree using information in simple-framebuffer node.
> > > > > > The EFI functionality should be retained in whole.
> > > > > > The driver was disabled on ARM because of a bug in early_ioremap
> > > > > > implementation on ARM.
> > > > > > 
> > > > > > Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> > > > > > ---
> > > > > >    .../admin-guide/kernel-parameters.txt         |  12 +-
> > > > > >    MAINTAINERS                                   |   5 +
> > > > > >    drivers/firmware/efi/Kconfig                  |   6 +-
> > > > > >    drivers/firmware/efi/Makefile                 |   1 -
> > > > > >    drivers/firmware/efi/earlycon.c               | 246 --------------
> > > > > >    drivers/video/fbdev/Kconfig                   |  11 +
> > > > > >    drivers/video/fbdev/Makefile                  |   1 +
> > > > > >    drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
> > > > > >    8 files changed, 327 insertions(+), 256 deletions(-)
> > > > > >    delete mode 100644 drivers/firmware/efi/earlycon.c
> > > > > >    create mode 100644 drivers/video/fbdev/earlycon.c
> > > > > 
> > > > > That should be a rename, not a delete/create, right?
> > > > 
> > > > Should this change be split into two separate commits,
> > > > one for moving the file and the second for making changes?
> > > 
> > > Git will show a rename and modification properly, if you use -M to git
> > > format-patch, so it should be fine.
> > 
> > It appears that there are so many changes Git would refuse to make it a
> > "move" no matter what I do. What should be done here: should it be two
> > separate commits for move/change or should it just be kept as delete/create?
> 
> One commit to move the file, and then add your changes on top of it
> might be the easiest to review, right?

+1

I think this should be a least
- commit to move the file, as unchanged as possible
- commit to auto-select the right mapping mode (or maybe that's only in
  v2)
- actual change to add the simplefb support with a clearly readable diff

But also video/console is for Greg to maintain, I'm trying hard to not go
even more stupid :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
