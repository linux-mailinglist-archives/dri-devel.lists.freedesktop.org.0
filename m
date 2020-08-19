Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F62491AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 02:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19A389AAE;
	Wed, 19 Aug 2020 00:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BA689AAE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 00:10:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EB9A29E;
 Wed, 19 Aug 2020 02:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597795848;
 bh=7f6JpwIgaRJBXO+151bdoDs5oIFbz35n2tdS14jETBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MwDXuS7ZbIVAOHcNlwfpMFGBDgWNtIzCGpPzBRmqm8H6cnpa2vYGtvBHgh8U6HN++
 jEXQv8dmuB3wVOpQMrbh6C+oqqwSvl7mYDV2swsNUO42nOBDe9aEVlph7RyCRp4P/p
 RlK28BiO2qc+D+WcPo6uZu6pvUoQyJkptMQpbI4s=
Date: Wed, 19 Aug 2020 03:10:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexandre Bounine <alex.bou9@gmail.com>,
 Matt Porter <mporter@kernel.crashing.org>
Subject: Re: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200819001030.GF2360@pendragon.ideasonboard.com>
References: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
 <20200731164744.GF12965@vkoul-mobl>
 <20200731204206.GC24315@pendragon.ideasonboard.com>
 <20200802064409.GH12965@vkoul-mobl>
 <20200811225203.GG17446@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811225203.GG17446@pendragon.ideasonboard.com>
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
Cc: alsa-devel@alsa-project.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Matt, Alexandre,

Gentle ping. As this should be fixed in v5.9, a quick reply would be
really appreciated. Otherwise I'll have to bundle the rapidio fix with
the DPSUB fix, and get them both merged through the DRM/KMS tree without
your ack.

On Wed, Aug 12, 2020 at 01:52:04AM +0300, Laurent Pinchart wrote:
> On Sun, Aug 02, 2020 at 12:14:09PM +0530, Vinod Koul wrote:
> > On 31-07-20, 23:42, Laurent Pinchart wrote:
> > > On Fri, Jul 31, 2020 at 10:17:44PM +0530, Vinod Koul wrote:
> > > > On 31-07-20, 18:24, Laurent Pinchart wrote:
> > > > > Hello,
> > > > > 
> > > > > This small series fixes a Kconfig dependency issue with the recently
> > > > > merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> > > > > requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> > > > > dependencies:
> > > > > 
> > > > >         drivers/i2c/Kconfig:8:error: recursive dependency detected!
> > > > >         drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> > > > >         drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> > > > >         drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> > > > >         drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> > > > >         drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> > > > >         drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> > > > >         drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> > > > >         drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> > > > >         sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> > > > >         sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> > > > >         For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > > > >         subsection "Kconfig recursive dependency limitations"
> > > > > 
> > > > > Due to the DPSUB driver being merged in v5.9, this is a candidate fix
> > > > > for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
> > > > > on the first two. What's the best course of action, can I merge this all
> > > > > in a single tree, or should the rapidio and ASoC patches be merged
> > > > > independently early in the -rc cycle, and the DRM patch later on top ? I
> > > > > don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
> > > > > series in one go would be simpler in my opinion.
> > > > 
> > > > Acked-By: Vinod Koul <vkoul@kernel.org>
> > > 
> > > Thank you.
> > > 
> > > As Mark as queued the sound fix in his for-next branch for v5.9, could
> > > you queue the dmaengine fix for v5.9 too ?
> > 
> > Dmaengine? I see three patches none of which touch dmaengine..
> > Did I miss something?
> 
> I'm not sure what I was thinking... It's the rapidio patch that needs to
> be merged.
> 
> Matt, Alexandre, can you either merge the patch as a v5.9 fix, or give
> me an ack to get it merged through the DRM tree ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
