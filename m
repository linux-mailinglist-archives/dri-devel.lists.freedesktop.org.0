Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95611D39CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 20:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A9C89134;
	Thu, 14 May 2020 18:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8854089134;
 Thu, 14 May 2020 18:52:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AFED2065F;
 Thu, 14 May 2020 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589482367;
 bh=FpJAmaIbXfW+zhkboocQed7po9iRsV2lzX9DK4liwkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBgg7eSyfBLZcQW1BIRmjA6UiW1oz+cWp3SQDVx7M2GY89mo/L/YpXuqblWdlT6ZB
 2/nL1t9MVAnW5Fnsb0BDCgmXvVZRuP4OjGgGpSIdNbZhRo7t1zMbnNcbiMjw4NjOnV
 aFlOfh4lWq92GTjY/JyRarXrHOkqe2/bDS3KNfpc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 46/62] drm/amd/display: Prevent dpcd reads with
 passive dongles
Date: Thu, 14 May 2020 14:51:31 -0400
Message-Id: <20200514185147.19716-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit e6142dd511425cb827b5db869f489eb81f5f994d ]

[why]
During hotplug, a DP port may be connected to the sink through
passive adapter which does not support DPCD reads. Issuing reads
without checking for this condition will result in errors

[how]
Ensure the link is in aux_mode before initiating operation that result
in a DPCD read.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8136a58deb393..f98c42150b4f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1941,17 +1941,22 @@ amdgpu_dm_update_connector_after_detect(struct amdgpu_dm_connector *aconnector)
 		dc_sink_retain(aconnector->dc_sink);
 		if (sink->dc_edid.length == 0) {
 			aconnector->edid = NULL;
-			drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
+			if (aconnector->dc_link->aux_mode) {
+				drm_dp_cec_unset_edid(
+					&aconnector->dm_dp_aux.aux);
+			}
 		} else {
 			aconnector->edid =
-				(struct edid *) sink->dc_edid.raw_edid;
-
+				(struct edid *)sink->dc_edid.raw_edid;
 
 			drm_connector_update_edid_property(connector,
-					aconnector->edid);
-			drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-					    aconnector->edid);
+							   aconnector->edid);
+
+			if (aconnector->dc_link->aux_mode)
+				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
+						    aconnector->edid);
 		}
+
 		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
 
 	} else {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
