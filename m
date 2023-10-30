Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B667B7DB1D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 02:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44910E068;
	Mon, 30 Oct 2023 01:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Mon, 30 Oct 2023 01:34:47 UTC
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEB910E068
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 01:34:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-Xy9NjHctMKqDh59Y5P5M3w-1; Sun,
 29 Oct 2023 21:28:18 -0400
X-MC-Unique: Xy9NjHctMKqDh59Y5P5M3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7771C3827965;
 Mon, 30 Oct 2023 01:28:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 788EC492BE0;
 Mon, 30 Oct 2023 01:28:17 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] nouveau/disp: fix post-gsp build on 32-bit arm.
Date: Mon, 30 Oct 2023 11:28:13 +1000
Message-ID: <20231030012814.1208972-2-airlied@gmail.com>
In-Reply-To: <20231030012814.1208972-1-airlied@gmail.com>
References: <20231030012814.1208972-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This converts a bunch of divides into the proper macros.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.c
index d2be40337b92..7840b6428afb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1644,7 +1644,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *out=
p,
 =09// 0 active symbols. This may cause HW hang. Bug 200379426
 =09//
 =09if ((bEnableDsc) &&
-=09=09((pixelClockHz * depth) < ((8 * minRate * outp->dp.link_nr * DSC_FAC=
TOR) / 64)))
+=09    ((pixelClockHz * depth) < div_u64(8 * minRate * outp->dp.link_nr * =
DSC_FACTOR, 64)))
 =09{
 =09=09return false;
 =09}
@@ -1654,20 +1654,20 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *o=
utp,
 =09//=09For auto mode the watermark calculation does not need to track acc=
umulated error the
 =09//=09formulas for manual mode will not work.  So below calculation was =
extracted from the DTB.
 =09//
-=09ratioF =3D ((u64)pixelClockHz * depth * PrecisionFactor) / DSC_FACTOR;
+=09ratioF =3D div_u64((u64)pixelClockHz * depth * PrecisionFactor, DSC_FAC=
TOR);
=20
-=09ratioF /=3D 8 * (u64) minRate * outp->dp.link_nr;
+=09ratioF =3D div_u64(ratioF, 8 * (u64) minRate * outp->dp.link_nr);
=20
 =09if (PrecisionFactor < ratioF) // Assert if we will end up with a negati=
ve number in below
 =09=09return false;
=20
-=09watermarkF =3D ratioF * tuSize * (PrecisionFactor - ratioF)  / Precisio=
nFactor;
-=09waterMark =3D (unsigned)(watermarkAdjust + ((2 * (depth * PrecisionFact=
or / (8 * numLanesPerLink * DSC_FACTOR)) + watermarkF) / PrecisionFactor));
+=09watermarkF =3D div_u64(ratioF * tuSize * (PrecisionFactor - ratioF), Pr=
ecisionFactor);
+=09waterMark =3D (unsigned)(watermarkAdjust + (div_u64(2 * div_u64(depth *=
 PrecisionFactor, 8 * numLanesPerLink * DSC_FACTOR) + watermarkF, Precision=
Factor)));
=20
 =09//
 =09//  Bounds check the watermark
 =09//
-=09numSymbolsPerLine =3D (surfaceWidth * depth) / (8 * outp->dp.link_nr * =
DSC_FACTOR);
+=09numSymbolsPerLine =3D div_u64(surfaceWidth * depth, 8 * outp->dp.link_n=
r * DSC_FACTOR);
=20
 =09if (WARN_ON(waterMark > 39 || waterMark > numSymbolsPerLine))
 =09=09return false;
@@ -1688,11 +1688,13 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *o=
utp,
 =09surfaceWidthPerLink =3D surfaceWidth;
=20
 =09//Extra bits sent due to pixel steering
-=09PixelSteeringBits =3D (surfaceWidthPerLink % numLanesPerLink) ? (((numL=
anesPerLink - surfaceWidthPerLink % numLanesPerLink) * depth) / DSC_FACTOR)=
 : 0;
+=09u32 remain;
+=09div_u64_rem(surfaceWidthPerLink, numLanesPerLink, &remain);
+=09PixelSteeringBits =3D remain ? div_u64((numLanesPerLink - remain) * dep=
th, DSC_FACTOR) : 0;
=20
 =09BlankingBits +=3D PixelSteeringBits;
-=09NumBlankingLinkClocks =3D (u64)BlankingBits * PrecisionFactor / (8 * nu=
mLanesPerLink);
-=09MinHBlank =3D (u32)(NumBlankingLinkClocks * pixelClockHz/ minRate / Pre=
cisionFactor);
+=09NumBlankingLinkClocks =3D div_u64((u64)BlankingBits * PrecisionFactor, =
(8 * numLanesPerLink));
+=09MinHBlank =3D (u32)(div_u64(div_u64(NumBlankingLinkClocks * pixelClockH=
z, minRate), PrecisionFactor));
 =09MinHBlank +=3D 12;
=20
 =09if (WARN_ON(MinHBlank > rasterWidth - surfaceWidth))
@@ -1703,7 +1705,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *out=
p,
 =09=09return false;
=20
=20
-=09hblank_symbols =3D (s32)(((u64)(rasterWidth - surfaceWidth - MinHBlank)=
 * minRate) / pixelClockHz);
+=09hblank_symbols =3D (s32)(div_u64((u64)(rasterWidth - surfaceWidth - Min=
HBlank) * minRate, pixelClockHz));
=20
 =09//reduce HBlank Symbols to account for secondary data packet
 =09hblank_symbols -=3D 1; //Stuffer latency to send BS
@@ -1722,7 +1724,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *out=
p,
 =09}
 =09else
 =09{
-=09=09vblank_symbols =3D (s32)(((u64)(surfaceWidth - 40) * minRate) /  pix=
elClockHz) - 1;
+=09=09vblank_symbols =3D (s32)((div_u64((u64)(surfaceWidth - 40) * minRate=
, pixelClockHz))) - 1;
=20
 =09=09vblank_symbols -=3D numLanesPerLink =3D=3D 1 ? 39  : numLanesPerLink=
 =3D=3D 2 ? 21 : 12;
 =09}
--=20
2.41.0

