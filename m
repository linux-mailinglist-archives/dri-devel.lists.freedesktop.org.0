Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D663C2F35C9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 17:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD900897E4;
	Tue, 12 Jan 2021 16:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDE5897E4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 16:30:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33C6958B;
 Tue, 12 Jan 2021 17:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610469003;
 bh=VG6IMjHKwXDLQBfQ9biHJXOjwpA2yRoHq+B9kTZZDPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqOYACBfPcmWFdfKNXYyM8sTthKsHFXY21pJfNAVsq2zur+56smXzfnlEOQJaXr5V
 IOtTS3W+f1oIbyY5Kz2sJ4aUeSXYdCUA3yx9bjAbyQK+T+znK5qzP5Pv1GYhd8M72G
 T7t0LSa51j39nSEGQ/RL1S+FKEoViP4d1L8KxdKs=
Date: Tue, 12 Jan 2021 18:29:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: omapfb removal (was: Re: [PATCHv1] video: omapfb2: Make standard
 and custom DSI command mode panel driver mutually exclusive)
Message-ID: <X/3Oe9HwKe9UFnS1@pendragon.ideasonboard.com>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
 <20210108195839.GA1429715@ravnborg.org>
 <20210112120246.ujhjyylrlgfrfvig@earth.universe>
 <4b39c036-fb70-4a5b-ddda-08ce2f0a6db5@kernel.org>
 <20210112162454.hfzj5bxy7e6zlccl@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112162454.hfzj5bxy7e6zlccl@earth.universe>
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
Cc: linux-fbdev@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Tue, Jan 12, 2021 at 05:24:54PM +0100, Sebastian Reichel wrote:
> [dropped linux-next from Cc]
> 
> Hi,
> 
> On Tue, Jan 12, 2021 at 03:10:56PM +0200, Tomi Valkeinen wrote:
> > >> But why is it it we need omapfb at all when we have omapdrm?
> > > 
> > > I think there are two reasons omapfb has not been killed yet. One
> > > reason was missing support for manually updated DSI panels, which
> > > have been working since 1 or 2 kernel releases now. The other reason
> > > is some people using it in combination with an out-of-tree PowerVR
> > > kernel driver. There is currently work going on to use a more recent
> > > PowerVR driver based on omapdrm driven by Maemo Leste people.
> > 
> > omapfb also has a custom sysfs API, so applications that depend on it
> > would not work anymore. I don't know if there are such applications, though.
> > 
> > >> Can we sunset all or some parts of omap support in video/?
> > >> If not, what is missing to do so.
> > > 
> > > IDK the exact status of the PowerVR work and have not been using
> > > omapfb myself for years. I don't think there is a reason to rush
> > > this, so my suggestion is removing it in 3 steps giving people
> > > the chance to complain:
> > > 
> > > 1. Add 'depends on EXPERT' to 'FB_OMAP2' and add deprecation notice
> > >    referencing omapdrm in help text in 5.12
> > > 2. Add 'depends on BROKEN' in 5.13
> > > 3. Drop drivers/video/fbdev/omap2 afterwards
> > 
> > I'd love to remove omapfb, but I also fear that there are still people
> > using it. We can try the above sequence, but it's probably better to go
> > slower, as people may not be using the latest kernels.
> 
> I thought about this again and I think the best option is to rename
> CONFIG_FB_OMAP2 to something like CONFIG_FB_OMAP2_DEPRECATED and
> update the help text. That way anyone with CONFIG_FB_OMAP2 in
> their .config will definitely notice the change when upgrading to
> a newer kernel, but can easily fix it temporarily. Help text could
> be
> 
> "This driver will be removed in 2022, please switch to omapdrm."
> 
> and no other intermediate steps are required that way :)

The plan looks good to me.

> But while looking through CONFIG_FB_OMAP2 references I noticed there
> is also a V4L2 driver (CONFIG_VIDEO_OMAP2_VOUT), which seems to
> only work with omapfb. IIUIC that driver provides display overlays
> to V4L. I guess on omapdrm V4L can use DRM planes instead and no
> driver is needed (i.e. this driver could just go away with omapfb)?

One feature that the omapfb2 and the omap-vout drivers provide is
rotation support with VRFB on OMAP3. I haven't moved to omapdrm on an
old project for this reason. It should be possible to implement rotation
support in omapdrm, but I'm not aware of any effort in that direction.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
