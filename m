Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E778569B0B7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EBE10F05A;
	Fri, 17 Feb 2023 16:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51110F05A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 16:22:10 +0000 (UTC)
Date: Fri, 17 Feb 2023 16:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676650927; x=1676910127;
 bh=GJhxh3YzJJGLmpUI0Qp54119ychTvTcmQCg/QIpG7h8=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=UVm428z42T+2/F4ZQRkljkn0Tl4sER/EFiq1eKN2j7boNyF8IzSd+A4WZmFDPMYuR
 gQaPX8uJfNgqvtEg44jylRwfQkA1ZiZppMMmSLo7s1QBji2o6Yfk6BMpoPQfL+ECdr
 9hizCfsdYKf4jmExg8kUuilgjAfrh6q20Q7Th3Q5kP+9tA3B9pakrbJ1/ID+h3nC6a
 QZX2X4Gg2M1TgjaUyJa0cJlDBEOuPZLPvIp8ea5nvQz3KibfzMdXTfpRhHbADxm/gW
 0h/IDa88U1y3GrRz+3oePYZW3GholDpgpMlN+n4jLau5oC3ECOnE68wTv9Q0bGwx0l
 /812A8VYxhC0w==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/2] drm: document expectations for GETFB2 handles
Message-ID: <20230217162151.59996-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two important details missing from the docs:

- If the memory object backing the FB already has a GEM handle,
  it's not re-used, a new one is generated.
- Aliased planes will return the same GEM handle.

v2: document how user-space can obtain DMA-BUF FDs without leaking
handles (Pekka)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index c39fefb54613..292e4778a2f4 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1117,8 +1117,13 @@ extern "C" {
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
@@ -1126,6 +1131,11 @@ extern "C" {
  * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will b=
e set
  * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will contain =
the
  * modifier. Otherwise, user-space must ignore &drm_mode_fb_cmd2.modifier.
+ *
+ * To obtain DMA-BUF FDs for each plane without leaking GEM handles, user-=
space
+ * can export each handle via &DRM_IOCTL_PRIME_HANDLE_TO_FD, then immediat=
ely
+ * close each unique handle via &DRM_IOCTL_GEM_CLOSE, making sure to not
+ * double-close handles which are specified multiple times in the array.
  */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
--=20
2.39.2


