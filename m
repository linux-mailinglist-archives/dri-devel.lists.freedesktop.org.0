Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE526012C6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92610E44D;
	Mon, 17 Oct 2022 15:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A510E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 15:32:02 +0000 (UTC)
Date: Mon, 17 Oct 2022 15:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666020720; x=1666279920;
 bh=bUJdkEV0AJZwcglqX6ugH3X0OXQISRQwEFpN+WUzGVw=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=jPuonxeBy2lrLO10O0cJFeuq807yXprw7f4VlvVqYc4AeeN7jHFJLbtZwpChbBwaD
 UCHwb+KLpXMt4Blt/FsCtpMiMmwWIrWHDjiZHXYsNtlH57TZ2yzTnrFbtnOaWa0wDe
 DLMLIY6U1w2nrQnNy0DhIRUzQJxpruLzHcRTzx1uG/z2iFk33U5+2YXsKHjtsHlsF1
 sMB5AF+haiYXq0r6uDEURZLlVABIyZo9KXBKt5Sx2TIaaiYUfkRT/ud/3FlxZe3a5Q
 RB7DUr3hatcai7FMDdW3trzBogRXTgbeIqhkirNiel3NAEHM3tHzxVqJImwiVYVWdW
 487OpV04ptKSA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <20221017153150.60675-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 981f09295687f856d5345e19c7084aca481c1395.

It turns out this breaks Mutter.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jonas =C3=85dahl <jadahl@redhat.com>
---
 drivers/gpu/drm/drm_mode_config.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 939d621c9ad4..688c8afe0bf1 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void =
*data,
 =09count =3D 0;
 =09connector_id =3D u64_to_user_ptr(card_res->connector_id_ptr);
 =09drm_for_each_connector_iter(connector, &conn_iter) {
-=09=09if (connector->registration_state !=3D DRM_CONNECTOR_REGISTERED)
-=09=09=09continue;
-
 =09=09/* only expose writeback connectors if userspace understands them */
 =09=09if (!file_priv->writeback_connectors &&
 =09=09    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK))
--=20
2.38.0


