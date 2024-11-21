Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147069D455C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 02:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F3310E1EE;
	Thu, 21 Nov 2024 01:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA6810E800
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 01:46:12 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-mfNYNHxuOzmIGbP58CgUVQ-1; Wed,
 20 Nov 2024 20:46:07 -0500
X-MC-Unique: mfNYNHxuOzmIGbP58CgUVQ-1
X-Mimecast-MFC-AGG-ID: mfNYNHxuOzmIGbP58CgUVQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9FF46195609E; Thu, 21 Nov 2024 01:46:06 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.106])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 970A619560A3; Thu, 21 Nov 2024 01:46:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@redhat.com
Subject: [PATCH] nouveau/gsp: drop WARN_ON in ACPI probes
Date: Thu, 21 Nov 2024 11:46:01 +1000
Message-ID: <20241121014601.229391-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GlXvOuQt6xHgIgzHy8jqcAJmn38hz9DdxcLgYhSF0MQ_1732153566
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

These WARN_ONs seem to trigger a lot, and we don't seem to have a
plan to fix them, so just drop them, as they are most likely
harmless.

Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index cf58f9da9139..8c5f4ed85f45 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1466,8 +1466,8 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DA=
TA *caps)
 =09if (!obj)
 =09=09return;
=20
-=09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
-=09    WARN_ON(obj->buffer.length !=3D 4))
+=09if (obj->type !=3D ACPI_TYPE_BUFFER ||
+=09    obj->buffer.length !=3D 4)
 =09=09return;
=20
 =09caps->status =3D 0;
@@ -1498,8 +1498,8 @@ r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *=
jt)
 =09if (!obj)
 =09=09return;
=20
-=09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
-=09    WARN_ON(obj->buffer.length !=3D 4))
+=09if (obj->type !=3D ACPI_TYPE_BUFFER ||
+=09    obj->buffer.length !=3D 4)
 =09=09return;
=20
 =09jt->status =3D 0;
@@ -1585,8 +1585,8 @@ r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA=
 *dod)
=20
 =09_DOD =3D output.pointer;
=20
-=09if (WARN_ON(_DOD->type !=3D ACPI_TYPE_PACKAGE) ||
-=09    WARN_ON(_DOD->package.count > ARRAY_SIZE(dod->acpiIdList)))
+=09if (_DOD->type !=3D ACPI_TYPE_PACKAGE ||
+=09    _DOD->package.count > ARRAY_SIZE(dod->acpiIdList))
 =09=09return;
=20
 =09for (int i =3D 0; i < _DOD->package.count; i++) {
--=20
2.47.0

