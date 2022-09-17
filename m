Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FA5BB9F4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 20:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA9710E08A;
	Sat, 17 Sep 2022 18:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586C110E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663439912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=23tjVksrjYW5v0nLvXHifLUA17brLvbuQ40YLTG692k=;
 b=YhyU8b0b+75CoE6Yi8TOxVAWEL1dWujbPKWho8J2A5dx5mqqUt6QGVhv+Nj5WkFwkcQbNk
 F/5AWb4OMGdNFKFyPgHzlAmMCp6xLNJXqN8IBOpw6qZB2MUqRVX2NQpmm8s8BmQIs5dRof
 t6WIQGmymSEWRDV5pR9A1Q7ga83vUJw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-8EgFERwzNH-H3m4l-sGfWg-1; Sat, 17 Sep 2022 14:38:31 -0400
X-MC-Unique: 8EgFERwzNH-H3m4l-sGfWg-1
Received: by mail-qv1-f69.google.com with SMTP id
 oj15-20020a056214440f00b004ac6db57cacso16994714qvb.17
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 11:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=23tjVksrjYW5v0nLvXHifLUA17brLvbuQ40YLTG692k=;
 b=kUmcOxsN+aPamiRkzLdxEMUmpbUzuRPVBD+qhHCcoL8MBNTZreuY7MgdC6aQ/8P2lG
 flm8At1IbweGRZlMBEVJ46qq17swDtShJxmPvvkimczab75iNL0j4CGZz/LxitD3HRBW
 oxq8cI+T2Evu7qdozFopISPLsr8AHiwlvOeC1BfXpkL0+FtmZNBwo/0sOOoFsxYX6dDF
 ubtxXp41xtF2uyJ6Kz/fyW1nQPA5TqqPupqXL3524PmuaBGuXLSipMo//eqaV/TnZ7Pd
 ceedvXoPnMxDV8eKXa8b7P25pcVqAzgG/QWEiRKzO3roEqbnwUASVMvzafBoi32XA0+W
 3EIg==
X-Gm-Message-State: ACrzQf34R2lQdSVgrp04Hk9Kp2A5pHP1g4PKNZOmaeE40rsqXPHInoLK
 nEGs7bjUfTV2FwFzVZ+kEmv17T6ixDO3c4ErsqgJc34VkG1u3UioaTlmzSX0zToRHjq60TKu6iA
 2isDeUrydQe9go2UhMXSD00SOjpzZ
X-Received: by 2002:a0c:f5d2:0:b0:4ab:f974:1e55 with SMTP id
 q18-20020a0cf5d2000000b004abf9741e55mr9103896qvm.46.1663439910126; 
 Sat, 17 Sep 2022 11:38:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76rKpD2zLs+CY19nwy7sBZzMyKF6kwM9Sz+8KweT1+sCYo+EBYa4geRltsS3vLrAh8aJcuCw==
X-Received: by 2002:a0c:f5d2:0:b0:4ab:f974:1e55 with SMTP id
 q18-20020a0cf5d2000000b004abf9741e55mr9103848qvm.46.1663439909694; 
 Sat, 17 Sep 2022 11:38:29 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm9306845qkp.39.2022.09.17.11.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 11:38:29 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, aric.cyr@amd.com, Pavle.Kotarac@amd.com,
 Nevenko.Stupar@amd.com, aurabindo.pillai@amd.com, mairacanal@riseup.net,
 Bing.Guo@amd.com, nathan@kernel.org, hamza.mahfooz@amd.com,
 nicholas.kazlauskas@amd.com, agustin.gutierrez@amd.com,
 mdaenzer@redhat.com, Charlene.Liu@amd.com, roman.li@amd.com,
 Wesley.Chalmers@amd.com, alvin.lee2@amd.com, Jun.Lei@amd.com,
 yang.lee@linux.alibaba.com, Syed.Hassan@amd.com
Subject: [PATCH] drm/amd/display: refactor CalculateWriteBackDelay to use
 vba_vars_st ptr
Date: Sat, 17 Sep 2022 14:37:44 -0400
Message-Id: <20220917183744.2526927-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mimimize the function signature by passing a pointer and an index instead
of passing several elements of the pointer.

The dml2x,dml3x families uses the same algorithm.  Remove the duplicates.
Use dml20_ and dml30_ prefix to distinguish the two variants.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        |  78 +++---------
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 115 ++----------------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 114 +----------------
 .../dc/dml/dcn30/display_mode_vba_30.c        |  74 +++--------
 .../dc/dml/dcn31/display_mode_vba_31.c        |  76 +-----------
 .../dc/dml/dcn314/display_mode_vba_314.c      |  76 +-----------
 .../dc/dml/dcn32/display_mode_vba_32.c        |  42 +------
 .../dc/dml/dcn32/display_mode_vba_util_32.c   |  30 -----
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |  10 +-
 9 files changed, 63 insertions(+), 552 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index d3b5b6fedf04..6e9d7e2b5243 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -217,16 +217,8 @@ static void CalculateFlipSchedule(
 		double *DestinationLinesToRequestRowInImmediateFlip,
 		double *final_flip_bw,
 		bool *ImmediateFlipSupportedForPipe);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth);
 
