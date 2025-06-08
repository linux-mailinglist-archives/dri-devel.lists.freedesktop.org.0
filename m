Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FDAD1410
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 21:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DC610E3C9;
	Sun,  8 Jun 2025 19:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="apERh0s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798310E2A9;
 Sun,  8 Jun 2025 19:55:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 8B624581028;
 Sun,  8 Jun 2025 19:37:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2EF1F65B;
 Sun,  8 Jun 2025 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749411471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0C38mLCm+B9BYKlJOfWEN5xHVublMuXuPu2d0ZlfFs=;
 b=apERh0s0k3od83+QhMpwchNQIJ68iMqfauWwLQajqeK0OLqfQe0qCTOhbHgY8Lg3lFAWb/
 PrGlv/fQ4yn+EoIK/s6JX+uB4aESNNFFPnmRaneuXp6XSXYPoYXNCxD0xwXtPRAgwV4dsX
 GmY0qNmjzrxY++3/tqNaSn3oX/KWB8/hE1pcsGkMND8dizfsAfPdeU+fzXW1wIhtqJmyP6
 2thPoIWeRrMYfaEf/lOLQs3QBtuqib6PCRHZ1yx4tRHe24naVN92oAumepTddhT/zpHx9U
 JtPDG0eC3sgouznOdM/85r7oPee2vOlzwkKrQq+76qoG09aeEbSdCbsH/Wbb5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,  Richard Weinberger
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
In-Reply-To: <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Sun, 8 Jun 2025 07:00:10 +0000")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sun, 08 Jun 2025 21:37:47 +0200
Message-ID: <87bjqyja7o.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutedtfeelvefgjeevuedukefhtefgiefftdekffffteduheduheelgedutdetueenucffohhmrghinhepughtshhirdhishenucfkphepledvrddukeegrdelkedrvddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrddvtdegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrt
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

Hi Guenter,

On 08/06/2025 at 07:00:10 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>=20
>> Hi,
>>=20
>> On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
>> > Create master device without partition when
>> > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>> >
>> > This streamlines device tree and allows to anchor
>> > runtime power management on master device in all cases.
>> >
>> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>=20
>> Several of my qemu boot tests fail to boot from mtd devices with this pa=
tch
>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=3Dy
>> when
>> trying to boot from an mtd partition other than mtdblock0, with the
>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>> Is there a guidance describing the changed behavior, by any chance,
>> and how the boot command line now needs to look like when using one of
>> the flash partitions as root file system ?
>>=20
>> Thanks,
>> Guenter
>
> I've tried to make is as transparent as possible for the existing users.
> Only change is that now every partition has master that is not partitione=
d.
> Is the CONFIG_MTD_PARTITIONED_MASTER=3Dn fixed the problem for you?

No change is expected, can you please describe the devices that you
observe with and without the patch? Maybe there is something wrong in
the core logic.

Thanks,
Miqu=C3=A8l
