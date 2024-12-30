Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56DC9FE784
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 16:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DBB10E507;
	Mon, 30 Dec 2024 15:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VaoVtRuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F3F10E507
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 15:17:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so5669984f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735571792; x=1736176592; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
 b=VaoVtRuQINa3M/69pPZM4P0bilo5r8aVjt+18V2aZlpjnZSrKyEqvzwoXefbqcWvnu
 lStk9nI7TgnzzlRcZgRBlu/h1JfahrmpC6ARIimIWvoOqB/v9O2RtDdw4vsmVFtVroio
 kfgyi8UCBlYPMy8Vv9qKV1c6c4+AT5C+9wA+5hFaFwUEifZJvYucPC4oJm3dmicI33Lu
 52dVEZa9xAi29uZIp0wgi7nXecyn1DLBlnRocc5gg1XlOkGCmOY/O2I+vn18sir+ogAO
 gxLuvUq23qqbpwbhSg6ETYubbpM/wXCo4QtRO9VYYIOFrdcbs6pdiUGyBakupp8qEfFq
 FTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735571792; x=1736176592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
 b=G/PU5v2ku1724YmWvZxCQc/Ui2hEbeTUoNU1OxwXEEOSluHxWuSVWYNbdOmwn/eJle
 hHkKL6o1EOWU7iYHsdjCEAJRAw9oeGOfILFSk/k+CHyrvSpnkPDD+lpzKJV2rpVNd5df
 LH4kh+zWHcWIkJde/x0lho2OJo8XBgeZi8O0RoHSpWevi5CpBerx9HXR1BgYGObGg1yx
 OWqla6CGc0dk/8jbZPdl2VZJZRmiRLuUdvvyA/Wf9mUnNt7x9PMeA/CM2u0ejRb3x1J3
 rKimX0oXTHCvbyLn0fHz2hACMYe7iaqWG6BPzWzs3+IvTaaH2qxN9zXnRG4FPow8WU8b
 lD5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6vOjZ0UXp1Wh8qqA82TsWJ1rl3qHQ7IqBoxPxzcPJdm0Do3o2Qcj38yznXhCrxbsSHAWKP4nSFYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR3TYsesy6R0z+2mOVng0dkb2BEuGGSTVes3ElEO1Si7KfpqmE
 zA0OWK+Czr3zN00Ga4o8dDG2EtBrJBeHoOV/VIuYTK+FD+hUWYk5hpKGVm8Pf7p59jMAlVBXGI6
 A
X-Gm-Gg: ASbGnctDu8JfIdMraT6qcfaT4OJsXN5qu7mBZ1JZ/1zh/2+qBx7gWFnThdXweiNHqUC
 h+vsn+W7FWFH28utuoYuq2MKjb95ZyKMehqhoWGuoyImDBiRp9NGkxnG/eworQWffPz7yOrLvfH
 0ep1v7CUw4O2cbeWZ6gJfPwY8p3/BwmRwOlN2zho1AriErV/MSEVMQIXpguskOB6mEqyXprrCoF
 e4RjAWLez+JyJIEqmPnp/mkURTLVbbG9+hZAMQWYOpwcx4uxbdIOabLcqHdyUBb60PuK3T8qG3N
 O9BQQsS0430va+IUKPDyqVevXOGe6es1ORCh
X-Google-Smtp-Source: AGHT+IFz6vnKDsjYSCj71qMJRlNWygcgRvbZvMXcj/k0biLU+n2vHyB+qTqUo+a6PyxFg6r3rse+Tg==
X-Received: by 2002:a05:6512:ba5:b0:540:1ec7:ef57 with SMTP id
 2adb3069b0e04-54229586f9emr9237438e87.56.1735566528611; 
 Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238137cesm3129503e87.148.2024.12.30.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Date: Mon, 30 Dec 2024 15:48:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ying Liu <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <dc5apgdlj7ybujm7spadpxhilwdb3266x3xwok7blno4y6sp5m@4iwa7wiwkaof>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

On Mon, Dec 30, 2024 at 07:04:51AM +0000, Ying Liu wrote:
> On 12/26/2024, Marek Vasut wrote:
> > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > >> The dw-hdmi output_port is set to 1 in order to look for a connector
> > >> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > working.
> > >> The output_port set to 1 makes the DW HDMI driver core look up the
> > >> next bridge in DT, where the next bridge is often the hdmi-connector .
> > >>
> > >> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > >>
> > >> Signed-off-by: Marek Vasut <marex@denx.de>
> > >> ---
> > >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Fabio Estevam <festevam@gmail.com>
> > >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >> Cc: Jonas Karlman <jonas@kwiboo.se>
> > >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > >> Cc: Liu Ying <victor.liu@nxp.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > >> Cc: Robert Foss <rfoss@kernel.org>
> > >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > >> Cc: Shawn Guo <shawnguo@kernel.org>
> > >> Cc: Simona Vetter <simona@ffwll.ch>
> > >> Cc: Stefan Agner <stefan@agner.ch>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: imx@lists.linux.dev
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> ---
> > >> V2: No change
> > >> ---
> > >>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > >>   2 files changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> index 9a480c6abb856..d8e9fbf75edbb 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > >> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >>   config DRM_IMX8MP_HDMI_PVI
> > >>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > >>   	depends on OF
> > >> +	select DRM_DISPLAY_CONNECTOR
> > >>   	help
> > >>   	  Choose this to enable support for the internal HDMI TX Parallel
> > >>   	  Video Interface found on the Freescale i.MX8MP SoC.
> > >> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> index 1e7a789ec2890..4ebae5ad072ad 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > platform_device *pdev)
> > >>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > >>   	plat_data->priv_data = hdmi;
> > >>   	plat_data->phy_force_vendor = true;
> > >> +	plat_data->output_port = 1;
> > >
> > > Quoting my feedback to a similar Liu's patch:
> > >
> > > This will break compatibility with older DT files, which don't have
> > > output port. I think you need to add output_port_optional flag to
> > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > is set, but there is no remote node.
> > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > support is commit:
> > 
> > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > TQMa8MPxL/MBa8MPxL")
> > 
> > That already contains the HDMI connector node. Every follow up addition
> > of HDMI to another device has been a copy of the same commit, with
> > connector, so I think it is safe to say, no upstream DT is going to be
> > broken by this change. Do we care about hypothetical downstream DTs
> > which may be missing the connector ?
> 
> These have no HDMI connector nodes:
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts

Indeed. I should be less trustful.

Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
