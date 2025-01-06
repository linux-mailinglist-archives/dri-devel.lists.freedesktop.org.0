Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F97A01F85
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 08:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD3D10E598;
	Mon,  6 Jan 2025 07:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pFoU0USx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B710E598
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 07:05:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9A822E;
 Mon,  6 Jan 2025 08:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736147067;
 bh=awVHU3gXrjHE7tKmYneTP2+PaG8+KpDacT2GKYKtdbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFoU0USxLOmfN/9R8xKNakPqu5uHUW6/gLaq/jL3RANdfHywEFN2OUz+BSoInw32J
 XEBwIzsIzJofCGWcZ0EhoX0QAaWb52462LDZElVeLwne2JMUUCjvp11SsTyXDKH02t
 bmw8pzoNX+ZaWmaLOJTGVkl0V3xlMVfvryCR/+Rs=
Date: Mon, 6 Jan 2025 09:05:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250106070514.GA5568@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
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

On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >> HDMI but do not contain the HDMI connector node. This flag allows such
> >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >> use this flag, do not proliferate this flag, please fix your DTs and add
> >> the connector node this way:
> >>
> >> ```
> >> / {
> >>      hdmi-connector {
> >>          compatible = "hdmi-connector";
> >>          label = "FIXME-Board-Specific-Connector-Label"; // Modify this
> >>          type = "a";
> >>
> >>          port {
> >>              hdmi_connector_in: endpoint {
> >>                  remote-endpoint = <&hdmi_tx_out>;
> >>              };
> >>          };
> >>      };
> >> };
> >>
> >> &hdmi_tx {
> >>      ...
> >>
> >>      ports {
> >>          port@1 {
> >>              hdmi_tx_out: endpoint {
> >>                  remote-endpoint = <&hdmi_connector_in>;
> >>              };
> >>          };
> >>      };
> >> };
> >> ```
> > 
> > Are there any in-tree DT sources that use the old bindings ?
> 
> See 
> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/

Maybe I'm missing something obvious, but where is the patch series that
moves the DT sources mentioned in that mail thread to the new bindings ?

> The rest is fixed, thanks.

-- 
Regards,

Laurent Pinchart
