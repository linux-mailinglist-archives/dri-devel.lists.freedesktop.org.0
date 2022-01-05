Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4AA485196
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 12:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AC710E239;
	Wed,  5 Jan 2022 11:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53A210E239
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 11:04:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1n545t-0008W1-8N; Wed, 05 Jan 2022 12:04:37 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1n545q-0004qQ-DW; Wed, 05 Jan 2022 12:04:34 +0100
Date: Wed, 5 Jan 2022 12:04:34 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 4/4] ARM: dts: imx6dl: plym2m, prtvt7, victgo:  make
 use of new resistive-adc-touch driver
Message-ID: <20220105110434.GG303@pengutronix.de>
References: <20211122124310.2796505-1-o.rempel@pengutronix.de>
 <20211122124310.2796505-4-o.rempel@pengutronix.de>
 <20211206010627.GK4216@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211206010627.GK4216@dragon>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:58:52 up 25 days, 19:44, 81 users,  load average: 1.02, 1.06, 1.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, David Jander <david@protonic.nl>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shawn,

sorry for the delay, I just came back to work.

On Mon, Dec 06, 2021 at 09:06:28AM +0800, Shawn Guo wrote:
> On Mon, Nov 22, 2021 at 01:43:10PM +0100, Oleksij Rempel wrote:
> > The tsc2046 is an ADC used as touchscreen controller. To share as mach
> > code as possible, we should use it as actual ADC + virtual tochscreen
> > controller.
> > With this patch we make use of the new kernel IIO and HID infrastructure.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> One space is enough in subject "victgo:  make".

done.

> > ---
> >  arch/arm/boot/dts/imx6dl-plym2m.dts | 55 ++++++++++++++++++++---------
> >  arch/arm/boot/dts/imx6dl-prtvt7.dts | 53 ++++++++++++++++++++-------
> >  arch/arm/boot/dts/imx6dl-victgo.dts | 55 +++++++++++++++++++++--------
> >  3 files changed, 120 insertions(+), 43 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
> > index 60fe5f14666e..e2afedae85cb 100644
> > --- a/arch/arm/boot/dts/imx6dl-plym2m.dts
> > +++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
> > @@ -101,6 +101,17 @@ reg_12v0: regulator-12v0 {
> >  		regulator-min-microvolt = <12000000>;
> >  		regulator-max-microvolt = <12000000>;
> >  	};
> > +
> > +	touchscreen {
> > +		compatible = "resistive-adc-touch";
> > +		io-channels = <&adc 1>, <&adc 3>, <&adc 4>, <&adc 5>;
> > +		io-channel-names = "y", "z1", "z2", "x";
> > +		touchscreen-min-pressure = <64687>;
> > +		touchscreen-inverted-x;
> > +		touchscreen-inverted-y;
> > +		touchscreen-x-plate-ohms = <300>;
> > +		touchscreen-y-plate-ohms = <800>;
> > +	};
> >  };
> >  
> >  &can1 {
> > @@ -129,26 +140,38 @@ &ecspi2 {
> >  	pinctrl-0 = <&pinctrl_ecspi2>;
> >  	status = "okay";
> >  
> > -	touchscreen@0 {
> > -		compatible = "ti,tsc2046";
> > +	adc: adc@0 {
> 
> Isn't label name "adc" too generic?

I do not have strong opinion about this. Currently we have no
restrictions for the node names:
Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
Documentation/devicetree/bindings/iio/adc/adc.yaml

I can name it touchscreen-adc@0 or something like this. What are your
preferences?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
