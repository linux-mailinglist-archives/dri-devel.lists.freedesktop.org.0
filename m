Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D342DB489
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C52289CFA;
	Tue, 15 Dec 2020 19:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1D7894D7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:38:07 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76B1EAD5;
 Tue, 15 Dec 2020 20:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608061085;
 bh=XqWEIalu+0avQbstRGzf01y7Jwl+uJ5jOg6Pc5Fqvww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jlu4knIyKWeh5ttEktaE1tJIT9gYgVaAaz0CaDaVB88By600z8w7E6CoVUp8zfXt1
 pYMvPqRDxXOQW0TDxFPJJhjq8pp88E4xX38Kuk5AvVIMz3VReMnLMaVPSjE6J3AX6Z
 sHVyfxDxfwSMls1SjtbqSLrc7Pk8Bx9wXVzdjY1E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm: sti: Remove unnecessary drm_plane_cleanup() wrapper
Date: Tue, 15 Dec 2020 21:37:53 +0200
Message-Id: <20201215193755.26160-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_plane_cleanup() function directly as the drm_plane_funcs
.destroy() handler without creating an unnecessary wrapper around it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/sti/sti_cursor.c | 9 +--------
 drivers/gpu/drm/sti/sti_gdp.c    | 9 +--------
 drivers/gpu/drm/sti/sti_hqvdp.c  | 9 +--------
 3 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index a98057431023..7476301d7142 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -330,13 +330,6 @@ static const struct drm_plane_helper_funcs sti_cursor_helpers_funcs = {
 	.atomic_disable = sti_cursor_atomic_disable,
 };
 
-static void sti_cursor_destroy(struct drm_plane *drm_plane)
-{
-	DRM_DEBUG_DRIVER("\n");
-
-	drm_plane_cleanup(drm_plane);
-}
-
 static int sti_cursor_late_register(struct drm_plane *drm_plane)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
@@ -350,7 +343,7 @@ static int sti_cursor_late_register(struct drm_plane *drm_plane)
 static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = sti_cursor_destroy,
+	.destroy = drm_plane_cleanup,
 	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 2d5a2b5b78b8..2f4a34f14d33 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -884,13 +884,6 @@ static const struct drm_plane_helper_funcs sti_gdp_helpers_funcs = {
 	.atomic_disable = sti_gdp_atomic_disable,
 };
 
-static void sti_gdp_destroy(struct drm_plane *drm_plane)
-{
-	DRM_DEBUG_DRIVER("\n");
-
-	drm_plane_cleanup(drm_plane);
-}
-
 static int sti_gdp_late_register(struct drm_plane *drm_plane)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
@@ -902,7 +895,7 @@ static int sti_gdp_late_register(struct drm_plane *drm_plane)
 static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = sti_gdp_destroy,
+	.destroy = drm_plane_cleanup,
 	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 5a4e12194a77..62f824cd5f21 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1262,13 +1262,6 @@ static const struct drm_plane_helper_funcs sti_hqvdp_helpers_funcs = {
 	.atomic_disable = sti_hqvdp_atomic_disable,
 };
 
-static void sti_hqvdp_destroy(struct drm_plane *drm_plane)
-{
-	DRM_DEBUG_DRIVER("\n");
-
-	drm_plane_cleanup(drm_plane);
-}
-
 static int sti_hqvdp_late_register(struct drm_plane *drm_plane)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
@@ -1282,7 +1275,7 @@ static int sti_hqvdp_late_register(struct drm_plane *drm_plane)
 static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = sti_hqvdp_destroy,
+	.destroy = drm_plane_cleanup,
 	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
