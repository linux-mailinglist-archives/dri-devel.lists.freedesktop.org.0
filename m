Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF3D5ED21E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078DC10E1FF;
	Wed, 28 Sep 2022 00:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C6610E1FF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:40:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D615E47C;
 Wed, 28 Sep 2022 02:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664325646;
 bh=nlCVzQMwjRd/4LIY6185L3UtjW8v4Q8WVof2Uz4QnTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vDbUvK2yOyrlCz9U+8LpZpKxjTUpA/Akzknf7TmXA6IPRTNQeaOZCadgzxWG1wUY5
 JJYfm0RfodsBbn8pDNtfqSNpVsc6EiGq9XMV0dIw2IX9xYFAiQ2DToDaFGsVO0dUNd
 tSFGvjXSKuctfl9P8J0xiRB8Jp0Ox6GsGBe+at/c=
Date: Wed, 28 Sep 2022 03:40:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Message-ID: <YzOYDM94ENK8Dt4w@pendragon.ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
 <303e8be8-41a6-e63f-f2f5-6fc3271886ed@denx.de>
 <YzOTj+QgYnn8RU84@pendragon.ideasonboard.com>
 <d89388e9-a7bf-3540-dcc9-c4ba9efe2044@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d89388e9-a7bf-3540-dcc9-c4ba9efe2044@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 02:37:04AM +0200, Marek Vasut wrote:
> On 9/28/22 02:21, Laurent Pinchart wrote:
> 
> Hi,
> 
> [...]
> 
> >>> -		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> >>> -		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> >>> +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> >>> +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF0);
> >>> -		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> >>> +		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF1);
> >>> -		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> >>> +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF2);
> >>> -		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> >>> +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF3);
> >>> -		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> >>> +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF4);
> >>>    		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> >>>    		       lcdif->base + LCDC_V8_CSC0_COEF5);
> >>
> >> Would it make sense to use the same coeffs as csc2_coef_bt601_lim in
> >> drivers/media/platform/nxp/imx-pxp.c , since the block is most likely
> >> identical ?
> > 
> > The coefficients in this patch have been computed to distribute the
> > error in such a way that the sum of all lines stays the same. This
> > avoids biases and overflow, but it likely makes very little difference
> > in practice. I'm thus fine with the coefficients from imx-pxp.c.
> 
> Would it then make sense to update the coeffs in the pxp driver instead?
> 
> Either option works for me.

It could, but I won't be able to easily test it. As the hardware clamps
the calculated value, there's no risk of wraparound, and the difference
in the +/-1 error distribution will not be noticeable, so I'll just copy
the coefficients from imx-pxp.c to ensure coherency.

-- 
Regards,

Laurent Pinchart
