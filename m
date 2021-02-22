Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4291322219
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 23:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DC589E05;
	Mon, 22 Feb 2021 22:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E246E7D3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 21:29:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 007643AB53B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 21:21:09 +0000 (UTC)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 92EC9240004;
 Mon, 22 Feb 2021 21:20:45 +0000 (UTC)
Date: Mon, 22 Feb 2021 22:20:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <YDQgLTPE0E+/1Cwv@piout.net>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-2-sebastian.reichel@collabora.com>
X-Mailman-Approved-At: Mon, 22 Feb 2021 22:23:08 +0000
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. On systems using hardware
> watchdog it seems to likely trigger a lot earlier than configured.
> 
> The proper solution would be to describe this dependency in DT,
> but that will result in a deadlock. The kernel will see, that
> i.MX6 system clock needs the RTC clock and do probe deferral.
> But the i.MX6 I2C module never becomes usable without the i.MX6
> CKIL clock and thus the RTC's clock will not be probed. So from
> the kernel's perspective this is a chicken-and-egg problem.
> 

Reading the previous paragraph, I was going to suggest describing the
dependency and wondering whether this would cause a circular dependency.
I guess this will keep being an issue for clocks on an I2C or SPI bus...

> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case a kernel without this support has been booted.
> 
> The 'protected-clocks' property is already in use for some clocks
> that may not be touched because of firmware limitations and is
> described in Documentation/devicetree/bindings/clock/clock-bindings.txt.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt | 1 +
>  drivers/rtc/rtc-m41t80.c                             | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> index c746cb221210..ea4bbf5c4282 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> @@ -19,6 +19,7 @@ Optional properties:
>  - interrupts: rtc alarm interrupt.
>  - clock-output-names: From common clock binding to override the default output
>                        clock name
> +- protected-clocks: Bool, if set operating system should not handle clock.
>  - wakeup-source: Enables wake up of host system on alarm
>  
>  Example:
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 160dcf68e64e..3296583853a8 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -546,6 +546,9 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
>  	struct clk_init_data init;
>  	int ret;
>  
> +	if (of_property_read_bool(node, "protected-clocks"))
> +		return 0;
> +
>  	/* First disable the clock */
>  	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
>  	if (ret < 0)
> -- 
> 2.30.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
