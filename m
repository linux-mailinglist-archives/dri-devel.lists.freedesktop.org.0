Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F993285C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09110E72D;
	Tue, 16 Jul 2024 14:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vo0HOI/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329610E724;
 Tue, 16 Jul 2024 14:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F06160DF7;
 Tue, 16 Jul 2024 14:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443B1C4AF0E;
 Tue, 16 Jul 2024 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721139966;
 bh=Hz/o9nLTtk1iJp4WIbecjrvjZlLtRU2bXgXuq8bnBVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vo0HOI/KS4dja0kGJMxmitaRfeELD2y9eri6dLuEf2x5ETNUiE/uQnQpTNye8kGXh
 2rxLEhYICHvrJVf3J+kb+XHNHvwUyhJOXwzGZkQkb7XNdQcPT2bl+hAEPEKqsh2fca
 m/S34EUZTAo77yXXyQKbJ5X0ovajb6dPh1Cga0QXKwhCPkqV5BCO/8r2XbdOM6m6VB
 KIWEgiSrSNiQFworLQawRMqng3LC2UingyHQPW6GdKAQoQN84dEvmY47RsIJFv6Z1p
 BFdTm/FJmGnSzAjr2DaGVDUt3/GZwL1WCUL2hLorfaphsTAbU1a0CPm/ZmKhTD9ugv
 cUKPyGmxuCFhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Sun peng Li <sunpeng.li@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 joshua@froggi.es, wayne.lin@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 14/22] drm/amd/display: Fix refresh rate range for
 some panel
Date: Tue, 16 Jul 2024 10:24:21 -0400
Message-ID: <20240716142519.2712487-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142519.2712487-1-sashal@kernel.org>
References: <20240716142519.2712487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
Content-Transfer-Encoding: 8bit
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

From: Tom Chung <chiahsuan.chung@amd.com>

[ Upstream commit 9ef1548aeaa8858e7aee2152bf95cc71cdcd6dff ]

[Why]
Some of the panels does not have the refresh rate range info
in base EDID and only have the refresh rate range info in
DisplayID block.
It will cause the max/min freesync refresh rate set to 0.

[How]
Try to parse the refresh rate range info from DisplayID if the
max/min refresh rate is 0.

Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f43797e1c060..fc47d68877654 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11162,6 +11162,49 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 	return ret;
 }
 
+static void parse_edid_displayid_vrr(struct drm_connector *connector,
+		struct edid *edid)
+{
+	u8 *edid_ext = NULL;
+	int i;
+	int j = 0;
+	u16 min_vfreq;
+	u16 max_vfreq;
+
+	if (edid == NULL || edid->extensions == 0)
+		return;
+
+	/* Find DisplayID extension */
+	for (i = 0; i < edid->extensions; i++) {
+		edid_ext = (void *)(edid + (i + 1));
+		if (edid_ext[0] == DISPLAYID_EXT)
+			break;
+	}
+
+	if (edid_ext == NULL)
+		return;
+
+	while (j < EDID_LENGTH) {
+		/* Get dynamic video timing range from DisplayID if available */
+		if (EDID_LENGTH - j > 13 && edid_ext[j] == 0x25	&&
+		    (edid_ext[j+1] & 0xFE) == 0 && (edid_ext[j+2] == 9)) {
+			min_vfreq = edid_ext[j+9];
+			if (edid_ext[j+1] & 7)
+				max_vfreq = edid_ext[j+10] + ((edid_ext[j+11] & 3) << 8);
+			else
+				max_vfreq = edid_ext[j+10];
+
+			if (max_vfreq && min_vfreq) {
+				connector->display_info.monitor_range.max_vfreq = max_vfreq;
+				connector->display_info.monitor_range.min_vfreq = min_vfreq;
+
+				return;
+			}
+		}
+		j++;
+	}
+}
+
 static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
@@ -11283,6 +11326,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module)
 		goto update;
 
+	/* Some eDP panels only have the refresh rate range info in DisplayID */
+	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
+	     connector->display_info.monitor_range.max_vfreq == 0))
+		parse_edid_displayid_vrr(connector, edid);
+
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
 		bool edid_check_required = false;
-- 
2.43.0

