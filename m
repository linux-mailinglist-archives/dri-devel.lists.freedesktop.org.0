Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5BCB3FA94
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEFB10E61C;
	Tue,  2 Sep 2025 09:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FS3rnlSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355410E622
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B85260210;
 Tue,  2 Sep 2025 09:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B626EC4CEF7;
 Tue,  2 Sep 2025 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805745;
 bh=2raMrWvKmV9wpzsUSqMytUKVoolekxak9NtjeUuvoMk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FS3rnlSsImpJG+Wp/GHcOVTH69tiqeINd2ZVe4YlCm6prqU1XRdt7t0vSSxsLrHvY
 d2x+/TRJbchjlsK4wtYSUnW5GnPPYoivJXg7w6kG7N10p03Z96mEZst1HJ3bSqyqys
 WYXPGpqVN4FpCWTC4Ihv0WpUAmiT44QUIQIraslC66q34GZGhlt4jS0ySN9hRVunfA
 eQuRVFH0EwCsnvU9a0nlXLa1kpo6twznoU7psCls4CT6Jt1q3TVaNfgc6p7UXCN6+b
 kjJS8xZs87YtM4rfdRFF6OK3PpK3Vho9RFC8l0dCznIS3JuTRl1kc3ss3xfzJ77wsn
 +1Ljke9S8HEBw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:06 +0200
Subject: [PATCH v2 07/37] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-7-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2raMrWvKmV9wpzsUSqMytUKVoolekxak9NtjeUuvoMk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvkFJbY4X98Wf/tD2gPXB3/C8h0/HrvDb9VWOGn/j
 /a207bTOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEOrIZGyZuaPmwffbBhEhJ
 1ugKj51XdDa8D1m81TygudXFXWoF06x1aqfKa2q2/oqc5nMmduExNcaGU5m2P8+Ub13070KTZ+P
 Xm/Vn5n5mN91al/hczeT5utjc6qgq5bA7ys1q7GWL9k06wOMIAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

In the tilcdc_crtc_atomic_check(), the tilcdc driver hand-crafts its own
implementation of drm_atomic_helper_check_crtc_primary_plane(). And it
does so by accessing the state pointer in drm_atomic_state->planes which
is deprecated.

Let's use the right helper here.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e72ae8ec0f3f4e5e85bc5004e6e5b..5718d9d83a49f38081aabbc9860847bdc83cf773 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -674,18 +674,11 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	/* If we are not active we don't care */
 	if (!crtc_state->active)
 		return 0;
 
-	if (state->planes[0].ptr != crtc->primary ||
-	    state->planes[0].state == NULL ||
-	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
-		return -EINVAL;
-	}
-
-	return 0;
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 }
 
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);

-- 
2.50.1

