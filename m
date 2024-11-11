Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E59C46C5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 21:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFFF10E0CC;
	Mon, 11 Nov 2024 20:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ofLOlyzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1658 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2024 20:27:42 UTC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071C410E00A;
 Mon, 11 Nov 2024 20:27:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1497F20003;
 Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731356860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xq9A5l1i9Igv1/7m4w9nDZzIX3x5k17d5L7FGPm2Dw=;
 b=ofLOlyzNIds6ghTysRaYefoQ/z63D8cK21p0RetzdsuNqG0btKw7ivJnvxeltPe6YSDwDE
 x/o04SiiiPXBU5F+QGqR1t1HfAPswzOsII8N7VlyTinZDHYTM3CvMazrK1gMVyNH+fDo8Y
 Fd3sZqrwIQQ1bqLsl57VQLwzT/y8o2TtjvsdXEXK6FbgkLWaQjE//0//AO+17qznrUWt03
 wZhltzUMD8Fv0Lao+7Ms7c3EVfCXELA14BIhkC/dyihvZeKyD6gmnokskqpUlzPwh449Gg
 EVHp4STgwKh+iDvtQoAb4zJwN7WtJ2Qj1ECB8cswqBQWAzN0m1epZKHohYSLkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,  "Gupta, Anshuman"
 <anshuman.gupta@intel.com>,  "Deak, Imre" <imre.deak@intel.com>,  Richard
 Weinberger <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB6366051E35678864805BC89CED582@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Mon, 11 Nov 2024 11:29:47 +0000")
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zyk5kueKlusKlwqM@intel.com>
 <CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zy1EAIPEaY8Wlh-h@intel.com>
 <CY5PR11MB6366769459115688B8AA100AED5F2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366051E35678864805BC89CED582@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 21:27:37 +0100
Message-ID: <87msi5o6rq.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Alexander,

Please reduce the context when answering, otherwise it's hard to find
all places where you commented.

>> > > > That's the part that I'm not sure if I agree. if I remember from s=
ome
>> > > > experiments in the past,
>> > > > when you call to wake up the child, the parent will wakeup first a=
nyway.
>> > > >
>> > > The child (mtd device) does not exist at this point of time.
>> > > To create MTD device, the partition table should be provided
>> > > and it read directly from flash that should be powered to do read.
>> >
>> > I don't understand... you have the mtd->dev at this point... this is
>> > the one you should be touching, not the mtd->dev.parent... even at the
>> > probe, but moreover on everywhere else as well.
>> >
>>=20
>> At the probe time I do not have dev->mtd, but now I see you point here.
>> I'll separate power management:
>> - probe before dev->mtd creation will use aux_dev->dev (that will be mtd-
>> >dev.parent later)
>> - mtd functions will use mtd->dev
>>=20
>> Is this that you have in mind?
>
> I've tried it and found out that mtd->dev is not initialized if partition=
s are present [1].
> Miquel - this may be the reason why other mtd drivers use pci or platform
> devices to manage runtime pm.
> Or I have missed something?

Please keep in mind there is _a lot_ of history behind mtd, and
sometimes choices from the past cannot be simply "fixed" without
breaking userspace. The problem with mtd is that the "mtd" structure
defines nothing with precision. It may be a controller, a chip, a
partition, or whatever mix of those. In this particular case, I believe
you are mentioning the KEEP_PARTITIONED_MASTER configuration, which by
default is unset, which means you'll loose the "top level" mtd device?

However in general I believe the "framework" struct device is maybe less
relevant than the "bus" struct device when it comes to runtime PM, so
actually I would eventually expect this device to be used?

> [1] https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/mtd/mtdcore=
.c#L1078

Thanks,
Miqu=C3=A8l
