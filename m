Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5831413022A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828AD6E45F;
	Sat,  4 Jan 2020 11:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D31A6E3A6
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 05:53:45 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AFCB18043;
 Sat,  4 Jan 2020 05:54:25 +0000 (UTC)
Date: Fri, 3 Jan 2020 21:53:41 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104055341.GB5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20200104045211.GA10025@chinchilla>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104045211.GA10025@chinchilla>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Matthijs van Duin <matthijsvanduin@gmail.com> [200104 04:53]:
> On Fri, Dec 20, 2019 at 04:57:11PM -0800, Tony Lindgren wrote:
> > On my droid4 I noticed bad constant tearing on the LCD with stellarium in
> > landscape mode with xorg-video-omap rotated with xrandr --rotate right.
> > Every second or so update gets squeezed down in size to only the top half
> > of the LCD panel.
> 
> Odd, there's not really a good reason for rotation to have any effect on
> whether tearing happens or not.
> 
> BTW, with "top half", I assume you mean the top of the screen (i.e.
> right side of the display), not the top of the display (i.e. left side
> of the screen) ?

Correct right side of the display that appears on top after rotate right.

> > This issue does not happen with xrandr --rotate normal, or when HDMI
> > display is also connected.
> 
> Ehhhh, mirroring onto HDMI fixes the problem?  Strange

Yup just connecting an additional HDMI panel fixes the issue on the LCD :)

> > Looking around what might affect BO_TILED, I noticed Matthijs had this
> > change in his earlier pyra tiler patches. The earlier patch "XXX omapdrm:
> > force tiled buffers to be pinned and page-aligned" has no commit log
> > though, so I'm not sure what other issues this might fix.
> 
> This is just part of a hacky patch series to improve performance for
> userspace access to tiled buffers.  Page alignment has no effect by
> itself, but it's necessary to allow the tiled memory allocated by
> tiled_reserve_2d() to be mapped directly into userspace instead of using
> the really slow "usergart" mechanism.

OK

> You can find the full patch series in github.com/mvduin/linux branch
> 4.15/patch/tiler-fast (based on mainline 4.15-rc6):
> 
> ae664249050b ARM: introduce pgprot_device()
> fc1e8ffd1334 drm: omapdrm: improve choice of memory type for tiled memory
>    these improve performance on omap5/dra7 by mapping tiled buffers as
>    "device" memory by default instead of the pointlessly slow "strongly
>    ordered" which is currently used as a workaround for the
>    incompatibility between TILER and the bizarre way the ARM Cortex-A15
>    implements loads from normal non-cacheable memory.
> 
> 3d4c98cc47dd XXX omapdrm: factor out _omap_gem_(un)pin
> 70593563f531 XXX omapdrm: force tiled buffers to be pinned and page-aligned
> e061e454afd5 XXX omapdrm: fast userspace mapping of tiled buffers
>    these greatly improve performance of userspace access to tiled
>    buffers (on all devices that use tiler) at the expense of using more
>    tiler virtual memory.  note that tiler virtual memory is a less
>    scarce resource on omap5/dra7 where 2d and 1d mappings have separate
>    page tables than on omap4 where they share a page table.
> 
> None of this should have any impact on tearing.

OK so the alignment change just happens to fix the issue then.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
