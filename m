Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A12177E9C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 19:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BAB6E44C;
	Tue,  3 Mar 2020 18:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085086E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:48:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C28F2AF;
 Tue,  3 Mar 2020 19:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583261306;
 bh=xjKfkm7MxwxqOq3hL/YppNzZPfz7ORMU2D6/8zU5i0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kio74RpWJCIG2E3/srA2XV969ivzkOnx8qTgtvnpNEgFX0ue4/9dKtz0NtevE7t0e
 V2sUj56NQWIv2cri1AxUBek2MaoGLvuwzj9xpMHSXv/WQLn6XzHpK/kVRjBwZB4uhK
 WzAC3wL3usPjAIub2XrxFJXerni1TDZjctYwnUwE=
Date: Tue, 3 Mar 2020 20:48:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT
 schema
Message-ID: <20200303184805.GI11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200229181320.GA14589@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229181320.GA14589@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sat, Feb 29, 2020 at 07:13:20PM +0100, Sam Ravnborg wrote:
> On Sun, Feb 16, 2020 at 07:15:08PM +0100, Sam Ravnborg wrote:
> > This set of patches convert display-timing.txt to DT schema.
> > To do that add a panel-timing.yaml file that include all the
> > panel-timing properties and use this in panel-common and in display-timings.
> > 
> > panel-dpi was also converted so we have no .txt users left of panel-timing
> > in panel/
> > 
> > Everything passed dt_binding_check - and the trivial errors I tried in
> > the examples was all catched during validation.
> > 
> > This work was triggered by a patch-set from Oleksandr Suvorov aiming
> > at updating panel-lvds to support panel-dpi.
> > This will make it simple to add additional properties to panel-dpi.
> > 
> > Thanks for the quick responses on v2 and likewise the quick
> > feedback on the request for the license change!
> > 
> > Highlight from v3 - se individual patches for details.
> > - Added panel-dpi support to panel-simple.
> >   We can now add a simple panel just by addding timing parameters
> >   in a DT node
> >   The patch [5/5] is RFC as test is pending
> > - To support panel-dpi in panel-simple - add a data-mapping
> >   property to panel-dpi
> > 
> > Highlights from v2 - see individual patches for details.
> > - Got acks for the license change
> > - Simplfied panel-timings bindings
> > - panel-dpi can now be used without a panel specific compatible
> >   So panel-dpi can be used as a generic binding for dumb panels
> > 
> > Feedback welcome!
> > 
> > 	Sam
> > 
> > Sam Ravnborg (5):
> >       dt-bindings: display: add panel-timing.yaml
> >       dt-bindings: display: convert display-timings to DT schema
> >       dt-bindings: display: convert panel-dpi to DT schema
> >       dt-bindings: display: add data-mapping to panel-dpi
> >       drm/panel: simple: add panel-dpi support
> 
> All patches now pushed to drm-misc-next.
> Dropped lvds666 when applying the patches.

My feedback is a bit late. Would you like to still take it into
consideration yourself, or would you like me to submit patches ?

> > 
> >  .../bindings/display/panel/display-timing.txt      | 124 +----------
> >  .../bindings/display/panel/display-timings.yaml    |  77 +++++++
> >  .../bindings/display/panel/panel-common.yaml       |  15 +-
> >  .../bindings/display/panel/panel-dpi.txt           |  50 -----
> >  .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
> >  .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
> >  7 files changed, 470 insertions(+), 179 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
