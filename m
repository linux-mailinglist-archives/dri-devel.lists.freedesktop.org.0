Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5AA202BE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 01:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3310E26F;
	Tue, 28 Jan 2025 00:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bJkgbEtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D1310E26F;
 Tue, 28 Jan 2025 00:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OfGzCfYnCSC/y9hntIRR0u+ln9oZQUmIxU2URCy+FCc=; b=bJkgbEtJn95bqgaLzfZkJoDhd+
 au0JxOFDYQFqHI01ymJXWFaBZNgwOS7o2qd+m4M4fy1TvQZa/pJlnKDO3ZD8d2sLcSE86NBMPJM43
 vrr+ZISe/2Pqim3ApigEA1VsvURVsT6Ze8adChxs2bcG5rUt70wkxw0/k3/ZqlwnOsizzdL47T8S+
 r+PlFP/iroMDKf3Qp+TqzEEM/yyk47EhBInJrm0mnLDl2U3dhbjIgMiwSumI0l1kHJ8kOcgil59UT
 EUHV59TZhcQ/2LXRi6qxq4/+syl0Y4474EdDKlEGHaWY6x2fLakAs5VDokoUn6MrlsVBPALkvwPCx
 qzPEbIcw==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tcZpO-003Tma-Uv; Tue, 28 Jan 2025 01:51:43 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, mwen@igalia.com, alex.hung@amd.com,
 mario.limonciello@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: restore invalid MSA timing check for freesync
Date: Mon, 27 Jan 2025 21:41:10 -0300
Message-ID: <20250128005135.168681-1-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

This restores the original behavior that gets min/max freq from EDID and
only set DP/eDP connector as freesync capable if "sink device is capable
of rendering incoming video stream without MSA timing parameters", i.e.,
`allow_invalid_MSA_timing_params` is true. The condition was mistakenly
removed by 0159f88a99c9 ("drm/amd/display: remove redundant freesync
parser for DP").

CC: Mario Limonciello <mario.limonciello@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3915
Fixes: 0159f88a99c9 ("drm/amd/display: remove redundant freesync parser for DP")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---


Mario, Alex,

I can't reproduce the reported issue on my side, but reporters mentioned
this fixes their black screen issue. I examined the code around it and
overall restoring this condition in this way seems right.

For the future, we can consider using
`drm_dp_sink_can_do_video_without_timing_msa` instead.

Anyway, from my tests, what I can say is that things seem stable and I
didn't noticed any changes.

Can you verify how it goes on the CI?

Thanks,

Melissa 


 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c9e8982a8804..da550a257f09 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12381,10 +12381,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-			freesync_capable = true;
+		if (amdgpu_dm_connector->dc_link &&
+		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
+			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
+			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+				freesync_capable = true;
+		}
+
 		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 
 		if (vsdb_info.replay_mode) {
-- 
2.45.2

