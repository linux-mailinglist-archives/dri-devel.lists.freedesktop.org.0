Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536916EC02F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B5010E413;
	Sun, 23 Apr 2023 14:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A69510E40E;
 Sun, 23 Apr 2023 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P4ZXpKFMtoIv2GHYDm0O+bIMEiRHVdDFlzSdVRRjl+4=; b=Xf5xbFUlVRcMeEfF92pKTWXigX
 R9y7r3VyMhFpJTzPExO/MEwG3xN9AyhwDWtZ+WGoZe8rbS3sdSGEV77TDsmVhg2icLCNnhOqq/nZq
 C94uECAkNCXMFTBXeOewYKAf3EFwNxYGTW+54d9UbLXWJkzvXXMvDYEDMY6JWdZI3UuFi1R/PW7yj
 Tj6FFfM6mOlk6Uz1yKXlU+iE+uuhNX59b6Q9G3mElUuCEDTy67bzM3TKt8//1H7bEjJsGJYcuqvdB
 rjmy50QlYBUT/bHPct4NQfoVfgJsbb5dW5VB8BZCE7LdtB78DNXJFGVC8sjgEQWkwzlmiQy7qFtJx
 UHH6t3+A==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTO-00ANVs-Pv; Sun, 23 Apr 2023 16:13:50 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 34/40] drm/amd/display: add dc_fixpt_from_s3132 helper
Date: Sun, 23 Apr 2023 13:10:46 -0100
Message-Id: <20230423141051.702990-35-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Detach value translation from CTM to reuse it for programming HDR
multiplier property.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  |  8 +-------
 drivers/gpu/drm/amd/display/include/fixed31_32.h     | 12 ++++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 07303c9f3618..d714728ca143 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -182,7 +182,6 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 				   struct fixed31_32 *matrix)
 {
-	int64_t val;
 	int i;
 
 	/*
@@ -201,12 +200,7 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 		}
 
 		/* gamut_remap_matrix[i] = ctm[i - floor(i/4)] */
-		val = ctm->matrix[i - (i / 4)];
-		/* If negative, convert to 2's complement. */
-		if (val & (1ULL << 63))
-			val = -(val & ~(1ULL << 63));
-
-		matrix[i].value = val;
+		matrix[i] = dc_fixpt_from_s3132(ctm->matrix[i - (i / 4)]);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/include/fixed31_32.h b/drivers/gpu/drm/amd/display/include/fixed31_32.h
index ece97ae0e826..f4cc7f97329f 100644
--- a/drivers/gpu/drm/amd/display/include/fixed31_32.h
+++ b/drivers/gpu/drm/amd/display/include/fixed31_32.h
@@ -69,6 +69,18 @@ static const struct fixed31_32 dc_fixpt_epsilon = { 1LL };
 static const struct fixed31_32 dc_fixpt_half = { 0x80000000LL };
 static const struct fixed31_32 dc_fixpt_one = { 0x100000000LL };
 
+static inline struct fixed31_32 dc_fixpt_from_s3132(__u64 x)
+{
+	struct fixed31_32 val;
+
+	/* If negative, convert to 2's complement. */
+	if (x & (1ULL << 63))
+		x = -(x & ~(1ULL << 63));
+
+	val.value = x;
+	return val;
+}
+
 /*
  * @brief
  * Initialization routines
-- 
2.39.2

