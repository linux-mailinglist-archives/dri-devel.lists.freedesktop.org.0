Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F43A6EBFE4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FEC10E2E9;
	Sun, 23 Apr 2023 14:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F30910E2DE;
 Sun, 23 Apr 2023 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VoRYWGMN5c9KG4TgMo/sMnf0C+k2cdqhrvLiKjpRO7A=; b=rpOzJFYoeReUqyZCbjrl9+lW6p
 znpkLJeZlULUEL9KwSv12WzUX8EKLpikCNGiQSyd7zQsBPbdNJVkusoz4CXXLRJzfmsMEsFx1Srr1
 tXR9tru/pIjpEr2T/w3wSabpSyrIeJO3xTP+sM3eXr6oq0Ea2VK2yuWDnwfA3JJZ8maDBgLd/MrAO
 bhkSx05XBtQX1aXmE+4EIFftUvJarzG6BLSDlzUpTjFRZyZMLI6OEhOqMnyLA/UYBWoaptBByRz4V
 vDOCChvXQz9YXTMxC8YQt8OBEWL7CJXbnegEcmI1NlYJZY5m4Va8RKF2kjpNAa9gtQXNugQDsj88G
 4j8B6Amg==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRa-00ANVs-Ps; Sun, 23 Apr 2023 16:11:58 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 02/40] drm/amd/display: fix the delta clamping for shaper
 LUT
Date: Sun, 23 Apr 2023 13:10:14 -0100
Message-Id: <20230423141051.702990-3-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

The shaper LUT requires a 10-bit value of the delta between
segments. We were using dc_fixpt_clamp_u0d10() to do that
but it doesn't do what we want it to do. It will preserve
10-bit precision after the decimal point, but that's not
quite what we want. We want 14-bit precision and discard
the 4 most-significant bytes.

To do that we'll do dc_fixpt_clamp_u0d14() & 0x3ff instead.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
index f27413e94280..efa6cee649d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
@@ -539,10 +539,18 @@ bool cm_helper_translate_curve_to_hw_format(
 		rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
 		rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
 
+
 		if (fixpoint == true) {
-			rgb->delta_red_reg   = dc_fixpt_clamp_u0d10(rgb->delta_red);
-			rgb->delta_green_reg = dc_fixpt_clamp_u0d10(rgb->delta_green);
-			rgb->delta_blue_reg  = dc_fixpt_clamp_u0d10(rgb->delta_blue);
+			uint32_t red_clamp = dc_fixpt_clamp_u0d14(rgb->delta_red);
+			uint32_t green_clamp = dc_fixpt_clamp_u0d14(rgb->delta_green);
+			uint32_t blue_clamp = dc_fixpt_clamp_u0d14(rgb->delta_blue);
+
+			if (red_clamp >> 10 || green_clamp >> 10 || blue_clamp >> 10)
+				DC_LOG_WARNING("Losing delta precision while programming shaper LUT.");
+
+			rgb->delta_red_reg   = red_clamp & 0x3ff;
+			rgb->delta_green_reg = green_clamp & 0x3ff;
+			rgb->delta_blue_reg  = blue_clamp & 0x3ff;
 			rgb->red_reg         = dc_fixpt_clamp_u0d14(rgb->red);
 			rgb->green_reg       = dc_fixpt_clamp_u0d14(rgb->green);
 			rgb->blue_reg        = dc_fixpt_clamp_u0d14(rgb->blue);
-- 
2.39.2

