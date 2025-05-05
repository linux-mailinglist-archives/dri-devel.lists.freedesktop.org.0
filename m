Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C72AAA12E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C5410E525;
	Mon,  5 May 2025 22:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FMIxcF+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6382310E525;
 Mon,  5 May 2025 22:44:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E459261F1B;
 Mon,  5 May 2025 22:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3656DC4CEE4;
 Mon,  5 May 2025 22:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485090;
 bh=LCnnPAWWj9dD4v3jedrgPS8PzuwhW6mTI4/VpNY/qZk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FMIxcF+oIvruhNxU/yj2+dfsIgdH9OIVguARj99/Ceeeucwp2WitamSJX0GSYN9d3
 lOiZy2DKvod7kDYWn9ndL4zzXT0XTtIh/AmE8M8oiSHgg18I/nKRSdICHIvKv5/zji
 +oFPVGUWwmAhMlLJkld4zRcHdoTUTu6Xc/Cs661y7PVj2Ry6Zn+XcKR9aT2KpezY08
 csoJzZf2OzGCHCcuGyTSQcoTTLbELSDiLOS9GJ4RhGzqw3Sg8wgLTjarDaPM8DHNNZ
 gjIllpAiRqzPNNnykmsvH3GkWHrokrLwX3rz8HiSlXW0GaHNXI4eGeTIx1yBXKUJHR
 4JK7JEBRTFWlg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peichen Huang <PeiChen.Huang@amd.com>, Cruise Hung <cruise.hung@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, wenjing.liu@amd.com, alex.hung@amd.com,
 Jerry.Zuo@amd.com, michael.strauss@amd.com, Brendan.Tam@amd.com,
 ivlipski@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 158/486] drm/amd/display: not abort link train
 when bw is low
Date: Mon,  5 May 2025 18:33:54 -0400
Message-Id: <20250505223922.2682012-158-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Peichen Huang <PeiChen.Huang@amd.com>

[ Upstream commit 8a21da2842bb22b2b80e5902d0438030d729bfd3 ]

[WHY]
DP tunneling should not abort link train even bandwidth become
too low after downgrade. Otherwise, it would fail compliance test.

[HOW}
Do link train with downgrade settings even bandwidth is not enough

Reviewed-by: Cruise Hung <cruise.hung@amd.com>
Reviewed-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Signed-off-by: Peichen Huang <PeiChen.Huang@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 27b881f947e8b..9385a32a471b8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -1769,13 +1769,10 @@ bool perform_link_training_with_retries(
 			is_link_bw_min = ((cur_link_settings.link_rate <= LINK_RATE_LOW) &&
 				(cur_link_settings.lane_count <= LANE_COUNT_ONE));
 
-			if (is_link_bw_low) {
+			if (is_link_bw_low)
 				DC_LOG_WARNING(
 					"%s: Link(%d) bandwidth too low after fallback req_bw(%d) > link_bw(%d)\n",
 					__func__, link->link_index, req_bw, link_bw);
-
-				return false;
-			}
 		}
 
 		msleep(delay_between_attempts);
-- 
2.39.5

