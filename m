Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4608CCF84D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A610EDA6;
	Fri, 19 Dec 2025 11:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nG/VMczH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ABB10EDA6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766142258;
 bh=kM9rqO+k4n5tn6iUhIYm8PySEHfSSmGX6FihNL7XdfA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nG/VMczH2Z+8CQfEUrBR/VXVSvt/pOWn9of4OV8hHMC1J/atIKWw0xdJieU4LlueU
 BgTCCHAPYIuk9vfBkM9AtohSjcEDbAVAZKfVEPcI5y0nwPedigzysUqzxeVZQuSbPD
 /KmQ4J+yKtKdJy0gvx19JKiLoUWEwpAzmupvp3bS0eOPUEffCyQKlcbEMIPgz0Cp2h
 8A+o01rxJuJnsEC2RRiW3zfGGDb2hxdpO50376MuRcCkoULKeE3drw5fYEoqmKojU2
 ihFBMByS3JDtCiOFNJN9yPAA/DyJ8b0/PfniJERUKqNa0+5cyUTjwpf8eMNJDKg78y
 3QvEP14NtTxNQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8949A17E0184;
 Fri, 19 Dec 2025 12:04:17 +0100 (CET)
Date: Fri, 19 Dec 2025 12:04:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Message-ID: <20251219120414.58c89125@fedora>
In-Reply-To: <TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
 <TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 19 Dec 2025 10:13:45 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Adri=C3=A1n Larumbe,
>=20
> > -----Original Message-----
> > From: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Sent: 19 December 2025 10:02
> > Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
> >=20
> > Hi Biju,
> >=20
> > I'll be merging your patch. It'll be my first time as a Panfrost mainta=
iner, so bear me with me while
> > I become familiar with the process. =20
>=20
> OK. Thanks.
>=20
> FYI, I just use the below 4 commands based on the documentation to merge =
a patch after the initial dim setup.
>=20
> =3D> ./maintainer-tools/dim update-branches
> =3D> ./maintainer-tools/dim checkout drm-misc-next
> =3D> curl xxx | ./maintainer-tools/dim apply-branch drm-misc-next

Or

# dim b4-shazam 20251203125104.67596-1-biju.das.jz@bp.renesas.com

if you find it simpler to pass a get the Message-ID than searching
for a link to pass to curl.

> =3D> ./maintainer-tools/dim push-branch drm-misc-next =20
