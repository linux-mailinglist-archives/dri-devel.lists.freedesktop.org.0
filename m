Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C009B1DF02C
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 21:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFEF6E0F0;
	Fri, 22 May 2020 19:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25BE6E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 19:48:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FCA724D;
 Fri, 22 May 2020 21:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590176909;
 bh=fzOxLZ+2SM9leiC9dZyU/qh65tpJrbZzMa0o5kAnkTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gAUA0vKbJ1zRToR/aJqy/PJ4FMEyGCfVKnqm65z33gMHac4F25NdM3SS/7696tJxE
 D/CiyObzaLU+Er6QWhPmZOxt8PB9n7yY9S9msh6g37Yk8ke+JldukXMuXgK58EtATq
 QRwSnl5aV2pJPe13issp15x6DLeelvv9SEygXar0=
Date: Fri, 22 May 2020 22:48:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS
 macro
Message-ID: <20200522194817.GD5824@pendragon.ideasonboard.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-2-tzimmermann@suse.de>
 <20200522174835.GA1087580@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522174835.GA1087580@ravnborg.org>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 philippe.cornu@st.com, paul@crapouillou.net, mihail.atanassov@arm.com,
 alexandre.torgue@st.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>, zourongrong@gmail.com,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, May 22, 2020 at 07:48:35PM +0200, Sam Ravnborg wrote:
> On Fri, May 22, 2020 at 03:52:26PM +0200, Thomas Zimmermann wrote:
> > Rename the macro to DRM_GEM_CMA_DRIVER_OPS to align with SHMEM
> > helpers.
>
> This part is fine, I like that the naming is somehow consistent.
> 
> > An internal version is provided for drivers that override
> > the default .dumb_create callback. Adapt drivers to the changes.
> I loathe anything named __foo or __FOO. This __ signals to me
> that the author was clueless in naming - or some sort.
> I know that __ is used in some lib headers - but thats not the case
> here.
> 
> But I love that we have a variant that takes a create function.
> So we do not have to escape from the nice macro.
> The macro is another way to tell me as rewiewer that this
> drivers uses all the default helpers for this.
> 
> 
> So critizising the name I better suggest something that
> I personally like better:
> 
> DRM_GEM_CMA_DRIVER_OPS_CREATE()
> 
> It would look like this:
> 	/* GEM Operations */
> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> -	.dumb_create            = drm_sun4i_gem_dumb_create,
> +	DRM_GEM_CMA_DRIVER_OPS_CREATE(drm_sun4i_gem_dumb_create),

