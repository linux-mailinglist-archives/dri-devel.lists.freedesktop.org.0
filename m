Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608324201D0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 15:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138246E0D2;
	Sun,  3 Oct 2021 13:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D2A6E0CB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Oct 2021 13:53:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A727A2A;
 Sun,  3 Oct 2021 15:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633269203;
 bh=i2COgYweNcWFegEI95TYlq2aE0WKAid8UjmSCsbuI0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbpRWJAEnljbkMmQ9PZJJJVeFaY1fIZ9SmXj+/AKXMSku1abWmVAbqgAD0VgV/bxr
 rMKZHuDTyyjEUkOBsDTXOCSCvkji2sN1RntdD4Ab7Q9lWWqxK/o2Bai73Njni0Hv8h
 k2GPyzXKvgPxXHkyNMGj0ba5vPFWvOM4aznFAUu0=
Date: Sun, 3 Oct 2021 16:53:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS
 outputs
Message-ID: <YVm1zyrlrTqYCgC+@pendragon.ideasonboard.com>
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
 <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
 <CAMuHMdW6Y4rhcH4EfjnzkPvWhm2ok=7E_3Cswe=5bnozGzpmGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6Y4rhcH4EfjnzkPvWhm2ok=7E_3Cswe=5bnozGzpmGA@mail.gmail.com>
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

On Tue, Sep 28, 2021 at 10:55:57AM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 23, 2021 at 4:54 PM Laurent Pinchart wrote:
> > On Mon, Aug 23, 2021 at 02:25:32PM +0200, Geert Uytterhoeven wrote:
> > > On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart wrote:
> > > > On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> > > > even when LVDS outputs are not used. For this reason, the rcar-lvds
> > > > driver probes successfully on those platforms even if no further bridge
> > > > or panel is connected to the LVDS output, in order to provide the
> > > > rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> > > > driver.
> > > >
> > > > If an LVDS output isn't connected, trying to create a DRM connector for
> > > > the output will fail. Fix this by skipping connector creation in that
> > > > case, and also skip creation of the DRM encoder as there's no point in
> > > > an encoder without a connector.
> > > >
> > > > Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> > > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Can you please change that to
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ?
> >
> > Sure thing.
> 
> Thanks!
> 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > Thanks, the scary warning on Ebisu-4D is gone, so
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Disclaimer: there are no displays connected to my Ebisu-4D.
> >
> > That's the best way to ensure the absence of display issues. It works
> > great for camera testing too, if you also remove networking and storage
> > :-)
> 
> Any chance this fix can make it upstream?
> The fix was created before the issue entered upstream in v5.15-rc1.

Pull request sent.

-- 
Regards,

Laurent Pinchart
