Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868628D0660
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953910E4A0;
	Mon, 27 May 2024 15:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4F110E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:40:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sBcSC-0005Mf-IW; Mon, 27 May 2024 17:40:04 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sBcSB-003D3H-BW; Mon, 27 May 2024 17:40:03 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sBcSB-000EmW-0r;
 Mon, 27 May 2024 17:40:03 +0200
Message-ID: <fbb666b99104241aae09fc5b2ae72433e1249c23.camel@pengutronix.de>
Subject: Re: [PATCH v2 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Date: Mon, 27 May 2024 17:40:03 +0200
In-Reply-To: <yh4r2pgdl2m5wp627r35zse3obacmeanin5rjo34f7tctgpix2@dme3vwzaivag>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
 <yh4r2pgdl2m5wp627r35zse3obacmeanin5rjo34f7tctgpix2@dme3vwzaivag>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Dmitry,

On Mi, 2024-04-17 at 00:58 +0300, Dmitry Baryshkov wrote:
> On Sun, Mar 31, 2024 at 11:28:57PM +0300, Dmitry Baryshkov wrote:
> > The IPUv3 DRM i.MX driver contains several codepaths for different
> > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > panel and the legacy display-timings DT node on their own.
> >=20
> > Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> > upstream ever used these features), switch to panel-bridge driver,
> > removing the need to handle drm_panel codepaths separately and finally
> > switch to drm_bridge_connector, removing requirement for the downstream
> > bridges to create drm_connector on their own.
> >=20
> > This has been tested on the iMX53 with the DPI panel attached to LDB vi=
a
> > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > linked directly to LDB node and the display-timings node).
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e=
104f05caa51@linaro.org
>=20
> Phillip, Shawn, Sascha, any comments on this patchset?

Sorry for the delay, this all looks sane to me. I can't find any users
of the "edid" and "ddc-i2c-bus" properties either. But let me test on
i.MX6 and with parallel-display as well.

regards
Philipp
