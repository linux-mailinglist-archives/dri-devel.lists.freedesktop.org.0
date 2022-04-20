Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A82508229
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921DE10F1C5;
	Wed, 20 Apr 2022 07:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DC010F1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8368C618B3;
 Wed, 20 Apr 2022 07:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1DAC385A0;
 Wed, 20 Apr 2022 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650439816;
 bh=+EDTmtai/jQZPWiRlzQLKQkboIqyWdx84ej+J0tgCT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lbzpvm/rXJqIP40ZLzhNxJqSNboD4Hfk+B9K54hBNd9SBa1jZSKJAq2lqjHx5lTiF
 mHqnxAuKK9c96NUFSxyh9indJmJNNrFm60iDqkFLKpSBXKxorqWucVtDyZ4Rak6JAf
 tkWpFesOVCPMSmHBmRJgtbWu/RPnPFf4ojkPRdkbJpfkztunS9KhCVQVBBQjtqWM46
 KCAxxbGuDm+ycKV08gp9I0xd/vBXuTSv3ZScZh4X0VpsBD8Xwnd3TefnrnK+N6O/9B
 TLysoHxyA4HDXUahRW9izrVaarTquVdArJyMsTK1QHAgD20fmAbYVTFYXIH6hUhaaE
 K9CmiG516V9AA==
Date: Wed, 20 Apr 2022 13:00:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH resend v8 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp
 LVDS PHY mode support
Message-ID: <Yl+2hOIcr6CrOv+T@matsya>
References: <20220419010852.452169-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, krzk+dt@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19-04-22, 09:08, Liu Ying wrote:
> Hi,
> 
> This is the v8 series to add i.MX8qxp LVDS PHY mode support for the Mixel
> PHY in the Freescale i.MX8qxp SoC.
> 
> The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
> MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
> SCU firmware.  The PHY driver would call a SCU function to configure the
> mode.
> 
> The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
> where it appears to be a single MIPI DPHY.
> 
> 
> Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
> bridge driver, since i.MX8qxp SoC embeds this controller IP to support
> MIPI DSI displays together with the Mixel PHY.
> 
> Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
> and through a custom structure added to the generic PHY configuration union.
> 
> Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.
> 
> Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.
> 
> Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.

Applied patch 2-5 to phy-next, thanks

-- 
~Vinod