+double dlm20_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i);
 static void dml20_DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
 static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
 		struct display_mode_lib *mode_lib);
@@ -1085,6 +1077,7 @@ static unsigned int CalculateVMAndRowBytes(
 static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
 		struct display_mode_lib *mode_lib)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
 	unsigned int j, k;
 
 	mode_lib->vba.WritebackDISPCLK = 0.0;
@@ -1980,36 +1973,15 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
 			if (mode_lib->vba.WritebackEnable[k] == true) {
 				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] =
-						mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k])
-										/ mode_lib->vba.DISPCLK;
+					mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(v, k) / mode_lib->vba.DISPCLK;
 			} else
 				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
 			for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
 				if (mode_lib->vba.BlendingAndTiming[j] == k
 						&& mode_lib->vba.WritebackEnable[j] == true) {
 					mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] =
-							dml_max(
-									mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k],
-									mode_lib->vba.WritebackLatency
-											+ CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[j],
-													mode_lib->vba.WritebackHRatio[j],
-													mode_lib->vba.WritebackVRatio[j],
-													mode_lib->vba.WritebackLumaHTaps[j],
-													mode_lib->vba.WritebackLumaVTaps[j],
-													mode_lib->vba.WritebackChromaHTaps[j],
-													mode_lib->vba.WritebackChromaVTaps[j],
-													mode_lib->vba.WritebackDestinationWidth[j])
-													/ mode_lib->vba.DISPCLK);
+							dml_max(mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k],
+								mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(v, j) / mode_lib->vba.DISPCLK);
 				}
 			}
 		}
@@ -2975,16 +2947,17 @@ static double CalculateRemoteSurfaceFlipDelay(
 	return result;
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth)
+double dlm20_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i)
 {
+	const enum source_format_class WritebackPixelFormat = vba->WritebackPixelFormat[i];
+	const double WritebackHRatio = vba->WritebackHRatio[i];
+	const double WritebackVRatio = vba->WritebackVRatio[i];
+	const unsigned int WritebackLumaHTaps = vba->WritebackLumaHTaps[i];
+	const unsigned int WritebackLumaVTaps = vba->WritebackLumaVTaps[i];
+	const unsigned int WritebackChromaHTaps = vba->WritebackChromaHTaps[i];
+	const unsigned int WritebackChromaVTaps = vba->WritebackChromaVTaps[i];
+	const unsigned int WritebackDestinationWidth = vba->WritebackDestinationWidth[i];
+
 	double CalculateWriteBackDelay =
 			dml_max(
 					dml_ceil(WritebackLumaHTaps / 4.0, 1) / WritebackHRatio,
@@ -4619,15 +4592,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
 					if (mode_lib->vba.WritebackEnable[k] == true) {
 						locals->WritebackDelay[i][k] = mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k]) / locals->RequiredDISPCLK[i][j];
+							+ dlm20_CalculateWriteBackDelay(locals, k) / locals->RequiredDISPCLK[i][j];
 					} else {
 						locals->WritebackDelay[i][k] = 0.0;
 					}
@@ -4636,15 +4601,8 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 								&& mode_lib->vba.WritebackEnable[m]
 										== true) {
 							locals->WritebackDelay[i][k] = dml_max(locals->WritebackDelay[i][k],
-											mode_lib->vba.WritebackLatency + CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[m],
-													mode_lib->vba.WritebackHRatio[m],
-													mode_lib->vba.WritebackVRatio[m],
-													mode_lib->vba.WritebackLumaHTaps[m],
-													mode_lib->vba.WritebackLumaVTaps[m],
-													mode_lib->vba.WritebackChromaHTaps[m],
-													mode_lib->vba.WritebackChromaVTaps[m],
-													mode_lib->vba.WritebackDestinationWidth[m]) / locals->RequiredDISPCLK[i][j]);
+											       mode_lib->vba.WritebackLatency +
+											       dlm20_CalculateWriteBackDelay(locals, m) / locals->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index edd098c7eb92..b02dda8ce70f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -241,15 +241,7 @@ static void CalculateFlipSchedule(
 		double *DestinationLinesToRequestRowInImmediateFlip,
 		double *final_flip_bw,
 		bool *ImmediateFlipSupportedForPipe);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth);
+double dlm20_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i);
 
 static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
 static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
@@ -1145,6 +1137,7 @@ static unsigned int CalculateVMAndRowBytes(
 static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
 		struct display_mode_lib *mode_lib)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
 	unsigned int j, k;
 
 	mode_lib->vba.WritebackDISPCLK = 0.0;
@@ -2016,17 +2009,7 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
 			if (mode_lib->vba.WritebackEnable[k] == true) {
 				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] =
