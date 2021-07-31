Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3253DC5B8
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 13:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125D26E235;
	Sat, 31 Jul 2021 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD5F6E235
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 11:29:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CE762A3;
 Sat, 31 Jul 2021 13:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627730970;
 bh=1wvg+PNPiJdSg+oUDz39r8xSWe+4p//UL7fpZbNELBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZBu4/mSDTOYBVqGyCDY4TwEah5LDvlT3qKNA2aEquGj9/uv7jNxj5JGAQMtqiiCx
 F7lYbbQNrK4Mo8ZcbOuPs1XILicZHZ7PBgE5ska0ydekv0ls1LJ0leNJ33+jtgWtv7
 RwVhPwUIYjLAT0KuOYOni5BQw+pNw4Y/6mbdDNU0=
Date: Sat, 31 Jul 2021 14:29:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 2/9] drm/omap: Cast pointer to integer without
 generating warning
Message-ID: <YQU0EImXxLbRDU9p@pendragon.ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
 <32ff5167-01f3-3af4-9075-f61a659c35eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32ff5167-01f3-3af4-9075-f61a659c35eb@gmail.com>
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

Hi Sergey,

On Sat, Jul 31, 2021 at 01:12:58PM +0300, Sergei Shtylyov wrote:
> On 31.07.2021 4:39, Laurent Pinchart wrote:
> 
> > On 64-bit platforms, the compiler complains that casting a void pointer
> > to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
> 
>     Is "unsigned" really needed here?

No it's not :-) I'll s/uintptr_t unsigned/uintptr_t/.

> > to fix this.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > index f86e20578143..c05d3975cb31 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > @@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
> >   	priv->dss->mgr_ops_priv = priv;
> >   
> >   	soc = soc_device_match(omapdrm_soc_devices);
> > -	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> > +	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
> >   	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
> >   
> >   	mutex_init(&priv->list_lock);

-- 
Regards,

Laurent Pinchart
