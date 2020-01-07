Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666151327BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848006E073;
	Tue,  7 Jan 2020 13:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB986E073
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:34:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 15A72291F9E;
 Tue,  7 Jan 2020 13:34:20 +0000 (GMT)
Date: Tue, 7 Jan 2020 14:34:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: dsi: Fix bridge chain handling
Message-ID: <20200107143416.33717553@collabora.com>
In-Reply-To: <3cf5afd7-9bdf-25ac-0683-2b72105681eb@samsung.com>
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20191227144135eucas1p15c431ece1d12d133f2f30d725ca2df8d@eucas1p1.samsung.com>
 <20191227144124.210294-3-boris.brezillon@collabora.com>
 <3cf5afd7-9bdf-25ac-0683-2b72105681eb@samsung.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, 7 Jan 2020 10:11:43 +0100
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi Boris,
> 
> Sorry, for the late reply, I've just got back from my prolonged Chrismas 
> holidays.
> 
> On 27.12.2019 15:41, Boris Brezillon wrote:
> > Commit 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked
> > list") patched the bridge chain logic to use a double-linked list instead
> > of a single-linked list. This change induced changes to the Exynos driver
> > which was manually resetting the encoder->bridge element to NULL to
> > control the enable/disable sequence of the bridge chain. During this
> > conversion, 2 bugs were introduced:
> >
> > 1/ list_splice() was used to move chain elements to our own internal
> >     chain, but list_splice() does not reset the source list to an empty
> >     state, leading to unexpected bridge hook calls when
> >     drm_bridge_chain_xxx() helpers were called by the core. Replacing
> >     the list_splice() call by list_splice_init() fixes this problem.
> >
> > 2/ drm_bridge_chain_xxx() helpers operate on the
> >     bridge->encoder->bridge_chain list, which is now empty. When the
> >     helper uses list_for_each_entry_reverse() we end up with no operation
> >     done which is not what we want. But that's even worse when the helper
> >     uses list_for_each_entry_from(), because in that case we end up in
> >     an infinite loop searching for the list head element which is no
> >     longer encoder->bridge_chain but exynos_dsi->bridge_chain. To address
> >     that problem we stop using the bridge chain helpers and call the
> >     hooks directly.
> >
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Works fine on Exynos5250-based Arndale board.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing, but can you also add your R-b (I need it to make
dim happy)? While you're at it, maybe you can review patch 2 (it's very
similar to this patch).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