-						mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k])
-										/ mode_lib->vba.DISPCLK;
+					mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(v, k) / mode_lib->vba.DISPCLK;
 			} else
 				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
 			for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
@@ -2036,16 +2019,7 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 							dml_max(
 									mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k],
 									mode_lib->vba.WritebackLatency
-											+ CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[j],
-													mode_lib->vba.WritebackHRatio[j],
-													mode_lib->vba.WritebackVRatio[j],
-													mode_lib->vba.WritebackLumaHTaps[j],
-													mode_lib->vba.WritebackLumaVTaps[j],
-													mode_lib->vba.WritebackChromaHTaps[j],
-													mode_lib->vba.WritebackChromaVTaps[j],
-													mode_lib->vba.WritebackDestinationWidth[j])
-													/ mode_lib->vba.DISPCLK);
+									+ dlm20_CalculateWriteBackDelay(v, j) / mode_lib->vba.DISPCLK);
 				}
 			}
 		}
@@ -3048,66 +3022,6 @@ static double CalculateRemoteSurfaceFlipDelay(
 	return result;
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth)
-{
-	double CalculateWriteBackDelay =
-			dml_max(
-					dml_ceil(WritebackLumaHTaps / 4.0, 1) / WritebackHRatio,
-					WritebackLumaVTaps * dml_ceil(1.0 / WritebackVRatio, 1)
-							* dml_ceil(
-									WritebackDestinationWidth
-											/ 4.0,
-									1)
-							+ dml_ceil(1.0 / WritebackVRatio, 1)
-									* (dml_ceil(
-											WritebackLumaVTaps
-													/ 4.0,
-											1) + 4));
-
-	if (WritebackPixelFormat != dm_444_32) {
-		CalculateWriteBackDelay =
-				dml_max(
-						CalculateWriteBackDelay,
-						dml_max(
-								dml_ceil(
-										WritebackChromaHTaps
-												/ 2.0,
-										1)
-										/ (2
-												* WritebackHRatio),
-								WritebackChromaVTaps
-										* dml_ceil(
-												1
-														/ (2
-																* WritebackVRatio),
-												1)
-										* dml_ceil(
-												WritebackDestinationWidth
-														/ 2.0
-														/ 2.0,
-												1)
-										+ dml_ceil(
-												1
-														/ (2
-																* WritebackVRatio),
-												1)
-												* (dml_ceil(
-														WritebackChromaVTaps
-																/ 4.0,
-														1)
-														+ 4)));
-	}
-	return CalculateWriteBackDelay;
-}
-
 static void CalculateActiveRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
@@ -4745,15 +4659,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
 					if (mode_lib->vba.WritebackEnable[k] == true) {
 						locals->WritebackDelay[i][k] = mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k]) / locals->RequiredDISPCLK[i][j];
+							+ dlm20_CalculateWriteBackDelay(locals, k) / locals->RequiredDISPCLK[i][j];
 					} else {
 						locals->WritebackDelay[i][k] = 0.0;
 					}
@@ -4762,15 +4668,8 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 								&& mode_lib->vba.WritebackEnable[m]
 										== true) {
 							locals->WritebackDelay[i][k] = dml_max(locals->WritebackDelay[i][k],
-											mode_lib->vba.WritebackLatency + CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[m],
-													mode_lib->vba.WritebackHRatio[m],
-													mode_lib->vba.WritebackVRatio[m],
-													mode_lib->vba.WritebackLumaHTaps[m],
-													mode_lib->vba.WritebackLumaVTaps[m],
-													mode_lib->vba.WritebackChromaHTaps[m],
-													mode_lib->vba.WritebackChromaVTaps[m],
-													mode_lib->vba.WritebackDestinationWidth[m]) / locals->RequiredDISPCLK[i][j]);
+											       mode_lib->vba.WritebackLatency +
+											       dlm20_CalculateWriteBackDelay(locals, m) / locals->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index d40d32e380f4..6be14f55c78d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -273,15 +273,7 @@ static void CalculateFlipSchedule(
 		double *DestinationLinesToRequestRowInImmediateFlip,
 		double *final_flip_bw,
 		bool *ImmediateFlipSupportedForPipe);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth);
+double dlm20_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i);
 static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		struct display_mode_lib *mode_lib,
 		unsigned int PrefetchMode,
@@ -2042,17 +2034,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
 			if (mode_lib->vba.WritebackEnable[k] == true) {
 				locals->WritebackDelay[mode_lib->vba.VoltageLevel][k] =
-						mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k])
-										/ mode_lib->vba.DISPCLK;
+					mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(locals, k) / mode_lib->vba.DISPCLK;
 			} else
 				locals->WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
 			for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
