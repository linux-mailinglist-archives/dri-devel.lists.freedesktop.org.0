Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139549725A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 16:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496310FB44;
	Sun, 23 Jan 2022 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093A10FB33
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 15:10:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE3C625E;
 Sun, 23 Jan 2022 16:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642950650;
 bh=9AwQOyMclN3lDZ74aKgjK2P/kyt6S/DtgqFhL0tSUoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BHEjmEr0MW2oRn+iKnNj67wcMhmt7xhfCTqjAq5u0DIICwkrWxFTJJxxaCvuDCC5R
 gx7oN/4gyZyvN/TcPhkOnGsM1T94gcj8UzKNIqUgc4qYD2xFFlMTuzURZvPtsH0yiY
 kTirSveJKobFFYr0L4vyKR2JCXSmCuZCxmvwc1bc=
Date: Sun, 23 Jan 2022 17:10:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: Renesas rcar-du and DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
Message-ID: <Ye1v6WkLsUBxL9fy@pendragon.ideasonboard.com>
References: <FE3831D8-A33F-470B-AD55-6005786139AF.ref@yahoo.com>
 <FE3831D8-A33F-470B-AD55-6005786139AF@yahoo.com>
 <CAHCN7xJvDP7o__42Rm7n-KNhoGa4MTP2iuty+x_k616ANkcu+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xJvDP7o__42Rm7n-KNhoGa4MTP2iuty+x_k616ANkcu+Q@mail.gmail.com>
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
Cc: Charles Stevens <chazste@yahoo.com>,
 kieran.bingham+renesas@ideasonboard.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Thanks for CC me Adam.

On Fri, Jan 21, 2022 at 11:24:09AM -0600, Adam Ford wrote:
> On Wed, Dec 29, 2021 at 10:19 PM Charles Stevens wrote:
> >
> > Hi All,
> >
> > I am working on a platform based on the Renesas RZ/G2 SoC family.
> > This chip uses the rcar-du driver for the display. I would like to
> > submit a patch to address the fact that the driver does not
> > check/honor the flag DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE. My issue is
> > that I would like to make as small a change to the driver as
> > possible, but the panel bus_flags don't seem to even make it to the
> > crtc driver. The crtc driver seems to use adjusted_mode to set the
> > HSYNC and VSYNC polarity and as I said ignores the pixel clock
> > polarity leaving it at the default of driving on the falling edge.
> > In my investigations so far I have not figured out how to chase the
> > pointers from the CRTC to the bridge to the panel in order to be
> > able to look at bus_flags. My current approach also modifies the
> > encoder initialization to cache the needed panel and then find the
> > attached encoder during CRTC initialization to find the bus flags.
> > This seems like a lot of work and not something that would be
> > accepted as a patch. The OMAP DSS seems to have problems accessing
> > this flag as well. The TI driver goes so far as to document the
> > current approach as a HACK and suggest a fairly large change to the
> > driver to address the problem. Am I missing something? Is there an
> > easy way to get from a drm_crtc to a drm_panel that is in the same
> > pipeline?

This is actually something I've experimented with before. I wrote
patches, but never got a chance to post them. I've pushed them to
git://linuxtv.org/pinchartl/media.git drm/du/syncpol if you want to have
a look.

However, there's one issue with this approach: it's not correct :-) The
CRTC shouldn't be configured based on the polarity of signals at the end
of the pipeline, it needs to be configured based on the polarities
expected by the next bridge in the chain. That may depend on the next
bridge, which may depend on the next bridge, and so on. The information
should thus be propagated from the panel towards the CRTC, one bridge at
a time, the same way that we propagate formats with the bridge
.atomic_get_input_bus_fmts() and .atomic_get_output_bus_fmts()
operations. There's thus quite a bit of work required to handle all
this.

> > Any pointers would be greatly appreciated!
>
> +  Laurent, Kieran
> 
> Charles,
> 
> I added Laurent and Kieran because they appear as the maintainers for
> the rcar-du driver.

-- 
Regards,

Laurent Pinchart
