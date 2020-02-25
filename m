Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ECB16F920
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D76E1F3;
	Wed, 26 Feb 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D0D78979E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 23:09:41 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 82D21810E;
 Tue, 25 Feb 2020 23:10:25 +0000 (UTC)
Date: Tue, 25 Feb 2020 15:09:37 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225230937.GL37466@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
 <20200225230124.fkt35ihyjnokb2ng@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225230124.fkt35ihyjnokb2ng@earth.universe>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Sebastian Reichel <sre@kernel.org> [200225 23:03]:
> Hi,
> 
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

Well my main concern here is that we should use generic
Linux frameworks between the devices within DSS where possible.
I can see a single driver pile of code quickly turn into a
spaghetti of internal calls instead..

Also each devices on the DSS interconnect needs to do
pm_runtime_get for it's struct device naturally.

If you can avoid the issues above, then I have no objections
of just having one module.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
