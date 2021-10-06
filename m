Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46C424127
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DDB6E550;
	Wed,  6 Oct 2021 15:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF46E550
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 15:19:39 +0000 (UTC)
Date: Wed, 06 Oct 2021 15:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633533576;
 bh=IlqtNhdaO8cZ/qn4ZXnzlyd0yvsCx815ogXEnwm1pso=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=vubZtN0vmy0ecSDZhbKr7GyveDwpkGK/pogMoY+xchJbvs5KyOuvGWEipkTqbdjAO
 x98FMA4W7/QUZpIJLVstDil3p/cn6wnpOjv8dKFPiSNFqdjKxsXg4VoIDTST/+gVFT
 jXEU8USTnDi7qaOhmZDVg6GrL85KG+YRKtdBvPCpYMxVRsuaud8fqX507lLD7KDcoq
 Q2Yl1uR78RvUgyBQQen0kM5SZJsPn6/+qMJmT/JVfulUTSt7l0CDJjmlAJHfeG6SVE
 3FPJcG5A8XL5q07zuKVxxK5F9xB/OzRqC9M7iqDYU0xbrrrhG3V/bqUZoOpxkaJwaW
 /1ll3LrOSt/xQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>,
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: [PATCH RFC] drm: introduce DRM_MODE_FB_PERSIST
Message-ID: <20211006151921.312714-1-contact@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new ADDFB2 flag allows callers to mark a framebuffer as
"persistent", and no longer have RMFB semantics when the DRM
file is closed.

[1]: https://lore.kernel.org/dri-devel/YTJypepF1Hpc2YYT@reader/

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dennis Filder <d.filder@web.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---

I'm not sure this is enough, but posting this to get initial
feedback and allow to start e.g. Plymouth experiments. I'll
follow up with an IGT test soon.

 drivers/gpu/drm/drm_framebuffer.c |  6 ++++--
 include/uapi/drm/drm_mode.h       | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 07f5abc875e9..9b398838e1f4 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -292,7 +292,8 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 =09struct drm_framebuffer *fb;
 =09int ret;
=20
-=09if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS)) {
+=09if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS |
+=09=09=09 DRM_MODE_FB_PERSIST)) {
 =09=09DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flags);
 =09=09return ERR_PTR(-EINVAL);
 =09}
@@ -789,7 +790,8 @@ void drm_fb_release(struct drm_file *priv)
 =09 * at it any more.
 =09 */
 =09list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
-=09=09if (drm_framebuffer_read_refcount(fb) > 1) {
+=09=09if (drm_framebuffer_read_refcount(fb) > 1 &&
+=09=09    !(fb->flags & DRM_MODE_FB_PERSIST)) {
 =09=09=09list_move_tail(&fb->filp_head, &arg.fbs);
 =09=09} else {
 =09=09=09list_del_init(&fb->filp_head);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e1e351682872..c7a7089ec31e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -662,6 +662,21 @@ struct drm_mode_fb_cmd {
=20
 #define DRM_MODE_FB_INTERLACED=09(1<<0) /* for interlaced framebuffers */
 #define DRM_MODE_FB_MODIFIERS=09(1<<1) /* enables ->modifer[] */
+/**
+ * DRM_MODE_FB_PERSIST
+ *
+ * DRM framebuffers are normally implicitly removed when their owner close=
s the
+ * DRM FD. Passing this flag will make the framebuffer persistent: it will=
 not
+ * be implicitly removed. This is useful to implement flicker-free transit=
ions
+ * between two processes.
+ *
+ * This flag doesn't change the behavior of &DRM_IOCTL_MODE_RMFB.
+ *
+ * User-space should ensure the framebuffer doesn't expose any sensitive u=
ser
+ * information: persistent framebuffers can be read back by the next DRM
+ * master.
+ */
+#define DRM_MODE_FB_PERSIST (1 << 2)
=20
 struct drm_mode_fb_cmd2 {
 =09__u32 fb_id;
--=20
2.33.0


