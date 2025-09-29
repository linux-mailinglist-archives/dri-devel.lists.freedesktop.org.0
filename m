Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA526BAA2A8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEBA10E46E;
	Mon, 29 Sep 2025 17:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="R0XsjvQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Mon, 29 Sep 2025 04:38:04 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E2710E216
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:38:04 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250929042918epoutp01c92f583e71b6b3c76f9f2e82417d48a1~ppnbCbN6V0608606086epoutp01K
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250929042918epoutp01c92f583e71b6b3c76f9f2e82417d48a1~ppnbCbN6V0608606086epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759120158;
 bh=Y74o6IOjQgwfeEIGmmm1c1vskXSR4OXN85rOUOM1PX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0XsjvQO+w1Ywh/1MWZByziR5BfBr4OS6m4H5t/GbWJBGk96Xb/JCHvlf+g67jDlC
 d3EJbm23myQ3qL4Tf8Ls24OmhMo2avzGux+usuUDPXTdrfMJnnbeqx0Mvr4YvkijTT
 G0YjvAWsx3vMmqs9xaDfH0Dq+0Up3HB37e6Y3sJM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20250929042918epcas2p2580ef12c45a153d3b0312026dfaf0c63~ppnavDpyh1831418314epcas2p2S;
 Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.208]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9n5bpbz6B9mJ; Mon, 29 Sep
 2025 04:29:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4~ppnZ5GzZ60613506135epcas2p4p;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250929042917epsmtip1030b8011b124a863d36bf014cdf0ad72~ppnZ0uSI12522725227epsmtip1m;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
Date: Mon, 29 Sep 2025 13:31:08 +0900
Message-ID: <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
X-Mailman-Approved-At: Mon, 29 Sep 2025 17:28:00 +0000
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

Some configurations require additional actions when all windows are
disabled to keep DECON operating correctly. Programming a zero-sized window
in ->atomic_update() leaves the plane logically enabled and can bypass
those disable semantics.

Treat a fully off-screen plane as not visible and take the explicit disable
path.

Implementation details:
- exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mark
  state->visible = false and return early.
- exynos_plane_atomic_check(): if !visible, skip further checks and
  return 0.
- exynos_plane_atomic_update(): if !visible, call ->disable_plane();
  otherwise call ->update_plane().

No functional change for visible planes; off-screen planes are now cleanly
disabled, ensuring the disable hooks run consistently.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3..842974154d79 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
 	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
 
+	if (!actual_w || !actual_h) {
+		state->visible = false;
+		return;
+	}
+
 	if (crtc_x < 0) {
 		if (actual_w)
 			src_x += ((-crtc_x) * exynos_state->h_ratio) >> 16;
@@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
+	if (!new_plane_state->visible)
+		return 0;
+
 	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
 	if (ret)
 		return ret;
@@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc)
 		return;
 
-	if (exynos_crtc->ops->update_plane)
+	if (new_state->visible && exynos_crtc->ops->update_plane)
 		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
+	else if (exynos_crtc->ops->disable_plane)
+		exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane);
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
-- 
2.34.1

