Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F86A8442
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 15:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34F710E4F5;
	Thu,  2 Mar 2023 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F072710E4F5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 14:35:23 +0000 (UTC)
Date: Thu, 02 Mar 2023 14:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677767721; x=1678026921;
 bh=mfeN7cWG+xdpjLBhz8gTnkGojBY2WsOui4CA+tBC+7Q=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=H05m1+gh9UN3C/7UIrrBS+2f/8EmtyyTzLWIThnynaTO2ATIlI9XImVIBf+PuLFzs
 gSQTz1xm+uXn/e4SajJpQ8ykdrIOmaZ/NlMeJNmO4ZWWUBeB7blPrA6BOZyooULORw
 i/w9Rc+U3peVGl3LIIgZ/6XhLzCSGI0QwIQ2R/2h5pu9i/P5y6dPA0BQeKbE221h/+
 sE0iTxkIp9E/hYXi0AgCVEtivG+Rjk2gYqFwRBxYthVSOeDZfosKNMzRNadrfqX9mt
 BUINAqT9V0dWv3ZnMmB//ut+dx1m859/Q2+k4zKDoUHhGScooSr0hOEB0onGoMYu6a
 571a3bSmkFfsw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table is
 missing
Message-ID: <20230302143502.500661-1-contact@emersion.fr>
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

drm_gem_map_dma_buf() requires drm_gem_object_funcs.get_sg_table
to be implemented, or else WARNs.

Allow drivers to leave this hook unimplemented to implement purely
local DMA-BUFs (ie, DMA-BUFs which cannot be imported anywhere
else but the device which allocated them). In that case, reject
imports to other devices in drm_gem_map_attach().

v2: new patch

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_prime.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index f924b8b4ab6b..ab1d21d63a03 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -544,7 +544,8 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
  * Optional pinning of buffers is handled at dma-buf attach and detach tim=
e in
  * drm_gem_map_attach() and drm_gem_map_detach(). Backing storage itself i=
s
  * handled by drm_gem_map_dma_buf() and drm_gem_unmap_dma_buf(), which rel=
ies on
- * &drm_gem_object_funcs.get_sg_table.
+ * &drm_gem_object_funcs.get_sg_table. If &drm_gem_object_funcs.get_sg_tab=
le is
+ * unimplemented, exports into another device are rejected.
  *
  * For kernel-internal access there's drm_gem_dmabuf_vmap() and
  * drm_gem_dmabuf_vunmap(). Userspace mmap support is provided by
@@ -583,6 +584,9 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 {
 =09struct drm_gem_object *obj =3D dma_buf->priv;
=20
+=09if (!obj->funcs->get_sg_table)
+=09=09return -EOPNOTSUPP;
+
 =09return drm_gem_pin(obj);
 }
 EXPORT_SYMBOL(drm_gem_map_attach);
--=20
2.39.2


