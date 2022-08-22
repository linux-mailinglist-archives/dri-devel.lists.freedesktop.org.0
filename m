Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981B59C19A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84822907F4;
	Mon, 22 Aug 2022 14:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71057907A4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:28:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 835382B3;
 Mon, 22 Aug 2022 16:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661178491;
 bh=tPepQA0zrZUUsv4TUAxHMqpQEB09+kJnTPxPrVg2jW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONpKtG2iBg4ZirIiZeqN54vADwfXBAYNo696P5ve8I3pdIv1rt43/pZ+PfrRT+f8/
 Zirp0pJ5c/IRTkmeUaT037djV0nHx5pZBbhE6hU7uu/tNwN3vM9msQVDAnPi37ebhA
 CCxsoRrTGQTFNprNaZ4fE4TMCGbvPW5PoBYOeuRc=
Date: Mon, 22 Aug 2022 17:28:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: rcar-du: dsi: Improve DSI shutdown
Message-ID: <YwOSeDkBmFfRC8Rx@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
 <YwOCmqcZfU4zfr3D@pendragon.ideasonboard.com>
 <38c3ce75-2dcd-38e4-0e05-151ac3faf24c@ideasonboard.com>
 <YwONHTkBjVSQ47ek@pendragon.ideasonboard.com>
 <71457f76-9912-71c2-4aba-66ed5f88a648@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71457f76-9912-71c2-4aba-66ed5f88a648@ideasonboard.com>
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

On Mon, Aug 22, 2022 at 05:19:56PM +0300, Tomi Valkeinen wrote:
> On 22/08/2022 17:05, Laurent Pinchart wrote:
> > On Mon, Aug 22, 2022 at 04:49:02PM +0300, Tomi Valkeinen wrote:
> >> On 22/08/2022 16:20, Laurent Pinchart wrote:
> >>> Hi Tomi,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Aug 22, 2022 at 04:05:10PM +0300, Tomi Valkeinen wrote:
> >>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>>
> >>>> Improve the DSI shutdown procedure by clearing various bits that were
> >>>> set while enabling the DSI output. There has been no clear issues caused
> >>>> by these, but it's safer to ensure that the features are disabled at the
> >>>> start of the next DSI enable.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>    drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
> >>>>    1 file changed, 12 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >>>> index 7f2be490fcf8..6a10a35f1122 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >>>> @@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> >>>>    
> >>>>    static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
> >>>>    {
> >>>> +	/* Disable VCLKEN */
> >>>> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
> >>>> +
> >>>> +	/* Disable DOT clock */
> >>>> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
> >>>
> >>> I think you can write 0 to those two registers, this will also be safer.
> >>> With this,
> >>
> >> VCLKEN has only the single VCLKEN_CKEN bit and the rest of the bits are
> >> reserved with default value of 0, however VCLKSET has other fields and
> >> the default value of those fields is not 0.
> > 
> > But the two fields whose default value isn't 0 are set in the startup()
> > function (albeit incorrectly as discussed below), so it should be fine.
> 
> That is true. But I'd rather write 0 to VCLKEN in the startup, before 
> writing the configuration.

You can do both :-)

> >> Why do you think it's safer to set the whole register to 0? Isn't it
> >> better to just do what we want to do, which makes the purpose clear and,
> >> I think, is safer as we don't touch bits we don't know about?
> > 
> > Because it will ensure that we don't get surprises when we later restart
> > the device, such as mentioned below :-)
> 
> Well, but that's a bug in the startup code. I don't think the shutdown 
> code should do things to make startup work better if the startup does 
> something wrong. Nevertheless, while I slightly disagree, I'm fine with 
> writing zero there in shutdown.

I agree it needs to be fixed at start() time, but I think it's also good
practice to put the device in a fully known state after shutdown, at
least when it's easy to do so. It would also save an unnecessary read
access to the register.

-- 
Regards,

Laurent Pinchart
