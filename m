Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E644A9C8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 09:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2AA89D8E;
	Tue,  9 Nov 2021 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D10189D84
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 08:56:19 +0000 (UTC)
Date: Tue, 09 Nov 2021 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636448176;
 bh=h9g+TWBFwYPvz01TYa0i+9VGeS2AR7++zm5oaD617Qs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=xRQ+iV2gbF5P/otqkPPuFCnoamMpMCwxU5LeyewGEioY7gKM8FYstnWqDibnOeDnf
 7tCpThOqEvkIU8Kj8JL3m32K63L/ZQJ+qBaoAgvUxhQtU/r3c2DHPUcwps16PcECGL
 CJ1lrr87IMwnx07xv+/I2cVndk7xBPP4gJu5/jWQnF2ni9kBe2MubxSLnvEtCFw1Tn
 DFhIjHqjzlm/3LRETvG3eL6ZkmTUBXS8MK+Yq6dFh1qmuvZYDr4shETFivOFGvfwei
 vivUTaLh97Gk5DT/bsYBMH342+bqbuYSquMIX1w7U9lTE0XlbwkMwtKrSrVIqcdPfe
 c+4KEOlc6gLpw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <20211109085601.170275-1-contact@emersion.fr>
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

There are a few details specific to the GETFB2 IOCTL.

It's not immediately clear how user-space should check for the
number of planes. Suggest using the pitches field.

The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
So explicitly tell user-space to not look at it unless the flag is
set.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3b810b53ba8b..9809078b0f51 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1096,6 +1096,22 @@ extern "C" {
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
+ * If the client is not DRM master and doesn't have &CAP_SYS_ADMIN,
+ * &drm_mode_fb_cmd2.handles will be zeroed. Planes are valid until one ha=
s a
+ * zero &drm_mode_fb_cmd2.pitches -- this can be used to compute the numbe=
r of
+ * planes.
+ *
+ * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will b=
e set
+ * in &drm_mode_fb_cmd2.flags. Otherwise, &drm_mode_fb_cmd2.modifier has
+ * undefined contents.
+ */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
 /*
--=20
2.33.1


