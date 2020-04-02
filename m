Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F719C46D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 16:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F82E89DB4;
	Thu,  2 Apr 2020 14:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Thu, 02 Apr 2020 14:38:04 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BDC89CBE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 14:38:04 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5F3DC300020AD;
 Thu,  2 Apr 2020 16:31:17 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 3381B448C29; Thu,  2 Apr 2020 16:31:17 +0200 (CEST)
Date: Thu, 2 Apr 2020 16:31:17 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
Message-ID: <20200402143117.qabod72gn3p6yft3@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <20200402154934.04917382@eldfell.localdomain>
 <CAKMK7uGusoE+GQOefMTB_tax-Tj5PymMMOrWPMJ6XczdrdFb3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGusoE+GQOefMTB_tax-Tj5PymMMOrWPMJ6XczdrdFb3g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Daniel Dadap <ddadap@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 03:13:26PM +0200, Daniel Vetter wrote:
> On Thu, Apr 2, 2020 at 2:58 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Thu, 2 Apr 2020 13:39:25 +0200 Lukas Wunner <lukas@wunner.de> wrote:
> > > Note that vga_switcheroo is currently controlled via debugfs.
> > > That is a historic artefact.  The kernel has since gained a
> > > mux subsystem in drivers/mux/ which could be used to represent
> > > the display mux in a standardized way in regular sysfs.
> >
> > if mux control was in sysfs, then how would userspace figure out
> > which mux state refers to which DRM device and its connector?
> >
> > Maybe some DRM connector property referring to the mux and its state?
> >
> > How would a display server running as a regular user gain access to
> > sysfs to control the mux?
> 
> I think a sysfs interface for vgaswitcheroo would need some kind of
> links from drm_device (and for the outpu-only mux from drm_connector
> sysfs files) to the corresponding sysfs directory for the
> vgaswitcheroo switch.

Yes, that would be one way to do it.


> But actual change of state needs to indeed be done through some other
> interface, since sysfs interfaces suck for compositors. We have this
> problem already with backlight, and the solution there is a special
> backlight frobbing services which compositors can call through udev,
> and fun stuff like that. Definitely not an uapi pattern we want to
> repeat. So I think sysfs would be only for information links, and
> maybe the global switch for the old optimus designs where you can only
> switch the entire gpu, and need to delay the switch until all existing
> clients are closed. Aka 1) stop compositor 2) write to sysfs 3) start
> new compositor on new gpu. For that case compositors don't need to
> ever write to sysfs themselves, so I think that's ok. Also only
> relevant for rather old hw.

There's an in-kernel interface in <linux/mux/consumer.h> which
could be invoked from, say, an ioctl(), to control or query the
mux.

I'm not really prepared to answer detailed questions how it should
be done, my point is just that the existing building blocks (such
as the mux subsystem) should be used instead of reinventing the
wheel.  If the mux subsystem lacks specific features needed for
graphics muxes, I think adding them won't face much opposition
from Peter Rosin.

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
