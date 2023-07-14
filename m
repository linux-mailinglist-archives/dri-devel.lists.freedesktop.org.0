Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61375389F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1115C10E86C;
	Fri, 14 Jul 2023 10:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872E710E86E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:46:16 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689331573; x=1689590773;
 bh=U0CfyV7Bh7oJ5xaa/saFWtrA0Pz5NAcT4Y6W8/mn8hQ=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=odbn76IJyiVQ5By+eUEjMDaO/zBoO09PEUpb/8FOAaIttsK3HWXhf+jiEEK1t9Lho
 MAcYUPT84Cv7BWDKV39nkJFgPAEsLRmw/ug1GzJCycIEIpA8L2lw80tq8FlKmKCGWy
 zPW+CJO1g43IN9mQnBV9wBraYvtkR+viQr3i+arU5Dpm3mDQG4as+NiF8H95VJ5t2e
 I6av2FCuWn/AzniLRc3r82jyKS5KrdiOImOCRZqxn90a9WYJOXaOeiFNmc7KDvYcx5
 yE2Bt6n2IKmt2p0wSFNXanM8yYlWAUvhhhd+nYIu0ChsUtwDXB72sM06gQXP+JNnrN
 /H3Z7NXYpCqbA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/3] drm/drv: use enum drm_minor_type when appropriate
Message-ID: <20230714104557.518457-1-contact@emersion.fr>
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
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it easier to figure out what the "type" variable can be
set to when reading the implementation of these functions.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: James Zhu <James.Zhu@amd.com>
Cc: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..3eda026ffac6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -84,7 +84,7 @@ DEFINE_STATIC_SRCU(drm_unplug_srcu);
  */
=20
 static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
-=09=09=09=09=09     unsigned int type)
+=09=09=09=09=09     enum drm_minor_type type)
 {
 =09switch (type) {
 =09case DRM_MINOR_PRIMARY:
@@ -116,7 +116,7 @@ static void drm_minor_alloc_release(struct drm_device *=
dev, void *data)
 =09}
 }
=20
-static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
+static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type typ=
e)
 {
 =09struct drm_minor *minor;
 =09unsigned long flags;
@@ -160,7 +160,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsi=
gned int type)
 =09return 0;
 }
=20
-static int drm_minor_register(struct drm_device *dev, unsigned int type)
+static int drm_minor_register(struct drm_device *dev, enum drm_minor_type =
type)
 {
 =09struct drm_minor *minor;
 =09unsigned long flags;
@@ -203,7 +203,7 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
 =09return ret;
 }
=20
-static void drm_minor_unregister(struct drm_device *dev, unsigned int type=
)
+static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_ty=
pe type)
 {
 =09struct drm_minor *minor;
 =09unsigned long flags;
--=20
2.41.0


