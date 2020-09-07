Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E44A25FA43
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 14:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA2D6E443;
	Mon,  7 Sep 2020 12:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 967 seconds by postgrey-1.36 at gabe;
 Mon, 07 Sep 2020 12:15:20 UTC
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629266E443
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:15:20 +0000 (UTC)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 087Bwjb2023420
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 7 Sep 2020 06:58:49 -0500
Message-ID: <6161b96a30e51ff77a387a71eee6a46400530155.camel@kernel.crashing.org>
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Daniel Vetter <daniel@ffwll.ch>, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Mon, 07 Sep 2020 21:58:44 +1000
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bjorn@helgaas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-09-07 at 09:55 +0200, Daniel Vetter wrote:
> On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > Linux Kernel Mentee: Remove Legacy Power Management. 
> > 
> > The original goal of the patch series is to upgrade the power
> > management
> > framework of radeonfb fbdev driver. This has been done by upgrading
> > .suspend()
> > and .resume() callbacks.
> > 
> > The upgrade makes sure that the involvement of PCI Core does not
> > change the
> > order of operations executed in a driver. Thus, does not change its
> > behavior.
> > 
> > During this process, it was found that "#if defined(CONFIG_PM)" at
> > line 1434 is
> > redundant. This was introduced in the commit
> > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> 
> I do wonder whether it wouldn't be better to just outright delete
> these,
> we have the drm radeon driver for pretty much all the same hardware
> ...

The only thing is, afaik, the DRM drivers never got the D2/D3 code that
I wrote for radeonfb to get old powerbooks to suspend/resume.

Cheers,
Ben.

> -Daniel
> 
> > 
> > ------------
> > 
> > Before 42ddb453a0cd:
> > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n
> > "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1943:#ifdef CONFIG_PPC_OF
> >                    |-- 2206:#if 0 /* Not ready yet */
> >                    |-- 2508:#endif /* 0 */
> >        |-- 2510:#endif /* CONFIG_PPC_OF */
> >        |-- 2648:#ifdef CONFIG_PPC_PMAC
> >        |-- 2654:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2768:#ifdef CONFIG_PPC_PMAC
> >        |-- 2774:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2801:#endif /* CONFIG_PPC_OF */
> > 2803:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > After 42ddb453a0cd:
> > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n
> > "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1430:#if defined(CONFIG_PM)
> >                    |-- 1431:#if defined(CONFIG_X86) ||
> > defined(CONFIG_PPC_PMAC)
> >                    |-- 1944:#endif
> >                    |-- 1946:#ifdef CONFIG_PPC_OF
> >                                |-- 1947:#ifdef CONFIG_PPC_PMAC
> >                                |-- 2208:#endif
> >                    |-- 2209:#endif
> >                    |-- 2211:#if 0 /* Not ready yet */
> >                    |-- 2513:#endif /* 0 */
> >        |-- 2515:#endif /* CONFIG_PPC_OF */
> >        |-- 2653:#ifdef CONFIG_PPC_PMAC
> >        |-- 2659:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2773:#ifdef CONFIG_PPC_PMAC
> >        |-- 2779:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2806:#endif /* CONFIG_PPC_OF */
> > 2808:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > This also affected the CONFIG_PPC_OF container (line 1943 at commit
> > 65122f7e80b5)
> > 
> > The patch-series fixes it along with PM upgrade.
> > 
> > All patches are compile-tested only.
> > 
> > Test tools:
> >     - Compiler: gcc (GCC) 10.1.0
> >     - allmodconfig build: make -j$(nproc) W=1 all
> > 
> > Vaibhav Gupta (2):
> >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM
> > container
> >   fbdev: radeonfb:use generic power management
> > 
> >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++---
> > ----
> >  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
> >  3 files changed, 35 insertions(+), 16 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
