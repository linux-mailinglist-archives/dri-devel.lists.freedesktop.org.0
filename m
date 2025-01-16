Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79188A13F4A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 17:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34310E9C1;
	Thu, 16 Jan 2025 16:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="dyrrrvmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3710E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737044741; x=1737303941;
 bh=H7B666yZOAMUf9BEHZLBaTb06/RsgL8B4L/HyGdK19c=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=dyrrrvmrhrulbIbQb8h8r8wy63Qfy35GDVlsGlNb8lIhqaw8rU/RS6xPsvR/iItU7
 HAjQZCxfOu4ZkSvtAHREyWHxMjGQ85vgBj62gTUHkhAiI/pdv/1qDWZ+OiZEeBomia
 IsEmBjKQSpjJNaulrwPo/sAEUh3QQwRswwKq2nggMUinlU8KYXhlPHXYXC8MpWBQw3
 HiE6NKJpoDFr5FScCW7+poiUQTUFnEYTTI9PcSrurNi6P0LwXaVuwb3h3B1Eiv3swK
 AkcwaSBUUPenr6N5sEAc+bKPxo11BIhsag3A1wId70Ya/LC5iVNTIThW63C2Ekm5Md
 /PJ59Rtp4IoUw==
Date: Thu, 16 Jan 2025 16:25:35 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>
Subject: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <20250116162528.2235991-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: eec6c185f11e108b133fd6d75107012abbffb10f
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not obvious off-hand which CRTCs will get a page-flip event
when using this flag in an atomic commit, because it's all
implicitly implied based on the contents of the atomic commit.
Document requirements for using this flag and

Note, because prepare_signaling() runs right after
drm_atomic_set_property() calls, page-flip events are not delivered
for CRTCs pulled in later by DRM core (e.g. on modeset by
drm_atomic_helper_check_modeset()) or the driver (e.g. other CRTCs
sharing a DP-MST connector).

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: David Turner <david.turner@raspberrypi.com>
---
 include/uapi/drm/drm_mode.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..a122bea25593 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -962,6 +962,14 @@ struct hdr_output_metadata {
  * Request that the kernel sends back a vblank event (see
  * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when th=
e
  * page-flip is done.
+ *
+ * When used with atomic uAPI, one event will be delivered per CRTC includ=
ed in
+ * the atomic commit. A CRTC is included in an atomic commit if one of its
+ * properties is set, or if a property is set on a connector or plane link=
ed
+ * via the CRTC_ID property to the CRTC. At least one CRTC must be include=
d,
+ * and all pulled in CRTCs must be either previously or newly powered on (=
in
+ * other words, a powered off CRTC which stays off cannot be included in t=
he
+ * atomic commit).
  */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 /**
--=20
2.47.1


