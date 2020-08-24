Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840862502B9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 18:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFADD6E32B;
	Mon, 24 Aug 2020 16:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8F36E30C;
 Mon, 24 Aug 2020 16:35:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA2D920578;
 Mon, 24 Aug 2020 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598286929;
 bh=hEcf91JbzgPXRuztevJtJxtp78NU32tVPVA7ZRUoHnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JoObgjekUxgYr7qo4X5Y4CQMG+LjOX/YN18IBNONtW1HIWPqo5bbIpqVKEgP8RcVo
 DXawu7LgWLuVhE3qPp76yMQb7TM5viqzav+EZUDqtCSm9qgyrcATfibJj3uAswW1AZ
 /zznmE8fdDv9ZwX5MduB7M1zRAYYzpyYSSoYlil4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 19/63] drm/amd/display: Fix LFC multiplier
 changing erratically
Date: Mon, 24 Aug 2020 12:34:19 -0400
Message-Id: <20200824163504.605538-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163504.605538-1-sashal@kernel.org>
References: <20200824163504.605538-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anthony Koo <Anthony.Koo@amd.com>

[ Upstream commit e4ed4dbbc8383d42a197da8fe7ca6434b0f14def ]

[Why]
1. There is a calculation that is using frame_time_in_us instead of
last_render_time_in_us to calculate whether choosing an LFC multiplier
would cause the inserted frame duration to be outside of range.

2. We do not handle unsigned integer subtraction correctly and it underflows
to a really large value, which causes some logic errors.

[How]
1. Fix logic to calculate 'within range' using last_render_time_in_us
2. Split out delta_from_mid_point_delta_in_us calculation to ensure
we don't underflow and wrap around

Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/modules/freesync/freesync.c   | 36 +++++++++++++++----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index eb7421e83b865..23a7fa8447e24 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -324,22 +324,44 @@ static void apply_below_the_range(struct core_freesync *core_freesync,
 
 		/* Choose number of frames to insert based on how close it
 		 * can get to the mid point of the variable range.
+		 *  - Delta for CEIL: delta_from_mid_point_in_us_1
+		 *  - Delta for FLOOR: delta_from_mid_point_in_us_2
 		 */
-		if ((frame_time_in_us / mid_point_frames_ceil) > in_out_vrr->min_duration_in_us &&
-				(delta_from_mid_point_in_us_1 < delta_from_mid_point_in_us_2 ||
-						mid_point_frames_floor < 2)) {
+		if ((last_render_time_in_us / mid_point_frames_ceil) < in_out_vrr->min_duration_in_us) {
+			/* Check for out of range.
+			 * If using CEIL produces a value that is out of range,
+			 * then we are forced to use FLOOR.
+			 */
+			frames_to_insert = mid_point_frames_floor;
+		} else if (mid_point_frames_floor < 2) {
+			/* Check if FLOOR would result in non-LFC. In this case
+			 * choose to use CEIL
+			 */
+			frames_to_insert = mid_point_frames_ceil;
+		} else if (delta_from_mid_point_in_us_1 < delta_from_mid_point_in_us_2) {
+			/* If choosing CEIL results in a frame duration that is
+			 * closer to the mid point of the range.
+			 * Choose CEIL
+			 */
 			frames_to_insert = mid_point_frames_ceil;
-			delta_from_mid_point_delta_in_us = delta_from_mid_point_in_us_2 -
-					delta_from_mid_point_in_us_1;
 		} else {
+			/* If choosing FLOOR results in a frame duration that is
+			 * closer to the mid point of the range.
+			 * Choose FLOOR
+			 */
 			frames_to_insert = mid_point_frames_floor;
-			delta_from_mid_point_delta_in_us = delta_from_mid_point_in_us_1 -
-					delta_from_mid_point_in_us_2;
 		}
 
 		/* Prefer current frame multiplier when BTR is enabled unless it drifts
 		 * too far from the midpoint
 		 */
+		if (delta_from_mid_point_in_us_1 < delta_from_mid_point_in_us_2) {
+			delta_from_mid_point_delta_in_us = delta_from_mid_point_in_us_2 -
+					delta_from_mid_point_in_us_1;
+		} else {
+			delta_from_mid_point_delta_in_us = delta_from_mid_point_in_us_1 -
+					delta_from_mid_point_in_us_2;
+		}
 		if (in_out_vrr->btr.frames_to_insert != 0 &&
 				delta_from_mid_point_delta_in_us < BTR_DRIFT_MARGIN) {
 			if (((last_render_time_in_us / in_out_vrr->btr.frames_to_insert) <
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
