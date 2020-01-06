Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89846130E13
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 08:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911C89BBE;
	Mon,  6 Jan 2020 07:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4366189BBE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 07:41:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AC99928A0EC;
 Mon,  6 Jan 2020 07:41:34 +0000 (GMT)
Date: Mon, 6 Jan 2020 08:41:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: dsi: Fix bridge chain handling
Message-ID: <20200106084131.0d4a8002@collabora.com>
In-Reply-To: <20191227144124.210294-3-boris.brezillon@collabora.com>
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <20191227144124.210294-3-boris.brezillon@collabora.com>
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

On Fri, 27 Dec 2019 15:41:24 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Commit 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked
> list") patched the bridge chain logic to use a double-linked list instead
> of a single-linked list. This change induced changes to the Exynos driver
> which was manually resetting the encoder->bridge element to NULL to
> control the enable/disable sequence of the bridge chain. During this
> conversion, 2 bugs were introduced:
> 
> 1/ list_splice() was used to move chain elements to our own internal
>    chain, but list_splice() does not reset the source list to an empty
>    state, leading to unexpected bridge hook calls when
>    drm_bridge_chain_xxx() helpers were called by the core. Replacing
>    the list_splice() call by list_splice_init() fixes this problem.
> 
> 2/ drm_bridge_chain_xxx() helpers operate on the
>    bridge->encoder->bridge_chain list, which is now empty. When the
>    helper uses list_for_each_entry_reverse() we end up with no operation
>    done which is not what we want. But that's even worse when the helper
>    uses list_for_each_entry_from(), because in that case we end up in
>    an infinite loop searching for the list head element which is no
>    longer encoder->bridge_chain but exynos_dsi->bridge_chain. To address
>    that problem we stop using the bridge chain helpers and call the
>    hooks directly.
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Hello Marek,
> 
> I'm perfectly fine applying your patch instead of this one if you prefer
> to restrict the logic to a single bridge per chain. I just sent this
> patch in case your okay with the slightly different version I propose
> here.

Marek, Andrzej, did you have time to look at this patch (or respin
"drm/bridge: Fix Exynos DSI after making bridge chain a  double-linked
list" if you don't like this version)?

I'd really like to apply this fix (and its vc4 equivalent) to
drm-misc-next as soon as possible.

Thanks,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
