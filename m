Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3402E11AB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0796E895;
	Wed, 23 Dec 2020 02:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2D16E88D;
 Wed, 23 Dec 2020 02:16:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C235423137;
 Wed, 23 Dec 2020 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689811;
 bh=it+HTgVVO1MflBnmaXHlqr5E0XdrcaWNL0+XY5KXdgs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FuqLfvRoOZQ/Mk6R6X5NiAbM/AANFVfMDIrD5iQbsQTUvHna5BV95r3Ukt1vYi8T4
 9/YcG5f9K7swpagcnPMI+/qCcwoB0OnODhleXg74VSK6t5mhRQHqWepockZULO1pVu
 4ZeGXgIWi33Ygm2pTlWbZHS0T7W0mRStB/t8mxftcd4+7pWpMSb1iOWLAz8LZSQiv+
 57MxPMDeYcVM+icR25JyhBIgJUdN3zPOYMn/bEEuJRW4mDbZkOqx9R8VvchrmfwCD6
 WQGxWItvNddYJzSauuVqveLv2htBBXrkw9ubrbuOW6fRgWl2fEu/dAjcCT4ZPaPWfI
 4uVe2Wo7GHcLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 019/217] drm/amd/display: Force prefetch mode to 0
Date: Tue, 22 Dec 2020 21:13:08 -0500
Message-Id: <20201223021626.2790791-19-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Isabel Zhang <isabel.zhang@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Isabel Zhang <isabel.zhang@amd.com>

[ Upstream commit 685b4d8142dcbf11b817f74c2bc5b94eca7ee7f2 ]

[Why]
On APU should be always using prefetch mode 0.
Currently, sometimes prefetch mode 1 is being
used causing system to hard hang due to
minTTUVBlank being too low.

[How]
Any ASIC running DCN21 will by default allow
self refresh and mclk switch. This sets both
min and max prefetch mode to 0 by default.

Signed-off-by: Isabel Zhang <isabel.zhang@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index e73785e74cba8..202a677a1bd78 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -301,7 +301,9 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
 	.xfc_bus_transport_time_us = 4,
 	.xfc_xbuf_latency_tolerance_us = 4,
 	.use_urgent_burst_bw = 1,
-	.num_states = 8
+	.num_states = 8,
+	.allow_dram_self_refresh_or_dram_clock_change_in_vblank
+			= dm_allow_self_refresh_and_mclk_switch
 };
 
 #ifndef MAX
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
