Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74112B479
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 13:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C097C89F2D;
	Fri, 27 Dec 2019 12:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14689F2D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 12:21:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 06E5928A9D8;
 Fri, 27 Dec 2019 12:21:34 +0000 (GMT)
Date: Fri, 27 Dec 2019 13:21:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191227132131.1e84ad60@collabora.com>
In-Reply-To: <20191227105154.GA4769@pendragon.ideasonboard.com>
References: <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
 <20191224104422.25dbf980@collabora.com>
 <3a30de8e-9cc9-e3ff-a19a-45ea085ed9fc@samsung.com>
 <20191227105154.GA4769@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Dec 2019 12:51:54 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Andrzej,
> 
> On Fri, Dec 27, 2019 at 10:42:25AM +0100, Andrzej Hajda wrote:
> > On 24.12.2019 10:44, Boris Brezillon wrote:  
> > > On Tue, 24 Dec 2019 10:16:49 +0100 Andrzej Hajda wrote:  
> > >> On 23.12.2019 10:55, Marek Szyprowski wrote:  
> > >>> On 16.12.2019 16:25, Boris Brezillon wrote:    
> > >>>> On Mon, 16 Dec 2019 16:02:36 +0100 Marek Szyprowski wrote:    
> > >>>>> On 16.12.2019 15:55, Boris Brezillon wrote:    
> > >>>>>> On Mon, 16 Dec 2019 14:54:25 +0100
> > >>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:    
> > >>>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:    
> > >>>>>>>> So that each element in the chain can easily access its predecessor.
> > >>>>>>>> This will be needed to support bus format negotiation between elements
> > >>>>>>>> of the bridge chain.
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >>>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > >>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>    
> > >>>>>>>
> > >>>>>>> I've noticed that this patch got merged to linux-next as commit
> > >>>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
> > >>>>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
> > >>>>>>> messages:
> > >>>>>>>
> > >>>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> > >>>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> > >>>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> > >>>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> > >>>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> > >>>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > >>>>>>> [drm] No driver support for vblank timestamp query.
> > >>>>>>> [drm] Cannot find any crtc or sizes
> > >>>>>>> [drm] Cannot find any crtc or sizes
> > >>>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> > >>>>>>>
> > >>>>>>> I will try to debug this and provide more information soon.  
> > >>>>>>
> > >>>>>> Can you try with this diff applied?    
> > >>>>>
> > >>>>> This patch doesn't change anything.    
> > >>>>
> > >>>> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
> > >>>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
> > >>>> after the list_splice_init() call?    
> > >>>
> > >>> encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
> > >>>
> > >>> Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
> > >>> fixed the boot issue.  
> > >
> > > If INIT_LIST_HEAD() worked, I don't understand why replacing the
> > > list_splice() call by a list_splice_init() (which doing a list_splice()
> > > + INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
> > > list_splice_init() version doesn't work?
> > >  
> > >>> It looks that this is related with the way the 
> > >>> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
> > >>> will give a bit more detailed comment and spread some light on this.    
> > >>
> > >> Hi Marek, Boris,
> > >>
> > >> I have not followed latest patches due to high work load, my bad. Marek
> > >> thanks from pointing
> > >>
> > >> About ExynosDSI bridge handling:
> > >>
> > >> The order of calling encoder, bridge (and consequently panel) ops
> > >> enforced by DRM core (bridge->pre_enable, encoder->enable,
> > >> bridge->enable) does not fit to ExynosDSI hardware initialization
> > >> sequence, if I remember correctly it does not fit to whole MIPI DSI
> > >> standard (I think similar situation is with eDP). As a result DSI
> > >> drivers must use some ugly workarounds, rely on HW properly coping with
> > >> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
> > >> using encoder->bridge chaining and call bridge ops by itself when suitable.  
> > >
> > > Yes, that's definitely hack-ish, and I proposed 2 solutions to address
> > > that in previous versions of this patchset, unfortunately I didn't get
> > > any feedback so I went for the less invasive option (keep the hack but
> > > adapt it to the double-linked list changes), which still lead to
> > > regressions :-/.
> > >
> > > Just a reminder of my 2 proposals:
> > >
> > > 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
> > >    split your enable/disable logic in 2 parts and make sure things are
> > >    ready when the panel/next bridge tries to send DSI commands  
> > 
> > If it means 'convert exynos_dsi to bridge' I do not think it will help -
> > 
> > - pre_enable op will be still called after pre_enable op of downstream
> > bridge - and this is the main reason why exynos_dsi do not use encoder
> > bridge chain - it needs to perform some operations BEFORE (pre)enabling
> > downstream devices.

Yep, I figured that after Laurent's review.

> >   
> > > 2/ move everything that's needed to send DSI commands out of the  
> > >    ->enable() path (maybe in runtime PM resume/suspend hooks) so you  
> > >    can call that in the DSI transfer path too  
> > 
> > It looks like a solution for DSI protocol, where control bus is shared
> > with data bus, but the problem is more general - we have source and sink
> > connected with some local bus, which has some negotiation/enable/disable
> > protocol/requirements. And drm_core/bridge framework enforces us to fit
> > every such protocol to 'drm_bridge protocol' with few opses called in
> > fixed order, without clearly defined purpose of each ops. That does not
> > sound generic and results in multiple issues:
> > 
> > - different drivers uses different opses to perform the same thing,
> > 
> > - different drivers assumes different things about their sinks/sources
> > in their opses,
> > 
> > - more complicated sequences does not fit at all to this model.
> > 
> > All this results in incompatibilities between drivers which become
> > visible with devices used in different configurations/platforms.

That's true, drm_bridge_funcs semantics is rather vague and probably
doesn't fit all needs, but that's not the only problem we have when it
comes to DSI IMHO. I mean, I couldn't find any doc in drm_mipi_dsi.h
explaining when panel/bridge drivers are allowed to send DCS commands.
I was personally assuming that we were allowed to send such commands as
soon as mipi_dsi_attach() was called, but that's not clearly not
possible with VC4 and Exynos. This part should be clarified too.

> 
> I fully agree with you, not defining the semantics of the bridge
> operations precisely was I believe a mistake, and we're paying the price
> now. That's OK, we "just" need to fix it :-)

Okay, so how do we fix that? :-)

I'm not a big fan of specializing the drm_bridge_funcs interface to fit
protocol X or protocol Y needs. Sounds like a never ending story,
protocol Z might require something slightly different, and we're likely
to end up with an interface that's not generic at all.

Maybe I'm wrong, but it sounds like all DSI ordering issues could be
addressed at the mipi_dsi_host_ops level if we define a new
->enter_power_state() hook and have the DSI framework keep track of the
host power state (LP,HS,PD,...). The framework would then make sure we
are in a valid state (LP or HS) before calling dsi_host->transfer(). If
we have that in place, I don't think we need new hooks at the bridge
level, at least not for the DSI case. Please let me know if I'm missing
something.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
