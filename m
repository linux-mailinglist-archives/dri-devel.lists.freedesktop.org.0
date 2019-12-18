Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD062124F03
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 18:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1050B6E92A;
	Wed, 18 Dec 2019 17:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731C6E92A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 17:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 7A82628B855
Message-ID: <980c181ad15153ee0af4ea20ac2a7265cd2b56f1.camel@collabora.com>
Subject: Re: [PATCH v21 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 18 Dec 2019 14:22:00 -0300
In-Reply-To: <9e38774d-0028-6988-1be1-2e726c5ed4ab@collabora.com>
References: <20191216135834.27775-1-enric.balletbo@collabora.com>
 <20191216135834.27775-3-enric.balletbo@collabora.com>
 <bb97505cfadae364afa14605793affe4a7d69ffa.camel@collabora.com>
 <9e38774d-0028-6988-1be1-2e726c5ed4ab@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2019-12-18 at 16:21 +0100, Enric Balletbo i Serra wrote:
> Hi Ezequiel,
> 
> Many thanks for the review, I am just preparing the next version to send.
> 
[..]
> > > +
> > > +#define PAGE1_VSTART		0x6b
> > > +#define PAGE2_SPI_CFG3		0x82
> > > +#define I2C_TO_SPI_RESET	0x20
> > > +#define PAGE2_ROMADD_BYTE1	0x8e
> > > +#define PAGE2_ROMADD_BYTE2	0x8f
> > > +#define PAGE2_SWSPI_WDATA	0x90
> > > +#define PAGE2_SWSPI_RDATA	0x91
> > > +#define PAGE2_SWSPI_LEN		0x92
> > > +#define PAGE2_SWSPI_CTL		0x93
> > > +#define TRIGGER_NO_READBACK	0x05
> > > +#define TRIGGER_READBACK	0x01
> > > +#define PAGE2_SPI_STATUS	0x9e
> > > +#define SPI_READY		0x0c
> > > +#define PAGE2_GPIO_L		0xa6
> > > +#define PAGE2_GPIO_H		0xa7
> > > +#define PS_GPIO9		BIT(1)
> > > +#define PAGE2_IROM_CTRL		0xb0
> > > +#define IROM_ENABLE		0xc0
> > > +#define IROM_DISABLE		0x80
> > > +#define PAGE2_SW_RESET		0xbc
> > > +#define SPI_SW_RESET		BIT(7)
> > > +#define MPU_SW_RESET		BIT(6)
> > > +#define PAGE2_ENCTLSPI_WR	0xda
> > > +#define PAGE2_I2C_BYPASS	0xea
> > > +#define I2C_BYPASS_EN		0xd0
> > > +#define PAGE2_MCS_EN		0xf3
> > > +#define MCS_EN			BIT(0)
> > > +#define PAGE3_SET_ADD		0xfe
> > > +#define PAGE3_SET_VAL		0xff
> > > +#define VDO_CTL_ADD		0x13
> > > +#define VDO_DIS			0x18
> > > +#define VDO_EN			0x1c
> > > +#define PAGE4_REV_L		0xf0
> > > +#define PAGE4_REV_H		0xf1
> > > +#define PAGE4_CHIP_L		0xf2
> > > +#define PAGE4_CHIP_H		0xf3
> > > +
> > > +#define PAGE0_DP_CNTL		0
> > 
> > Unused macro.
> > 
> > > +#define PAGE1_VDO_BDG		1
> > > +#define PAGE2_TOP_CNTL		2
> > > +#define PAGE3_DSI_CNTL1		3
> > > +#define PAGE4_MIPI_PHY		4
> > 
> > Ditto... maybe others as well?
> > 
> 
> I removed all the unused macros.
> 

In this case, given these PAGEX_XXX refer
to the I2C ancillaries, maybe you can leave them.

Moreover, I'd put them in an enum, to emphasize
their relationship.

Regards,
Ezequiel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
