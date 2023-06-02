Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD6720076
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554510E664;
	Fri,  2 Jun 2023 11:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB7010E664
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:34:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B95F6E0;
 Fri,  2 Jun 2023 13:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685705663;
 bh=DpSH2YIya3yVWhp5YFol7Rg+OA6AdykUKJUi2jLq8X8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7IzAYqyKDwwjJ1BFf/W55beqoBjmjT/JhihvVgAGpMcx/2W/kHV6L3Oy3/+3NblB
 KHBieU9duGoiLNIvOu/HvapUIM4Y9VYV6RN60Pmdusl8T02FzqJVyfUr+/gx0rmgRN
 0363SIO9vECkfcZ41Y1sh8FMKkKKQn7zHL9cMQvg=
Date: Fri, 2 Jun 2023 14:34:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
Message-ID: <20230602113443.GF26944@pendragon.ideasonboard.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-5-biju.das.jz@bp.renesas.com>
 <20230529154305.GB15264@pendragon.ideasonboard.com>
 <OS0PR01MB5922ED8C626E23D80D1458E386499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922ED8C626E23D80D1458E386499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Jun 01, 2023 at 12:08:44PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > This is a partial review, because the driver is big, and because some
> > changes in v10 will (hopefully) simplify the code and make review
> > easier.
> 
> I agree v10 will simplify the code as I have do clean-ups based on your
> review commnet.
> 
> > On Tue, May 02, 2023 at 11:09:11AM +0100, Biju Das wrote:
> > > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > > along with 2 RPFs to support the blending of two picture layers and
> > > raster operations (ROPs).
> > >
> > > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > > alike SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Ref:
> > >
> > > v8->v9:
> > >  * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get() as
> > >    suggested by Philipp Zabel.
> > > v7->v8:
> > >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du folder.
> > >  * Updated KConfig and Makefile.
> > > v6->v7:
> > >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> > >    DU support added to more platforms based on RZ/G2L alike SoCs.
> > >  * Rebased to latest drm-tip.
> > >  * Added patch #2 for binding support for RZ/V2L DU
> > >  * Added patch #4 for driver support for RZ/V2L DU
> > >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> > >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> > >  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs.
> > >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> > > ---
> > >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> > >  drivers/gpu/drm/renesas/Makefile              |   1 +
> > >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
> > >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714 ++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> > >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> > >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770 ++++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
> > >  15 files changed, 2664 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h

[snip]

> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > new file mode 100644
> > > index 000000000000..d61d433d72e6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > @@ -0,0 +1,714 @@

[snip]

> > > +/* -----------------------------------------------------------------------------
> > > + * CRTC Functions
> > > + */
> > > +
> > > +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> > > +				       struct drm_plane_state *state,
> > > +				       const struct rzg2l_du_format_info **format)
> > 
> > This function is only called from rzg2l_du_vsp_plane_atomic_check(), I
> > would inline it there.
> 
> Agreed.
> 
> > > +{
> > > +	struct drm_device *dev = plane->dev;
> > > +	struct drm_crtc_state *crtc_state;
> > > +	int ret;
> > > +
> > > +	if (!state->crtc) {
> > > +		/*
> > > +		 * The visible field is not reset by the DRM core but only
> > > +		 * updated by drm_plane_helper_check_state(), set it manually.
> > > +		 */
> > > +		state->visible = false;
> > > +		*format = NULL;
> > > +		return 0;
> > > +	}
> > > +
> > > +	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> > > +	if (IS_ERR(crtc_state))
> > > +		return PTR_ERR(crtc_state);
> > > +
> > > +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> > > +						  DRM_PLANE_NO_SCALING,
> > > +						  DRM_PLANE_NO_SCALING,
> > > +						  true, true);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (!state->visible) {
> > > +		*format = NULL;
> > > +		return 0;
> > > +	}
> > > +
> > > +	*format = rzg2l_du_format_info(state->fb->format->format);
> > > +	if (*format == NULL) {
> > 
> > Can this happen, or does the DRM core already checks that the
> > framebuffer format is supported by the plane ?
> 
> This will make sure the format is as per rzg2l_du_format_info,
> Otherwise print unsupported format.

I understand that, but it wasn't my question. Does the DRM core check if
the framebuffer pixel format is supported by the plane, using the
plane's supported pixel formats specified by the driver when the plane
was created ? If it does, you could drop this check, as
rzg2l_du_format_info() should support all the formats that the driver
specifies as supported by the plane.

I believe the DRM core handles this already, given the
drm_plane_check_pixel_format() call in drm_atomic_plane_check().

> > > +		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> > > +			state->fb->format->format);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}

