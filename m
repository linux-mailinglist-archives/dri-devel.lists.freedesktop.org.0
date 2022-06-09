Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE65544797
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89875112DE2;
	Thu,  9 Jun 2022 09:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79755112DE2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 09:32:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01C4D6CF;
 Thu,  9 Jun 2022 11:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654767141;
 bh=q/5FMD1xa8fY3pr3lxdbgaGLlg5lGwEDc3LHPKizvIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=abkqARdfqd7cqpMZCn6zfSbjFbeuDtdksDDXw1qTYKf4DNLfALlNcWBR7glTOZYMc
 TRlq/sB2C/d+SOJ3SoGqz/ey7ip/AA8wneI1nnaOFFL5oJYseZM5W9mcJvzREY7k6L
 WF7KMunlJF9cL0v6AeJBNCQ1bzj6SWDLh5ylQG+8=
Date: Thu, 9 Jun 2022 12:32:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v8 00/14] Add some DRM bridge drivers support for
 i.MX8qm/qxp SoCs
Message-ID: <YqG+Hxswo5ON1MX0@pendragon.ideasonboard.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On Thu, Jun 09, 2022 at 02:49:17PM +0800, Liu Ying wrote:
> Hi,
> 
> This is the v8 series to add some DRM bridge drivers support
> for i.MX8qm/qxp SoCs.
> 
> The bridges may chain one by one to form display pipes to support
> LVDS displays.  The relevant display controller is DPU embedded in
> i.MX8qm/qxp SoCs.
> 
> The DPU KMS driver can be found at:
> https://patchwork.kernel.org/project/dri-devel/list/?series=629908&state=%2A&archive=both
> 
> This series supports the following display pipes:
> 1) i.MX8qxp:
> prefetch eng -> DPU -> pixel combiner -> pixel link ->
> pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)
> 
> 2) i.MX8qm:
> prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)
> 
> 
> Patch 1/14 and 2/14 add bus formats used by pixel combiner.
> 
> Patch 9/14 adds a helper for LDB bridge drivers.
> 
> Patch 3/14 ~ 8/14 and 10/14 ~ 12/14 add drm bridge drivers and
> dt-bindings support for the bridges.
> 
> Patch 13/14 adds dt-binding for Control and Status Registers module(a syscon
> used by PXL2DPI and LDB), which references the PXL2DPI and LDB schemas.
> 
> Patch 14/14 updates MAINTAINERS.
> 
> 
> I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
> a LVDS to HDMI bridge(with a downstream drm bridge driver).
> 
> Marcel Ziswiler has tested v6 with two LVDS panels(single link LT170410-2WHC
> and dual link LP156WF1) on Toradex Colibri iMX8X.
> 
> 
> Welcome comments, thanks.

I'm not sure if this comment will be welcome, but what's the reason to
handle the pixel combiner and pixel link (DPL) as bridges ? They seem
very tightly couple with the display controller, wouldn't it be better
to handle them in the display controller driver ?

