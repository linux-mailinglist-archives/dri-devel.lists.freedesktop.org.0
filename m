Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0575ABFB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515D010E5A1;
	Thu, 20 Jul 2023 10:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0D910E5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:31:23 +0000 (UTC)
Date: Thu, 20 Jul 2023 10:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689849081; x=1690108281;
 bh=RIzsxjFJVzu7QLMreVFel/I2enVI2aly68q3YeP4hq0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=InfTrSUQ0uZ/cMgSXlQK6VSWlXVFSQUq4KnMDYSwVWz+Dhb5SWy/GZ7imgs+dsspT
 Zg1SHsw7CgvUoajZWTrNYH4aleja1q9XsJMbF7h4/aNGzf8s9G34J3t3ej+iCtIjK5
 ntrtIdfWf7pqkWxec5CBohfGorFTZEcJgJvcjBPqirvsnMygrkkFXu+MSbpLpMlXsW
 3SXmXK1H5sE+H4HUGniyVDpKJfhXWc4UZoBh6F9v0LELbm4jwUj8Ux174PVOFGNxZD
 ZBe7CxGXqYfpBOXNRy17utA7Cd1S4ZZf59Lp1q1wrWj+gAGhyKUQ/KEJ+e8Lj36PUD
 jC7Fe8X7VZL4Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/ioctl: turn on -Woverride-init for IOCTL table
Message-ID: <20230720103107.817084-1-contact@emersion.fr>
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
Cc: Erik Kurzinger <ekurzinger@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently two patches [1] [2] have hit a case of mistakenly picking
an IOCTL number which was already in-use. This is hard to debug
because the last definition wins and there is no indication that
there is a conflict.

Fix this by enabling -Werror=3Doverride-init for the IOCTL table.
When there is a duplicate entry, the compiler now errors out:

      CC [M]  drivers/gpu/drm/drm_ioctl.o
    drivers/gpu/drm/drm_ioctl.c:555:33: error: initialized field overwritte=
n [-Werror=3Doverride-init]
      555 |         [DRM_IOCTL_NR(ioctl)] =3D {               \
          |                                 ^
    drivers/gpu/drm/drm_ioctl.c:708:9: note: in expansion of macro =
=E2=80=98DRM_IOCTL_DEF=E2=80=99
      708 |         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_re=
set_ioctl,
          |         ^~~~~~~~~~~~~
    drivers/gpu/drm/drm_ioctl.c:555:33: note: (near initialization for =
=E2=80=98drm_ioctls[207]=E2=80=99)
      555 |         [DRM_IOCTL_NR(ioctl)] =3D {               \
          |                                 ^
    drivers/gpu/drm/drm_ioctl.c:708:9: note: in expansion of macro =
=E2=80=98DRM_IOCTL_DEF=E2=80=99
      708 |         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_re=
set_ioctl,
          |         ^~~~~~~~~~~~~
    cc1: some warnings being treated as errors

[1]: https://lore.kernel.org/dri-devel/20230714111257.11940-1-contact@emers=
ion.fr/
[2]: https://lore.kernel.org/dri-devel/vVFDBgHpdcB0vOwnl02QPOFmAZPEbIV56E_w=
Q8B012K2GZ-fAGyG0JMbSrMu3-IcKYVf0JpJyrf71e6KFHfeMoSPJlYRACxlxy91eW9c6Fc=3D@=
emersion.fr/

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Erik Kurzinger <ekurzinger@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f03ffbacfe9b..cd485eb54d2a 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -566,6 +566,8 @@ static int drm_ioctl_permit(u32 flags, struct drm_file =
*file_priv)
 #endif
=20
 /* Ioctl table */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic error "-Woverride-init"
 static const struct drm_ioctl_desc drm_ioctls[] =3D {
 =09DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
 =09DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
@@ -718,6 +720,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_M=
ASTER),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,=
 DRM_MASTER),
 };
+#pragma GCC diagnostic pop
=20
 #define DRM_CORE_IOCTL_COUNT=09ARRAY_SIZE(drm_ioctls)
=20
--=20
2.41.0


