Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2E133587
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEFE6E144;
	Tue,  7 Jan 2020 22:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734006E144
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:12:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7664E52F;
 Tue,  7 Jan 2020 23:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578435154;
 bh=AXbJzKOK2zmPPbII3OVLxs1ZXTCLfVVQ/T0Ks5djkL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EbjTiyiwbEq4A00sbxnPH+eeETrat7SOpeH0qx6VK1CsFFEd4qdaU0hk1jX8nEnkx
 drN4MrG3GtbTbwAtyqKJ8c3bA0URpgTwjMQyApIY/LKwYjCaRnj4SrOx8G2GIk1qvt
 PE/HZ51FKJDWKjepuZUz5ZPTREwI60iPwYue3z6E=
Date: Wed, 8 Jan 2020 00:12:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
Message-ID: <20200107221222.GE7869@pendragon.ideasonboard.com>
References: <20200107212747.4182515-1-arnd@arndb.de>
 <20200107220019.GC7869@pendragon.ideasonboard.com>
 <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Jan 07, 2020 at 11:09:13PM +0100, Arnd Bergmann wrote:
> On Tue, Jan 7, 2020 at 11:00 PM Laurent Pinchart wrote:
> > On Tue, Jan 07, 2020 at 10:27:33PM +0100, Arnd Bergmann wrote:
> > > With gcc -O3, the compiler can inline very aggressively,
> > > leading to rather large stack usage:
> > >
> > > drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
> > > drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> > >  }
> > >
> > > Marking jbt_reg_write_1() as noinline avoids the case where
> > > multiple instances of this function get inlined into the same
> > > stack frame and each one adds a copy of 'tx_buf'.
> > >
> > > Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Isn't this something that should be fixed at the compiler level ?
> 
> I suspect but have not verified that structleak gcc plugin is partly at
> fault here as well, it has caused similar problems elsewhere.
> 
> If you like I can try to dig deeper before that patch gets merged,
> and explain more in the changelog or open a gcc bug if necessary.

I think we'll need to merge this in the meantime, but if gcc is able to
detect too large frame sizes, I think it should have the ability to take
a frame size limit into account when optimizing. I haven't checked if
this is already possible and just not honoured here (possibly due to a
bug) or if the feature is entirely missing. In any case we'll likely
have to live with this compiler issue for quite some time.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
