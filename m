Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E73A87B26
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A1310E4EF;
	Mon, 14 Apr 2025 08:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="HjMkixnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D9710E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744621021; x=1744880221;
 bh=TvkVY4A11Ky4AInNyJMcsXNiwfKw52Njv39xoQElgOA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=HjMkixnrGbqKTgJwYJebo4W9/n/yVrxsI4gcrKLSNqxaHf1xcS2pN3WfxxeG9hAFk
 TjgXH1m0ev98fdyUVQgCtmFVHAMdUtm27pZIUxtTEPDM+iQY8KyXqc8vkrLOEVL1XV
 jz0ZgjqOzt1/yv4cZv9fNIbtV3BXsX2E1wV3Ag5BMHsbYsupBHjbbS9UQwRBEx/geu
 VjNCZwnOGyaxD94BunttKwzjT7Htjc85M9hkKfLuaNImI7BvuWDgPqYvPk5PczsgZ9
 fZfBcq7jUl22vrKfChRYls1HXQJ6nm2Mnhr0+Hlx1OMMcH1jOGfeZApRLFMZRsYWNz
 T7CB/ghamILjQ==
Date: Mon, 14 Apr 2025 08:56:56 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <20250414085652.43904-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 1e57691d9024a475234a0e72201fa9c23ca447f0
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

Explain how to perform front-buffer rendering.

v2: apply Pekka's rewrite

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_blend.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..4e83f372ea51 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -75,6 +75,12 @@
  * =09the currently visible vertical area of the &drm_crtc.
  * FB_ID:
  * =09Mode object ID of the &drm_framebuffer this plane should scan out.
+ *
+ *=09When a KMS client is perfoming front-buffer rendering, it should set
+ *=09FB_ID to the same front-buffer FB on each atomic commit. This implies
+ *=09to the driver that it needs to re-read the same FB again. Otherwise
+ *=09drivers which do not employ continuously repeated scanout cycles migh=
t
+ *=09not update the screen.
  * CRTC_ID:
  * =09Mode object ID of the &drm_crtc this plane should be connected to.
  *
--=20
2.49.0


