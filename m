Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A911C9850BC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 03:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3D010E2C4;
	Wed, 25 Sep 2024 01:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fYlF0A2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4010E2C4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:56:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C72545C5B1A;
 Wed, 25 Sep 2024 01:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31507C4CEC4;
 Wed, 25 Sep 2024 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727229413;
 bh=rhqTfbniq+oWE+xObN2NBk4vAtyvRkInj+N6WqmDnb8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fYlF0A2L/9QQ2zac9xxrLnHvYtKwNQVubTHJSUrfifTKQ9t39BuUClFTfD15dkX2c
 uRStMq3PX4aoVAwR865z2imNX7pZ/ACMZscsy+iMYFdt6rHV7aJb/o1AZmNKhZV1bx
 hm1AVUp6YTLhAN1GwaHkTNqJ/Lj2R3/C9FVL7NTftzd1EKUOtblqjL61WdTkTo3OqH
 P2P0+e/tCUX/JMrXJMIwHe+JNH/IlV6jSUWSsN6UKMaPxl3slUvoZHQftBfNU/AY9Q
 6aEy8SftGgIvgmCjnpsL0XLkvidBy7ZnWoVDYeBTKlMVfBZw8q8OgXidTEOlRopOck
 UDR28y/z2C4pQ==
Date: Tue, 24 Sep 2024 20:56:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: s.hauer@pengutronix.de, linux-imx@nxp.com, vkoul@kernel.org, 
 sam@ravnborg.org, linux-phy@lists.infradead.org, 
 dmitry.baryshkov@linaro.org, airlied@gmail.com, 
 alexander.stein@ew.tq-group.com, shawnguo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch, robh+dt@kernel.org, 
 andrzej.hajda@intel.com, festevam@gmail.com, jernej.skrabec@gmail.com, 
 oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, 
 kernel@pengutronix.de, mripard@kernel.org, linux-kernel@vger.kernel.org, 
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, 
 Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, 
 neil.armstrong@linaro.org
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Message-Id: <172722910962.836192.13554411095046576310.robh@kernel.org>
Subject: Re: [PATCH v17 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
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


On Tue, 24 Sep 2024 15:36:45 +0800, Sandor Yu wrote:
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
> 
> The patch set compose of DRM bridge drivers and PHY driver.
> 
> Both of them need by patch #1 and #2 to pass build.
> 
> DRM bridges driver patches:
>   #1: drm: bridge: Cadence: Creat mhdp helper driver
>   #2: phy: Add HDMI configuration options
>   #3: dt-bindings: display: bridge: Add Cadence MHDP8501
>   #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> 
> PHY driver patches:
>   #1: drm: bridge: Cadence: Creat mhdp helper driver
>   #2: phy: Add HDMI configuration options
>   #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   #6: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> 
> i.MX8M/TQMa8Mx DT patches:
>   #7: Add DT nodes for DCSS/HDMI pipeline
>   #8: Enable HDMI for TQMa8Mx/MBa8Mx
> 
> v16->v17:
> Patch #1:
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> Patch #2:
> - remove hdmi.h
> - add 2024 year to copyright
> - Add r-b tag.
> Patch #3:
> - Add lane-mapping property.
> Patch #4:
> - Reset the HDMI/DP link when an HPD (Hot Plug Detect) event is detected
> - Move the HDMI protocol settings from hdmi_ctrl_init() to a new function
>   cdns_hdmi_set_hdmi_mode_type(), to align with the introduced link reset functionality.
> - Implement logic to check the type of HDMI sink.
>   If the sink is not a hdmi display, set the default mode to DVI.
> - Implement hdmi_reset_infoframe function
> - Reorder certain bit definitions in the header file to follow a descending order.
> - Add "lane-mapping" property for both HDMI and DP, remove platform data from driver.
>   lane-mapping should be setting in dts according different board layout.
> - Remove variable mode in struct cdns_mhdp8501_device, video mode could get from struct drm_crtc_state
> - Remove variable char_rate in  struct cdns_mhdp8501_device, it could get from struct struct drm_connector_state.hdmi
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> - Remove mutext protect for phy_api access functions.
> Patch #6:
> - Remove mbox_mutex
> 
> v15->v16:
> Patch #2:
> - Remove pixel_clk_rate, bpc and color_space fields from struct
>   phy_configure_opts_hdmi, they were replaced by
>   unsigned long long tmds_char_rate.
> - Remove r-b and a-c tags because this patch have important change.
> Patch #4:
> - Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
> - Introduce the hdmi info frame helper functions,
>   added hdmi_clear_infoframe(), hdmi_write_infoframe() and
>   hdmi_tmds_char_rate_valid() according Dmitry's patch
>   'make use of the HDMI connector infrastructure' patchset ([2]).
> - mode_fixup() is replaced by atomic_check().
> - Fix video mode 4Kp30 did not work on some displays that support
>   LTE_340Mcsc_scramble.
> - updated for tmds_char_rate added in patch #2.
> Patch #6:
> - updated for tmds_char_rate added in patch #2.
> 
> v14->v15:
> Patch #6 + #7:
> -  Merged PHY driver into a single combo PHY driver
> Patch #7 + #8:
> - Add DT patches for a running HDMI setup
> 
> v13->v14:
> Patch #4:
> - Rebase to next-20240219, replace get_edid function by edid_read
>   function as commits d807ad80d811b ("drm/bridge: add ->edid_read
>   hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
>   remove ->get_edid callback") had change the API.
> 
> v12->v13:
> Patch #4:
> - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> - Fix build warning
> - Order bit bpc and color_space in descending shit.
> Patch #7:
> - Fix build warning
> 
> v11->v12:
> Patch #1:
> - Move status initialize out of mbox_mutex.
> - Reorder API functions in alphabetical.
> - Add notes for malibox access functions.
> - Add year 2024 to copyright.
> Patch #4:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function cdns_dp_aux_transferi().
> - Remove unused parmeter in function cdns_dp_get_msa_misc
>   and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
> Patch #6:
> - Return error code to replace -1 for function wait_for_ack().
> - Set cdns_phy->power_up = false in phy_power_down function.
> - Remove "RATE_8_1 = 810000", it is not used in driver.
> - Add year 2024 to copyright.
> Patch #7:
> - Adjust clk disable order.
> - Return error code to replace -1 for function wait_for_ack().
> - Use bool for variable pclk_in.
> - Add year 2024 to copyright.
> 
> v10->v11:
> - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
> - use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
> and remove them from EXPORT_SYMBOL_GPL().
> - remove MODULE_ALIAS() from mhdp8501 driver.
> 
> v9->v10:
> - Create mhdp helper driver to replace macro functions,
> move all mhdp mailbox access functions and common functions
> into the helper driver.
> Patch #1:drm: bridge: Cadence: Creat mhdp helper driver
> it is totaly different with v9.
> 
> v8->v9:
> - Remove compatible string "cdns,mhdp8501" that had removed
>   from dt-bindings file in v8.
> - Add Dmitry's R-b tag to patch #2
> - Add Krzysztof's R-b tag to patch #3
> 
> v7->v8:
> MHDP8501 HDMI/DP:
> - Correct DT node name to "display-bridge".
> - Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.
> 
> HDMI/DP PHY:
> - Introduced functions `wait_for_ack` and `wait_for_ack_clear` to handle
>   waiting with acknowledgment bits set and cleared respectively.
> - Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.
> 
> v6->v7:
> MHDP8501 HDMI/DP:
> - Combine HDMI and DP driver into one mhdp8501 driver.
>   Use the connector type to load the corresponding functions.
> - Remove connector init functions.
> - Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.
> 
> HDMI/DP PHY:
> - Lowercase hex values
> - Fix parameters indent issue on some functions
> - Replace 'udelay' with 'usleep_range'
> 
> v5->v6:
> HDMI/DP bridge driver
> - 8501 is the part number of Cadence MHDP on i.MX8MQ.
>   Use MHDP8501 to name hdmi/dp drivers and files.
> - Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
> - Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
> - Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
> - Fix HDMI scrambling is not enable issue when driver working in 4Kp60
>   mode.
> - Add HDMI/DP PHY API mailbox protect.
> 
> HDMI/DP PHY driver:
> - Rename DP and HDMI PHY files and move to folder phy/freescale/
> - Remove properties num_lanes and link_rate from DP PHY driver.
> - Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
> - Update compatible string to "fsl,imx8mq-dp-phy".
> - Update compatible string to "fsl,imx8mq-hdmi-phy".
> 
> v4->v5:
> - Drop "clk" suffix in clock name.
> - Add output port property in the example of hdmi/dp.
> 
> v3->v4:
> dt-bindings:
> - Correct dt-bindings coding style and address review comments.
> - Add apb_clk description.
> - Add output port for HDMI/DP connector
> PHY:
> - Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
> - Remove unused registers define from HDMI and DP PHY drivers.
> - More description in phy_hdmi.h.
> - Add apb_clk to HDMI and DP phy driver.
> HDMI/DP:
> - Use get_unaligned_le32() to replace hardcode type conversion
>   in HDMI AVI infoframe data fill function.
> - Add mailbox mutex lock in HDMI/DP driver for phy functions
>   to reslove race conditions between HDMI/DP and PHY drivers.
> - Add apb_clk to both HDMI and DP driver.
> - Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
> - Remove bpc 12 and 16 optional that not supported.
> 
> v2->v3:
> Address comments for dt-bindings files.
> - Correct dts-bindings file names
>   Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
>   Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
> - Drop redundant words and descriptions.
> - Correct hdmi/dp node name.
> 
> v2 is a completely different version compared to v1.
> Previous v1 can be available here [1].
> 
> v1->v2:
> - Reuse Cadence mailbox access functions from mhdp8546 instead of
>   rockchip DP.
> - Mailbox access functions be convert to marco functions
>   that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> - Plain bridge instead of component driver.
> - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> - Audio driver are removed from the patch set, it will be add in another
>   patch set later.
> 
> [1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/
> 
> Alexander Stein (2):
>   arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
>   arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support
> 
> Sandor Yu (6):
>   drm: bridge: Cadence: Create mhdp helper driver
>   phy: Add HDMI configuration options
>   dt-bindings: display: bridge: Add Cadence MHDP8501
>   drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> 
>  .../display/bridge/cdns,mhdp8501.yaml         |  109 ++
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
>  .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   20 +
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
>  arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   20 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
>  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |  307 ++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  323 ++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  359 +++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  737 +++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  692 +++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  425 +-----
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   36 +-
>  drivers/phy/freescale/Kconfig                 |   10 +
>  drivers/phy/freescale/Makefile                |    1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1337 +++++++++++++++++
>  include/drm/bridge/cdns-mhdp-helper.h         |   94 ++
>  include/linux/phy/phy-hdmi.h                  |   19 +
>  include/linux/phy/phy.h                       |    7 +-
>  21 files changed, 4268 insertions(+), 408 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
>  create mode 100644 include/linux/phy/phy-hdmi.h
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y freescale/imx8mq-tqma8mq-mba8mx.dtb' for cover.1727159906.git.Sandor.yu@nxp.com:

arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: bridge@32c00000: 'lane-mapping' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#





