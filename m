Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C543DC1F6
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 02:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27646F4D7;
	Sat, 31 Jul 2021 00:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430606F4D7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 00:25:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED7572A3;
 Sat, 31 Jul 2021 02:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627691116;
 bh=Se3omj1MbC8A2uCU/g3eF6EOHI8xJCoOcrDna0LOm8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pKF8FZTQE9iBIPHxNDy/m4fYIqhpghC1iXTHNOvh9x9yEwdLAIklsw238YDe1IEWd
 c1sIGbc51lhSlEzfXa9xPDmasjYGVZrG4Qx5IN0VMMmmFkSPXZvW1PAuoW0WnN4I2S
 UI1H1SgYDaIXovWcA1JL3oON5rje2bkzoXdSWs3E=
Date: Sat, 31 Jul 2021 03:25:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH 1/7] drm/omap: Cast pointer to integer safely
Message-ID: <YQSYYywcs3FpTn6u@pendragon.ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-2-laurent.pinchart+renesas@ideasonboard.com>
 <69ac4474-3bbf-db72-3777-74c59f947d42@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69ac4474-3bbf-db72-3777-74c59f947d42@ideasonboard.com>
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

Hi Tomi,

On Thu, Jul 29, 2021 at 09:13:17AM +0300, Tomi Valkeinen wrote:
> On 28/07/2021 18:37, Laurent Pinchart wrote:
> > On 64-bit platforms, the compiler complains that casting a void pointer
> > to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
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
> > 
> 
> Looks fine, although the subject sounds odd. Why was the cast "unsafe"
> before, and "safe" now?

The result is indeed exactly the same. It was safe before, because we
know the value won't exceed 32 bits. I'll s/safely/without generating a
warning/.

> There's also another bunch of warnings I see:

I wonder how I missed those. Will fix.

> drivers/gpu/drm/omapdrm/dss/dsi.c: In function ‘dsi_vc_send_long’:
> drivers/gpu/drm/omapdrm/dss/dsi.c:7:25: warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has type ‘size_t’ {aka ‘const long unsigned int’} [-Wformat=]
>      7 | #define DSS_SUBSYS_NAME "DSI"
>        |                         ^~~~~
> drivers/gpu/drm/omapdrm/dss/dss.h:30:21: note: in expansion of macro ‘DSS_SUBSYS_NAME’
>     30 | #define pr_fmt(fmt) DSS_SUBSYS_NAME ": " fmt
>        |                     ^~~~~~~~~~~~~~~
> ./include/linux/dynamic_debug.h:134:15: note: in expansion of macro ‘pr_fmt’
>    134 |   func(&id, ##__VA_ARGS__);  \
>        |               ^~~~~~~~~~~
> ./include/linux/dynamic_debug.h:152:2: note: in expansion of macro ‘__dynamic_func_call’
>    152 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>        |  ^~~~~~~~~~~~~~~~~~~
> ./include/linux/dynamic_debug.h:162:2: note: in expansion of macro ‘_dynamic_func_call’
>    162 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
>        |  ^~~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:471:2: note: in expansion of macro ‘dynamic_pr_debug’
>    471 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
>        |  ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/omapdrm/dss/dss.h:36:2: note: in expansion of macro ‘pr_debug’
>     36 |  pr_debug(format, ## __VA_ARGS__)
>        |  ^~~~~~~~
> drivers/gpu/drm/omapdrm/dss/dsi.c:2097:3: note: in expansion of macro ‘DSSDBG’
>   2097 |   DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
>        |   ^~~~~~
> In file included from ./include/linux/printk.h:7,
>                   from ./include/linux/kernel.h:19,
>                   from drivers/gpu/drm/omapdrm/dss/dsi.c:9:
> drivers/gpu/drm/omapdrm/dss/dsi.c: In function ‘dsi_vc_generic_read’:
> ./include/linux/kern_levels.h:5:18: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has type ‘size_t’ {aka ‘const long unsigned int’} [-Wformat=]
>      5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>        |                  ^~~~~~
> ./include/linux/kern_levels.h:11:18: note: in expansion of macro ‘KERN_SOH’
>     11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
>        |                  ^~~~~~~~
> ./include/linux/printk.h:390:9: note: in expansion of macro ‘KERN_ERR’
>    390 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>        |         ^~~~~~~~
> drivers/gpu/drm/omapdrm/dss/dss.h:40:2: note: in expansion of macro ‘pr_err’
>     40 |  pr_err("omapdss " DSS_SUBSYS_NAME " error: " format, ##__VA_ARGS__)
>        |  ^~~~~~
> drivers/gpu/drm/omapdrm/dss/dsi.c:2393:2: note: in expansion of macro ‘DSSERR’
>   2393 |  DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
>        |  ^~~~~~
> 

-- 
Regards,

Laurent Pinchart
