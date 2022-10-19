Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7C60496A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8110EAF6;
	Wed, 19 Oct 2022 14:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B8910F24B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:02 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190279; x=1666449479;
 bh=yWsT5OIuzTT+/9FW9RcipjSK+rK1bGFZrVkXMxvvif0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=FLB20bWiFpURDw1n1mhDU/d8P8/LpKOnViGpCc13kOnwWD8mrSFGetc127lGFYqGs
 dO2E1NBxZugKEcpWTEK+ooKvMfqFjYF/7KbFXds+QW7iEFMtYaiWSYT7xGV2rE/eE4
 +Q86SB0GTsHyUS1GJ0BDysbiNVr+JIZVmOIhvavn5Frc35fAOuIhy5Vr3Vb3pHxRWc
 2tMRD19bUuwPg23RkKcPpOpy7xAooj+wkv9ckOKpykwKWV+DC4oCGC/3k/d6MhGCGQ
 qZX+BGQGdi+G3Rlr/YR5FA3zzMlH6BgPaNM3baOz2JozqBlcT/QgKNUuS/gNK/il7k
 yQl6aIeCkYaOg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/7] drm/atomic: log
 drm_atomic_replace_property_blob_from_id() errors
Message-ID: <20221019143736.267324-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index c06d0639d552..e659fdae477d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -374,16 +374,25 @@ drm_atomic_replace_property_blob_from_id(struct drm_d=
evice *dev,
=20
 =09if (blob_id !=3D 0) {
 =09=09new_blob =3D drm_property_lookup_blob(dev, blob_id);
-=09=09if (new_blob =3D=3D NULL)
+=09=09if (new_blob =3D=3D NULL) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "cannot find blob ID %llu\n", blob_id);
 =09=09=09return -EINVAL;
+=09=09}
=20
 =09=09if (expected_size > 0 &&
 =09=09    new_blob->length !=3D expected_size) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[BLOB:%d] length %zu different from expected %zu\n",
+=09=09=09=09       new_blob->base.id, new_blob->length, expected_size);
 =09=09=09drm_property_blob_put(new_blob);
 =09=09=09return -EINVAL;
 =09=09}
 =09=09if (expected_elem_size > 0 &&
 =09=09    new_blob->length % expected_elem_size !=3D 0) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[BLOB:%d] length %zu not divisible by element size %zu=
\n",
+=09=09=09=09       new_blob->base.id, new_blob->length, expected_elem_size=
);
 =09=09=09drm_property_blob_put(new_blob);
 =09=09=09return -EINVAL;
 =09=09}
--=20
2.38.0


