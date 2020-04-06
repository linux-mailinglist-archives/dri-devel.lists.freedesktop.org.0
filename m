Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72819F11F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DFC6E2C8;
	Mon,  6 Apr 2020 07:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3E86E2C8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:46:52 +0000 (UTC)
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26D85206F5;
 Mon,  6 Apr 2020 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586159212;
 bh=y1V0y5qByl604OEH2YnRM/oaDhSWbRYnOBO3/Q8sV1g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AkF8viHMnjwxIIQDLRi8bLfelyOx5KL02q8bMWh4XEhGRpSk8BtJMuDhz76aIvqix
 12PQNXmLNtmvsDBto0D6NU7yWjEKTpRXkDbzOfebECj47JWsJzAjEbeZ90grjMzzq0
 BxJY/i4R+hzAA6x9VeDTajqkhPMHa54InTzsNxw0=
Date: Mon, 6 Apr 2020 09:46:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200406094645.5f96457a@coco.lan>
In-Reply-To: <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 3 Apr 2020 21:32:42 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:  
> > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > Joe Perches <joe@perches.com> escreveu:  
> 
> > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > in lib/vsprintf for this.  
> 
> No need. FourCC, if Sakari makes it more generic, can be used for
> other purposes, e.g. printing component names from the chips (not
> related to media at all).
> 

Hmm... not 100% sure about what you're meaning with "component names".

At media, some vendors use a cc-like code to allow identifying the
name of the chip, retrieved on a common register via an I2C bus.
Omnivision uses, for example, uses a 2 bytes code:

	OV5670_CHIP_ID			0x5670
	OV5675_CHIP_ID			0x5675
	OV2680_CHIP_ID			0x2680
	OV5670_CHIP_ID			0x5670
	OV5675_CHIP_ID			0x5675

We used this at the em28xx driver to detect a camera sensor, and give
a name for the chip (see drivers/media/usb/em28xx/em28xx-camera.c):

		switch (id) {
		case 0x2642:
			name = "OV2640";
			dev->em28xx_sensor = EM28XX_OV2640;
			break;
		case 0x7648:
			name = "OV7648";
			break;
		case 0x7660:
			name = "OV7660";
			break;

Yet, this is not too reliable, as, for some products, they use something
different:

	OV8856_CHIP_ID			0x885a
	OV13858_CHIP_ID		0xd855

	OV9640 can either be 0x9648 or 0x9649, depending on its revision.

If you're referring to this kind of code, I don't think we can have
something generic.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
