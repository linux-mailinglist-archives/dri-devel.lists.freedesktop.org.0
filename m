Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2716F2EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 00:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A30089870;
	Tue, 25 Feb 2020 23:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72D89870
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 23:06:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEBE643F;
 Wed, 26 Feb 2020 00:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582671985;
 bh=5e0NG6fs218HfbuSes4efOf8DxmAhvm3mA6JMHSDdbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jnhd/ToN+Xj7hALLojXpgPXKbK/GOjiRCVr7pYXc3Pz4TuxJNXKX5wQxsfVTPMOlr
 8v3KEGoICJoVb8HSqrTqmmVtx8BCwEE5IXqRY0gWSlGWd6cpQSTabJyzQIN09qvxGE
 4DVS23OH+dDVPeDe54LbNIqgT80mSaqjOwTjR6f8=
Date: Wed, 26 Feb 2020 01:06:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225230603.GW4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
 <20200225230124.fkt35ihyjnokb2ng@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225230124.fkt35ihyjnokb2ng@earth.universe>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Wed, Feb 26, 2020 at 12:01:24AM +0100, Sebastian Reichel wrote:
> On Tue, Feb 25, 2020 at 07:42:37AM -0800, Tony Lindgren wrote:
> > * Sebastian Reichel <sre@kernel.org> [200225 02:29]:
> > > On Mon, Feb 24, 2020 at 04:10:11PM -0800, Tony Lindgren wrote:
> > > > BTW, I think there's also some refcount issue in general where
> > > > the omapdrm related modules cannot be unloaded any longer?
> > > 
> > > I wouldn't be too surprised. The dependencies are quite interesting
> > > at the moment with omapdss registering omapdrm and then omapdrm
> > > registers the drm_device, which references the encoders from
> > > omapdss. I think this is something to look at once Laurent's and
> > > my branch have been merged to avoid increasing the complexity.
> > > Technically it should be possible to link everything into one
> > > module.
> > 
> > Well the DSS is really DOSSI for Display Output SubSystem
> > Interconnect :) The devices on the interconnect are mostly
> > independent and ideally the toplevel dss driver would just
> > provide Linux generic resources to dispc and various output
> > drivers. So probably not a good idea to try to build it all
> > into a single module.
> 
> All the output drivers and dispc are already in a single module:
> omapdss.ko. There is omapdss-base.ko, omapdss.ko and omapdrm.ko
> module. omapdss-base.ko contains a few helpers, omapdss.ko contains
> dispc and all output encoders, omapdrm has the tiler code and
> wraps some of the custom DSS APIs to DRM APIs. I think the best
> way forward is to eliminate the custom API and use common DRM
> APIs directly. Then merge all 3 modules into one module.
> 
> In theory one could add modules for each encoder, but practically
> this only increases complexity. DRM cannnot hotplug encoders, so
> removing any module results in complete loss of DRM. Also during
> probe we need to load all modules, since something might be
> connected. So having extra modules is not really useful?

This was considered previously, but blocked (IIRC) because it introduced
circular dependencies with the omapdrm-specific display drivers in
drivers/gpu/drm/omapdrm/displays/. Once panel-dsi-cm goes away, I think
we can give it another try.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
