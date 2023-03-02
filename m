Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE036A8443
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 15:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CC210E4F6;
	Thu,  2 Mar 2023 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EB410E4F5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 14:35:23 +0000 (UTC)
Date: Thu, 02 Mar 2023 14:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677767721; x=1678026921;
 bh=fhtYEddQkLQMgFuJBYztaVcQfYVgU/WTbkJkYmjiUYc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FauIqzf9SaJziY/iNnA9OAaT8C/lpMrB3R76kI8xPFLzD7oO28OmYexZcm+zGBFDt
 0EKbWZHibB5yAVYZeHrHYUwsWFE+iRLqAJV2xNoqls81BmBc5diMzVfQdHHjcHyNuR
 Ef2sr4fNCRiZMrg+L5AWefzYRgcatph/m7jTSwvVK/OTz9uhJVdNOD5mTLASNfY4cT
 kUqWOQJQfI23/aTdbntPpwLB4w0AuOsfhZO4lZtiIP/2gzXjcNUEazNt74T+uAE7+s
 2+RcDKyAw4DtcLsjBKV+2X8ITDWU7UTcTMT9l8AjCakHYQnIWoHo+3xYvyUIOV0QEA
 +HMJCf7WPKe/A==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/2] drm/vram-helper: turn on PRIME import/export
Message-ID: <20230302143502.500661-2-contact@emersion.fr>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>
References: <20230302143502.500661-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't populate drm_driver.gem_prime_import_sg_table so only
DMA-BUFs exported from our own device can be imported. We don't
populate drm_gem_object_funcs.get_sg_table so DMA-BUFs cannot be
imported into another device. Still, this is useful to user-space
to share buffers between processes and between API boundaries
(e.g. wlroots hard-requires PRIME import/export support).

v2: expand commit message

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 include/drm/drm_gem_vram_helper.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_h=
elper.h
index d3e8920c0b64..f4aab64411d8 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -160,7 +160,9 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 =09.debugfs_init             =3D drm_vram_mm_debugfs_init, \
 =09.dumb_create=09=09  =3D drm_gem_vram_driver_dumb_create, \
 =09.dumb_map_offset=09  =3D drm_gem_ttm_dumb_map_offset, \
-=09.gem_prime_mmap=09=09  =3D drm_gem_prime_mmap
+=09.gem_prime_mmap=09=09  =3D drm_gem_prime_mmap, \
+=09.prime_handle_to_fd=09  =3D drm_gem_prime_handle_to_fd, \
+=09.prime_fd_to_handle=09  =3D drm_gem_prime_fd_to_handle
=20
 /*
  *  VRAM memory manager
--=20
2.39.2


