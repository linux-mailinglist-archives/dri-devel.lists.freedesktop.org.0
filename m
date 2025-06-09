Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70638AD1ADC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 11:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C9F10E03A;
	Mon,  9 Jun 2025 09:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F2FIVahq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 50732 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jun 2025 09:43:25 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9110E00A;
 Mon,  9 Jun 2025 09:43:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 840E743122;
 Mon,  9 Jun 2025 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749462202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4UgXCTTbnvHTrs3VX9TJ5+oerjkN8m/Ze1sEVtj3/o=;
 b=F2FIVahqxhWL8ygtZGnIRv3UVAlCxUn+9Pw6GtMfhalXGsZlVkZ2Rm77s3BY2zuRdb78lr
 jBXlvV57Sbhiflz9/0iFKSwL7sL+8yDcQY0TvU7Hp6tULiFFlnkE7r4VF41OmUr7q3rtVB
 L1TzWHN6FWANQcJ0muLsWtNyf8t5YA69TKnHn+K4yvWTbZJre6jUooiF4PkTlUri1jKsWt
 Q+HlcSNyYvCrQQutvNPU8/0bEfydjmOTvGZ/eiwd8j9w/wYeIPU5kaU7lmfkicjuzgcOhN
 6bS1QVLEEvUNVmeQ4s/HH1ZEOH93UvyG7zhSp3QvAg7M+uVMBhcP4sH1hVLQew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,  "Abliyev, Reuven"
 <reuven.abliyev@intel.com>,  "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net> (Guenter
 Roeck's message of "Sun, 8 Jun 2025 17:59:37 -0700")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 11:43:19 +0200
Message-ID: <87ikl5xnbc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutedtfeelvefgjeevuedukefhtefgiefftdekffffteduheduheelgedutdetueenucffohhmrghinhepughtshhirdhishenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
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


>>>> Several of my qemu boot tests fail to boot from mtd devices with this =
patch
>>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=3Dy
>>>> when
>>>> trying to boot from an mtd partition other than mtdblock0, with the
>>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi=
).
>>>> Is there a guidance describing the changed behavior, by any chance,
>>>> and how the boot command line now needs to look like when using one of
>>>> the flash partitions as root file system ?
>>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> I've tried to make is as transparent as possible for the existing users.
>>> Only change is that now every partition has master that is not partitio=
ned.
>>> Is the CONFIG_MTD_PARTITIONED_MASTER=3Dn fixed the problem for you?
>> No change is expected, can you please describe the devices that you
>> observe with and without the patch? Maybe there is something wrong in
>> the core logic.
>>=20
>
> I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
> The qemu command line is something like
>
>     qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=3Dn25q256a13,spi-m=
odel=3Dn25q256a13 \
> 	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
> 	-audio none \
> 	-drive file=3D/tmp/flash,format=3Draw,if=3Dmtd,index=3D1 \
> 	-nic user \
> 	--append "root=3D/dev/mtdblock6 rootwait console=3DttyS4,115200 earlycon=
=3Duart8250,mmio32,0x1e784000,115200n8" \
> 	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
> 	-nographic -monitor null -serial stdio
>
> This is with aspeed_g5_defconfig. Note that the flash models need to be s=
pecified.
> The default flashes are no longer recognized when booting from qemu since=
 commit
> 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fiel=
ds").
>
> The above only works with this patch reverted (or with v6.15 and older, o=
f course).
>
> Guenter

Alexander, can you please investigate? We need a fix because Guenter
might not be the only affecter user. Otherwise this patch can't stand,
unfortunately.

Thanks,
Miqu=C3=A8l
