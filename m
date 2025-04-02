Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B16A79396
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30FD10E7F2;
	Wed,  2 Apr 2025 17:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE3B10E7F2;
 Wed,  2 Apr 2025 17:04:24 +0000 (UTC)
Received: from fedori.lan (51b692a2.dsl.pool.telekom.hu
 [::ffff:81.182.146.162]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 0000000000080D7C.0000000067ED6E16.0008406E; Wed, 02 Apr 2025 19:04:21 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] drm/amd/display: do not copy invalid CRTC timing info
Date: Wed,  2 Apr 2025 19:03:31 +0200
Message-ID: <24439c13a014e1cd200785db6f3dcf08f4773eb3.1743612701.git.soyer@irl.hu>
X-Mailer: git-send-email 2.49.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
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

Since b255ce4388e0, it is possible that the CRTC timing
information for the preferred mode has not yet been
calculated while amdgpu_dm_connector_mode_valid() is running.

In this case use the CRTC timing information of the actual mode.

Fixes: b255ce4388e0 ("drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()")
Closes: https://lore.kernel.org/all/ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu/
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4085
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bae83a129b5f..0eb25cdcb52f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6500,12 +6500,12 @@ decide_crtc_timing_for_drm_display_mode(struct drm_display_mode *drm_mode,
 					const struct drm_display_mode *native_mode,
 					bool scale_enabled)
 {
-	if (scale_enabled) {
-		copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
-	} else if (native_mode->clock == drm_mode->clock &&
-			native_mode->htotal == drm_mode->htotal &&
-			native_mode->vtotal == drm_mode->vtotal) {
-		copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
+	if (scale_enabled || (
+	    native_mode->clock == drm_mode->clock &&
+	    native_mode->htotal == drm_mode->htotal &&
+	    native_mode->vtotal == drm_mode->vtotal)) {
+		if (native_mode->crtc_clock)
+			copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
 	} else {
 		/* no scaling nor amdgpu inserted, no need to patch */
 	}
-- 
2.49.0

