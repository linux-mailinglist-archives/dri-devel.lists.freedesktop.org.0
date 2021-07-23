Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57793D3CB5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587E16E9B9;
	Fri, 23 Jul 2021 15:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85AC6E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 15:46:27 +0000 (UTC)
Date: Fri, 23 Jul 2021 15:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627055185;
 bh=TEs3+VV2fksiQLkyDR9K7x9dJBbuHjPW053pirt44F8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=qOwYV+I7jqYKUvFQAPPA7VY4jOghWEgcdkLk//w5um9bi+IzK8/ZygJgrMqXdLWiG
 YcDO91wY2i+L2j27PKDpkGf1a88GHpOlvBote9cn9Vpx26m09xClocapDIiLtnCekX
 QZaf07L1ozak01Cs9pk9n3ToSnQm6CXj0Wp7kUyt6gXknByXzKHN578H+NmJht0KRj
 RKy2TEU7hjf2F2FDgerm4eEo+hxT+LpCuQ8WesTRg29EpqOgeoZV8r7ha35+FRb7qb
 9L37yKVa2Idu6zZqlKGmDdajlKAjTE6DESTLMtbH/u0rSuQCo7/9pykKi9LTKsIKeu
 nzwEW6Ioxu+Qg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: add logging for RMFB ioctl
Message-ID: <xpuLEQstrPSZp6SF0CCWy59umtg3oW686DLB5VPai8w@cp4-web-037.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

We already have logging for ADDFB2. Add some logging for RMFB as
well.

This can be handy when trying to find out why a CRTC gets magically
disabled.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_framebuffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 4d01464b6f95..da77ceeb35e3 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -404,6 +404,7 @@ static void drm_mode_rmfb_work_fn(struct work_struct *w=
)
 =09=09struct drm_framebuffer *fb =3D
 =09=09=09list_first_entry(&arg->fbs, typeof(*fb), filp_head);
=20
+=09=09drm_dbg_kms(fb->dev, "Removing [FB:%d]\n", fb->base.id);
 =09=09list_del_init(&fb->filp_head);
 =09=09drm_framebuffer_remove(fb);
 =09}
--=20
2.32.0