> v7->v8:
> * Rebase upon v5.19-rc1.
> * Use devm_drm_of_get_bridge() in patch 9/14 due to the rebase.
> * Reorder the patch for adding dt-binding for Control and Status Registers
>   module as patch 13/14, as it references PXL2DPI and LDB schemas in this
>   series.
> 
> v6->v7:
> * Fix complaints from 'checkpatch.pl --strict' on the LDB DRM bridge helper
>   driver(patch 10/14) and some DRM bridge drivers(patch 9/14, 12/14 and 13/14).
>   (Robert)
> * Fix complaints from 'checkpatch --strict' on the rest DRM bridge
>   drivers(patch 4/14 and 6/14).
> * A trivial indentation fix for patch 9/14. (Robert)
> * Add Robert's R-b tags on patch 9/14, 10/14, 12/14, 13/14 and 14/14.
> * Add Marcel's T-b tags on all DRM bridge drivers.
> * Add Rob's R-b tag on patch 7/14 for CSR module dt-binding.
> 
> v5->v6:
> * Fix data organizations in documentation(patch 2/14) for
>   MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
> * Add Laurent's R-b tags on patch 1/14 and 2/14.
> * Drop 'select' schema from the CSR dt-binding documentation(patch 7/14). (Rob)
> * Add Rob's R-b tag on patch 8/14.
> 
> v4->v5:
> * Drop the patch 'phy: Add LVDS configuration options'. (Robert)
> * Add Robert's R-b tags on patch 1/14, 2/14, 4/14 and 6/14.
> * Drop the 'PC_BUF_PARA_REG' register definition from the pixel combiner bridge
>   driver(patch 4/14). (Robert)
> * Make a comment occupy a line in the pixel link bridge driver(patch 6/14).
>   (Robert)
> * Introduce a new patch(patch 7/14) to add dt-binding for Control and Status
>   Registers module. (Rob)
> * Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
>   driver and i.MX8qm LDB bridge driver, instead of a module.  Correspondingly,
>   rename 'imx8{qm, qxp}-ldb.c' to 'imx8{qm, qxp}-ldb-drv.c'. (Robert)
> * Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
>   (Robert)
> * s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.
> 
> v3->v4:
> * Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
>   the PXL2DPI instance instead of using alias ID. (Rob)
> * Add Rob's R-b tag on patch 11/14.
> 
> v2->v3:
> * Drop 'fsl,syscon' DT properties from fsl,imx8qxp-ldb.yaml and
>   fsl,imx8qxp-pxl2dpi.yaml. (Rob)
> * Mention the CSR module controls LDB and PXL2DPI in fsl,imx8qxp-ldb.yaml and
>   fsl,imx8qxp-pxl2dpi.yaml.
> * Call syscon_node_to_regmap() to get regmaps from LDB bridge helper driver
>   and PXL2DPI bridger driver instead of syscon_regmap_lookup_by_phandle().
> * Drop two macros from pixel link bridge driver which help define functions
>   and define them directly.
> * Properly disable all pixel link controls to POR value by calling
>   imx8qxp_pixel_link_disable_all_controls() from
>   imx8qxp_pixel_link_bridge_probe().
> * Add Rob's R-b tags on patch 4/14 and 6/14.
> 
> v1->v2:
> * Rebase the series upon the latest drm-misc-next branch(5.11-rc2 based).
> * Use graph schema in the dt-bindings of the bridges. (Laurent)
> * Require all four pixel link output ports in fsl,imx8qxp-pixel-link.yaml.
>   (Laurent)
> * Side note i.MX8qm/qxp LDB official name 'pixel mapper' in fsl,imx8qxp-ldb.yaml.
>   (Laurent)
> * Mention pixel link is accessed via SCU firmware in fsl,imx8qxp-pixel-link.yaml.
>   (Rob)
> * Use enum instead of oneOf + const for the reg property of pixel combiner
>   channels in fsl,imx8qxp-pixel-combiner.yaml. (Rob)
> * Rewrite the function to find the next bridge in pixel link bridge driver
>   by properly using OF APIs and dropping unnecessary DT validation. (Rob)
> * Drop unnecessary port availability check in i.MX8qxp pixel link to DPI
>   bridge driver.
> * Drop unnecessary DT validation from i.MX8qxp LDB bridge driver.
> * Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
>   get the input remote endpoint in imx8qxp_ldb_set_di_id() of i.MX8qxp LDB
>   bridge driver.
> * Avoid using companion_port OF node after putting it in
>   imx8qxp_ldb_parse_dt_companion() of i.MX8qxp LDB bridge driver.
> * Drop unnecessary check for maximum available LDB channels from
>   i.MX8qm LDB bridge driver.
> * Mention i.MX8qm/qxp LDB official name 'pixel mapper' in i.MX8qm/qxp LDB
>   bridge drivers and Kconfig help messages.
> 
> Liu Ying (14):
>   media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
>   media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
>   dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
>   drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
>   dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
>     binding
>   drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
>   dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
>   drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
>   drm/bridge: imx: Add LDB driver helper support
>   dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
>     binding
>   drm/bridge: imx: Add LDB support for i.MX8qxp
>   drm/bridge: imx: Add LDB support for i.MX8qm
>   dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module
>     binding
>   MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs
> 
>  .../display/bridge/fsl,imx8qxp-ldb.yaml       | 173 +++++
>  .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144 ++++
>  .../bridge/fsl,imx8qxp-pixel-link.yaml        | 106 +++
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml   | 108 +++
>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 +++++
>  .../media/v4l/subdev-formats.rst              | 156 ++++
>  MAINTAINERS                                   |  10 +
>  drivers/gpu/drm/bridge/Kconfig                |   2 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            |  42 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   9 +
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 220 ++++++
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h   |  96 +++
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c   | 587 ++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c  | 722 ++++++++++++++++++
>  .../drm/bridge/imx/imx8qxp-pixel-combiner.c   | 448 +++++++++++
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 +++++++++++
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 487 ++++++++++++
>  include/uapi/linux/media-bus-format.h         |   6 +-
>  19 files changed, 3937 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

-- 
Regards,

Laurent Pinchart
