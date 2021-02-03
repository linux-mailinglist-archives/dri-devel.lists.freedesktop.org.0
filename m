Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579D30D9F8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 13:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7436EA90;
	Wed,  3 Feb 2021 12:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3B6EA90;
 Wed,  3 Feb 2021 12:42:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EA87AD57;
 Wed,  3 Feb 2021 12:42:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/amd/display: Fix the brightness read via aux
Date: Wed,  3 Feb 2021 13:42:40 +0100
Message-Id: <20210203124241.8512-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203124241.8512-1-tiwai@suse.de>
References: <20210203124241.8512-1-tiwai@suse.de>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code tries to read the brightness value via
dc_link_get_backlight_level() no matter whether it's controlled via
aux or not, and this results in a bogus value returned.
Fix it to read the current value via
dc_link_get_backlight_level_nits() for the aux.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1180749
BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1438
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c6da89df055d..fb62886ae013 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3140,6 +3140,16 @@ static int set_backlight_via_aux(struct dc_link *link, uint32_t brightness)
 	return rc ? 0 : 1;
 }
 
+static int get_backlight_via_aux(struct dc_link *link)
+{
+	uint32_t avg, peak;
+
+	if (!link ||
+	    !dc_link_get_backlight_level_nits(link, &avg, &peak))
+		return DC_ERROR_UNEXPECTED;
+	return avg;
+}
+
 static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
 				unsigned *min, unsigned *max)
 {
@@ -3212,8 +3222,13 @@ static int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
 static int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct amdgpu_display_manager *dm = bl_get_data(bd);
-	int ret = dc_link_get_backlight_level(dm->backlight_link);
+	struct dc_link *link = (struct dc_link *)dm->backlight_link;
+	int ret;
 
+	if (dm->backlight_caps.aux_support)
+		ret = get_backlight_via_aux(link);
+	else
+		ret = dc_link_get_backlight_level(link);
 	if (ret == DC_ERROR_UNEXPECTED)
 		return bd->props.brightness;
 	return convert_brightness_to_user(&dm->backlight_caps, ret);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
