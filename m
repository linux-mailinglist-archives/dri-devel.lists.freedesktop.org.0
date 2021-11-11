Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E944D4CB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784846EA2F;
	Thu, 11 Nov 2021 10:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719166EA2F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:11:03 +0000 (UTC)
Date: Thu, 11 Nov 2021 10:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636625460;
 bh=Mh1fsiFLUqwZMJhBZTSNLuLGEoeXZpGJfBVlho6qc98=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=zB3Tv+ra2sn7UZt2iF7rlL0VX011KnbcJs0uZOTW42S9b47E+9iXFz9UUk8XdcC6z
 CcO++e0g2JkFYUELw99pe4/nCwcnqifheMkz2374XKv5qaG6DcQ6cGZu8Z70L/ouVY
 4z7jGCoXmP8iCho/Lc++idivEtXUkO9NgJ26SWyAwIjFFaOXiz+oGK2OgRYLzImJe9
 lLgEWe2M/bSk7vn+8JjJmTvrPyl+tiflut2qo0vW9c914ec3Vya/Kt/drBq1F/qJQP
 t1vrPwEwYSAHTk3hCgRcWRoHXcmPocDDLMvg1shSV1kQrjXlpJ2TuutjhzBOKBHMe1
 +OwBpIqzJ4qkw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <20211111101049.269349-1-contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space shouldn't look up the modifier array when the modifier
flag is missing, but at the moment no docs make this clear (working
on it). Right now the modifier array is pre-filled with zeroes, aka.
LINEAR. Instead, pre-fill with INVALID to avoid footguns.

This is a uAPI change, but OTOH any user-space which looks up the
modifier array without checking the flag is broken already, so
should be fine.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 07f5abc875e9..f7041c0a0407 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -601,7 +601,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 =09=09r->handles[i] =3D 0;
 =09=09r->pitches[i] =3D 0;
 =09=09r->offsets[i] =3D 0;
-=09=09r->modifier[i] =3D 0;
+=09=09r->modifier[i] =3D DRM_FORMAT_MOD_INVALID;
 =09}
=20
 =09for (i =3D 0; i < fb->format->num_planes; i++) {
--=20
2.33.1


