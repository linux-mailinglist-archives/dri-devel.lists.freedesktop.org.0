Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721BC697C03
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 13:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BF110E0B9;
	Wed, 15 Feb 2023 12:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E855410E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 12:42:06 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676464925; x=1676724125;
 bh=fvWmFsstnS/hDMPUuFyRqqOU2v5dPBuovP7aN0h0SfA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=gy5P87cNu+91+MrZD4+I/20xyZkJTXXpM5QIGJ5H7WILTcUd/R6u9Jlxo0p3eePbo
 3tJzLo/I2xVeqPNt9IZvp454OmcpUDwoN+Jx2GR1q5r7zEgBzekLjYZaX0nwMLBUvJ
 EyUnO688IijWGPxE4L9TZUiZFxF/Xa61AV6Qagvr3jwRZj5ikjbGvmcB+DB2JY3J1U
 DEWjUd7mvrezE4Z8VvdYwpsZ8c7XFLxx12WRY3DZa6SvmOK7HcznVq+77Br+rfcsEX
 IGu803MBj2XVNpKfCrpNU/KEsQ3YQ8jxsi47C9hjcVaBd10VzhsaqgZH1N8NPEG577
 WU8z8thPqIvjg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <20230215124152.101548-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two important details missing from the docs:

- If the memory object backing the FB already has a GEM handle,
  it's not re-used, a new one is generated.
- Aliased planes will return the same GEM handle.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..4cb956a52aee 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1104,8 +1104,13 @@ extern "C" {
  * struct as the output.
  *
  * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.ha=
ndles
- * will be filled with GEM buffer handles. Planes are valid until one has =
a
- * zero handle -- this can be used to compute the number of planes.
+ * will be filled with GEM buffer handles. Fresh new GEM handles are alway=
s
+ * returned, even if another GEM handle referring to the same memory objec=
t
+ * already exists on the DRM file description. The caller is responsible f=
or
+ * removing the new handles, e.g. via the &DRM_IOCTL_GEM_CLOSE IOCTL. The =
same
+ * new handle will be returned for multiple planes in case they use the sa=
me
+ * memory object. Planes are valid until one has a zero handle -- this can=
 be
+ * used to compute the number of planes.
  *
  * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are vali=
d
  * until one has a zero &drm_mode_fb_cmd2.pitches.
--=20
2.39.1


