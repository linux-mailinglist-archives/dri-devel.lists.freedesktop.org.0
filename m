Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9C60496F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E88C10EAF8;
	Wed, 19 Oct 2022 14:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD110EAF8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:28 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190307; x=1666449507;
 bh=AA+aPRXipHH521FkMJp0Bfj9uMGIe6KWk2aFLsIW4sE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=bFpxi4Y77zpDkNxE5InV6UC3AWdjKDmvD7z0Yk7rv0bxq6WllOt4J/YgD1NbC8t8u
 yFKR/BL46UR1IShWQUENO+TOmtFQ9GG1CTVlVLu6OKuK9srei2IXW9lsPf2GYlO/5b
 /131iRkmxX7Tlq1Dkq1KzI17rntFAh6Sj/CTMDyb0x8G4JMsqrJ2dIjW4o16a12CQh
 W3em5r7r2L9O4FRCCfFOGBXoP8aZtRLXznmJnrsjKfi2Vq+iStOuV50Q4rnCy8IKsR
 APi2pqGoItX0n5Js9O6OFJb7yKPJp4l1mGGRpI5SghyB2dgCfaNQctqxwHFr+4ekaX
 ciBnp42QBFy+A==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 6/7] drm/atomic: log when page-flip is requested without CRTCs
Message-ID: <20221019143736.267324-6-contact@emersion.fr>
In-Reply-To: <20221019143736.267324-1-contact@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
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
 drivers/gpu/drm/drm_atomic_uapi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 3df3f7ba0af3..b996351beb57 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1261,8 +1261,10 @@ static int prepare_signaling(struct drm_device *dev,
 =09 * Having this flag means user mode pends on event which will never
 =09 * reach due to lack of at least one CRTC for signaling
 =09 */
-=09if (c =3D=3D 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
+=09if (c =3D=3D 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
+=09=09drm_dbg_atomic(dev, "need at least one CRTC for DRM_MODE_PAGE_FLIP_E=
VENT");
 =09=09return -EINVAL;
+=09}
=20
 =09return 0;
 }
--=20
2.38.0


