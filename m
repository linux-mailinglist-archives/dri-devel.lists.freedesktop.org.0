Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A55C1313D0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46A889D77;
	Mon,  6 Jan 2020 14:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02289D77
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:37:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A62828EC45;
 Mon,  6 Jan 2020 14:37:32 +0000 (GMT)
Date: Mon, 6 Jan 2020 15:37:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 0/4] drm: Add support for bus-format negotiation
Message-ID: <20200106153729.7293f7e0@collabora.com>
In-Reply-To: <20200106143409.32321-1-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Jan 2020 15:34:05 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> This patch series aims at adding support for runtime bus-format
> negotiation between all elements of the
> 'encoder -> bridges -> connector/display' section of the pipeline.
> 
> In order to support that, we need drm bridges to fully take part in the
> atomic state validation process, which requires adding a
> drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> Once those basic building blocks are in place, we can add new hooks to
> allow bus format negotiation (those are called just before
> ->atomic_check()). The bus format selection is done at runtime by  
> testing all possible combinations across the whole bridge chain until
> one is reported to work.
> 
> No Major changes in this v6, I addressed the slight changed requested
> by Boris from Laurent on the patch 1, and rebased on drm-misc-next. 
> Note that this version only contains core changes.
> Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.
> 
> A more detailed changelog is provided in each patch.
> 
> This patch series is also available here [1].
> 
> Thanks,
> 
> ~Boris~ Neil
> 
> [1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v6
> 
> Boris Brezillon (4):
>   drm/bridge: Add a drm_bridge_state object
>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>   drm/bridge: Add an ->atomic_check() hook
>   drm/bridge: Add the necessary bits to support bus format negotiation

This version looks good to me.

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
>  .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
>  drivers/gpu/drm/drm_atomic.c                  |  39 ++
>  drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
>  drivers/gpu/drm/drm_bridge.c                  | 527 +++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |   5 +-
>  include/drm/drm_atomic.h                      |   3 +
>  include/drm/drm_bridge.h                      | 275 ++++++++-
>  7 files changed, 874 insertions(+), 48 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
