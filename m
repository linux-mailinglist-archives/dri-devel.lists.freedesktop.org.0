Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C19C18D2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 10:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D883810E947;
	Fri,  8 Nov 2024 09:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QztMvHcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AED10E947;
 Fri,  8 Nov 2024 09:10:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 634BEC3959;
 Fri,  8 Nov 2024 09:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0E01BF206;
 Fri,  8 Nov 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731056478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm3UhMCd7zn0wf/NB/NpG8HDn8ZRdu/b34t338J+8xk=;
 b=QztMvHcL/LJyrVDUjANfvRSEswWgGPCBkv8uGEXEF5EpfVhacT90xYLK/fwUPj2/au1Tc3
 1kh4DFm1qrJD/IV8wBboJjVIHQleo2/noYXHVSj16eJsENavfZmk1SsWmfowSgsSLPfavk
 phoOMfYt1+uV5mwHNLWE7Uhf/KujTA3RdCjpBF9mXa7ugfbiBd0ygDjVIOMZTYf5yTZ12/
 /oYn9/UfoHVdXU+OSnEKkoxw3iYpgtwPRZmg+NDNQZEip+rkelvRp8lva1M2fJRofpKpS8
 3U6vTMUP93+AAK89JLssHwaAi7z29pUaKMK4z+2+4qbL5LsfSdJhj+LIGLD6Kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,  "Gupta, Anshuman"
 <anshuman.gupta@intel.com>,  "Deak, Imre" <imre.deak@intel.com>,  "Richard
 Weinberger" <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Maarten Lankhorst"
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
In-Reply-To: <Zy1EAIPEaY8Wlh-h@intel.com> (Rodrigo Vivi's message of "Thu, 7
 Nov 2024 17:49:36 -0500")
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zyk5kueKlusKlwqM@intel.com>
 <CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zy1EAIPEaY8Wlh-h@intel.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 08 Nov 2024 10:01:15 +0100
Message-ID: <87cyj6aylg.fsf@bootlin.com>
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


>> > That's the part that I'm not sure if I agree. if I remember from some
>> > experiments in the past,
>> > when you call to wake up the child, the parent will wakeup first anywa=
y.
>> >=20
>> The child (mtd device) does not exist at this point of time.
>> To create MTD device, the partition table should be provided
>> and it read directly from flash that should be powered to do read.
>
> I don't understand... you have the mtd->dev at this point... this is
> the one you should be touching, not the mtd->dev.parent... even at the
> probe, but moreover on everywhere else as well.
>
>>=20
>> > > Considering above, is this move is justified?
>> > > Also, MTD drivers tend to enable parent rpm, not its own one.
>> >=20
>> > What other drivers are you looking for reference?
>>=20
>> drivers/mtd/nand/raw/tegra_nand.c
>> drivers/mtd/nand/raw/renesas-nand-controller.c
>> drivers/mtd/maps/physmap-core.c
>
> I see they getting pdev->dev... not the parent...

That's three drivers where there is probably room for improvement.

These differences are subtle and likely un-catch during review. Feel
free to correct the drivers if you think they are wrong and more
importantly, do the correct thing in your own.

Thanks,
Miqu=C3=A8l
