Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2705AB31D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE1D10E165;
	Mon, 12 May 2025 08:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JSI/NrHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8332D10E165;
 Mon, 12 May 2025 08:39:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 7CDDA580309;
 Mon, 12 May 2025 08:25:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63EE541DF6;
 Mon, 12 May 2025 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747038333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2qcaezvUijlLrPepDLPt+ZkioXMpqZt1fzdlF4KZU4=;
 b=JSI/NrHBSE2uOOYf6wgoEo5MwwgbaBwxNA0sEXTud+uUjAxlnaN0jn/9BH9bPaKI++c2nu
 ltcKsBAnJErln2qSlEgCTFhm6l7v+HyVeK/JGP+0SUaHxpFAs6j17RQVdYEHIgz6EHZ/xa
 1sIkGhBhKiTTg7ihvxkxXQJgfkqmdqxZW7UKPMIyTh4EY6YgSTouQ36JmD4dIJnYO3gSro
 /fZAFXJg9yPo0ETiQCWEEUtpDxzQMKV3Ch7ntAwwt1b7ef0/ariqY9uQ78VYtHMXARJJnt
 zSFfK4seEkDsrSESg0q8u7YdmlvtkydqXriGcO9WLrn8KUPRkqM7d3BE9C4wfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,  Maarten Lankhorst
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
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Tue, 6 May 2025 11:07:21 +0000")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
 <87ldrjtj7n.fsf@bootlin.com>
 <CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 10:25:31 +0200
Message-ID: <87h61qnslg.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrt
 ghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
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

On 06/05/2025 at 11:07:21 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>>=20
>> On 26/03/2025 at 17:26:12 +02, Alexander Usyskin
>> <alexander.usyskin@intel.com> wrote:
>>=20
>> > Create master device without partition when
>> > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>> >
>> > This streamlines device tree and allows to anchor
>> > runtime power management on master device in all cases.
>> >
>> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>=20
>> Applied to mtd/next. Thanks!
>>=20
>> Miqu=C3=A8l
>
> Thanks a lot!
>
> Miquel, would you pick patches from this series for files that are
> in the mtd tree?
> I can send separate patch series for this.
> In this case the i915/Xe patches can be merged in parallel via Xe
> tree.

I read several times that these patches should go through drm somehow,
so I provided my Ack. I do not think build would be broken if patch 1
goes through mtd and the others through drm anyway, especially since drm
has some structural slowness which means once applied to drm-misc(-next)
they may be part of the main tree a release later (iiuc).

However, I might drop this patch and reapply the one from v9, because I
apparently messed up with the version count. There is no action required
on your side.

Thanks,
Miqu=C3=A8l