I agree with Sam here. With this change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Please fix zte/zx_drm_drv.c which also uses DRM_GEM_CMA_VMAP_DRIVER_OPS.
> 
> The naming is a bikeshedding topic that we may not agree on, soo..
> 
> With zte fixed the patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_gem_cma_helper.c |  2 +-
> >  drivers/gpu/drm/sun4i/sun4i_drv.c    |  3 +--
> >  drivers/gpu/drm/tidss/tidss_drv.c    |  2 +-
> >  drivers/gpu/drm/tiny/hx8357d.c       |  2 +-
> >  drivers/gpu/drm/tiny/ili9225.c       |  2 +-
> >  drivers/gpu/drm/tiny/ili9341.c       |  2 +-
> >  drivers/gpu/drm/tiny/ili9486.c       |  2 +-
> >  drivers/gpu/drm/tiny/mi0283qt.c      |  2 +-
> >  drivers/gpu/drm/tiny/repaper.c       |  2 +-
> >  drivers/gpu/drm/tiny/st7586.c        |  2 +-
> >  drivers/gpu/drm/tiny/st7735r.c       |  2 +-
> >  include/drm/drm_gem_cma_helper.h     | 24 ++++++++++++++++++++----
> >  12 files changed, 31 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> > index 12e98fb28229d..6fa4d2f2e3987 100644
> > --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> > @@ -620,7 +620,7 @@ EXPORT_SYMBOL(drm_cma_gem_create_object_default_funcs);
> >   * address set. This address is released when the object is freed.
> >   *
> >   * This function can be used as the &drm_driver.gem_prime_import_sg_table
> > - * callback. The DRM_GEM_CMA_VMAP_DRIVER_OPS() macro provides a shortcut to set
> > + * callback. The &DRM_GEM_CMA_DRIVER_OPS macro provides a shortcut to set
> >   * the necessary DRM driver operations.
> >   *
> >   * Returns:
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > index 328272ff77d84..012855fd89c24 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > @@ -52,8 +52,7 @@ static struct drm_driver sun4i_drv_driver = {
> >  	.minor			= 0,
> >  
> >  	/* GEM Operations */
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > -	.dumb_create		= drm_sun4i_gem_dumb_create,
> > +	__DRM_GEM_CMA_DRIVER_OPS(drm_sun4i_gem_dumb_create),
> >  };
> >  
> >  static int sun4i_drv_bind(struct device *dev)
> > diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> > index 99edc66ebdef2..1753cdc74ebda 100644
> > --- a/drivers/gpu/drm/tidss/tidss_drv.c
> > +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> > @@ -112,7 +112,7 @@ static struct drm_driver tidss_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &tidss_fops,
> >  	.release		= tidss_release,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.name			= "tidss",
> >  	.desc			= "TI Keystone DSS",
> >  	.date			= "20180215",
> > diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
> > index b4bc358a3269a..592da71d7ca70 100644
> > --- a/drivers/gpu/drm/tiny/hx8357d.c
> > +++ b/drivers/gpu/drm/tiny/hx8357d.c
> > @@ -196,7 +196,7 @@ DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
> >  static struct drm_driver hx8357d_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &hx8357d_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "hx8357d",
> >  	.desc			= "HX8357D",
> > diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> > index d1a5ab6747d5c..368ff6c8a1efb 100644
> > --- a/drivers/gpu/drm/tiny/ili9225.c
> > +++ b/drivers/gpu/drm/tiny/ili9225.c
> > @@ -346,7 +346,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
> >  static struct drm_driver ili9225_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &ili9225_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.name			= "ili9225",
> >  	.desc			= "Ilitek ILI9225",
> >  	.date			= "20171106",
> > diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
> > index bb819f45a5d3b..e1b9043ef7a0a 100644
> > --- a/drivers/gpu/drm/tiny/ili9341.c
> > +++ b/drivers/gpu/drm/tiny/ili9341.c
> > @@ -152,7 +152,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
> >  static struct drm_driver ili9341_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &ili9341_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "ili9341",
> >  	.desc			= "Ilitek ILI9341",
> > diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> > index 2702ea557d297..90a17f40fdf0c 100644
> > --- a/drivers/gpu/drm/tiny/ili9486.c
> > +++ b/drivers/gpu/drm/tiny/ili9486.c
> > @@ -165,7 +165,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
> >  static struct drm_driver ili9486_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &ili9486_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "ili9486",
> >  	.desc			= "Ilitek ILI9486",
> > diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
> > index 08ac549ab0f7f..6624c2098fba2 100644
> > --- a/drivers/gpu/drm/tiny/mi0283qt.c
> > +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> > @@ -156,7 +156,7 @@ DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
> >  static struct drm_driver mi0283qt_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &mi0283qt_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "mi0283qt",
> >  	.desc			= "Multi-Inno MI0283QT",
> > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> > index 1c0e7169545b4..877dcece25828 100644
> > --- a/drivers/gpu/drm/tiny/repaper.c
> > +++ b/drivers/gpu/drm/tiny/repaper.c
> > @@ -946,7 +946,7 @@ DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
> >  static struct drm_driver repaper_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &repaper_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.name			= "repaper",
> >  	.desc			= "Pervasive Displays RePaper e-ink panels",
> >  	.date			= "20170405",
> > diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> > index 2a1fae422f7a2..ec84bdc51f60d 100644
> > --- a/drivers/gpu/drm/tiny/st7586.c
> > +++ b/drivers/gpu/drm/tiny/st7586.c
> > @@ -285,7 +285,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
> >  static struct drm_driver st7586_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &st7586_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "st7586",
> >  	.desc			= "Sitronix ST7586",
> > diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
> > index 0af1b15efdf8a..cfd4933f3b30c 100644
> > --- a/drivers/gpu/drm/tiny/st7735r.c
> > +++ b/drivers/gpu/drm/tiny/st7735r.c
> > @@ -157,7 +157,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
> >  static struct drm_driver st7735r_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >  	.fops			= &st7735r_fops,
> > -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	DRM_GEM_CMA_DRIVER_OPS,
> >  	.debugfs_init		= mipi_dbi_debugfs_init,
> >  	.name			= "st7735r",
> >  	.desc			= "Sitronix ST7735R",
> > diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> > index 947ac95eb24a9..917d42603db06 100644
> > --- a/include/drm/drm_gem_cma_helper.h
> > +++ b/include/drm/drm_gem_cma_helper.h
> > @@ -110,21 +110,37 @@ struct drm_gem_object *
> >  drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
> >  
> >  /**
> > - * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
> > - *                               address on the buffer
> > + * __DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a
> > + *                            virtual address on the buffer
> > + * @__dumb_create: callback function for .dumb_create
> >   *
> >   * This macro provides a shortcut for setting the default GEM operations in the
> >   * &drm_driver structure for drivers that need the virtual address also on
> >   * imported buffers.
> > + *
> > + * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
> > + * override the default implementation of .dumb_create. Use
> > + * DRM_GEM_CMA_DRIVER_OPS if possible.
> >   */
> > -#define DRM_GEM_CMA_VMAP_DRIVER_OPS \
> > +#define __DRM_GEM_CMA_DRIVER_OPS(__dumb_create) \
> >  	.gem_create_object	= drm_cma_gem_create_object_default_funcs, \
> > -	.dumb_create		= drm_gem_cma_dumb_create, \
> > +	.dumb_create		= (__dumb_create), \
> >  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
> >  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
> >  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
> >  	.gem_prime_mmap		= drm_gem_prime_mmap
> >  
> > +/**
> > + * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
> > + *                          address on the buffer
> > + *
> > + * This macro provides a shortcut for setting the default GEM operations in the
> > + * &drm_driver structure for drivers that need the virtual address also on
> > + * imported buffers.
> > + */
> > +#define DRM_GEM_CMA_DRIVER_OPS \
> > +	__DRM_GEM_CMA_DRIVER_OPS(drm_gem_cma_dumb_create)
> > +
> >  struct drm_gem_object *
> >  drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
> >  				       struct dma_buf_attachment *attach,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
