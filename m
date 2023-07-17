Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66E755F3D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5110E0A2;
	Mon, 17 Jul 2023 09:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD310E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:30:47 +0000 (UTC)
Date: Mon, 17 Jul 2023 09:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689586244; x=1689845444;
 bh=n7ThSZ6k3SR8oW5Lqu85xzl5msebPob3gQhGQxs/UmE=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=XaLAyYRArdvCIYjtwltza5JTi8ZSvuUkVI9PDJ+ukVwGZn5OznqazrA0tSu0fPgUZ
 9OiGImCP/qAVjgRStU/Y9K+3yoRuymEw1Zqfn1A4vzWY2CXG/AsXnnlfLrTnz3xQVl
 Q+Qy4QzBNHrQOEhNhfFpJrTeElBEubWWPZTCJiMz7eGyJA6BbjAj5MQ0fPMTSBOpOB
 Rq07Avuqxr4MHwwFmN7G1WXmjMqp4+ZxUTmo/kEPN/a4zJauvlHdHYTuSWsIS1nFLa
 FGwp75KrmR7PdeyAZ0/vdG33dluMoTL53lzfIW2Jm9Yl55wYlRlk9zOH2eVdgirirR
 tHTqeHvPwLzAA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: document drm_event and its types
Message-ID: <20230717093032.600773-1-contact@emersion.fr>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert struct drm_event to a kernel doc comment. Link to the
generic DRM event types. Add a basic description of each event
type.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm.h | 45 ++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index a87bbbbca2d4..7cc6bf9bec43 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1180,25 +1180,50 @@ extern "C" {
 #define DRM_COMMAND_BASE                0x40
 #define DRM_COMMAND_END=09=09=090xA0
=20
-/*
- * Header for events written back to userspace on the drm fd.  The
- * type defines the type of event, the length specifies the total
- * length of the event (including the header), and user_data is
- * typically a 64 bit value passed with the ioctl that triggered the
- * event.  A read on the drm fd will always only return complete
- * events, that is, if for example the read buffer is 100 bytes, and
- * there are two 64 byte events pending, only one will be returned.
+/**
+ * struct drm_event - Header for DRM events
+ * @type: event type.
+ * @length: total number of payload bytes (including header).
  *
- * Event types 0 - 0x7fffffff are generic drm events, 0x80000000 and
- * up are chipset specific.
+ * This struct is a header for events written back to user-space on the DR=
M FD.
+ * A read on the DRM FD will always only return complete events: e.g. if t=
he
+ * read buffer is 100 bytes large and there are two 64 byte events pending=
,
+ * only one will be returned.
+ *
+ * Event types 0 - 0x7fffffff are generic DRM events, 0x80000000 and
+ * up are chipset specific. Generic DRM events include &DRM_EVENT_VBLANK,
+ * &DRM_EVENT_FLIP_COMPLETE and &DRM_EVENT_CRTC_SEQUENCE.
  */
 struct drm_event {
 =09__u32 type;
 =09__u32 length;
 };
=20
+/**
+ * DRM_EVENT_VBLANK - vertical blanking event
+ *
+ * This event is sent in response to &DRM_IOCTL_WAIT_VBLANK with the
+ * &_DRM_VBLANK_EVENT flag set.
+ *
+ * The event payload is a struct drm_event_vblank.
+ */
 #define DRM_EVENT_VBLANK 0x01
+/**
+ * DRM_EVENT_FLIP_COMPLETE - page-flip completion event
+ *
+ * This event is sent in response to an atomic commit or legacy page-flip =
with
+ * the &DRM_MODE_PAGE_FLIP_EVENT flag set.
+ *
+ * The event payload is a struct drm_event_vblank.
+ */
 #define DRM_EVENT_FLIP_COMPLETE 0x02
+/**
+ * DRM_EVENT_CRTC_SEQUENCE - CRTC sequence event
+ *
+ * This event is sent in response to &DRM_IOCTL_CRTC_QUEUE_SEQUENCE.
+ *
+ * The event payload is a struct drm_event_crtc_sequence.
+ */
 #define DRM_EVENT_CRTC_SEQUENCE=090x03
=20
 struct drm_event_vblank {
--=20
2.41.0


