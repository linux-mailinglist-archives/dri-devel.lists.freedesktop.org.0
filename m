Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E93198CCD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAD96E27C;
	Tue, 31 Mar 2020 07:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E186E27C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:17:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 867CC296952
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host platform driver
In-Reply-To: <246bf7c71620021258355c2fc32dd38ac6b0cc45.camel@collabora.com>
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
 <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
 <4a9d2d6e5cecbe296c14119d27a8793a7dbed7b2.camel@collabora.com>
 <877dz134xf.fsf@collabora.com>
 <246bf7c71620021258355c2fc32dd38ac6b0cc45.camel@collabora.com>
Date: Tue, 31 Mar 2020 10:19:00 +0300
Message-ID: <874ku52dqz.fsf@collabora.com>
MIME-Version: 1.0
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2020, Ezequiel Garcia <ezequiel@collabora.com> 
wrote:
> On Tue, 2020-03-31 at 00:31 +0300, Adrian Ratiu wrote: 
>> On Mon, 30 Mar 2020, Ezequiel Garcia <ezequiel@collabora.com> 
>> wrote: 
>> > Hello Fabio, Adrian:   On Mon, 2020-03-30 at 08:49 -0300, 
>> > Fabio Estevam wrote:  
>> > > Hi Adrian,  On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu 
>> > > <adrian.ratiu@collabora.com> wrote:  
>> > > > This adds support for the Synopsis DesignWare MIPI DSI 
>> > > > v1.01  host controller which is embedded in i.MX 6 SoCs. 
>> > > > Based on  following patches, but updated/extended to work 
>> > > > with existing  support found in the kernel:  - drm: imx: 
>> > > > Support Synopsys  DesignWare MIPI DSI host controller  
>> > > >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>  
>> > > >  - ARM: dtsi: imx6qdl: Add support for MIPI DSI host  
>> > > > controller  
>> > > >   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>  
>> > >  This one looks like a devicetree patch, but this patch 
>> > >  does  
>> > > not touch devicetree.   
>> > > > +       ret = clk_prepare_enable(dsi->pllref_clk); + 
>> > > > if  (ret) { +               dev_err(dev, "%s: Failed to 
>> > > > enable  pllref_clk\n", __func__); +               return 
>> > > > ret; +  } + +       dsi->mux_sel = 
>> > > > syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr"); 
>> > > > +  if (IS_ERR(dsi->mux_sel)) { +               ret = 
>> > > > PTR_ERR(dsi->mux_sel); +               dev_err(dev, "%s: 
>> > > > Failed to get GPR regmap: %d\n", +  __func__, ret); + 
>> > > > return ret;  
>> > >  You should disable the dsi->pllref_clk clock prior to  
>> > > returning the error.   
>> >  Another approach could be moving the clock on and off to to 
>> > component_ops.{bind,unbind} (as rockhip driver does).    What 
>> > exactly is the PLL clock needed for? Would it make sense to 
>> > move it some of the PHY power on/off? (Maybe not, but it's 
>> > worthing checking).    Also, it seems the other IP blocks 
>> > have this PLL clock, so maybe  it could be moved to the 
>> > dw_mipi_dsi core? This could be  something for a follow-up, 
>> > to avoid creeping this series. 
>>  Hi Ezequiel,  pll is the video reference clock which drives 
>> the data lanes and  yes all drivers have it as it's a basic 
>> requirement, so moving it  to the common bridge is indeed a 
>> good idea, however this kind of  driver refactoring is out of 
>> scope for this specific patch series,  because, for now, I'd 
>> like to get the regmap and the imx6 driver  in, once that is 
>> done we can think how to further abstract away  common logic 
>> and slim down the existing drivers further.   Basically I just 
>> want to avoid feature creep as I expect v6 to be  ~ 8 patches 
>> big and the series is already over 1200 lines.  
> 
> Oh, absolutely: if there's one thing I try to avoid is feature 
> creep -- together with bikeshedding! 
> 
> Do note however, that you could move the PLL clock handling to 
> component_ops.{bind,unbind} and maybe simplify the error 
> handling. 
> 
> (BTW, great work!)

Thanks! I'll do the bind/unbind move for the new imx6 driver which 
I'm
adding in this series to make it resemble the existing rockchip 
driver a bit more, then I'll stop short of further driver 
refactorings.

>
> Cheers,
> Ezequiel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
