Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6632CEF0E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 14:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCF56E17E;
	Fri,  4 Dec 2020 13:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF266E17E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 13:54:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A69261F45EC7;
 Fri,  4 Dec 2020 13:54:32 +0000 (GMT)
Date: Fri, 4 Dec 2020 14:54:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201204145428.7badbdb3@collabora.com>
In-Reply-To: <1ab0f05c-866b-c028-12c0-50766f2132e6@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
 <422bd85b-cbda-7b9f-4393-057bef127894@ti.com>
 <20201204121235.4bbbe2eb@collabora.com>
 <1ab0f05c-866b-c028-12c0-50766f2132e6@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Dec 2020 13:47:05 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> On 04/12/2020 13:12, Boris Brezillon wrote:
> 
> >>> That'd be even better if you implement the bridge interface instead of
> >>> the encoder one so we can get rid of the encoder_{helper}_funcs and use
> >>> drm_simple_encoder_init().    
> >>
> >> I'm a bit confused here. What should be the design here...
> >>
> >> These formats need to be handled by the crtc (well, the display controller, which is modeled as the
> >> crtc). Should we have a tidss_crtc.c file, which implements a crtc, a simple encoder and a bridge?
> >> And just consider those three DRM components as different API parts of the display controller?  
> > 
> > The idea is to hide the encoder abstraction from drivers as much as we
> > can. We have to keep the encoder concept because that's what we expose
> > to userspace, but drivers shouldn't have to worry about the distinction
> > between the first bridge in the chain (what we currently call encoders)
> > and other bridges. The bridge interface provides pretty much the same
> > functionality, so all you need to do is turn your encoder driver into a
> > bridge driver (see what we did for
> > drivers/gpu/drm/imx/parallel-display.c), the only particularity here is
> > that the bridge knows it's the first in the chain, and has access to
> > the CRTC it's directly connected to.  
> 
> With a quick look, the imx parallel-display.c seems to be really part of the crtc. Shouldn't we then
> take one more step forward, and just combine the crtc, encoder and bridge (somehow)? That's kind of
> what parallel-display.c is doing, isn't it? It's directly poking the crtc state, but the code just
> happens to be in a separate file from the crtc.

Right. If we want to keep the code split, the logic should probably be
reversed, with the CRTC driver checking the first bridge state to setup
its internal state. Those DPI encoders are always a bit special, since
they tend to be directly embedded in the block responsible for timing
control (what we call CRTCs), so you're right, maybe we should model
that as a CRTC+bridge pair.

> 
> Thinking about the TI HW, we have a bunch of internal IPs which are clearly bridges: HDMI, DSI,
> which get the pixel data from the display controller, and they have their own registers, so clearly
> independent bridges.
> 
> Then we have MIPI DPI, which doesn't really have its own registers, as it's just plain parallel RGB,
> the same as what is sent to e.g. HDMI and DSI bridges.

I still consider that one a bridge, even if the translation is almost
transparent from a HW PoV.

> However, there might be some muxes or
> regulators to set up to get the external signals working. So a bridge would be ok here too to handle
> that external side.

Exactly.

> 
> But in all the above cases, we have the display controller (crtc), which in all the cases needs to
> do e.g. pixel/bus format configuration. So why add direct crtc poking into the first bridges (HDMI,
> DSI, DPI), when we could just model the crtc as a bridge, and thus the first bridges wouldn't need
> to touch the crtc.

Yes, that's an option. I mean, you can already modify your CRTC
logic to implement the bridge and CRTC interface and have your
driver-specific CRTC object embed both a drm_crtc and a drm_bridge.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
