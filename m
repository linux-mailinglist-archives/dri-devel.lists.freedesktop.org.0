Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC88132A17
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6A96E0E2;
	Tue,  7 Jan 2020 15:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C56E0E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:33:32 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED94429284A;
 Tue,  7 Jan 2020 15:33:30 +0000 (GMT)
Date: Tue, 7 Jan 2020 16:33:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/3] drm/bridge: Fix drm_bridge_chain_pre_enable()
Message-ID: <20200107163328.2134e428@collabora.com>
In-Reply-To: <9ec04432-c727-2309-ec4a-6527d9fc3e7a@samsung.com>
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20200106102926epcas5p4b68e21dc062f05695ac9bb23410ce4f7@epcas5p4.samsung.com>
 <20200106102911.GA4853@pendragon.ideasonboard.com>
 <9ec04432-c727-2309-ec4a-6527d9fc3e7a@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jan 2020 16:27:10 +0100
Andrzej Hajda <a.hajda@samsung.com> wrote:

> On 06.01.2020 11:29, Laurent Pinchart wrote:
> > Hi Boris,
> >
> > Thank you for the patch.
> >
> > On Fri, Dec 27, 2019 at 03:41:22PM +0100, Boris Brezillon wrote:  
> >> Stop iterating on the bridge chain when we reach the bridge element.
> >> That's what other helpers do and should allow bridge implementations
> >> to execute a pre_enable operation on a sub-chain.  
> > The code looks fine to me, but I think you should update the
> > documentation to explain this. It currently states:
> >
> >  * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
> >  * chain, starting from the last bridge to the first. These are called
> >  * before calling the encoder's commit op.
> >  *
> >  * Note: the bridge passed should be the one closest to the encoder
> >
> > I suggest stating instead that the operation is called from the last
> > bridge to the bridge passed as the argument. The note should then either
> > be removed, or updated to state that bridge is usually the bridge
> > closest to the encoder, but can be any other bridge if the caller only
> > wants to execute the operation on a subset of the chain. It's also
> > probably worth it updating the other functions accordingly.  
> 
> 
> Apparently drm_(atomic_)bridge_chain_* helpers are always called on the
> 1st bridge so you can try to remove bridge argument, if it is true.

You mean passing an encoder instead of a bridge? I think that's what I
initially did and was told we might want to execute operations on a
sub-chain at some point.

> 
> Moreover after patches 2 and 3 drm_bridge_chain_* helpers have no users.

Well, the core is still using it, but there's no external users, you're
right. Do you want me to stop exporting those helpers?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