@@ -2062,16 +2044,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 							dml_max(
 									locals->WritebackDelay[mode_lib->vba.VoltageLevel][k],
 									mode_lib->vba.WritebackLatency
-											+ CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[j],
-													mode_lib->vba.WritebackHRatio[j],
-													mode_lib->vba.WritebackVRatio[j],
-													mode_lib->vba.WritebackLumaHTaps[j],
-													mode_lib->vba.WritebackLumaVTaps[j],
-													mode_lib->vba.WritebackChromaHTaps[j],
-													mode_lib->vba.WritebackChromaVTaps[j],
-													mode_lib->vba.WritebackDestinationWidth[j])
-													/ mode_lib->vba.DISPCLK);
+									+ dlm20_CalculateWriteBackDelay(locals, j) / mode_lib->vba.DISPCLK);
 				}
 			}
 		}
@@ -3062,66 +3035,6 @@ static double CalculateRemoteSurfaceFlipDelay(
 	return result;
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackLumaHTaps,
-		unsigned int WritebackLumaVTaps,
-		unsigned int WritebackChromaHTaps,
-		unsigned int WritebackChromaVTaps,
-		unsigned int WritebackDestinationWidth)
-{
-	double CalculateWriteBackDelay =
-			dml_max(
-					dml_ceil(WritebackLumaHTaps / 4.0, 1) / WritebackHRatio,
-					WritebackLumaVTaps * dml_ceil(1.0 / WritebackVRatio, 1)
-							* dml_ceil(
-									WritebackDestinationWidth
-											/ 4.0,
-									1)
-							+ dml_ceil(1.0 / WritebackVRatio, 1)
-									* (dml_ceil(
-											WritebackLumaVTaps
-													/ 4.0,
-											1) + 4));
-
-	if (WritebackPixelFormat != dm_444_32) {
-		CalculateWriteBackDelay =
-				dml_max(
-						CalculateWriteBackDelay,
-						dml_max(
-								dml_ceil(
-										WritebackChromaHTaps
-												/ 2.0,
-										1)
-										/ (2
-												* WritebackHRatio),
-								WritebackChromaVTaps
-										* dml_ceil(
-												1
-														/ (2
-																* WritebackVRatio),
-												1)
-										* dml_ceil(
-												WritebackDestinationWidth
-														/ 2.0
-														/ 2.0,
-												1)
-										+ dml_ceil(
-												1
-														/ (2
-																* WritebackVRatio),
-												1)
-												* (dml_ceil(
-														WritebackChromaVTaps
-																/ 4.0,
-														1)
-														+ 4)));
-	}
-	return CalculateWriteBackDelay;
-}
-
 static void CalculateActiveRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
@@ -4744,15 +4657,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				if (mode_lib->vba.BlendingAndTiming[k] == k) {
 					if (mode_lib->vba.WritebackEnable[k] == true) {
 						locals->WritebackDelay[i][k] = mode_lib->vba.WritebackLatency
-								+ CalculateWriteBackDelay(
-										mode_lib->vba.WritebackPixelFormat[k],
-										mode_lib->vba.WritebackHRatio[k],
-										mode_lib->vba.WritebackVRatio[k],
-										mode_lib->vba.WritebackLumaHTaps[k],
-										mode_lib->vba.WritebackLumaVTaps[k],
-										mode_lib->vba.WritebackChromaHTaps[k],
-										mode_lib->vba.WritebackChromaVTaps[k],
-										mode_lib->vba.WritebackDestinationWidth[k]) / locals->RequiredDISPCLK[i][j];
+							+ dlm20_CalculateWriteBackDelay(locals, k) / locals->RequiredDISPCLK[i][j];
 					} else {
 						locals->WritebackDelay[i][k] = 0.0;
 					}
@@ -4761,15 +4666,8 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 								&& mode_lib->vba.WritebackEnable[m]
 										== true) {
 							locals->WritebackDelay[i][k] = dml_max(locals->WritebackDelay[i][k],
-											mode_lib->vba.WritebackLatency + CalculateWriteBackDelay(
-													mode_lib->vba.WritebackPixelFormat[m],
-													mode_lib->vba.WritebackHRatio[m],
-													mode_lib->vba.WritebackVRatio[m],
-													mode_lib->vba.WritebackLumaHTaps[m],
-													mode_lib->vba.WritebackLumaVTaps[m],
-													mode_lib->vba.WritebackChromaHTaps[m],
-													mode_lib->vba.WritebackChromaVTaps[m],
-													mode_lib->vba.WritebackDestinationWidth[m]) / locals->RequiredDISPCLK[i][j]);
+											mode_lib->vba.WritebackLatency +
+											       dlm20_CalculateWriteBackDelay(locals, m) / locals->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 479e2c1a1301..229548733177 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -268,15 +268,7 @@ static void CalculateFlipSchedule(
 		double *DestinationLinesToRequestRowInImmediateFlip,
 		double *final_flip_bw,
 		bool *ImmediateFlipSupportedForPipe);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		long WritebackDestinationWidth,
-		long WritebackDestinationHeight,
-		long WritebackSourceHeight,
-		unsigned int HTotal);
+double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal);
 static void CalculateDynamicMetadataParameters(
 		int MaxInterDCNTileRepeaters,
 		double DPPCLK,
@@ -2360,29 +2352,15 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		if (v->BlendingAndTiming[k] == k) {
 			if (v->WritebackEnable[k] == true) {
 				v->WritebackDelay[v->VoltageLevel][k] = v->WritebackLatency +
-						CalculateWriteBackDelay(v->WritebackPixelFormat[k],
-									v->WritebackHRatio[k],
-									v->WritebackVRatio[k],
-									v->WritebackVTaps[k],
-									v->WritebackDestinationWidth[k],
-									v->WritebackDestinationHeight[k],
-									v->WritebackSourceHeight[k],
-									v->HTotal[k]) / v->DISPCLK;
+					dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->DISPCLK;
 			} else
 				v->WritebackDelay[v->VoltageLevel][k] = 0;
 			for (j = 0; j < v->NumberOfActivePlanes; ++j) {
 				if (v->BlendingAndTiming[j] == k
 						&& v->WritebackEnable[j] == true) {
 					v->WritebackDelay[v->VoltageLevel][k] = dml_max(v->WritebackDelay[v->VoltageLevel][k],
-							v->WritebackLatency + CalculateWriteBackDelay(
-											v->WritebackPixelFormat[j],
-											v->WritebackHRatio[j],
-											v->WritebackVRatio[j],
-											v->WritebackVTaps[j],
-											v->WritebackDestinationWidth[j],
-											v->WritebackDestinationHeight[j],
-											v->WritebackSourceHeight[j],
-											v->HTotal[k]) / v->DISPCLK);
+											v->WritebackLatency +
+											dml30_CalculateWriteBackDelay(v, j, v->HTotal[k]) / v->DISPCLK);
 				}
 			}
 		}
