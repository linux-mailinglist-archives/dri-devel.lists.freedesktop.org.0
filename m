Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D02355B9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 08:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5406E061;
	Sun,  2 Aug 2020 06:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652066E061
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 06:44:16 +0000 (UTC)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB597207FB;
 Sun,  2 Aug 2020 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596350654;
 bh=X3mkD7RZZ1AgeK/4J92tDZwIJB1+lI9JjZ0GBWy5Zm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwpZoje1TbIJ68iQaOJPnkY+RgtH8WlN+xSMXPSBBaOn8oxBGhheVwuDc9JVBRnH4
 sla6un5LhRbtbsmAgUVFxkXufDH+UVzNk+nKL6TAaSm/vmHnPqI2ibQe/x9DWVTKhU
 rbaB+oQXX0/XzVKiuhiDzG59i/7Zb9XMrMIakM0c=
Date: Sun, 2 Aug 2020 12:14:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200802064409.GH12965@vkoul-mobl>
References: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
 <20200731164744.GF12965@vkoul-mobl>
 <20200731204206.GC24315@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731204206.GC24315@pendragon.ideasonboard.com>
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
 Alexandre Bounine <alex.bou9@gmail.com>, Mark Brown <broonie@kernel.org>,
 dmaengine@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31-07-20, 23:42, Laurent Pinchart wrote:
> Hi Vinod,
> 
> On Fri, Jul 31, 2020 at 10:17:44PM +0530, Vinod Koul wrote:
> > On 31-07-20, 18:24, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This small series fixes a Kconfig dependency issue with the recently
> > > merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> > > requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> > > dependencies:
> > > 
> > >         drivers/i2c/Kconfig:8:error: recursive dependency detected!
> > >         drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> > >         drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> > >         drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> > >         drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> > >         drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> > >         drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> > >         drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> > >         drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> > >         sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> > >         sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> > >         For a resolution refer to Documentation/kbuild/kconfig-language.rst
> > >         subsection "Kconfig recursive dependency limitations"
> > > 
> > > Due to the DPSUB driver being merged in v5.9, this is a candidate fix
> > > for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
> > > on the first two. What's the best course of action, can I merge this all
> > > in a single tree, or should the rapidio and ASoC patches be merged
> > > independently early in the -rc cycle, and the DRM patch later on top ? I
> > > don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
> > > series in one go would be simpler in my opinion.
> > 
> > Acked-By: Vinod Koul <vkoul@kernel.org>
> 
> Thank you.
> 
> As Mark as queued the sound fix in his for-next branch for v5.9, could
> you queue the dmaengine fix for v5.9 too ?

Dmaengine? I see three patches none of which touch dmaengine..
Did I miss something?

Thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
