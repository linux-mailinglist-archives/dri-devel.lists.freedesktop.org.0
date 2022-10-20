Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B49606B09
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 00:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE0E10E1EF;
	Thu, 20 Oct 2022 22:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484210E1EF;
 Thu, 20 Oct 2022 22:11:11 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id j188so1223466oih.4;
 Thu, 20 Oct 2022 15:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNcH8NNQ6H+ucEIDfZ6GtfiM1CXoewou+C4DHO1ovk4=;
 b=a8E5Qd8N1dlsyq39Y+t7APU29CWKcb7GobXv9R3jGBeT+H82d9SSPjSLUB/v69b7uF
 mqwmmTJ1EPc57abpt4vdRG5PbC8xgd6MbJNgmxCX8ICCgbFH+2dKiHZnKhuBTQlplydV
 9b0mw5gmn3c9UQWwicPLknL6TcFstS67+HPa5KN/3oT8SkgjHOJc/Zo7wtPmAWlsLQdd
 iK6IQQv1OiWYoWl7+55pSyKaFZ9g3863K4WbXS0K+HSZKeLN7lofg0puzpCuSYVlQD+O
 T6u63lM3pyamlEp9D8zul2+J2WNfiTiu6tdOgMNJlJ4TH9vn6lob21UhvVaTzpU39uR9
 PdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZNcH8NNQ6H+ucEIDfZ6GtfiM1CXoewou+C4DHO1ovk4=;
 b=CqrUpFJxbNjshzmqOPeMBEkQ+X6C2EFYthdd/r1l7wom76Xwq0gUoZ7YC8gNLpZzII
 8nmL2mQk71vWJnZTxKZTYpI2FlBkty0r/lYDNqKav52x1TFZtO+amSFGtzw/HhSwrT3B
 4Tam+Z7Yq3RazQlO/9/Zb98IW+lmPrfsV96Uz64xgUTYDGiriR4YsX6yH9peu5fiTocO
 gbgNUc4NnTRBJhugFALhGHNQmNh3ys5Pom0HcWvBNz+Bou2dw6m1TTgP2ceo3BhD0kg7
 5CjJeJ+iMoZGC6CWCerWGQLN2iiha6Z6LkE33fnSN1RUnmGT466FslBPXSYYH4JG0U73
 1FWA==
X-Gm-Message-State: ACrzQf1thWhdffNhWOp55U/zPCI0SY0cgcbuIjoALP03OHZ8PYa99c5q
 8ZWpAdXsbkfQe/6PNfZbOiI=
X-Google-Smtp-Source: AMsMyM7UfZbFJXOnTdCHew1dUKSWIPUiHwIJV3yBwwrPBaBfYg6ojijf0+vWLbd/8EzlK+0HDSR0TQ==
X-Received: by 2002:a05:6808:16ac:b0:353:b7d7:5fef with SMTP id
 bb44-20020a05680816ac00b00353b7d75fefmr8925133oib.293.1666303870481; 
 Thu, 20 Oct 2022 15:11:10 -0700 (PDT)
Received: from macondo.. ([2804:431:e7cc:1855:2215:4175:ce03:9ed3])
 by smtp.gmail.com with ESMTPSA id
 cp27-20020a056830661b00b006605883eae6sm385512otb.63.2022.10.20.15.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:11:10 -0700 (PDT)
From: Rafael Mendonca <rafaelmendsr@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Remove duplicate code for DCN314 DML
 calculation
Date: Thu, 20 Oct 2022 19:10:50 -0300
Message-Id: <20221020221051.919704-1-rafaelmendsr@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, Rafael Mendonca <rafaelmendsr@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an extension of commit fd3bc691fc7b ("drm/amd/display: Remove
duplicate code across dcn30 and dcn31"), which removed duplicate code for
the function CalculateBytePerPixelAnd256BBlockSizes() across dcn30 and
dcn31. At the time the aforementioned commit was introduced, support for
DCN 3.1.4 was still not merged. Thus, this deletes duplicate code for
CalculateBytePerPixelAnd256BBlockSizes(), that was introduced later in
DCN314, in favor of using the respective functionality from
'display_mode_vba_30.h'.

Additionally, by doing that, we also fix a duplicate argument issue
reported by coccinelle in 'display_rq_dlg_calc_314.c':

  static bool CalculateBytePerPixelAnd256BBlockSizes(...) {
    ...
    } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
    ...
  }

Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
---
 .../dc/dml/dcn314/display_mode_vba_314.c      | 106 +-----------------
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   |  91 +--------------
 2 files changed, 6 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 0d12fd079cd6..6e43cd21a7d3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -32,6 +32,7 @@
 #include "../display_mode_lib.h"
 #include "display_mode_vba_314.h"
 #include "../dml_inline_defs.h"
