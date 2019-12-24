Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAF129FC6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 10:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE966E31A;
	Tue, 24 Dec 2019 09:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2486E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 09:44:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD37E292380;
 Tue, 24 Dec 2019 09:44:25 +0000 (GMT)
Date: Tue, 24 Dec 2019 10:44:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191224104422.25dbf980@collabora.com>
In-Reply-To: <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
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
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Dec 2019 10:16:49 +0100
Andrzej Hajda <a.hajda@samsung.com> wrote:

> On 23.12.2019 10:55, Marek Szyprowski wrote:
> > Hi Boris,
> >
> > On 16.12.2019 16:25, Boris Brezillon wrote:  
> >> On Mon, 16 Dec 2019 16:02:36 +0100
> >> Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
> >>> Hi Boris,
> >>>
> >>> On 16.12.2019 15:55, Boris Brezillon wrote:  
> >>>> On Mon, 16 Dec 2019 14:54:25 +0100
> >>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
> >>>>> On 03.12.2019 15:15, Boris Brezillon wrote:  
> >>>>>> So that each element in the chain can easily access its predecessor.
> >>>>>> This will be needed to support bus format negotiation between elements
> >>>>>> of the bridge chain.
> >>>>>>
> >>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>  
> >>>>> I've noticed that this patch got merged to linux-next as commit
> >>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
> >>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
> >>>>> messages:
> >>>>>
> >>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> >>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> >>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> >>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> >>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> >>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> >>>>> [drm] No driver support for vblank timestamp query.
> >>>>> [drm] Cannot find any crtc or sizes
> >>>>> [drm] Cannot find any crtc or sizes
> >>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> >>>>>
> >>>>> I will try to debug this and provide more information soon.
> >>>>>     
> >>>> Can you try with this diff applied?  
> >>> This patch doesn't change anything.  
> >> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
> >> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
> >> after the list_splice_init() call?  
> > encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
> >
> > Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
> > fixed the boot issue.

If INIT_LIST_HEAD() worked, I don't understand why replacing the
list_splice() call by a list_splice_init() (which doing a list_splice()
+ INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
list_splice_init() version doesn't work?

> > It looks that this is related with the way the 
> > Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
> > will give a bit more detailed comment and spread some light on this.  
> 
> 
> Hi Marek, Boris,
> 
> 
> I have not followed latest patches due to high work load, my bad. Marek
> thanks from pointing
> 
> About ExynosDSI bridge handling:
> 
> The order of calling encoder, bridge (and consequently panel) ops
> enforced by DRM core (bridge->pre_enable, encoder->enable,
> bridge->enable) does not fit to ExynosDSI hardware initialization
> sequence, if I remember correctly it does not fit to whole MIPI DSI
> standard (I think similar situation is with eDP). As a result DSI
> drivers must use some ugly workarounds, rely on HW properly coping with
> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
> using encoder->bridge chaining and call bridge ops by itself when suitable.

Yes, that's definitely hack-ish, and I proposed 2 solutions to address
that in previous versions of this patchset, unfortunately I didn't get
any feedback so I went for the less invasive option (keep the hack but
adapt it to the double-linked list changes), which still lead to
regressions :-/.

Just a reminder of my 2 proposals:

1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
   split your enable/disable logic in 2 parts and make sure things are
   ready when the panel/next bridge tries to send DSI commands
2/ move everything that's needed to send DSI commands out of the
   ->enable() path (maybe in runtime PM resume/suspend hooks) so you
   can call that in the DSI transfer path too

As pointed out by Laurent, #1 doesn't work because some panel drivers
send DSI commands in their ->prepare() hook, and ->pre_enable() methods
are called in reverse order, meaning that the DRM panel bridge driver
would try to issue DSI commands before the DSI host controllers is ready
to send them. I still thing #2 is a good option.

> 
> So proper patch converting to double-linked list should not try to
> splice ExynosDSI private bridge list with with encoder's, encoder's list
> should be always empty, as Marek suggested.

That's exactly what I wanted to do: make the encoder's list empty after
attach() and restore it to its initial state before unregistering
the bridge, except I forgot that list_splice() doesn't call
INIT_LIST_HEAD(). It's still not clear to me why replacing the
list_splice() call by a list_splice_init() didn't work.
Also note that calling INIT_LIST_HEAD() only works if you have one
bridge in the chain, so if we go for that option we need a comment
explaining the limitations of this approach.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
