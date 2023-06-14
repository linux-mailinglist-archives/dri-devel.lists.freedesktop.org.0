Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFD572F77A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6510E416;
	Wed, 14 Jun 2023 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14A910E416
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:13:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01DFC838;
 Wed, 14 Jun 2023 10:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686730363;
 bh=EOB+XTys8buj3IJtQdqls61sGqyEJtwNJtRIoWEZ9uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LYw1K6BAkpTabXiS+mthzurbmsN8oIJaQASbtfjFxsclKy+q78EuJ7fDjwCg54Kv5
 8T8f8dXNtS5BiMOsjzeZim6/HS8l5/KAwWACDYrcpRAQ12X0Yqf7UznVXxUn8qDikc
 CSZ2uCgX0+H5ySWns17ifQQTvbRHQ9isBheOOy0g=
Date: Wed, 14 Jun 2023 11:13:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230614081314.GD17519@pendragon.ideasonboard.com>
References: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Mark Brown <broonie@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 07:31:46PM +0000, Biju Das wrote:
> > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > >
> > > > Hi everyone,
> > > >
> > > > > Perhaps we should first think through what an ancillary device
> > > > > really is.  My understanding is that it is used to talk to
> > > > > secondary addresses of a multi-address I2C slave device.
> > > >
> > > > As I mentioned somewhere before, this is not the case. Ancillary
> > > > devices are when one *driver* handles more than one address.
> > > > Everything else has been handled differently in the past (for  all
> > > > the uses I am aware of).
> > > >
> > > > Yet, I have another idea which is so simple that I wonder if it
> > > > maybe has already been discussed so far?
> > > >
> > > > * have two regs in the bindings
> > >
> > > OK, it is inline with DT maintainers expectation as it is matching
> > > with real hw as single device node having two regs.
> > >
> > > > * use the second reg with i2c_new_client_device to instantiate the
> > > >   RTC sibling. 'struct i2c_board_info', which is one parameter, should
> > > >   have enough options to pass data, e.g it has a software_node.
> > >
> > > OK, I can see the below can be passed from PMIC to new client device.
> > >
> > > 	client->addr = info->addr;
> > >
> > > 	client->init_irq = info->irq;
> > >
> > > >
> > > > Should work or did I miss something here?
> > >
> > > I guess it will work. We instantiate appropriate device based On PMIC
> > > revision and slave address and IRQ resource passed through 'struct
> > > i2c_board_info'
> > >
> > > Will check this and update you.
> > 
> > info.irq = irq; -->Irq fine
> > info.addr = addr; -->slave address fine
> > size = strscpy(info.type, name, sizeof(info.type)); -->instantiation based
> > on PMIC version fine.
> > 
> > 1) How do we share clk details on instantiated device to find is it
> > connected to external crystal or external clock source? as we cannot pass
> > of_node between PMIC and "i2c_board_info" as it results in pinctrl
> > failure. info->platformdata and
> > Client->dev.platformdata to retrieve this info??
> 
> Or 
> 
> I2C instantiation based on actual oscillator bit value, ie, two i2c_device_id's
> with one for setting oscillator bit and another for clearing oscillator bit
> 
> PMIC driver parses the clock details. Based on firmware version and clock, 
> It instantiates either i2c_device_id with setting oscillator bit or
> clearing oscillator bit.

I don't like that hack. I still think that two DT nodes is the best
option, I think you're trying hard to hack around a problem that is
actually not a problem.

-- 
Regards,

Laurent Pinchart
