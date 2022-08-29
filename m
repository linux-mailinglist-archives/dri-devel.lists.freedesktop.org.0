Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DF5A4FF6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1210F39E;
	Mon, 29 Aug 2022 15:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0567510F391
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:15:10 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661786107; x=1662045307;
 bh=e4jUqxUScMtErGJkmkHwID2vhEFdoPxDRA7/lrlBH0U=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=b5qbTANwPOrd2LL82qV0uM7cRymk942lKa8iXdavt8M/Jf0lDhZ9+3664CmJwbYzV
 Zc9Mewb0KwFxAweV0nrGZByEF+tOwe55R+QBFO/QqQjy+m7f0vAOE8i2IWhCCJbtm5
 73SL4YMXiApAzKHh5ogSPTEZSm7bK3K79YwfZTOMRvKti+JxhvX9vVKSMdjGgNN7om
 fdXqNAWi+7Wa+Nljw4uE6n0FPEYP1/M7j+bjIjn/g2zMZH0IyvIhRtLUs6dFpSq30L
 j6ZTSZcB1mLCbKq6yzkF1Wy5xD/XXPzEM+RekUqQyftBLhbQ6kSg2KQPGePdXY6RTu
 Y9bOJq76OYKsA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/3] drm/atomic-helper: print message on driver connector
 check failure
Message-ID: <20220829151451.152114-1-contact@emersion.fr>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes drivers are missing logs when they return EINVAL.
Printing the failure here in common code can help understand where
EINVAL is coming from.

All other atomic_check() calls in this file already have similar
logging.

v2: add missing newlines

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c
index c6abfd3d4b62..4aa05b626b57 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -702,8 +702,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev=
,
=20
 =09=09if (funcs->atomic_check)
 =09=09=09ret =3D funcs->atomic_check(connector, state);
-=09=09if (ret)
+=09=09if (ret) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[CONNECTOR:%d:%s] driver check failed\n",
+=09=09=09=09       connector->base.id, connector->name);
 =09=09=09return ret;
+=09=09}
=20
 =09=09connectors_mask |=3D BIT(i);
 =09}
@@ -745,8 +749,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev=
,
=20
 =09=09if (funcs->atomic_check)
 =09=09=09ret =3D funcs->atomic_check(connector, state);
-=09=09if (ret)
+=09=09if (ret) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[CONNECTOR:%d:%s] driver check failed\n",
+=09=09=09=09       connector->base.id, connector->name);
 =09=09=09return ret;
+=09=09}
 =09}
=20
 =09/*
--=20
2.37.2


