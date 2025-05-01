Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404AAA5DBF
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 13:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4D810E35B;
	Thu,  1 May 2025 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="N1OfIi9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5748610E35B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1746098994; x=1746358194;
 bh=pIc8t48NzaRbE4eQcTyKjS4UpCCbhYwNB4PvrCkXYyM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=N1OfIi9IFBF+P/xnkPYJyr14UbYpq9mQDbzSiVIuh35UoOnL+Y8UZpLkOpVUEiKb+
 UATqX6ISdbPvGFDL7FvS+gGXUCb6OM1A30lbIVh9aSqCdPtyJ3cTTe/ENksReQxYe4
 cHeMNS+IRiUvdF07HPYOS44dxEIUqwl5MQNBl/U4BpPAFmrSzHLwFSPlT1NLjMyYme
 8WcGrahCT5IrozTxpiZdOLDZaWwsRGjL9rrhp8L1cclZMYxnEazlHfY3skMTLx/CoM
 KrN83ZC1A+ALHuc8k1KILi8MWD6f1aeeXKyeI0JZkLTWgC1K+YXzSuozSKzN0apMvT
 Jk8bIugHiIwxw==
Date: Thu, 01 May 2025 11:29:51 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v2] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <20250501112945.6448-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: e09a4b3027d4b414d1bfe074c1bd8f8130f592c6
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
Document requirements for using this flag and how to request an
event for a CRTC.

Note, because prepare_signaling() runs right after
drm_atomic_set_property() calls, page-flip events are not delivered
for CRTCs pulled in later by DRM core (e.g. on modeset by
drm_atomic_helper_check_modeset()) or the driver (e.g. other CRTCs
sharing a DP-MST connector).

v2: fix cut off sentence in commit message (Pekka)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: David Turner <david.turner@raspberrypi.com>
Cc: Daniel Stone <daniel@fooishbar.org>
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
2.49.0


