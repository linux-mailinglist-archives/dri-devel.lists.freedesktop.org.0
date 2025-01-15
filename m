Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2718DA12BB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 20:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380C892EA;
	Wed, 15 Jan 2025 19:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ip1BlMl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDF910E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 19:22:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72E1720003;
 Wed, 15 Jan 2025 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736968947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvlL0mfj44cUCiwG8WLJrEnhaM51ApZOW7dKY/vuFiA=;
 b=Ip1BlMl93pKCALrSZKHRK3E2cThEoM684DtxClKerUnAHE+XALAA4E2QB0oMKrk/srchnw
 SJACqMQ8SlerS5Kd+G3O5/P45LVKnwrNDo1y0dGnMb+LEMnqepEj9cNaqlHat/BXjDU/tP
 wDExJThqs0CvG1AoQXpOb0CDhjX+RyXeoAEFcHqL7xUtC5Bh/X1rfPZ3SqnXmD9BC9Ah6r
 ap8ZH1MoMHQXnwlAB0GScmJZaG66htE4tpUppAUx/nrlA022aIhLqJPRxwrBodwjIzaiKC
 72MBi2xsYuISHHTtsIMZSsPNPbyG7C+vTGixVFj08ptr7fvShIjyoRcooioWfg==
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
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63663795A6C4DC83CB89602AED182@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Tue, 14 Jan 2025 14:05:40 +0000")
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <87sepwp6d9.fsf@bootlin.com>
 <IA1PR11MB6370A551FC8AEF0F9F404B42ED102@IA1PR11MB6370.namprd11.prod.outlook.com>
 <CY5PR11MB63663795A6C4DC83CB89602AED182@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:22:25 +0100
Message-ID: <871px3lw5q.fsf@bootlin.com>
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

Hi,


On 14/01/2025 at 14:05:40 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>> > > Create master device without partition when
>> > > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>> >
>> > I don't think you took into consideration my remarks regarding the fact
>> > that you would break userspace. If you enable the master, you no longer
>> > have the same device numbering in userspace. I know people should not
>> > care about these numbers, but in practice they do.
>> >
>> > If I'm wrong, please be a little more verbose about why :)
>> >
>> > Thanks,
>> > Miqu=C3=A8l
>>=20
>> Hi Miquel
>>=20
>> I've created separate class (mtd_master) for such devices.
>> Uses-space looking for mtd device continues to receive same number of
>> /dev/mtdX devices.
>> There will be additional /dev/mtd_masterX devices, but this is unavoidab=
le, I
>> suppose.
>> Maybe we can rename it to something that not in /dev/mtd* expression (e.=
g.
>> mastermtdX),
>> if it helps.
>>=20
>
> Miquel, is this good enough or requires rewrite?

This is an important change that requires attention, and at the time I
have not been able to dedicate enough to this patch.

Also, if the other mtd maintainers want to help, I'll be enthousiastic
about it :)

Thanks,
Miqu=C3=A8l
