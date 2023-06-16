Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E585B732B90
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA210E12C;
	Fri, 16 Jun 2023 09:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A77010E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686907798; x=1718443798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=32N1yGo7ctZs2eC7CuXCSbbaVed5l58bkGfloxPTIp4=;
 b=Rw0VeRDhlMv9GueDMiDC4ald1icPaPcZnQHi/ns7+EC2Wf/Od7iiRpAp
 RPbujcuxpt5I4j3K4YJh3cMR7COadEdmt5rD35bjYRhXMU/TFSXZufDE1
 6tJGWRBVS0tPWoVLDWCNzc3aJ8cOyYNO2e4nhJM52M6qnzlSqjUhftQDx
 4BohpJAXhqjBF06H3C6duuRNHsyabIdZNoRODXaJ+bGyNs2hDzd+iJ721
 OZmzDba5QDWuSVRhZjwQC9bGPsZglZw6hMBBnUhOjtGrwfgxdTgBGYJgw
 N87sDluyue4ykspzservV0MdPxAbpXzd1rQ1uw4oi77FAL57XCfh5QIuD Q==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681164000"; d="scan'208";a="31462582"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Jun 2023 11:29:55 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 63301280082;
 Fri, 16 Jun 2023 11:29:55 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501 HDMI driver
Date: Fri, 16 Jun 2023 11:29:57 +0200
Message-ID: <11795277.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ee0982418cc2e996b1f7889375b1a5138fb38a11.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <ee0982418cc2e996b1f7889375b1a5138fb38a11.1686729444.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: oliver.brown@nxp.com, Sandor Yu <Sandor.yu@nxp.com>, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

thanks for sending a new version.

Am Donnerstag, 15. Juni 2023, 03:38:15 CEST schrieb Sandor Yu:
> Add a new DRM HDMI bridge driver for Cadence MHDP8501
> that used in Freescale i.MX8MQ SoC.
> MHDP8501 could support HDMI or DisplayPort standards according
> embedded Firmware running in the uCPU.
>=20
> For iMX8MQ SoC, the HDMI FW was loaded and activated by SOC ROM code.
> Bootload binary included HDMI FW was required for the driver.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   12 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |    1 +
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 1024 +++++++++++++++++
>  3 files changed, 1037 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>=20
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> b/drivers/gpu/drm/bridge/cadence/Kconfig index 5b7ec4e49aa1..bee05e834055
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -59,3 +59,15 @@ config DRM_CDNS_MHDP8501_DP
>  	  Support Cadence MHDP8501 DisplayPort driver.
>  	  Cadence MHDP8501 Controller support one or more protocols,
>  	  DisplayPort firmware is required for this driver.
> +
> +config DRM_CDNS_MHDP8501_HDMI
> +	tristate "Cadence MHDP8501 HDMI DRM driver"
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_DISPLAY_HELPER
> +	select DRM_CDNS_AUDIO
> +	depends on OF
> +	help
> +	  Support Cadence MHDP8501 HDMI driver.
> +	  Cadence MHDP8501 Controller support one or more protocols,
> +	  HDMI firmware is required for this driver.
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> b/drivers/gpu/drm/bridge/cadence/Makefile index 5842e4540c62..8a129c14ac14
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -7,3 +7,4 @@ cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-h=
dcp.o
> cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D cdns-mhdp8546-j721e.o
>=20
>  obj-$(CONFIG_DRM_CDNS_MHDP8501_DP) +=3D cdns-mhdp8501-dp.o
> +obj-$(CONFIG_DRM_CDNS_MHDP8501_HDMI) +=3D cdns-mhdp8501-hdmi.o
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode 100644
> index 000000000000..43673f1b50f6
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
[...]
> +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct cdns_mhdp_device *mhdp =3D bridge->driver_private;
> +	struct drm_mode_config *config =3D &bridge->dev->mode_config;
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_connector *connector =3D &mhdp->connector;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		connector->interlace_allowed =3D 0;
> +		connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> +
> +		drm_connector_helper_add(connector,=20
&cdns_hdmi_connector_helper_funcs);
> +
> +		drm_connector_init(bridge->dev, connector,=20
&cdns_hdmi_connector_funcs,
> +				   DRM_MODE_CONNECTOR_HDMIA);
> +
> +		drm_object_attach_property(&connector->base,
> +					   config-
>hdr_output_metadata_property, 0);
> +
> +		if (!drm_mode_create_hdmi_colorspace_property(connector))

This is missing a 2nd parameter.

> +			drm_object_attach_property(&connector->base,
> +						connector-
>colorspace_property, 0);
> +
> +		drm_connector_attach_encoder(connector, encoder);
> +	}
> +
> +	return 0;
> +}
[...]

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


