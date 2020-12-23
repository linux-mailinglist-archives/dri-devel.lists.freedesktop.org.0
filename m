Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBF2E11AD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D72C6E892;
	Wed, 23 Dec 2020 02:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896096E892;
 Wed, 23 Dec 2020 02:16:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CF432312E;
 Wed, 23 Dec 2020 02:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689814;
 bh=Vx3ezAW5GJLBA67L7m77bVSFJqgm6ZZ07DOmRVrLuZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Krz+61sH3vYZl1a28xJqKdjQU2B0vvkNOyjTW7amKFEhEd48T1CH/EAgvwH+23FNI
 TEf2qpbjHgVh0gFuwujnYjw+8753nE6cwDOzn8c/Rk7T/HS4SIvk45PKSG4V9Jsrqo
 vymIRX5u2+JqWd5HzT8tMx/4wsELm2PfW18rpiOLP3DWXoGbmYbVxhG2DRHRa5LSPQ
 4prMWkWF2AxfBLwMyrerN9NJeMS2igqIzER36tV+n7SD7D4grnjjdM3rcVziux8C/U
 Yc1OjSHKFBm4jnzkoQnmus0rs4i0tjU9yTTHrNbkco5J726frHJ6rOqSGuXWJ6Q48N
 c3iPRJlGnYiiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 021/217] drm/amd/display: stop top_mgr when type
 change to non-MST during s3
Date: Tue, 22 Dec 2020 21:13:10 -0500
Message-Id: <20201223021626.2790791-21-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Lewis Huang <Lewis.Huang@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lewis Huang <Lewis.Huang@amd.com>

[ Upstream commit e748b59fb74e8725c8774a4b0753fabba9de7b97 ]

[Why]
Driver keeps the invalid information cause report the
incorrect monitor which save in remote sink to OS

[How]
When connector type change from MST to non-MST,
stop the topology manager.

Signed-off-by: Lewis Huang <Lewis.Huang@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 5b0cedfa824a9..59c5915665112 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -854,6 +854,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 	struct dpcd_caps prev_dpcd_caps;
 	bool same_dpcd = true;
 	enum dc_connection_type new_connection_type = dc_connection_none;
+	enum dc_connection_type pre_connection_type = dc_connection_none;
 	bool perform_dp_seamless_boot = false;
 	const uint32_t post_oui_delay = 30; // 30ms
 
@@ -889,6 +890,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 
 	link_disconnect_sink(link);
 	if (new_connection_type != dc_connection_none) {
+		pre_connection_type = link->type;
 		link->type = new_connection_type;
 		link->link_state_valid = false;
 
@@ -962,6 +964,12 @@ static bool dc_link_detect_helper(struct dc_link *link,
 				return true;
 			}
 
+			// link switch from MST to non-MST stop topology manager
+			if (pre_connection_type == dc_connection_mst_branch &&
+				link->type != dc_connection_mst_branch) {
+				dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
+			}
+
 			if (link->type == dc_connection_mst_branch) {
 				LINK_INFO("link=%d, mst branch is now Connected\n",
 					  link->link_index);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
