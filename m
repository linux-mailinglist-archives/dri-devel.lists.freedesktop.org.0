Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A014988DE82
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD8410FB8E;
	Wed, 27 Mar 2024 12:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AMQu2/+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9010FB81;
 Wed, 27 Mar 2024 12:16:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1025B61516;
 Wed, 27 Mar 2024 12:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91F5C433C7;
 Wed, 27 Mar 2024 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541800;
 bh=Y20evMptwoSu1w4hMKCSKGi18MXc2SMADujW67jie9M=;
 h=From:To:Cc:Subject:Date:From;
 b=AMQu2/+tBBD1lC3O9azTqY4UtC6Zkh/H5zg5PcdnOD1DOmKbTkhyDB1OE8qfF/PYd
 yToHHhLGeMkkLgSiP7TUHsHKg94qpylzs+HCMOZGPFjh0F9uHee6WiVO+rwcMUCyb+
 zKEcUzH60vS9e0n4fGGWR5SeotBOObfFzHSWcghef4mYq8BbU5Mp12oPGlXiw10Jzd
 gNWMwX/e/LWK8eRpmafO6xZ9wLlCWOCofLtzbNzdnO5POiUq6Ber4h+wO8XHmymrm5
 5ixFk8u1rnvvOAljUZC6hcmwUYDO/XE6NqGzf0uBRSjJfkwdHV9kbfoZwfMxaALfly
 IUI2w3whYqbKg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chiahsuan.chung@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Preserve original aspect ratio in
 create stream" failed to apply to 5.15-stable tree
Date: Wed, 27 Mar 2024 08:16:38 -0400
Message-ID: <20240327121639.2832878-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 79f3e38f60e5b2416ba99804d83d22e69ae592a3 Mon Sep 17 00:00:00 2001
From: Tom Chung <chiahsuan.chung@amd.com>
Date: Tue, 30 Jan 2024 15:34:08 +0800
Subject: [PATCH] drm/amd/display: Preserve original aspect ratio in create
 stream

[Why]
The original picture aspect ratio in mode struct may have chance be
overwritten with wrong aspect ratio data in create_stream_for_sink().
It will create a different VIC output and cause HDMI compliance test
failed.

[How]
Preserve the original picture aspect ratio data during create the
stream.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a2220d4787fb3..4fd07c60a2ad7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6232,7 +6232,9 @@ create_stream_for_sink(struct drm_connector *connector,
 		if (recalculate_timing) {
 			freesync_mode = get_highest_refresh_rate_mode(aconnector, false);
 			drm_mode_copy(&saved_mode, &mode);
+			saved_mode.picture_aspect_ratio = mode.picture_aspect_ratio;
 			drm_mode_copy(&mode, freesync_mode);
+			mode.picture_aspect_ratio = saved_mode.picture_aspect_ratio;
 		} else {
 			decide_crtc_timing_for_drm_display_mode(
 					&mode, preferred_mode, scale);
-- 
2.43.0




