Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A192D73C9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18B6ED64;
	Fri, 11 Dec 2020 10:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210A56ED64
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:19:40 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knfWT-0004SX-W3; Fri, 11 Dec 2020 11:19:37 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knfWT-0003rg-EP; Fri, 11 Dec 2020 11:19:37 +0100
Message-ID: <3bbb4b90fbeb43bb663cffa4432c5411e22028e0.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Fri, 11 Dec 2020 11:19:37 +0100
In-Reply-To: <X9ISaoHf5Sk7TmSN@pendragon.ideasonboard.com>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
 <20201209211047.GA401619@phenom.ffwll.local>
 <20201209211354.GB401619@phenom.ffwll.local>
 <X9ISaoHf5Sk7TmSN@pendragon.ideasonboard.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, Daniel,

On Thu, 2020-12-10 at 14:19 +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wed, Dec 09, 2020 at 10:13:54PM +0100, Daniel Vetter wrote:
> > On Wed, Dec 09, 2020 at 10:10:47PM +0100, Daniel Vetter wrote:
> > > On Tue, Dec 08, 2020 at 04:59:16PM +0100, Philipp Zabel wrote:
> > > > On Tue, 2020-12-08 at 16:54 +0100, Philipp Zabel wrote:
> > > > > Hi,
> > > > > 
> > > > > this is an update of the drmm_(simple_)encoder_alloc(),
> > > > > drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
> > > > > functions in v3 [1] together with the imx-drm managed allocation
> > > > > conversion from [2] as an example usage.
> > > > > a bit.
> > > >   ^^^^^^
> > > > this is a left-over of ", reordered an squashed a bit." before I decided
> > > > to move it into the list of changes below.
> > > > 
> > > > > Changes since v3:
> > > > [...]
> > > > >  - Reorder and squash the imx-drm managed allocation conversion patches
> > > > >    to use the new functions directly.
> > > 
> > > imx parts all look good. One thing I spotted is that you could use
> > > devm_drm_dev_alloc instead of drm_dev_alloc, at least my tree here doesn't
> > > have that one yet. Feel free to add a-b: me on top of the imx patches too,
> > > but probably not worth much :-)
> > 
> > Oh also for merging, ack for merging through whatever tree you feel like.
> > Since 5.11 merge window is done already if you go through imx please make
> > sure to send a feature pull soon after -rc1 so it's not holding up
> > Laurent.

If nobody minds, I'll do just that.

> >  Or coordinate with Laurent (and maybe others).
> 
> I've sent my rcar-du fixes without depending on this series, to ease
> backporting. I'll then submit additional cleanups using the new managed
> allocators when these patches will hit the drm tree. There's thus no
> need for a feature branch on my side.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
