Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE46BCB78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E610EC34;
	Thu, 16 Mar 2023 09:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2930610E0F2;
 Thu, 16 Mar 2023 09:52:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Ve-ANIv_1678960336; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Ve-ANIv_1678960336) by smtp.aliyun-inc.com;
 Thu, 16 Mar 2023 17:52:18 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 2/2] drm/amd/display: Remove the unused function
 link_timing_bandwidth_kbps()
Date: Thu, 16 Mar 2023 17:51:43 +0800
Message-Id: <20230316095143.73368-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230316095143.73368-1-jiapeng.chong@linux.alibaba.com>
References: <20230316095143.73368-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function link_timing_bandwidth_kbps is defined in the
link_validation.c file, but not called elsewhere, so remove this unused
function.

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:258:10: warning: no previous prototype for ‘link_timing_bandwidth_kbps’.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4547
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/link/link_validation.c | 51 -------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
index 9a5010f86003..afbd22631721 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_validation.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
@@ -255,57 +255,6 @@ uint32_t dp_link_bandwidth_kbps(
 	return link_rate_per_lane_kbps * link_settings->lane_count / 10000 * total_data_bw_efficiency_x10000;
 }
 
-uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing)
-{
-	uint32_t bits_per_channel = 0;
-	uint32_t kbps;
-
-	if (timing->flags.DSC)
-		return dc_dsc_stream_bandwidth_in_kbps(timing,
-				timing->dsc_cfg.bits_per_pixel,
-				timing->dsc_cfg.num_slices_h,
-				timing->dsc_cfg.is_dp);
-
-	switch (timing->display_color_depth) {
-	case COLOR_DEPTH_666:
-		bits_per_channel = 6;
-		break;
-	case COLOR_DEPTH_888:
-		bits_per_channel = 8;
-		break;
-	case COLOR_DEPTH_101010:
-		bits_per_channel = 10;
-		break;
-	case COLOR_DEPTH_121212:
-		bits_per_channel = 12;
-		break;
-	case COLOR_DEPTH_141414:
-		bits_per_channel = 14;
-		break;
-	case COLOR_DEPTH_161616:
-		bits_per_channel = 16;
-		break;
-	default:
-		ASSERT(bits_per_channel != 0);
-		bits_per_channel = 8;
-		break;
-	}
-
-	kbps = timing->pix_clk_100hz / 10;
-	kbps *= bits_per_channel;
-
-	if (timing->flags.Y_ONLY != 1) {
-		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
-		kbps *= 3;
-		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
-			kbps /= 2;
-		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
-			kbps = kbps * 2 / 3;
-	}
-
-	return kbps;
-}
-
 static bool dp_validate_mode_timing(
 	struct dc_link *link,
 	const struct dc_crtc_timing *timing)
-- 
2.20.1.7.g153144c

