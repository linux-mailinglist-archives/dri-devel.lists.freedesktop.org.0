Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BD70E8E4
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4672C10E52B;
	Tue, 23 May 2023 22:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AB310E522;
 Tue, 23 May 2023 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKh03CpgDtI9Ramyo0I6E/Oh2Ho9sob/OTw1JFhirOc=; b=CNvGsPtpfOXIJ17PLMzf5jlcTB
 mEz7djGVuGug3iw4btVWvesiHG8wiAQ8j2IyvNzh1WpTlfng17Ls84Sgdq6IG4BaUMCPYOn95Z7pH
 Eey69gcKmsYsjwAV8Cc/o8QEOqR1UDJfJUZvi4JleApsnbavi5CRL8DrqY0tkW9L3byeBYA0xtJsE
 boVHJ4YW4NDlmnft/jp91uDjwW/rpYzMMtKhi5U84dDxJY4A+eEN1of5+fceUis2+YCSZYobS/GlX
 rmeL0I5XLbPNW/RRMKrougOlusSKjG9cosdpXDejvSJh++UxsV06XlGC/xa9D0lJyrv0gBhdYmvBh
 aMVVnKwQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIb-00HEOv-FC; Wed, 24 May 2023 00:16:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 30/36] drm/amd/display: add dc_fixpt_from_s3132 helper
Date: Tue, 23 May 2023 21:15:14 -0100
Message-Id: <20230523221520.3115570-31-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Detach value translation from CTM to reuse it for programming HDR
multiplier property.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  |  8 +-------
 drivers/gpu/drm/amd/display/include/fixed31_32.h     | 12 ++++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 8452519cabe8..629ba10fbee9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -183,7 +183,6 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 				   struct fixed31_32 *matrix)
 {
-	int64_t val;
 	int i;
 
 	/*
@@ -202,12 +201,7 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
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

