Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0AA77EFA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A61410E5E3;
	Tue,  1 Apr 2025 15:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GMFYHBDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D9510E5E3;
 Tue,  1 Apr 2025 15:32:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 26CAE5814B4;
 Tue,  1 Apr 2025 15:00:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921F5441C8;
 Tue,  1 Apr 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1743519646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6SUzGcMkPKel2Eccn/jYaKzkfn5nDr4VwnUJsYHcl0=;
 b=GMFYHBDmkQqPnwkmOAvUpfp7X/+LmL7dcjdsCjsTdJynnH4itkSn1hQxCz5+SCHo1uaclf
 DhgtZjY4wTeHh3eozM/vo5clyziidRAKCKFpzukdJ18oiayB6OHyD0IAd2+Luv1CSMp1gD
 zY/JN/ez/OxbyQY0KoB1rJxDH4cgB5kVBny+R9Xqxu+BqgxnjIxQ7QpvHp8Jrrz21EIWBv
 8JOX6UARWLuysU9uR3cJezATqmPZbdx1VtrBi/dHC/aKYZWjiGqymqvGJBV9Qw7YGDO25i
 GAc2Rla0P/hRZ+f7DASVPsS87VlZylgntjN5l/aSlpNhYftOGqddTvQHiMmsfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <20250326152623.3897204-2-alexander.usyskin@intel.com> (Alexander
 Usyskin's message of "Wed, 26 Mar 2025 17:26:12 +0200")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 01 Apr 2025 17:00:43 +0200
Message-ID: <87ecycrko4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeftdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
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

Hello Alexander,

On 26/03/2025 at 17:26:12 +02, Alexander Usyskin <alexander.usyskin@intel.c=
om> wrote:

> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

I successfully tested it, this patch will be applied at -rc1 to the
mtd/next tree.

I was wondering, do you think it would be possible to keep the creation
of mtd_master and make it a symbolic link to mtdx when
MTD_PARTITIONED_MASTER=3Dy or when there is no partition? In short, always
having mtd_masterx, because I fear at some point we'll have problems
otherwise :-)

Right now we have:

- Without partition:
mtd0 (mtd0ro mtdblock0)
- With partition and MTD_PARTITIONED_MASTER=3Dn
mtd0 (mtd0ro mtdblock0)
mtd_master0
- With partition and MTD_PARTITIONED_MASTER=3Dy
mtd0 (mtd0ro mtdblock0) [this is the master]
mtd1 (mtd1ro mtdblock1)

I am suggesting:
- Without partition:
mtd0 (mtd0ro mtdblock0)
mtd_master0 -> link to mtd0
- With partition and MTD_PARTITIONED_MASTER=3Dn
mtd0 (mtd0ro mtdblock0)
mtd_master0
- With partition and MTD_PARTITIONED_MASTER=3Dy
mtd0 (mtd0ro mtdblock0) [this is the master]
mtd1 (mtd1ro mtdblock1)
mtd_master0 -> link to mtd0

What do you think? Or maybe even always mtd_master in the first place.

Richard, your point of view on this?

Thanks,
Miqu=C3=A8l
