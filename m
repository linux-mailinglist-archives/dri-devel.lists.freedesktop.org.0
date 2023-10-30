Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151247DB796
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558A10E27E;
	Mon, 30 Oct 2023 10:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC910E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q7IM93vTDTux0N+2jYnRw3/7heGxK5L4k9ZRHdyiRWo=; b=BoZPsHBfwsRUebCTOBF2SXc+O3
 lhIEPlisYiTkyYA19l7bqwJwOlDQa3nbTl3CdJ5ovQI52ENx6eE7mnIPgZzdE3nPPTWkynfGstqn5
 dBZoNCI+hRLzosow7pmBlA0HDrNSgmbwY5lLO91KfAH5vDBAMDl4xdPzUgGsDLM2l3i84/jJ+3TfP
 B9N1TiM9+3jrVXEa4IhhZSX71jshqBPgMU7VQXd1sLS5pJ2xYp72/0KXRoh0HSQ7FDT9LSomYm716
 06Lhfe3Vm8dc9fDZY+Cs/uVytxfzw8xamHVEYSIuSuMINBW0fPXnS2lMLWDPs9axv/ttgc0QLpjD6
 Bdf5RYvw==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxPIM-00ErMD-H0; Mon, 30 Oct 2023 11:14:54 +0100
Message-ID: <7dbf5892f22b01ec3ef99dc1b261f68147fc9715.camel@igalia.com>
Subject: Re: [PATCH v2 2/4] drm/v3d: fix up register addresses for V3D 7.x
From: Iago Toral <itoral@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>, Maira Canal <mcanal@igalia.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 30 Oct 2023 11:14:53 +0100
In-Reply-To: <613c4107-26c5-4d48-95c2-15ac8fcca33c@gmx.net>
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-3-itoral@igalia.com>
 <613c4107-26c5-4d48-95c2-15ac8fcca33c@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

El lun, 30-10-2023 a las 10:58 +0100, Stefan Wahren escribi=C3=B3:
> Hi Iago,
>=20
> Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
> > This patch updates a number of register addresses that have
> > been changed in Raspberry Pi 5 (V3D 7.1) and updates the
> > code to use the corresponding registers and addresses based
> > on the actual V3D version.
> >=20
> > v2:
> > =C2=A0 - added s-o-b and commit message. (Ma=C3=ADra Canal)
> > =C2=A0 - Used macro that takes version as argument and returns
> > =C2=A0=C2=A0=C2=A0 appropriate values instead of two different definiti=
ons
> > =C2=A0=C2=A0=C2=A0 for post-v71 and pre-v71 hardware when possible. (Ma=
=C3=ADra Canal)
> > =C2=A0 - fixed style warnings from checkpatch.pl. (Ma=C3=ADra Canal)
> >=20
> > Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> > ---
> > =C2=A0 drivers/gpu/drm/v3d/v3d_debugfs.c | 178 +++++++++++++++++-------=
-
> > -----
> > =C2=A0 drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +-
> > =C2=A0 drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46=
 ++++----
> > =C2=A0 drivers/gpu/drm/v3d/v3d_regs.h=C2=A0=C2=A0=C2=A0 |=C2=A0 94 ++++=
+++++-------
> > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0 |=C2=A0 38 ++++---
> > =C2=A0 5 files changed, 204 insertions(+), 156 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
> > b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > index 330669f51fa7..f843a50d5dce 100644
> > --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> > +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > @@ -12,69 +12,83 @@
> > =C2=A0 #include "v3d_drv.h"
> > =C2=A0 #include "v3d_regs.h"
> >=20
> > -#define REGDEF(reg) { reg, #reg }
> > +#define REGDEF(min_ver, max_ver, reg) { min_ver, max_ver, reg,
> > #reg }
> > =C2=A0 struct v3d_reg_def {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 min_ver;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 max_ver;
> Is this documented some where which SoC has which V3D version?
>=20

Not that I am aware of.

There are really only two Raspberry Pi SoCs supported by v3d: bcm2711
is Raspberry Pi 4 which is V3D 4.2 (compatible with 4.1), and bcm2712
is Raspberry Pi 5 which is V3D 7.1.

I don't know what SoCs are supported by versions of V3D before 4.1, I
think those were targetting set-top-box hardware that Emma used while
setting up the driver before the SoC for Raspberry Pi 4 was available.

Iago
