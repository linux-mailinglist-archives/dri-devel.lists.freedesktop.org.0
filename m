Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A9AD50AA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 11:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5710E348;
	Wed, 11 Jun 2025 09:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lvwelx4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81410E61B;
 Wed, 11 Jun 2025 09:56:34 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id AC151583615;
 Wed, 11 Jun 2025 09:34:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F5F043892;
 Wed, 11 Jun 2025 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749634467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTWVYcBwptCdDBnF3kGmXjZmZTDyF4Frz+J6o+FH2MA=;
 b=lvwelx4kVGW22Z4IvdtLWkF3fN2blgoJPRxQOY3wdzY/CH7Q/4PPHRwf3I3eeiOvInNLLm
 lx5EWeemSQaEK6K+gyrHSocE852TsxYM1RAyPtQ1Q/CX+BBB+pyGZbsLzgh/H+cdRSOcyj
 GiLrUfiWQDI6Fxj3ZdcukmRhRKMAmVh2W8fG4MqSwKX0h/XGen9CK1h0X0xEmbTZxCD0i6
 RVFjX+gznOqxAnIaLbvbfSJ0n6A/uHVszsZ/jAq1oWSDRbotgFnUJ0LZEjk8FyZMyI29fz
 VSp6WxG4MfGhU7gdxoqrqqRhGRlUr7c3tmB6UePCDNSgZy31zn2t4PX0uUxNlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Weinberger <richard@nod.at>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,  DRI mailing list
 <dri-devel@lists.freedesktop.org>,  intel-gfx
 <intel-gfx@lists.freedesktop.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> (Guenter
 Roeck's message of "Tue, 10 Jun 2025 09:15:25 -0700")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Jun 2025 11:34:25 +0200
Message-ID: <877c1ivcym.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmr
 ghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

On 10/06/2025 at 09:15:25 -07, Guenter Roeck <linux@roeck-us.net> wrote:

> On 6/10/25 05:54, Richard Weinberger wrote:
>> ----- Urspr=C3=BCngliche Mail -----
>>> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
>>> Richard, I've reproduced your setup (modulo that I must load mtdram man=
ually)
>>> and patch provided in this thread helps to fix the issue.
>>> Can you apply and confirm?
>> Yes, it fixes the issue here! :-)
>>=20
>
> It doesn't seem to fix the issue if the partition data is in
> devicetree.

I had a look at the patch again. The whole mtd core makes assumptions on
parenting, which is totally changed with this patch. There are so many
creative ways this can break, I don't believe we are going to continue
this route. I propose to revert the patch entirely for now. We need to
find another approach, I'm sorry.

Alexander, can you please remind me what was your initial problem? I
believe you needed to anchor runtime PM on the master device. Can you
please elaborate again? Why taking the controller as source (the
default, before your change) did not work? Also why was selecting
MTD_PARTITIONED_MASTER not an option for you? I'm trying to get to the
root of this change again, so we can find a solution fixing "the world"
(fast) and in a second time a way to address your problem.

Thanks,
Miqu=C3=A8l
