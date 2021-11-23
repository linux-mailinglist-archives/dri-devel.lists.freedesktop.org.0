Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD945A158
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 12:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F06E9D3;
	Tue, 23 Nov 2021 11:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98646E9D3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 11:24:14 +0000 (UTC)
Date: Tue, 23 Nov 2021 11:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1637666652;
 bh=EWmpO2cdedDq2vEp83KEqXRJ8FBgJXpZ+8PtXjmQL5U=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=yCeLgmWFeyAXWYv3EeeVwuQaRyzrcc9K6NH3xCITETC+dbOlPusljgV3k4Xx+XonM
 mllJZ15h8dJK60T3+4PblQARVo5UpoMlHH74s5aWxFQmnbs8eZ5JOuGl9YmWZgEKZL
 N8wO5LED6nJXeA+L9/BQscy1qbYGzBvNko8xmlM4d1E223O9/R8SP7gjMnbbzUX8Ro
 giOFTmZhGcnD0Fh4WY/YSYc8qHb+nUqmAYU7b8CfJWGdZIYiRmYBeP3+GATmp+agHY
 +GTqOtNhDX7q+r55jLa/Ga+xcOHdFc9oSJBDxxpvOu8gShMTb/S3iI249UdhhR7JjH
 tYxrGz4T+ylyQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <20211123112400.22245-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a few details specific to the GETFB2 IOCTL.

It's not immediately clear how user-space should check for the
number of planes. Suggest using the handles field or the pitches
field.

The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
So explicitly tell user-space to not look at it unless the flag is
set.

Changes in v2 (Daniel):
- Mention that handles should be used to compute the number of planes,
  and only refer to pitches as a fallback.
- Reword bit about undefined modifier.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3b810b53ba8b..642808520d92 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1096,6 +1096,24 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
=20
+/**
+ * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
+ *
+ * This queries metadata about a framebuffer. User-space fills
+ * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of=
 the
+ * struct as the output.
+ *
+ * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.ha=
ndles
+ * will be filled with GEM buffer handles. Planes are valid until one has =
a
+ * zero handle -- this can be used to compute the number of planes.
+ *
+ * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are vali=
d
+ * until one has a zero &drm_mode_fb_cmd2.pitches.
+ *
+ * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will b=
e set
+ * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will contain =
the
+ * modifier. Otherwise, user-space must ignore &drm_mode_fb_cmd2.modifier.
+ */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
 /*
--=20
2.34.0


