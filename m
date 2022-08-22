Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFE59C14A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4F88F8BC;
	Mon, 22 Aug 2022 14:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4228F884
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:05:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E724B3F1;
 Mon, 22 Aug 2022 16:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661177121;
 bh=GyCZuyIXJ0qtdiZ8HUBnTpA4LE55f8z67NzyIC4JDmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UheXW6mF0eKs0BHJEWMf/4W6dqG0iO/ePzL8iyDkJsaaA9BTPUludxaad2RGSX8SV
 jaSz1S6LIHbIyWoZ83qdhLx/sBa0h0Ol0ompsPX5HWgF5qIh4fLkfYlEfHCesobXkS
 pBbqMMY7kPGW3NHyxfcnhfw/Z1629NrXlHOIBheI=
Date: Mon, 22 Aug 2022 17:05:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: rcar-du: dsi: Improve DSI shutdown
Message-ID: <YwONHTkBjVSQ47ek@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
 <YwOCmqcZfU4zfr3D@pendragon.ideasonboard.com>
 <38c3ce75-2dcd-38e4-0e05-151ac3faf24c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38c3ce75-2dcd-38e4-0e05-151ac3faf24c@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 04:49:02PM +0300, Tomi Valkeinen wrote:
> On 22/08/2022 16:20, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Aug 22, 2022 at 04:05:10PM +0300, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Improve the DSI shutdown procedure by clearing various bits that were
> >> set while enabling the DSI output. There has been no clear issues caused
> >> by these, but it's safer to ensure that the features are disabled at the
> >> start of the next DSI enable.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> index 7f2be490fcf8..6a10a35f1122 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> @@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> >>   
> >>   static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
> >>   {
> >> +	/* Disable VCLKEN */
> >> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
> >> +
> >> +	/* Disable DOT clock */
> >> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
> > 
> > I think you can write 0 to those two registers, this will also be safer.
> > With this,
> 
> VCLKEN has only the single VCLKEN_CKEN bit and the rest of the bits are 
> reserved with default value of 0, however VCLKSET has other fields and 
> the default value of those fields is not 0.

But the two fields whose default value isn't 0 are set in the startup()
function (albeit incorrectly as discussed below), so it should be fine.

> Why do you think it's safer to set the whole register to 0? Isn't it 
> better to just do what we want to do, which makes the purpose clear and, 
> I think, is safer as we don't touch bits we don't know about?

Because it will ensure that we don't get surprises when we later restart
the device, such as mentioned below :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I think there's a bug in rcar_mipi_dsi_startup() related to this by the
> > way, the function only uses rcar_mipi_dsi_set() to set bits, so if the
> > DSI format is modified between two starts, bad things will happen.
> 
> Oh, that's bad. rcar_mipi_dsi_set() is not a very good function as it's 
> easy to misuse it like that. I'll make a fix for that.
-- 
Regards,

Laurent Pinchart
