Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4581C3ED
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCE10E745;
	Fri, 22 Dec 2023 04:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D787F10E731
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-863jhRSFOJiCt9Rh4DFKAA-1; Thu,
 21 Dec 2023 23:33:21 -0500
X-MC-Unique: 863jhRSFOJiCt9Rh4DFKAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54ED71C05AF6;
 Fri, 22 Dec 2023 04:33:21 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 563E82026D66;
 Fri, 22 Dec 2023 04:33:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 06/11] drm/nouveau/gsp: Fix ACPI MXDM/MXDS method invocations
Date: Fri, 22 Dec 2023 14:31:55 +1000
Message-ID: <20231222043308.3090089-7-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-1-airlied@gmail.com>
References: <20231222043308.3090089-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Currently we get an error from ACPI because both of these arguments expect
a single argument, and we don't provide one. I'm not totally clear on what
that argument does, but we're able to find the missing value from
_acpiCacheMethodData() in src/kernel/platform/acpi_common.c in nvidia's
driver. So, let's add that - which doesn't get eDP displays to power on
quite yet, but gets rid of the argument warning at least.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 1a6d7c89660d..774ca47b019f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1150,6 +1150,8 @@ static void
 r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *=
mode,
 =09=09=09=09=09=09 MUX_METHOD_DATA_ELEMENT *part)
 {
+=09union acpi_object mux_arg =3D { ACPI_TYPE_INTEGER };
+=09struct acpi_object_list input =3D { 1, &mux_arg };
 =09acpi_handle iter =3D NULL, handle_mux =3D NULL;
 =09acpi_status status;
 =09unsigned long long value;
@@ -1172,14 +1174,18 @@ r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MU=
X_METHOD_DATA_ELEMENT *mode,
 =09if (!handle_mux)
 =09=09return;
=20
-=09status =3D acpi_evaluate_integer(handle_mux, "MXDM", NULL, &value);
+=09/* I -think- 0 means "acquire" according to nvidia's driver source */
+=09input.pointer->integer.type =3D ACPI_TYPE_INTEGER;
+=09input.pointer->integer.value =3D 0;
+
+=09status =3D acpi_evaluate_integer(handle_mux, "MXDM", &input, &value);
 =09if (ACPI_SUCCESS(status)) {
 =09=09mode->acpiId =3D id;
 =09=09mode->mode   =3D value;
 =09=09mode->status =3D 0;
 =09}
=20
-=09status =3D acpi_evaluate_integer(handle_mux, "MXDS", NULL, &value);
+=09status =3D acpi_evaluate_integer(handle_mux, "MXDS", &input, &value);
 =09if (ACPI_SUCCESS(status)) {
 =09=09part->acpiId =3D id;
 =09=09part->mode   =3D value;
--=20
2.43.0

