Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CF547A05
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 14:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDEC10E06A;
	Sun, 12 Jun 2022 12:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E898110E06A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PpzGp7NR4K+XdPQXyebnsBlhWXRW19xXIqTXFtCBX/0=;
 b=cm1ygXXTd6pH43wfqfLlbG4azdNalhbWk3ANVYv8XZkf//Jglj8h35tavfxHLyCL7kaecc6OpCeoh
 1w8jETo+5u/J1WmB1icF88jDYot3D4i21HVziwy15dywI+DHQm/4daxpg4QNPwGz7yBk7KOs9APy+L
 xVnt88L26PcQiic1WRAqxWyxlPMajBTrwlSmORR62nCAtNj8schNT56e7mlyi+W7aq4o9MqbYKhjnW
 zAq5ArsH1MZqng88UhMRzSY/Qx5v74J1D+l0fNg/aMj9iMVBafL5Ag5CJ1eTXd7WUI0JcTG4+F8ioP
 /cCfrnhF8lOQTmP+aRBzqRttEwwuCrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PpzGp7NR4K+XdPQXyebnsBlhWXRW19xXIqTXFtCBX/0=;
 b=3VtBALeuTrpi7h/gCJPxv5JJit36IekJ8V7hCqQcypA9z6dVSjNbe5uqWRorvogQg0KV2wXJcYguZ
 2yJMRJLCA==
X-HalOne-Cookie: 793e103983e3ed54b6ee4344c53ccadba803143b
X-HalOne-ID: 6d6c1816-ea48-11ec-a912-d0431ea8a290
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 6d6c1816-ea48-11ec-a912-d0431ea8a290;
 Sun, 12 Jun 2022 12:08:53 +0000 (UTC)
Date: Sun, 12 Jun 2022 14:08:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi83: Do not cache dsi_lanes and
 host twice
Message-ID: <YqXXVJSTpDL0VL9x@ravnborg.org>
References: <20220612102918.13874-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612102918.13874-1-marex@denx.de>
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
Cc: robert.foss@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,
On Sun, Jun 12, 2022 at 12:29:18PM +0200, Marek Vasut wrote:
> The DSI lane count can be accessed via the dsi device pointer, make use
> of that. The DSI host pointer is only used in sn65dsi83_host_attach(),
> move the code around so that the host does not have to be cached in the
> driver private data. This simplifies the code further. No functional
> change.
> 
> This has the added bonus that lt9211, tc358767, sn65dsi83 now use very
> similar *_mipi_dsi_host_attach() which is ripe for deduplication.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Looks OK,
Acked-by: Sam Ravnborg <sam@ravnborg.org>
