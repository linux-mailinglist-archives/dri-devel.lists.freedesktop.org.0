Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E97E647B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6279B10E1CF;
	Thu,  9 Nov 2023 07:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4099D10E1C5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:53 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 919B28CD;
 Thu,  9 Nov 2023 08:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515510;
 bh=+jaNPtduetcEvhSP7u6BC4egR5EmPv/b6uS08H/KztU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AsVZ7pcctQSiPyOw0SEvmSJkLI4kp0LZnRuQsCOhHeDnWLar5vqsjrMgqtxLgy2LD
 syDzZ+6TmaE5dPeJO7ySe96MzYnj3jvUkXjCNBMF36+mLChbrxs5g1JwXaTGFHcgeV
 gESZKz351l0kxkuKKADDHd9QT9h30hwJ2Uxqu7cg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:38:04 +0200
Subject: [PATCH v2 11/11] drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-11-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+jaNPtduetcEvhSP7u6BC4egR5EmPv/b6uS08H/KztU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIyBOL8n/raVGNTFxAt6t4oVrY3lRU98v9mD6
 wDphIwh4YWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMgQAKCRD6PaqMvJYe
 9XUvD/9JzEs7/j+qn0lz37oFW98QMakrkW9ly9/P/8fIlKNfmLjm6XaxkaldaDArWfd3nPy2bjK
 Td/Xz2a0t3opx9NcyDkuyaBYrkOkGsmY6XnB/Ik8hrE8On5C4V9OC/aXY30Ly0NZzgCom2NhV4C
 lR1JDRV7oJvzOe2GQ5Zr6z9UqnkLH0q+mHMVmXJ/o9D+nA9MlPpCYmgNKHQJFsfrLuQdGOaszvT
 YyQL3q78Ro+5OavI892p7olYrAd2/LmFkRstTzf8l3CGPb1VZFzFM4sHH3NoHycsGPA1Lbvje9u
 8/ISjpjSmNzihCIbJrnzVgW/Sl5jyRN1sovgwE1bbBrOtfyxFejfhWwHNSSa3IRfaU2B4qIKDeh
 E6lwQe0Ws33WsXhDQJvJ2BQFYIzfyNu5ND5R3UvMCOlStvlTcy/1KuynTrbZeDfznLoAfqMHRYC
 a5NCD6b+df4PoownUg+NQteSkWko6Y3DghpRGfwHClpm3b5qqeNSl/0Xqa1kMRzUoSDif4Alfx3
 xJDqMnt6cZZ13aPChj/deHRL3KpVDLqNfqWF3sA1HqViwjXG52KOI4/cxgZ6fdbzoYOHbwciHVu
 kMKfsNCtGlEOiCg3TkrbeRib6hvqC+gSApbfKGpMoM979GQIv2a2qQaM9tU0dmrXSV/wdDYiJPQ
 zj8HTwyz3y48EGA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the moment the driver does not use DRM_PLANE_COMMIT_ACTIVE_ONLY, but
still checks for crtc->state->active in tidss_crtc_atomic_flush(), and
skips the flush if the crtc is not active.

The exact reason why DRM_PLANE_COMMIT_ACTIVE_ONLY is not used has been
lost in history. DRM_PLANE_COMMIT_ACTIVE_ONLY does also affect the plane
updates, and I think the issue was related to multi-display systems and
moving planes between the displays. However, it is possible the issue
was only present on the older DSS hardware, handled by the omapdrm
driver (on which the tidss driver is loosely based).

Reviewing the code related to DRM_PLANE_COMMIT_ACTIVE_ONLY does not show
any issues, and testing on J7 EVM with two displays works fine.

Change the driver to use DRM_PLANE_COMMIT_ACTIVE_ONLY.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 4 ----
 drivers/gpu/drm/tidss/tidss_kms.c  | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 7c78c074e3a2..5f838980c7a1 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -174,10 +174,6 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 		drm_atomic_crtc_needs_modeset(crtc->state) ? "needs" : "doesn't need",
 		crtc->state->event);
 
-	/* There is nothing to do if CRTC is not going to be enabled. */
-	if (!crtc->state->active)
-		return;
-
 	/*
 	 * Flush CRTC changes with go bit only if new modeset is not
 	 * coming, so CRTC is enabled trough out the commit.
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index d096d8d2bc8f..a0e494c806a9 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -29,7 +29,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 	tidss_runtime_get(tidss);
 
 	drm_atomic_helper_commit_modeset_disables(ddev, old_state);
-	drm_atomic_helper_commit_planes(ddev, old_state, 0);
+	drm_atomic_helper_commit_planes(ddev, old_state, DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);

-- 
2.34.1

