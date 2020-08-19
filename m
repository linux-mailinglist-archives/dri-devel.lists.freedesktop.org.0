Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF424A7D0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29FA89228;
	Wed, 19 Aug 2020 20:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7DA89228
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:39:59 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D4190804B9;
 Wed, 19 Aug 2020 22:39:54 +0200 (CEST)
Date: Wed, 19 Aug 2020 22:39:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v14 0/2] Add initial support for slimport anx7625
Message-ID: <20200819203953.GA109541@ravnborg.org>
References: <cover.1594283160.git.xji@analogixsemi.com>
 <20200810203546.GA421906@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810203546.GA421906@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-3hZfeu0XQcix8hqga0A:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin Ji.

On Mon, Aug 10, 2020 at 10:35:46PM +0200, Sam Ravnborg wrote:
> Hi Xin Ji.
> 
> On Thu, Jul 09, 2020 at 04:31:09PM +0800, Xin Ji wrote:
> > Hi all,
> > 
> > The following series add support for the Slimport ANX7625 transmitter, a
> > ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.
> > 
> > 
> > This is the v14 version, any mistakes, please let me know, I will fix it in
> > the next series.
> > 
> > Change history:
> > v14: Fix comments from Sam and Nicolas
> >  - Check flags at drm_bridge_attach
> >  - Use panel_bridge instead of drm_panel
> >  - Fix not correct return value
> 
> Sorry for ignoring this for so long time.
> The patch applies but no longer builds.
> 
> I could fix it locally but wanted to know if you have a later version to
> be applied?

I took a short look at the driver today.
I noticed following code:
       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
                return -EINVAL;

So if the display driver do not supply the DRM_BRIDGE_ATTACH_NO_CONNECTOR
then -EINVAL is returned.

But then the anx7625_bridge_attach() continues and creates a connector.
For a new bridge driver there should be no need for the backward
compatibility - so no need to create the connector.
Unless the display driver needs it - but then we should fix the display
driver and not add backward compatibility code in the bridge driver.

Which display driver do you expect this bridge driver to be used with?

	Sam




> 
> 	Sam
> 
> 
> > 
> > v13: Fix comments from Launrent Pinchart and Rob Herring
> >  - Picked up Rob's Reviewed-By
> >  - Add .detect and .get_edid interface in bridge funcs.
> > 
> > v12: Fix comments from Hsin-Yi Wang
> >  - Rebase the code on kernel 5.7, fix DRM interface not match issue.
> > 
> > v11: Fix comments from Rob Herring
> >  - Update commit message.
> >  - Remove unused label.
> > 
> > v10: Fix comments from Rob Herring, Daniel.
> >  - Fix dt_binding_check warning.
> >  - Update description.
> > 
> > v9: Fix comments from Sam, Nicolas, Daniel
> >  - Remove extcon interface.
> >  - Remove DPI support.
> >  - Fix dt_binding_check complains.
> >  - Code clean up and update description.
> > 
> > v8: Fix comments from Nicolas.
> >  - Fix several coding format.
> >  - Update description.
> > 
> > v7:
> >  - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
> >    enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.
> > 
> > 
> > Xin Ji (2):
> >   dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
> >   drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP
> > 
> >  .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
> >  drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
> >  drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c          | 1939 ++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h          |  391 ++++
> >  5 files changed, 2435 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> > 
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
