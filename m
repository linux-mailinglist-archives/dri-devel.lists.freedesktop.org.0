Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18D144EA3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 10:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967DB6F43A;
	Wed, 22 Jan 2020 09:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0306F43A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 09:27:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CAEAC28F6BA;
 Wed, 22 Jan 2020 09:27:21 +0000 (GMT)
Date: Wed, 22 Jan 2020 10:27:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 18/21] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200122102719.1149f6f6@collabora.com>
In-Reply-To: <20191203101730.GP4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-19-boris.brezillon@collabora.com>
 <20191203101730.GP4730@pendragon.ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Sorry for the late reply.

On Tue, 3 Dec 2019 12:17:30 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Wed, Oct 23, 2019 at 05:45:09PM +0200, Boris Brezillon wrote:
> > So that the previous bridge element in the chain knows which input
> > format the panel bridge expects.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * Adjust things to match the new bus-format negotiation approach
> > * Use drm_atomic_helper_bridge_propagate_bus_fmt
> > * Don't implement ->atomic_check() (the core now takes care of bus
> >   flags propagation)
> > 
> > Changes in v2:
> > * Adjust things to match the new bus-format negotiation approach
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index f4e293e7cf64..a70c363a2bd0 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -127,6 +127,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> >  	.enable = panel_bridge_enable,
> >  	.disable = panel_bridge_disable,
> >  	.post_disable = panel_bridge_post_disable,
> > +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,  
> 
> Shouldn't the format be retrieved from the panel instead of from the
> connector ? We're moving towards removing connector creation from
> bridges, so I think it would be more future-proof.

Right now the panel bus_format is not exposed by the drm_panel
abstraction (only panel_simple have access to this information through
their panel_desc). I'd rather not add new things to this series so I'm
in favor of keeping the current implementation, but I add this idea
(expose bus format through the drm_panel abstraction) to my TODO list.

Thanks,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
