Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B2284775
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665E76E3F9;
	Tue,  6 Oct 2020 07:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8C6E3F9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 07:38:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D21F82941E2;
 Tue,  6 Oct 2020 08:38:08 +0100 (BST)
Date: Tue, 6 Oct 2020 09:38:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: drm: Supporting new connector model in tidss
Message-ID: <20201006093804.41128512@collabora.com>
In-Reply-To: <e4b95dfd-93e1-4839-08c3-32b28e32dbc0@ti.com>
References: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
 <e4b95dfd-93e1-4839-08c3-32b28e32dbc0@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Oct 2020 10:07:39 +0300
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> Adding Boris who added bus format negotiation.
> 
> On 06/10/2020 00:31, Nikhil Devshatwar wrote:
> > Hi all,
> > 
> > I am trying to convert the upstream tidss drm driver to new
> > connector model.
> > The connector is getting created by the tidss driver and bridges are
> > attached with flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > Here are some questions, regarding this:  
> 
> I was looking at this a bit, and below is my understanding. And I'm mostly talking about how things
> should be with new code, not legacy code. Things are probably a bit more complex if you mix bridges
> which implement different styles on how to deal with bus formats.
> 
> > 1) Most of the info regarding bus_format and bus flags is coming from
> > the bridges. Is it okay to not populate connector->display_info with
> > bus_format and flags?  
> 
> drm_display_info describes the connected display and what goes on the wire to the display.
> 
> For monitors that's quite clear, and the data in display_info would reflect what the last bridge
> needs to output. Most of the data comes from EDID, but I think bus format and flags do not. So a
> bridge would need to fill them in, which doesn't make sense when we have a chain of bridges (which
> would be the bridge to fill the data?). So for monitors, I think bus flags and formats in
> display_info are unused.
> 
> For panels, I'm not sure. We have the bridge/panel.c which wraps the actual panel driver, so afaics
> the panel is essentially the last bridge in the chain, and the connector is kind of a dummy
> connector. But the panel driver fills in the display_info, and that's where the bridge/panel.c gets
> the bus formats & flags for the negotiation.
> 
> Probably the above could be changed so that the panels take part of the negotiation process, and
> then the bus formats and flags fields in the display_info could be removed.

Yep, that'd be better to have the bus format/flags info provided by the
panel itself rather than passed through display info.

> 
> > 2) The "drm_atomic_bridge_chain_select_bus_fmts" does the format
> > negotiation. So is it okay for the encoder to simply pick the bus_format
> > from the first bridge's state?  
> 
> Yes, I think that is the idea. The first bridge's input is what the display controller's encoder
> should output, and the negotiation should take care to provide something in the first bridge's state
> for the input.

Exactly.

> 
> > 3) What is the meaning of MEDIA_BUS_FMT_FIXED? Does it mean that the
> > bridge does not change the format from input to output?  
> 
> I think it just means "undefined" here, and it's up to the drivers to decide what to do. I presume
> this is mostly for drivers that don't support the new stuff, as each bridge should be able to tell
> what formats & flags it supports.

Correct.

> 
> > 4) The bus_flags are available in bridge->timings->input_bus_flags and
> > also in bridge_state->input_bus_cfg.flags. Which one should be used?  
> 
> I think bridge_state->input_bus_cfg. Although bridge->timings->input_bus_flags has some data that's
> not in input_bus_cfg. If the drivers support the negotiation, I don't think
> bridge->timings->input_bus_flags has any use.

Oh, I didn't realize there was an input_bus_flags in the timings
struct. We should probably propagate those in
drm_atomic_bridge_propagate_bus_flags().

> 
> Probably bridge->timings->input_bus_flags should be used as a fallback. So if a bridge is asked to
> use MEDIA_BUS_FMT_FIXED as output (i.e. the next bridge doesn't support negotiation), then the
> bridge might use a default format and also see if the next bridge has bridge->timings->input_bus_flags.

I think this could be automated in
drm_atomic_bridge_propagate_bus_flags(). Right now we simply propagate
the output bus flags to the input end [1], but it probably makes more
sense to use the value in bridge->timings->input_bus_flags if present.

[1]https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/gpu/drm/drm_bridge.c#L971
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
