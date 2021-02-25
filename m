Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023C3251DD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4506E1BA;
	Thu, 25 Feb 2021 15:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55736E1BA;
 Thu, 25 Feb 2021 15:01:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB3B764EC3;
 Thu, 25 Feb 2021 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614265288;
 bh=rTp6tlRl/+2dDCi+5gBT4LR+IqVuF5cDPLNiC8PJHgk=;
 h=From:To:Cc:Subject:Date:From;
 b=jYFhNaZbbSoTDYljzbyuXXwgaGElH7/NWFsFNQhQ0ZoAdxEgpmjKWwUUu1s2Fli55
 9FL9kT4HbFgnoCICaopvKBMhYoCiXfOXBFuMEVE8k6Q84QY9hsCwa5yJHoyViq4v1X
 EX7tPknLeA2y0OW0L5A8mWn1P2bv6+vBhgqELGcPZG8j6su4kf+Kg+/L96oO+quyl6
 71p38s+XZbNuKnAKIhqqAX3KgeM5DPUWGgkFGbfSeHNJLnPQuoalrJrn6A57tV3ngW
 iaX1C009z+deiIsRBEnQ0n2G5zZ2RRY5moTt6Lf/Fvl81G5WA1QbJOXFi9UVJXZlmp
 eWEboNG471QWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: Fix an uninitialized index variable
Date: Thu, 25 Feb 2021 16:01:02 +0100
Message-Id: <20210225150119.405469-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang points out that the new logic uses an always-uninitialized
array index:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9810:38: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                        timing  = &edid->detailed_timings[i];
                                                          ^
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9720:7: note: initialize the variable 'i' to silence this warning

My best guess is that the index should have been returned by the
parse_hdmi_amd_vsdb() function that walks an array here, so do that.

Fixes: f9b4f20c4777 ("drm/amd/display: Add Freesync HDMI support to DM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b19b93c74bae..667c0d52dbfa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9736,7 +9736,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 	return false;
 }
 
-static bool parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
+static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	uint8_t *edid_ext = NULL;
@@ -9746,7 +9746,7 @@ static bool parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	/*----- drm_find_cea_extension() -----*/
 	/* No EDID or EDID extensions */
 	if (edid == NULL || edid->extensions == 0)
-		return false;
+		return -ENODEV;
 
 	/* Find CEA extension */
 	for (i = 0; i < edid->extensions; i++) {
@@ -9756,14 +9756,15 @@ static bool parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 	}
 
 	if (i == edid->extensions)
-		return false;
+		return -ENODEV;
 
 	/*----- cea_db_offsets() -----*/
 	if (edid_ext[0] != CEA_EXT)
-		return false;
+		return -ENODEV;
 
 	valid_vsdb_found = parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, vsdb_info);
-	return valid_vsdb_found;
+
+	return valid_vsdb_found ? i : -ENODEV;
 }
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
@@ -9781,7 +9782,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	bool freesync_capable = false;
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
-	bool hdmi_valid_vsdb_found = false;
 
 	if (!connector->state) {
 		DRM_ERROR("%s - Connector has no state", __func__);
@@ -9857,8 +9857,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			}
 		}
 	} else if (edid && amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		hdmi_valid_vsdb_found = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (hdmi_valid_vsdb_found && vsdb_info.freesync_supported) {
+		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
+		if (i >= 0 && vsdb_info.freesync_supported) {
 			timing  = &edid->detailed_timings[i];
 			data    = &timing->data.other_data;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