+#include "dml/dcn30/display_mode_vba_30.h"
 
 /*
  * NOTE:
@@ -90,17 +91,6 @@ typedef struct {
 #define BPP_INVALID 0
 #define BPP_BLENDED_PIPE 0xffffffff
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC);
 static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
 static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(struct display_mode_lib *mode_lib);
 static unsigned int dscceComputeDelay(
@@ -2178,7 +2168,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	DTRACE("   return_bus_bw      = %f", v->ReturnBW);
 
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
@@ -3317,7 +3307,7 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 
 	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&BytePerPixY[k],
@@ -3371,94 +3361,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			&dummysinglestring);
 }
 
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC)
-{
-	if (SourcePixelFormat == dm_444_64) {
-		*BytePerPixelDETY = 8;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 8;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_rgbe_alpha) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 1;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 1;
-	} else if (SourcePixelFormat == dm_420_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 2;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 2;
-	} else if (SourcePixelFormat == dm_420_12) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 4;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	} else {
-		*BytePerPixelDETY = 4.0 / 3;
-		*BytePerPixelDETC = 8.0 / 3;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	}
-
-	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
-			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-		} else if (SourcePixelFormat == dm_444_64) {
-			*BlockHeight256BytesY = 4;
-		} else if (SourcePixelFormat == dm_444_8) {
-			*BlockHeight256BytesY = 16;
-		} else {
-			*BlockHeight256BytesY = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockHeight256BytesC = 0;
-		*BlockWidth256BytesC = 0;
-	} else {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-			*BlockHeight256BytesC = 1;
-		} else if (SourcePixelFormat == dm_rgbe_alpha) {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 16;
-		} else if (SourcePixelFormat == dm_420_8) {
-			*BlockHeight256BytesY = 16;
-			*BlockHeight256BytesC = 8;
-		} else {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
-	}
-	return true;
-}
-
 static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
 {
 	if (PrefetchMode == 0) {
@@ -3948,7 +3850,7 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 	/*Bandwidth Support Check*/
 
 	for (k = 0; k < v->NumberOfActivePlanes; k++) {
-		CalculateBytePerPixelAnd256BBlockSizes(
+		dml30_CalculateBytePerPixelAnd256BBlockSizes(
 				v->SourcePixelFormat[k],
 				v->SurfaceTiling[k],
 				&v->BytePerPixelY[k],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index 61ee9ba063a7..a373d35dd473 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -28,94 +28,7 @@
 #include "../display_mode_vba.h"
 #include "../dml_inline_defs.h"
 #include "display_rq_dlg_calc_314.h"
-
-static bool CalculateBytePerPixelAnd256BBlockSizes(
-		enum source_format_class SourcePixelFormat,
-		enum dm_swizzle_mode SurfaceTiling,
-		unsigned int *BytePerPixelY,
-		unsigned int *BytePerPixelC,
-		double *BytePerPixelDETY,
-		double *BytePerPixelDETC,
-		unsigned int *BlockHeight256BytesY,
-		unsigned int *BlockHeight256BytesC,
-		unsigned int *BlockWidth256BytesY,
-		unsigned int *BlockWidth256BytesC)
-{
-	if (SourcePixelFormat == dm_444_64) {
-		*BytePerPixelDETY = 8;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 8;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 0;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_rgbe_alpha) {
-		*BytePerPixelDETY = 4;
-		*BytePerPixelDETC = 1;
-		*BytePerPixelY = 4;
-		*BytePerPixelC = 1;
-	} else if (SourcePixelFormat == dm_420_8) {
-		*BytePerPixelDETY = 1;
-		*BytePerPixelDETC = 2;
-		*BytePerPixelY = 1;
-		*BytePerPixelC = 2;
-	} else if (SourcePixelFormat == dm_420_12) {
-		*BytePerPixelDETY = 2;
-		*BytePerPixelDETC = 4;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	} else {
-		*BytePerPixelDETY = 4.0 / 3;
-		*BytePerPixelDETC = 8.0 / 3;
-		*BytePerPixelY = 2;
-		*BytePerPixelC = 4;
-	}
-
-	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
-			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
-		if (SurfaceTiling == dm_sw_linear)
-			*BlockHeight256BytesY = 1;
-		else if (SourcePixelFormat == dm_444_64)
-			*BlockHeight256BytesY = 4;
-		else if (SourcePixelFormat == dm_444_8)
-			*BlockHeight256BytesY = 16;
-		else
-			*BlockHeight256BytesY = 8;
-
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockHeight256BytesC = 0;
-		*BlockWidth256BytesC = 0;
-	} else {
-		if (SurfaceTiling == dm_sw_linear) {
-			*BlockHeight256BytesY = 1;
-			*BlockHeight256BytesC = 1;
-		} else if (SourcePixelFormat == dm_rgbe_alpha) {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 16;
-		} else if (SourcePixelFormat == dm_420_8) {
-			*BlockHeight256BytesY = 16;
-			*BlockHeight256BytesC = 8;
-		} else {
-			*BlockHeight256BytesY = 8;
-			*BlockHeight256BytesC = 8;
-		}
-		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
-		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
-	}
-	return true;
-}
+#include "dml/dcn30/display_mode_vba_30.h"
 
 static bool is_dual_plane(enum source_format_class source_format)
 {
@@ -468,7 +381,7 @@ static void get_meta_and_pte_attr(
 	double byte_per_pixel_det_y;
 	double byte_per_pixel_det_c;
 
-	CalculateBytePerPixelAnd256BBlockSizes(
+	dml30_CalculateBytePerPixelAnd256BBlockSizes(
 			(enum source_format_class) (source_format),
 			(enum dm_swizzle_mode) (tiling),
 			&bytes_per_element_y,
-- 
2.34.1

