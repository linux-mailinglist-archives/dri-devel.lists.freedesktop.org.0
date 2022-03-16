Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9A4DABEC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 08:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894AA10E5BA;
	Wed, 16 Mar 2022 07:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B559110E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 07:40:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUOGJ-0003j1-OH; Wed, 16 Mar 2022 08:40:03 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUOGH-0007Ye-1L; Wed, 16 Mar 2022 08:40:01 +0100
Date: Wed, 16 Mar 2022 08:40:01 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 22/24] drm: rockchip: Add VOP2 driver
Message-ID: <20220316074001.GP405@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-23-s.hauer@pengutronix.de>
 <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:35:30 up 95 days, 16:21, 82 users,  load average: 0.45, 0.47, 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 02:46:35PM +0800, Andy Yan wrote:
> Hi Sascha:
> 
> On 3/11/22 16:33, Sascha Hauer wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> > It replaces the VOP unit found in the older Rockchip SoCs.
> > 
> > This driver has been derived from the downstream Rockchip Kernel and
> > heavily modified:
> > 
> > - All nonstandard DRM properties have been removed
> > - dropped struct vop2_plane_state and pass around less data between
> >    functions
> > - Dropped all DRM_FORMAT_* not known on upstream
> > - rework register access to get rid of excessively used macros
> > - Drop all waiting for framesyncs
> > 
> > The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> > board. Overlay support is tested with the modetest utility. AFBC support
> > on the cluster windows is tested with weston-simple-dmabuf-egl on
> > weston using the (yet to be upstreamed) panfrost driver support.
> 
> Do we need some modification to test AFBC by weston-simple-dma-egl ?

By default weston-simple-dma-egl uses DRM_FORMAT_XRGB8888 which in the
panfrost driver ends up as PIPE_FORMAT_B8G8R8_UNORM and
panfrost_afbc_format() returns PIPE_FORMAT_NONE for that. Change the
format to DRM_FORMAT_ABGR8888 using weston-simple-dma-egl -f 0x34324241.
This ends up as PIPE_FORMAT_R8G8B8A8_UNORM in panfrost_afbc_format()
which is a supported format.

> 
> I have a buildroot system with weston-10.0.9 and mesa 21.3.5.
> 
> After launch weston, I run weston-simple-dmabuf-egl, but from the output
> 
> of sys/kernel/debug/dri/0/state, the weston is still use Smart0-win0, which
> is
> 
> a non-AFBC window.
> 
> Do i need to modify the vop2 driver to set one Cluster window as primary
> plane?

I never used a Cluster window as primary plane.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
