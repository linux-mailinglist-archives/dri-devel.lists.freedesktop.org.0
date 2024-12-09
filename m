Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A89E9383
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD710E2A5;
	Mon,  9 Dec 2024 12:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CVg4sCWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2110E2A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:12:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFFBD89A;
 Mon,  9 Dec 2024 13:12:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733746336;
 bh=HPdEhNeCa9d+5UCt4BEFPtOkoZ4FUNpxJMBp6KEER10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CVg4sCWFbyzDm24I3WKAVOYPrWRjXFg+W8mFlot8An2INjlug0adBjBsbuEnIDaTG
 JmrXZubA9A5EkFr0K1oe3YsiA5nN+ifOZuECh/2Ey7KnLD8VJLOQhmPKhTd3QqOZWK
 FgeTWhRhUhXdoB0F2mLkcB/9r8PYPmrSIc0JtcfI=
Date: Mon, 9 Dec 2024 14:12:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Message-ID: <20241209121231.GH11343@pendragon.ideasonboard.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Mon, Dec 09, 2024 at 08:29:40AM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping to apply the series, if you are happy.

v7 seems to have all the necessary Rb, and I believe you now have
drm-misc commit access. Andrzej, Neil, Rob, can Biju push DRM bridge
patches to drm-misc once they have been reviewed, even if none of you
have provided Rb tags, or do you want to handle this yourselves ?

> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 19 November 2024 18:44
> > Subject: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
> > 
> > This patch series aims to fix 2 bugs in the ADV7535 driver
> > 
> > 1) use-after-free bug in adv7533_attach_dsi()
> > 2) Drop unsupported single lane.
> > 
> > Changes in v6:
> >  - Fixed memory leak by adding goto stattement in error path of
> >    adv7511_init_regulators().
> >  - Added Rb tag from Adam for patch#3.
> > Changes in v5:
> >  - Updated commit description for patch#1.
> >  - restored host_node in struct adv7511.
> >  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
> >    in error path of probe() and also in the remove().
> > Changes in v4:
> >  - Updated commit description for patch#1.
> >  - Dropped host_node from struct adv7511 and instead used a local pointer
> >    in probe(). Also freeing of host_node pointer after use is done in
> >    probe().
> >  - Added link to ADV7533 data sheet.
> >  - Collected tags
> > Changes in v3:
> >  - Replace __free construct with readable of_node_put().
> >  - Dropped single lane support from bindings and driver.
> > changes in v2:
> >  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
> >  - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.
> > 
> > Biju Das (3):
> >   drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
> >   dt-bindings: display: adi,adv7533: Drop single lane support
> >   drm: adv7511: Drop dsi single lane support
> > 
> >  .../bindings/display/bridge/adi,adv7533.yaml         |  2 +-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         | 12 ++++++++++--
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             |  4 +---
> >  3 files changed, 12 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
