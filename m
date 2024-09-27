Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E6988CD6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5B10ED3D;
	Fri, 27 Sep 2024 23:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ULS1Hpm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D9210ED3B;
 Fri, 27 Sep 2024 23:06:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 838F95C05DF;
 Fri, 27 Sep 2024 23:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A78CC4CEC9;
 Fri, 27 Sep 2024 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478376;
 bh=IFeEj1HnZNsFB+Rwq6xIaHSeOdxi924uEXz1vPzQikw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ULS1Hpm5o0Cl5iMKa/D/TncVFExjCursxA+vGZim0uHch/FktZfKILUAT03LW/PQO
 T+rjWKktKQDvata/u7/d3WAdkuN9zGEJgbOWFnIWsCTmYgVsqGiUp+FKVJiIhhqbt+
 XHnrmJhBlgy09QGbKXQRb1y81TGxS6WBC2O7xpdDUPH5EIQVBnhzMgOuvPo/saJkPl
 e8S17MIZ2YxDfVTiJOp0i6W6S6bfJn/hcB+E2fxmP4TPn0GvNZrybQDnpb/cgMoLSW
 gWoFfAI+D9UM6qmfl/UiDLThwkg35p4W5Z4Z3Lnsg2b5ZE6A1Jz0LUtEIOItyCowiv
 +59ymlA7LPT+g==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 3/5] drm/amd/display: always call connector_update when
 parsing freesync_caps
Date: Fri, 27 Sep 2024 18:05:58 -0500
Message-ID: <20240927230600.2619844-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
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

From: Melissa Wen <mwen@igalia.com>

Update connector caps with drm_edid data before parsing info for
freesync.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b6c936be7a6..efc1609ff26f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3569,13 +3569,11 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_edid_connector_update(connector, aconnector->drm_edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
@@ -12088,6 +12086,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
-- 
2.43.0

