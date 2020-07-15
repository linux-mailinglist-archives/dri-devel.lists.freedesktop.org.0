Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20122132B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 19:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FB76EBDC;
	Wed, 15 Jul 2020 17:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9676EBDC;
 Wed, 15 Jul 2020 17:06:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BDAF32003D;
 Wed, 15 Jul 2020 19:06:50 +0200 (CEST)
Date: Wed, 15 Jul 2020 19:06:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 00/59] Add support for KeemBay DRM driver
Message-ID: <20200715170649.GB1785807@ravnborg.org>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
 <20200715150549.GL3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715150549.GL3278063@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=Wk9AzPC2wjdKAl7LsWUA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 05:05:49PM +0200, Daniel Vetter wrote:
> Hi Anitha
> 
> On Tue, Jul 14, 2020 at 01:56:46PM -0700, Anitha Chrisanthus wrote:
> > This is a new DRM driver for Intel's KeemBay SOC.
> > The SoC couples an ARM Cortex A53 CPU with an Intel
> > Movidius VPU.
> > 
> > This driver is tested with the KMB EVM board which is the refernce baord
> > for Keem Bay SOC. The SOC's display pipeline is as follows
> > 
> > +--------------+    +---------+    +-----------------------+
> > |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> > +--------------+    +---------+    +-----------------------+
> > 
> > LCD controller and Mipi DSI transmitter are part of the SOC and
> > mipi to HDMI converter is ADV7535 for KMB EVM board.
> > 
> > The DRM driver is a basic KMS atomic modesetting display driver and
> > has no 2D or 3D graphics.It calls into the ADV bridge driver at
> > the connector level.
> > 
> > Only 1080p resolution and single plane is supported at this time.
> > The usecase is for debugging video and camera outputs.
> > 
> > Device tree patches are under review here
> > https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-daniele.alessandrelli@linux.intel.com/T/
> 
> Cool, new driver, thanks a lot for submitting.
> 
> > Changes since v1:
> > - Removed redundant license text, updated license
> > - Rearranged include blocks
> > - renamed global vars and removed extern in c
> > - Used upclassing for dev_private
> > - Used drm_dev_init in drm device create (will be updated to use
> >   devm_drm_dev_alloc() in a separate patch later as kmb driver is currently
> >   developed on 5.4 kernel)
> 
> drm moves fairly quickly, please develop the upstream submission on top of
> linux-next or similar. We constantly add new helpers to simplify drivers,
> and we expect new driver submissions to be up to date with all that.
Seconded!

> 
> Another thing: From your description it sounds like it's a very simple
> driver, just a single plane/crtc, nothing fancy, plus adv bridge output.
> Is the driver already using simple display pipeline helpers? I think that
> would be an ideal fit and probably greatly simplifies the code.
> 
> > - minor cleanups
> 
> The patch series looks like it contains the entire development history, or
> at least large chunks of it. That's useful for you, but for upstreaming
> the main focues (especially for smaller drivers) is whether your driver
> uses all the available helpers and integrations correctly. And for that
> it's much easier if the history is cleaned up, and all intermediate steps
> removed.
And also agree on this point.
The submission could be split up in a few patches where the split is
file based. So only with the latest patch, containing Makefile +
Kconfig,the driver i buildable.
This would ease review as one looses focus when trying to review 1000+
lines in one mail.

You will loose some of the internal history - but if important keep
relevant parts in sensible comments.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
