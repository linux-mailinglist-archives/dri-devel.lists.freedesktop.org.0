Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C55AD594D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD5410E107;
	Wed, 11 Jun 2025 14:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OBVtex+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3FB10E682;
 Wed, 11 Jun 2025 14:53:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07743431EB;
 Wed, 11 Jun 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749653607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJu5NSgqNOml+9Lox7VvY57DB9A7wKSyNIB2QDnPsGk=;
 b=OBVtex+PPJ9C5YrO63rD52e2cVGsu/uqOLAY/L5dVGBbk36SdtmKeU5z7a8gjyDMv+3FaT
 TX/XWmjIZZOc04r1YF58J0UZmzld+Dkri6ScFCWleeIP6lbmHq868ldlq00T+fx8gJgkyI
 k8hI2/zz6hZhcjDqGHWI3Vyphrs88/33hARFhOWkdMAty3Q8ddiC4Q71ZFC+WQw/ZvU7oL
 ClgB+Dqt0esvCGIidbCkKPeUDdP7/pboiTDjIH1fcRy78yYoCwHyJMVFxSjAsdluxEF9cD
 sKyqBcqTttiLXgUfWXVTiRLrRFVDpN5Ap4ZpdRVu8OAa/540HM9YNp4iXMGjYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Guenter Roeck
 <linux@roeck-us.net>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
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
 linux-mtd <linux-mtd@lists.infradead.org>,  "DRI mailing list"
 <dri-devel@lists.freedesktop.org>,  intel-gfx
 <intel-gfx@lists.freedesktop.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Wed, 11 Jun 2025 10:52:36 +0000")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
 <877c1ivcym.fsf@bootlin.com>
 <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
 <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Jun 2025 16:53:24 +0200
Message-ID: <87y0tytjmj.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehin
 hhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

Hello,

On 11/06/2025 at 10:52:36 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>=20
>> ----- Urspr=C3=BCngliche Mail -----
>> > Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
>> >> On 6/10/25 05:54, Richard Weinberger wrote:
>> >>> ----- Urspr=C3=BCngliche Mail -----
>> >>>> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
>> >>>> Richard, I've reproduced your setup (modulo that I must load mtdram
>> manually)
>> >>>> and patch provided in this thread helps to fix the issue.
>> >>>> Can you apply and confirm?
>> >>> Yes, it fixes the issue here! :-)
>> >>>
>> >>
>> >> It doesn't seem to fix the issue if the partition data is in
>> >> devicetree.
>> >
>> > I had a look at the patch again. The whole mtd core makes assumptions =
on
>> > parenting, which is totally changed with this patch. There are so many
>> > creative ways this can break, I don't believe we are going to continue
>> > this route. I propose to revert the patch entirely for now. We need to
>> > find another approach, I'm sorry.
>>=20
>> I think reverting is a valid option to consider if the issue turns out t=
o be
>> a "back to the drawing board" problem.
>>=20
>> > Alexander, can you please remind me what was your initial problem? I
>> > believe you needed to anchor runtime PM on the master device. Can you
>> > please elaborate again? Why taking the controller as source (the
>> > default, before your change) did not work? Also why was selecting
>> > MTD_PARTITIONED_MASTER not an option for you? I'm trying to get to the
>> > root of this change again, so we can find a solution fixing "the world"
>> > (fast) and in a second time a way to address your problem.
>>=20
>> IIRC the problem is that depending on CONFIG_MTD_PARTITIONED_MASTER
>> won't fly as PM needs to work with any configuration.
>> And enforcing CONFIG_MTD_PARTITIONED_MASTER will break existing
>> setups because mtd id's will change.
>>=20
>> On the other hand, how about placing the master device at the end
>> of the available mtd id space if CONFIG_MTD_PARTITIONED_MASTER=3Dn?
>> A bit hacky but IMHO worth a thought.
>>=20
>> Thanks,
>> //Richard
>
> The original problem was that general purpose OS never set
> CONFIG_MTD_PARTITIONED_MASTER and we need valid device tree
> to power management to work.
>
> We can return to V7 of this patch that only creates dummy master if
> CONFIG_MTD_PARTITIONED_MASTER is off.
> In this case the hierarchy remains the same.
>
> Miquel, can you re-review v7 and say if it worth to revert current versio=
n and
> put v7 instead?

After taking inspiration from Richard's wisdom on IRC, we have another
proposal. Let's drop the mtd_master class. We need an mtd device to be
the master device, we already have one but we cannot keep *at the
beginning* of the ID space under the CONFIG_MTD_PARTITIONED_MASTER=3Dn
configuration to avoid breaking userspace. So let's keep the master
anyway, with the following specificities in the problematic case:
- id is allocated from the max value downwards (avoids messing with
  numbering)
- mtd device is simply hidden (same user experience as before)

Apparently this second point, while not natively supported, is something
the block world already does:
https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/blkdev.h#L88

What do you think?

Thanks,
Miqu=C3=A8l
