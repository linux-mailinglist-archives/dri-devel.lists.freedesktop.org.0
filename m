Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DB17123A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0A96EC37;
	Thu, 27 Feb 2020 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF036EBC0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 0912129576D
Message-ID: <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform driver
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, robh+dt@kernel.org, mark.rutland@arm.com, 
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, 
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com, 
 laurent.pinchart@ideasonboard.com
Date: Wed, 26 Feb 2020 17:29:35 -0300
In-Reply-To: <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
 <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-26 at 07:40 -0800, Randy Dunlap wrote:
> On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
> > diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> > index 2114b563478c..dcd6481a14d0 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -44,4 +44,11 @@ config MTK_SCPSYS
> >  	  Say yes here to add support for the MediaTek SCPSYS power domain
> >  	  driver.
> >  
> > +config MT8173_MMSYS
> > +	bool "MediaTek MT8173 MMSYS Support"
> 
> Hi,
> Can this be tristate instead of bool?
> 

Wouldn't that conflict with
the driver being a builtin_platform_driver,
or am I just confusing things badly?

Thanks,
Ezequiel

> +	depends on COMMON_CLK_MT8173
> > +	help
> > +	  Say yes here to add support for the MediaTek MT8173 Multimedia
> > +	  Subsystem (MMSYS).
> > +
> >  endmenu
> 
> thanks.
> -- 
> ~Randy
> 
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
