Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459EF9FB4A5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 20:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F343010E26D;
	Mon, 23 Dec 2024 19:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XkL4HlxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FE510E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 19:21:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4343AFF803;
 Mon, 23 Dec 2024 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734981691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWj1thEE3fEk4/JDoMlPzjIiOgvaovwBP/OLPmPxMTc=;
 b=XkL4HlxDTSTVu8Z3tpaDo0aUqQjDmb1EDtc/kb/3vkFvtvfjq5NCactwOYkt2DXR9/jgDL
 wrtpgjGDtx0hpkK9ZmSvEYv2EMZbYwv9arz0d3MZuxWiyvtWmfZHn7mwGrlqtaMv6I4+6Y
 90hO51r6ps3MOp4l27g2VGiqP80/ZIJ9OvQmo2O7Bop199rK/KyLNYvqfNj8LseasjZkdO
 AnUXXqybWyvrrZqpZB6TGEVAFLXkpc7XQALLfRbrORYiVT31MnMNXB8uAD28QDMsCT1zp7
 aZgUix8Gfs2nXqYN47SFUTEpGx6C7wxgo0RLtW2VnFI6M3Hae/LoYaQyEMzS9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,  "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  "De Marchi, Lucas"
 <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Maarten Lankhorst
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
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 (Alexander Usyskin's message of "Wed, 18 Dec 2024 15:58:35 +0000")
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>
 <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
 <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 20:21:29 +0100
Message-ID: <87cyhiqk7a.fsf@bootlin.com>
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

Hello Alexander,

>> If so, I have to add patch for mtd subsystem to always have device for m=
aster
>> initialized regardless of kernel flag.
>> Only to initialize struct device, not to create full mtd node.
>>=20
>> Miquel - are you agree to this?

Conceptually yes, but please mind one thing: we do not break
userspace. So if you want to keep the master mtd device, fine, but you
need to do it in a consistent way so that people not enabling the kernel
flag won't get a new device in their rootfs, shifting all indexes
upwards.

That being said, you are probably going in the right direction by doing
that.

Thanks,
Miqu=C3=A8l

