Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EB72C5B1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EC610E237;
	Mon, 12 Jun 2023 13:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E2610E237
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:19:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C779CCE6;
 Mon, 12 Jun 2023 15:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686575928;
 bh=Bj+SpMG81sTj8aensnQvokjjL3Rwu9dHwfJTAZQIrBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unso4Umz7SnrFwQD6vncMYiN8Wghu0zrDkXYhTxYVqPsvHrha9zPuyquvf4leAAsY
 aP6tl5rSEy52aLPeBmoU19RN6n2unwxLxcfM7a45sx1ngyujr8w2ddKgM30gZBzw7E
 jipNHUxMxAAHkEqHwP9VbTz9Xv/hkHgz7DA7P+gA=
Date: Mon, 12 Jun 2023 16:19:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230612131917.GD23921@pendragon.ideasonboard.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612125405.GA23921@pendragon.ideasonboard.com>
 <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Trent Piepho <tpiepho@gmail.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Jun 12, 2023 at 03:08:46PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 12, 2023 at 2:54 PM Laurent Pinchart wrote:
> > On Mon, Jun 12, 2023 at 12:42:33PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > > > How do we proceed here between [1] and [2]?
> > > > >
> > > > > DT-Maintainers suggestion:
> > > > > [1]
> > > > > raa215300: pmic@12 {
> > > > >   compatible = "renesas,raa215300";
> > > > >   reg = <0x12>, <0x6f>;
> > > > >   reg-names = "main", "rtc";
> > > > >
> > > > >   clocks = <&x2>;
> > > > >   clock-names = "xin";
> > > > >   /* Add Optional shared IRQ resource and share it to child and handle
> > > > > it both in parent and child */ };
> > > > >
> > > > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > > > [2]
> > > > >   raa215300: pmic @12 {
> > > > >           compatible = "renesas,raa215300";
> > > > >           reg = <0x12>;
> > > > >
> > > > >           /* Add Optional shared IRQ */
> > > > >           renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > > > >   };
> > > > >
> > > > >   rtc_raa215300: rtc@6f {
> > > > >           compatible = "renesas,raa215300-isl1208";
> > > >
> > > > Make this
> > > >
> > > >             compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> > > >
> > > > >           reg = <0x6f>;
> > > > >
> > > > >           /* Add Optional shared IRQ */
> > > > >           clocks = <&x2>;
> > > > >           clock-names = "xin";
> > > > >           renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC
> > > > > version to check Oscillator bit is inverted or not */
> > > >
> > > > This isn't nice. I would instead add a renesas,invert-xtoscb boolean
> > > > property. If you don't want different DT sources for different revisions
> > > > of the PMIC,
> > >
> > > I need to support all PMIC versions with same image, as PMIC is just a component on the
> > > SoM module. So SoM's have different PMIC versions.
> >
> > I understand it's not convenient, so let's try to find a good solution.
> >
> > > > one option is to perform the auto-detection in the boot
> > > > loader and update the DT dynamically there.
> > >
> > > Yes, this is an option. Bootloader updates "renesas,invert-xtoscb" property based
> > > on PMIC version.
> > >
> > > Not sure, From binding perspective, Documenting "renesas,invert-xtoscb" is OK for
> > > the relevant maintainers??
> >
> > It's fine with me at least :-) I think a property makes sense, as it
> > describes the device. Updating the device tree in the boot loader based
> > on auto-detection of features is also fairly common (to set the amount
> > of DRAM for instance).
> >
> > What I'm not entirely sure about in this case is if a property would be
> > the best option, or two different compatible strings. I'll let the
> > appropriate maintainer recommend one of those two options. In either
> > case, the boot loader would be responsible for updating the DT.
> 
> Indeed. DT binding best practices 101: do not use properties to
> distinguish, use compatible values instead.
> 
> And don't use different compatible values if you can distinguish using
> a version register.  Unfortunately the version register is part of the
> main/first device (the PMIC), so the RTC cannot find out easily...

That's not very different from having IP cores whose integration is
different between different SoC versions. We could easily add SoC match
code in drivers and map the SoC version to integration data, but it's
not a good practice. DT helps decoupling integration (and quirks) from
drivers and allows getting rid of lots of cross-driver communication
(which used to be handled through board files).

> So basically you have an i2c mfd.  The Linux mfd subsystem is tailored
> for platform devices, so it's not a good match.  The closest we have
> in i2c is the ancillary device...

I think an MFD-type solution that's way too much trouble to handle the
issue at hand. I recommend a DT property here.

-- 
Regards,

Laurent Pinchart
