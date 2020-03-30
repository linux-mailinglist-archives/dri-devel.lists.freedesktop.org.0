Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC29198D11
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466C66E591;
	Tue, 31 Mar 2020 07:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77B66E37C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 13:51:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 36C842965EC
Message-ID: <4a9d2d6e5cecbe296c14119d27a8793a7dbed7b2.camel@collabora.com>
Subject: Re: [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host platform driver
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Fabio Estevam <festevam@gmail.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>
Date: Mon, 30 Mar 2020 10:51:23 -0300
In-Reply-To: <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
 <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
Organization: Collabora
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Martyn Welch <martyn.welch@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, linux-rockchip@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Fabio, Adrian:

On Mon, 2020-03-30 at 08:49 -0300, Fabio Estevam wrote:
> Hi Adrian,
> 
> On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
> > This adds support for the Synopsis DesignWare MIPI DSI v1.01 host
> > controller which is embedded in i.MX 6 SoCs.
> > 
> > Based on following patches, but updated/extended to work with existing
> > support found in the kernel:
> > 
> > - drm: imx: Support Synopsys DesignWare MIPI DSI host controller
> >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
> > 
> > - ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
> >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
> 
> This one looks like a devicetree patch, but this patch does not touch
> devicetree.
> 
> > +       ret = clk_prepare_enable(dsi->pllref_clk);
> > +       if (ret) {
> > +               dev_err(dev, "%s: Failed to enable pllref_clk\n", __func__);
> > +               return ret;
> > +       }
> > +
> > +       dsi->mux_sel = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr");
> > +       if (IS_ERR(dsi->mux_sel)) {
> > +               ret = PTR_ERR(dsi->mux_sel);
> > +               dev_err(dev, "%s: Failed to get GPR regmap: %d\n",
> > +                       __func__, ret);
> > +               return ret;
> 
> You should disable the dsi->pllref_clk clock prior to returning the error.
> 

Another approach could be moving the clock on and off to
to component_ops.{bind,unbind} (as rockhip driver does).

What exactly is the PLL clock needed for? Would it make sense
to move it some of the PHY power on/off? (Maybe not, but it's worthing
checking).

Also, it seems the other IP blocks have this PLL clock, so maybe
it could be moved to the dw_mipi_dsi core? This could be something
for a follow-up, to avoid creeping this series.

Thanks,
Ezequiel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