[snip]

> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > new file mode 100644
> > > index 000000000000..0fea1fea837c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > @@ -0,0 +1,188 @@

[snip]

> > > +static int rzg2l_du_probe(struct platform_device *pdev)
> > > +{
> > > +	struct rzg2l_du_device *rcdu;
> > > +	int ret;
> > > +
> > > +	if (drm_firmware_drivers_only())
> > > +		return -ENODEV;
> > > +
> > > +	/* Allocate and initialize the RZ/G2L device structure. */
> > > +	rcdu = devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
> > > +				  struct rzg2l_du_device, ddev);
> > > +	if (IS_ERR(rcdu))
> > > +		return PTR_ERR(rcdu);
> > > +
> > > +	rcdu->dev = &pdev->dev;
> > > +	rcdu->info = of_device_get_match_data(rcdu->dev);
> > > +
> > > +	platform_set_drvdata(pdev, rcdu);
> > > +
> > > +	/* I/O resources */
> > > +	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(rcdu->mmio))
> > > +		return PTR_ERR(rcdu->mmio);
> > > +
> > > +	/*
> > > +	 * When sourcing frames from a VSP the DU doesn't perform any memory
> > > +	 * access so set the DMA coherent mask to 40 bits to accept all buffers.
> > > +	 */
> > > +	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* DRM/KMS objects */
> > > +	ret = rzg2l_du_modeset_init(rcdu);
> > > +	if (ret < 0) {
> > > +		if (ret != -EPROBE_DEFER)
> > > +			dev_err(&pdev->dev,
> > > +				"failed to initialize DRM/KMS (%d)\n", ret);
> > 
> > Use dev_err_probe()
> 
> As per your patch [1], I guess it is not required
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com/

If you add dev_err_probe() calls in rzg2l_du_modeset_init() as
appropriate, like done in [1] :-)

> > > +		goto error;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Register the DRM device with the core and the connectors with
> > > +	 * sysfs.
> > > +	 */
> > > +	ret = drm_dev_register(&rcdu->ddev, 0);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
> > 
> > Use drm_info().
> 
> Agreed.
> 
> > > +
> > > +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	drm_kms_helper_poll_fini(&rcdu->ddev);
> > > +	return ret;
> > > +}

[snip]

> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > new file mode 100644
> > > index 000000000000..3b84e91aa64a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > @@ -0,0 +1,89 @@

[snip]

> > > +enum rzg2l_du_output {
> > > +	RZG2L_DU_OUTPUT_DSI0,
> > > +	RZG2L_DU_OUTPUT_DPAD0,
> > > +	RZG2L_DU_OUTPUT_MAX,
> > > +};
> > > +
> > > +/*
> > > + * struct rzg2l_du_output_routing - Output routing specification
> > > + * @possible_crtcs: bitmask of possible CRTCs for the output
> > > + * @port: device tree port number corresponding to this output route
> > > + *
> > > + * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> > > + * specify the valid SoC outputs, which CRTCs can drive the output, and the type
> > > + * of in-SoC encoder for the output.
> > > + */
> > > +struct rzg2l_du_output_routing {
> > > +	unsigned int possible_crtcs;
> > > +	unsigned int port;
> > > +};
> > > +
> > > +/*
> > > + * struct rzg2l_du_device_info - DU model-specific information
> > > + * @channels_mask: bit mask of available DU channels
> > > + * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
> > > + */
> > > +struct rzg2l_du_device_info {
> > > +	unsigned int channels_mask;
> > > +	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > > +};
> > 
> > The driver supports a single SoC, with two outputs, connected to the
> > same DU channel. Do you really need to copy the rzg2l_du_device_info
> > abstraction from the rcar-du driver, or could you simplify the code ?
> 
> After adding basic support, as an optimization
> will simplify the code later. Hope it is ok for you??

I'm OK with patches on top. Please don't forget about them :-)

[snip]

-- 
Regards,

Laurent Pinchart
