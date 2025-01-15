Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B5A134AC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84E210E059;
	Thu, 16 Jan 2025 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jan 2025 22:36:03 UTC
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7310E130;
 Wed, 15 Jan 2025 22:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 366172A7F6C;
 Wed, 15 Jan 2025 23:30:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xJ8tDHd-QsCG; Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A192C2A7F73;
 Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VX5lZQl7DxbL; Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6BDAE2A7F6C;
 Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Date: Wed, 15 Jan 2025 23:30:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Karthik Poosa <karthik.poosa@intel.com>, 
 Reuven Abliyev <reuven.abliyev@intel.com>, 
 Oren Weil <oren.jer.weil@intel.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
In-Reply-To: <20250101153925.865703-2-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133
 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: C6s+HB4y1QOCkRTVyeRkXaeBPdTLsQ==
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

Alexander,

----- Urspr=C3=BCngliche Mail -----
> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>=20
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.

Please explain in more detail why this is needed.
If this change makes the overall situation better and breaks
no userspace, I'm happy. :-)

From skimming over the patch I think the mtd_master device completely
useless for userspace, right?

> int add_mtd_device(struct mtd_info *mtd)
> {
> =09struct device_node *np =3D mtd_get_of_node(mtd);
> =09struct mtd_info *master =3D mtd_get_master(mtd);
> =09struct mtd_notifier *not;
> +=09bool partitioned =3D true;
> =09int i, error, ofidx;
>=20
> =09/*
> @@ -655,6 +678,11 @@ int add_mtd_device(struct mtd_info *mtd)
> =09if (WARN_ONCE(mtd->dev.type, "MTD already registered\n"))
> =09=09return -EEXIST;
>=20
> +=09if ((master =3D=3D mtd) && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)=
) {
> +=09=09partitioned =3D false;
> +=09=09pr_debug("mtd: unpartitioned master %s\n", mtd->name);
> +=09}

So, when CONFIG_MTD_PARTITIONED_MASTER is not set and a driver like MTDRAM
does mtd_device_register(mtd, NULL, 0) we end up here with partitioned =3D =
false,
and allocate just a master device but no real mtd because with zero
parts the mtd_device_parse_register() function will not call add_mtd_device=
(). :-(

Thanks,
//richard
