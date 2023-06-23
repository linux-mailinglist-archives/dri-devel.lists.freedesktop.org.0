Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27F73BA44
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662410E646;
	Fri, 23 Jun 2023 14:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4B510E646
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:35:33 +0000 (UTC)
Date: Fri, 23 Jun 2023 14:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687530930; x=1687790130;
 bh=YymGHJVx8QAcRL69nLPQXQjGsZNGlGI/V7ryyUEOLlo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=gS7v6vJzv8Vmwfn1Eu3cHidzn2mGhwERnfNEKbIqE8rVaBWyqxu1l6bebFLgR7K51
 5Uvc+letVzqJ2YTjUdYLd3St36g/eCJbgBXVTVrXu1D8Eu8+y8WcWFx4JtyYAE4ZDp
 FN0AM/Q+Jpb+/aXfaNE5jfaRVPu2PPWWVUkflQm/W87vmoDjnbwKLhke2DQYgkPG4n
 4a2JK7llv+2nDalnpA6iM81g5iMQFnHGySLQnV9PMK0S8qdv6ems3cHbRQ+kKLWUYq
 GizTmOer2ZTCAyv1e6Fo+X3e1kFnvxivkSBlT8XVqV8hXN3qdujWAhFlgWxO8E7UCi
 PXcMLEJK0MVww==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/kms: log when querying an object not included in lease
Message-ID: <20230623143514.38707-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space may query an existing object not included in a lease.
Make it easier to debug such situations by logging a debug message.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_mode_object.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_o=
bject.c
index ba1608effc0f..ac0d2ce3f870 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -147,8 +147,10 @@ struct drm_mode_object *__drm_mode_object_find(struct =
drm_device *dev,
 =09=09obj =3D NULL;
=20
 =09if (obj && drm_mode_object_lease_required(obj->type) &&
-=09    !_drm_lease_held(file_priv, obj->id))
+=09    !_drm_lease_held(file_priv, obj->id)) {
+=09=09drm_dbg_kms(dev, "[OBJECT:%d] not included in lease", id);
 =09=09obj =3D NULL;
+=09}
=20
 =09if (obj && obj->free_cb) {
 =09=09if (!kref_get_unless_zero(&obj->refcount))
--=20
2.41.0