@@ -3249,20 +3227,18 @@ double dml30_CalculateWriteBackDISPCLK(
 	return dml_max3(DISPCLK_H, DISPCLK_V, DISPCLK_HB);
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		long         WritebackDestinationWidth,
-		long         WritebackDestinationHeight,
-		long         WritebackSourceHeight,
-		unsigned int HTotal)
+double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal)
 {
-	double CalculateWriteBackDelay = 0;
-	double Line_length = 0;
-	double Output_lines_last_notclamped = 0;
-	double WritebackVInit = 0;
+	const double WritebackVRatio = vba->WritebackVRatio[i];
+	const unsigned int WritebackVTaps = vba->WritebackVTaps[i];
+	const long WritebackDestinationWidth = vba->WritebackDestinationWidth[i];
+	const long WritebackDestinationHeight = vba->WritebackDestinationHeight[i];
+	const long WritebackSourceHeight = vba->WritebackSourceHeight[i];
+
+	double CalculateWriteBackDelay;
+	double Line_length;
+	double Output_lines_last_notclamped;
+	double WritebackVInit;
 
 	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
 	Line_length = dml_max((double) WritebackDestinationWidth, dml_ceil(WritebackDestinationWidth / 6.0, 1) * WritebackVTaps);
@@ -4578,15 +4554,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				if (v->BlendingAndTiming[k] == k) {
 					if (v->WritebackEnable[k] == true) {
 						v->WritebackDelayTime[k] = v->WritebackLatency
-								+ CalculateWriteBackDelay(
-										v->WritebackPixelFormat[k],
-										v->WritebackHRatio[k],
-										v->WritebackVRatio[k],
-										v->WritebackVTaps[k],
-										v->WritebackDestinationWidth[k],
-										v->WritebackDestinationHeight[k],
-										v->WritebackSourceHeight[k],
-										v->HTotal[k]) / v->RequiredDISPCLK[i][j];
+							+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->RequiredDISPCLK[i][j];
 					} else {
 						v->WritebackDelayTime[k] = 0.0;
 					}
@@ -4595,15 +4563,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->WritebackDelayTime[k] = dml_max(
 									v->WritebackDelayTime[k],
 									v->WritebackLatency
-											+ CalculateWriteBackDelay(
-													v->WritebackPixelFormat[m],
-													v->WritebackHRatio[m],
-													v->WritebackVRatio[m],
-													v->WritebackVTaps[m],
-													v->WritebackDestinationWidth[m],
-													v->WritebackDestinationHeight[m],
-													v->WritebackSourceHeight[m],
-													v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
+									+ dml30_CalculateWriteBackDelay(v, m, v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 4e3356d12147..58dc4c046cf4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -258,15 +258,7 @@ static void CalculateFlipSchedule(
 		double PDEAndMetaPTEBytesPerFrame,
 		double MetaRowBytes,
 		double DPTEBytesPerRow);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		int WritebackDestinationWidth,
-		int WritebackDestinationHeight,
-		int WritebackSourceHeight,
-		unsigned int HTotal);
+double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal);
 
 static void CalculateVupdateAndDynamicMetadataParameters(
 		int MaxInterDCNTileRepeaters,
@@ -2508,15 +2500,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		if (v->BlendingAndTiming[k] == k) {
 			if (v->WritebackEnable[k] == true) {
 				v->WritebackDelay[v->VoltageLevel][k] = v->WritebackLatency
-						+ CalculateWriteBackDelay(
-								v->WritebackPixelFormat[k],
-								v->WritebackHRatio[k],
-								v->WritebackVRatio[k],
-								v->WritebackVTaps[k],
-								v->WritebackDestinationWidth[k],
-								v->WritebackDestinationHeight[k],
-								v->WritebackSourceHeight[k],
-								v->HTotal[k]) / v->DISPCLK;
+					+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->DISPCLK;
 			} else
 				v->WritebackDelay[v->VoltageLevel][k] = 0;
 			for (j = 0; j < v->NumberOfActivePlanes; ++j) {
@@ -2524,15 +2508,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->WritebackDelay[v->VoltageLevel][k] = dml_max(
 							v->WritebackDelay[v->VoltageLevel][k],
 							v->WritebackLatency
-									+ CalculateWriteBackDelay(
-											v->WritebackPixelFormat[j],
-											v->WritebackHRatio[j],
-											v->WritebackVRatio[j],
-											v->WritebackVTaps[j],
-											v->WritebackDestinationWidth[j],
-											v->WritebackDestinationHeight[j],
-											v->WritebackSourceHeight[j],
-											v->HTotal[k]) / v->DISPCLK);
+							+ dml30_CalculateWriteBackDelay(v, j, v->HTotal[k]) / v->DISPCLK);
 				}
 			}
 		}
@@ -3378,32 +3354,6 @@ double dml31_CalculateWriteBackDISPCLK(
 	return dml_max3(DISPCLK_H, DISPCLK_V, DISPCLK_HB);
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		int WritebackDestinationWidth,
-		int WritebackDestinationHeight,
-		int WritebackSourceHeight,
-		unsigned int HTotal)
-{
-	double CalculateWriteBackDelay;
-	double Line_length;
-	double Output_lines_last_notclamped;
-	double WritebackVInit;
-
-	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
-	Line_length = dml_max((double) WritebackDestinationWidth, dml_ceil(WritebackDestinationWidth / 6.0, 1) * WritebackVTaps);
-	Output_lines_last_notclamped = WritebackDestinationHeight - 1 - dml_ceil((WritebackSourceHeight - WritebackVInit) / WritebackVRatio, 1);
-	if (Output_lines_last_notclamped < 0) {
-		CalculateWriteBackDelay = 0;
-	} else {
-		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length + (HTotal - WritebackDestinationWidth) + 80;
-	}
-	return CalculateWriteBackDelay;
-}
-
 static void CalculateVupdateAndDynamicMetadataParameters(
 		int MaxInterDCNTileRepeaters,
 		double DPPCLK,
@@ -4848,15 +4798,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				if (v->BlendingAndTiming[k] == k) {
 					if (v->WritebackEnable[k] == true) {
 						v->WritebackDelayTime[k] = v->WritebackLatency
-								+ CalculateWriteBackDelay(
-										v->WritebackPixelFormat[k],
-										v->WritebackHRatio[k],
-										v->WritebackVRatio[k],
-										v->WritebackVTaps[k],
-										v->WritebackDestinationWidth[k],
-										v->WritebackDestinationHeight[k],
-										v->WritebackSourceHeight[k],
-										v->HTotal[k]) / v->RequiredDISPCLK[i][j];
+							+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->RequiredDISPCLK[i][j];
 					} else {
 						v->WritebackDelayTime[k] = 0.0;
 					}
@@ -4865,15 +4807,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->WritebackDelayTime[k] = dml_max(
 									v->WritebackDelayTime[k],
 									v->WritebackLatency
-											+ CalculateWriteBackDelay(
-													v->WritebackPixelFormat[m],
-													v->WritebackHRatio[m],
-													v->WritebackVRatio[m],
-													v->WritebackVTaps[m],
-													v->WritebackDestinationWidth[m],
-													v->WritebackDestinationHeight[m],
-													v->WritebackSourceHeight[m],
-													v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
+									+ dml30_CalculateWriteBackDelay(v, m, v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 2829f179f982..7024412fe441 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -292,15 +292,7 @@ static void CalculateFlipSchedule(
 		double *DestinationLinesToRequestRowInImmediateFlip,
 		double *final_flip_bw,
 		bool *ImmediateFlipSupportedForPipe);
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		int WritebackDestinationWidth,
-		int WritebackDestinationHeight,
-		int WritebackSourceHeight,
-		unsigned int HTotal);
+double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal);
 
 static void CalculateVupdateAndDynamicMetadataParameters(
 		int MaxInterDCNTileRepeaters,
@@ -2588,15 +2580,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		if (v->BlendingAndTiming[k] == k) {
 			if (v->WritebackEnable[k] == true) {
 				v->WritebackDelay[v->VoltageLevel][k] = v->WritebackLatency
-						+ CalculateWriteBackDelay(
-								v->WritebackPixelFormat[k],
-								v->WritebackHRatio[k],
-								v->WritebackVRatio[k],
-								v->WritebackVTaps[k],
-								v->WritebackDestinationWidth[k],
-								v->WritebackDestinationHeight[k],
-								v->WritebackSourceHeight[k],
-								v->HTotal[k]) / v->DISPCLK;
+					+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->DISPCLK;
 			} else
 				v->WritebackDelay[v->VoltageLevel][k] = 0;
 			for (j = 0; j < v->NumberOfActivePlanes; ++j) {
@@ -2604,15 +2588,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->WritebackDelay[v->VoltageLevel][k] = dml_max(
 							v->WritebackDelay[v->VoltageLevel][k],
 							v->WritebackLatency
-									+ CalculateWriteBackDelay(
-											v->WritebackPixelFormat[j],
-											v->WritebackHRatio[j],
-											v->WritebackVRatio[j],
-											v->WritebackVTaps[j],
-											v->WritebackDestinationWidth[j],
-											v->WritebackDestinationHeight[j],
-											v->WritebackSourceHeight[j],
-											v->HTotal[k]) / v->DISPCLK);
+							+ dml30_CalculateWriteBackDelay(v, j, v->HTotal[k]) / v->DISPCLK);
 				}
 			}
 		}
@@ -3602,32 +3578,6 @@ double dml314_CalculateWriteBackDISPCLK(
 	return dml_max3(DISPCLK_H, DISPCLK_V, DISPCLK_HB);
 }
 
-static double CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		int WritebackDestinationWidth,
-		int WritebackDestinationHeight,
-		int WritebackSourceHeight,
-		unsigned int HTotal)
-{
-	double CalculateWriteBackDelay;
-	double Line_length;
-	double Output_lines_last_notclamped;
-	double WritebackVInit;
-
-	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
-	Line_length = dml_max((double) WritebackDestinationWidth, dml_ceil(WritebackDestinationWidth / 6.0, 1) * WritebackVTaps);
-	Output_lines_last_notclamped = WritebackDestinationHeight - 1 - dml_ceil((WritebackSourceHeight - WritebackVInit) / WritebackVRatio, 1);
-	if (Output_lines_last_notclamped < 0) {
-		CalculateWriteBackDelay = 0;
-	} else {
-		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length + (HTotal - WritebackDestinationWidth) + 80;
-	}
-	return CalculateWriteBackDelay;
-}
-
 static void CalculateVupdateAndDynamicMetadataParameters(
 		int MaxInterDCNTileRepeaters,
 		double DPPCLK,
@@ -5092,15 +5042,7 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 				if (v->BlendingAndTiming[k] == k) {
 					if (v->WritebackEnable[k] == true) {
 						v->WritebackDelayTime[k] = v->WritebackLatency
-								+ CalculateWriteBackDelay(
-										v->WritebackPixelFormat[k],
-										v->WritebackHRatio[k],
-										v->WritebackVRatio[k],
-										v->WritebackVTaps[k],
-										v->WritebackDestinationWidth[k],
-										v->WritebackDestinationHeight[k],
-										v->WritebackSourceHeight[k],
-										v->HTotal[k]) / v->RequiredDISPCLK[i][j];
+							+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / v->RequiredDISPCLK[i][j];
 					} else {
 						v->WritebackDelayTime[k] = 0.0;
 					}
@@ -5109,15 +5051,7 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 							v->WritebackDelayTime[k] = dml_max(
 									v->WritebackDelayTime[k],
 									v->WritebackLatency
-											+ CalculateWriteBackDelay(
-													v->WritebackPixelFormat[m],
-													v->WritebackHRatio[m],
-													v->WritebackVRatio[m],
-													v->WritebackVTaps[m],
-													v->WritebackDestinationWidth[m],
-													v->WritebackDestinationHeight[m],
-													v->WritebackSourceHeight[m],
-													v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
+									+ dml30_CalculateWriteBackDelay(v, m, v->HTotal[m]) / v->RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index ad100658132f..9778effba7a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -597,15 +597,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		if (mode_lib->vba.BlendingAndTiming[k] == k) {
 			if (mode_lib->vba.WritebackEnable[k] == true) {
 				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = mode_lib->vba.WritebackLatency
-						+ dml32_CalculateWriteBackDelay(
-								mode_lib->vba.WritebackPixelFormat[k],
-								mode_lib->vba.WritebackHRatio[k],
-								mode_lib->vba.WritebackVRatio[k],
-								mode_lib->vba.WritebackVTaps[k],
-								mode_lib->vba.WritebackDestinationWidth[k],
-								mode_lib->vba.WritebackDestinationHeight[k],
-								mode_lib->vba.WritebackSourceHeight[k],
-								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK;
+					+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / mode_lib->vba.DISPCLK;
 			} else
 				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
 			for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
@@ -614,15 +606,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->WritebackDelay[mode_lib->vba.VoltageLevel][k] =
 						dml_max(v->WritebackDelay[mode_lib->vba.VoltageLevel][k],
 						mode_lib->vba.WritebackLatency +
-						dml32_CalculateWriteBackDelay(
-								mode_lib->vba.WritebackPixelFormat[j],
-								mode_lib->vba.WritebackHRatio[j],
-								mode_lib->vba.WritebackVRatio[j],
-								mode_lib->vba.WritebackVTaps[j],
-								mode_lib->vba.WritebackDestinationWidth[j],
-								mode_lib->vba.WritebackDestinationHeight[j],
-								mode_lib->vba.WritebackSourceHeight[j],
-								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK);
+							dml30_CalculateWriteBackDelay(v, j, v->HTotal[k]) / mode_lib->vba.DISPCLK);
 				}
 			}
 		}
@@ -2864,16 +2848,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					if (mode_lib->vba.WritebackEnable[k] == true) {
 						mode_lib->vba.WritebackDelayTime[k] =
 							mode_lib->vba.WritebackLatency
-						+ dml32_CalculateWriteBackDelay(
-							mode_lib->vba.WritebackPixelFormat[k],
-							mode_lib->vba.WritebackHRatio[k],
-							mode_lib->vba.WritebackVRatio[k],
-							mode_lib->vba.WritebackVTaps[k],
-							mode_lib->vba.WritebackDestinationWidth[k],
-							mode_lib->vba.WritebackDestinationHeight[k],
-							mode_lib->vba.WritebackSourceHeight[k],
-							mode_lib->vba.HTotal[k])
-							/ mode_lib->vba.RequiredDISPCLK[i][j];
+							+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / mode_lib->vba.RequiredDISPCLK[i][j];
 					} else {
 						mode_lib->vba.WritebackDelayTime[k] = 0.0;
 					}
@@ -2883,16 +2858,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.WritebackDelayTime[k] =
 								dml_max(mode_lib->vba.WritebackDelayTime[k],
 									mode_lib->vba.WritebackLatency
-								+ dml32_CalculateWriteBackDelay(
-									mode_lib->vba.WritebackPixelFormat[m],
-									mode_lib->vba.WritebackHRatio[m],
-									mode_lib->vba.WritebackVRatio[m],
-									mode_lib->vba.WritebackVTaps[m],
-									mode_lib->vba.WritebackDestinationWidth[m],
-									mode_lib->vba.WritebackDestinationHeight[m],
-									mode_lib->vba.WritebackSourceHeight[m],
-									mode_lib->vba.HTotal[m]) /
-									mode_lib->vba.RequiredDISPCLK[i][j]);
+									+ dml30_CalculateWriteBackDelay(v, m, v->HTotal[m]) / mode_lib->vba.RequiredDISPCLK[i][j]);
 						}
 					}
 				}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 5b5b94f1024d..a08de0dc080f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -2856,36 +2856,6 @@ void dml32_CalculateDCFCLKDeepSleep(
 #endif
 } // CalculateDCFCLKDeepSleep
 
-double dml32_CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		unsigned int         WritebackDestinationWidth,
-		unsigned int         WritebackDestinationHeight,
-		unsigned int         WritebackSourceHeight,
-		unsigned int HTotal)
-{
-	double CalculateWriteBackDelay;
-	double Line_length;
-	double Output_lines_last_notclamped;
-	double WritebackVInit;
-
-	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
-	Line_length = dml_max((double) WritebackDestinationWidth,
-			dml_ceil((double)WritebackDestinationWidth / 6.0, 1.0) * WritebackVTaps);
-	Output_lines_last_notclamped = WritebackDestinationHeight - 1 -
-			dml_ceil(((double)WritebackSourceHeight -
-					(double) WritebackVInit) / (double)WritebackVRatio, 1.0);
-	if (Output_lines_last_notclamped < 0) {
-		CalculateWriteBackDelay = 0;
-	} else {
-		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length +
-				(HTotal - WritebackDestinationWidth) + 80;
-	}
-	return CalculateWriteBackDelay;
-}
-
 void dml32_UseMinimumDCFCLK(
 		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
 		bool DRRDisplay[],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 3dbc9cf46aad..017acfe5af2f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -571,15 +571,7 @@ void dml32_CalculateDCFCLKDeepSleep(
 		/* Output */
 		double *DCFClkDeepSleep);
 
-double dml32_CalculateWriteBackDelay(
-		enum source_format_class WritebackPixelFormat,
-		double WritebackHRatio,
-		double WritebackVRatio,
-		unsigned int WritebackVTaps,
-		unsigned int         WritebackDestinationWidth,
-		unsigned int         WritebackDestinationHeight,
-		unsigned int         WritebackSourceHeight,
-		unsigned int HTotal);
+double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal);
 
 void dml32_UseMinimumDCFCLK(
 		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
-- 
2.27.0

