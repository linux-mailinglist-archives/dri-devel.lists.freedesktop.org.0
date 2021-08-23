Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E970B3F4CB6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 16:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13E89F9F;
	Mon, 23 Aug 2021 14:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AAB89F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 14:54:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E68938F;
 Mon, 23 Aug 2021 16:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1629730449;
 bh=NdVNzZz2+MtRmpGXjjC7lYtKYGpXXYjv5gHsl/8dvvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKRkYTcJR+6h4clEdABrc96JpoJBoUryd942WBp2J9NTFDIVtoQmokOebwKZQsBbs
 xFuAocU410Au/r6Is38tp7mv6lv4POCiuDPgjMy44W+AKe0/32LA59KGYRnQBWcr10
 z1F4JDx70YydwB+jWJPfUmxUYu8nEB9eA2iOi9ro=
Date: Mon, 23 Aug 2021 17:53:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS
 outputs
Message-ID: <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Aug 23, 2021 at 02:25:32PM +0200, Geert Uytterhoeven wrote:
> On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart wrote:
> > On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> > even when LVDS outputs are not used. For this reason, the rcar-lvds
> > driver probes successfully on those platforms even if no further bridge
> > or panel is connected to the LVDS output, in order to provide the
> > rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> > driver.
> >
> > If an LVDS output isn't connected, trying to create a DRM connector for
> > the output will fail. Fix this by skipping connector creation in that
> > case, and also skip creation of the DRM encoder as there's no point in
> > an encoder without a connector.
> >
> > Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Can you please change that to
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ?

Sure thing.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks, the scary warning on Ebisu-4D is gone, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Disclaimer: there are no displays connected to my Ebisu-4D.

That's the best way to ensure the absence of display issues. It works
great for camera testing too, if you also remove networking and storage
:-)

-- 
Regards,

Laurent Pinchart
