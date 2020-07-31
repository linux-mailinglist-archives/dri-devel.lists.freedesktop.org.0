Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AF234C68
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 22:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C556EB4D;
	Fri, 31 Jul 2020 20:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5CD6EB4D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 20:42:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB6D353C;
 Fri, 31 Jul 2020 22:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596228136;
 bh=TGDv3Frj4rCMmzqFPlTvoVIycIJIp6yYmbKH/jOE9mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Im3+k8u+Yxa3c9UDV4VQq4DNQKg69ugyaC0/L5DmB2fFrkduhebVB6KTRG6iVWOXa
 egFJ/d36EO5mvPkd5KwvF3DNugdzJwhUdIkiLFzsp02rX3vkq8SC/KwnGOV1ia4eVw
 Bs2wh5kDTRDxiPEdhX1Rhc3bov2XSPe5p41MPOfk=
Date: Fri, 31 Jul 2020 23:42:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/3] Fix Kconfig dependency issue with DMAENGINES
 selection
Message-ID: <20200731204206.GC24315@pendragon.ideasonboard.com>
References: <20200731152433.1297-1-laurent.pinchart@ideasonboard.com>
 <20200731164744.GF12965@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731164744.GF12965@vkoul-mobl>
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

Hi Vinod,

On Fri, Jul 31, 2020 at 10:17:44PM +0530, Vinod Koul wrote:
> On 31-07-20, 18:24, Laurent Pinchart wrote:
> > Hello,
> > 
> > This small series fixes a Kconfig dependency issue with the recently
> > merged Xilixn DPSUB DRM/KMS driver. The fix is in patch 3/3, but
> > requires a separate fixes in patches 1/3 and 2/3 to avoid circular
> > dependencies:
> > 
> >         drivers/i2c/Kconfig:8:error: recursive dependency detected!
> >         drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> >         drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> >         drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> >         drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> >         drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> >         drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> >         drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> >         drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> >         sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> >         sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> >         For a resolution refer to Documentation/kbuild/kconfig-language.rst
> >         subsection "Kconfig recursive dependency limitations"
> > 
> > Due to the DPSUB driver being merged in v5.9, this is a candidate fix
> > for v5.9 as well. 1/3 and 2/3 can be merged independently, 3/3 depends
> > on the first two. What's the best course of action, can I merge this all
> > in a single tree, or should the rapidio and ASoC patches be merged
> > independently early in the -rc cycle, and the DRM patch later on top ? I
> > don't expect conflicts (especially in 2/3 and 3/3), so merging the whole
> > series in one go would be simpler in my opinion.
> 
> Acked-By: Vinod Koul <vkoul@kernel.org>

Thank you.

As Mark as queued the sound fix in his for-next branch for v5.9, could
you queue the dmaengine fix for v5.9 too ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
