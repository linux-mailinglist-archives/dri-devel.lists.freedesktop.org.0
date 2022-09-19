Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97115BC16F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 04:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22010E0FE;
	Mon, 19 Sep 2022 02:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8657E10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 02:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663555037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7a6Yx196aUqplgt5mT2Q5wrzyl9YUk8UESPewUTSVmI=;
 b=U1fyW5zBLtweQmSrDtAnAX2IpbFuxlPG2kBP2p31loMXiGz17O7BHoY5iscQnfyHkDnEmL
 Rj6UKECAWnN+oDfljGbr/VTpncgExU/YyvI6R9NExs6lo924ioNj0bwX0J4U1TAB1jmwTE
 UgcPf4v3LuUInSdxidkLdcEAbXpRums=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-6NdQltTTMPusxrQuDQEUag-1; Sun, 18 Sep 2022 22:37:16 -0400
X-MC-Unique: 6NdQltTTMPusxrQuDQEUag-1
Received: by mail-qk1-f199.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso11139135qkp.16
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 19:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7a6Yx196aUqplgt5mT2Q5wrzyl9YUk8UESPewUTSVmI=;
 b=4h40RmEfP/hrf2ynQEIYmAn1zuH93xK3sZKSWlN3XxCbio6j7fWLUjlektx2GeGmxd
 aPtC5dWkbkKyDTJVj626KcmOT8lcTKHk81qXwquFgBMBtUU+NinfVQGhmurgbeMuTfBZ
 RvGjioC5k4EVCcyRP/g54LwDYsgZw/HuvuAlXL0K+3caZWx5mRhdILD+KUt0BkMq2X2q
 zgvdgGmsjhmk81hLzmIeDEGOgOEkUylmCpVTBReNGHhyaGVBmMvckoYZx/ndSl/yaaL2
 eJgy2qSzJlat/vkFj12bHcKghQVKMvMYSpcfI8bGdIiXQby4TkQwoA/cb2g30EatptKR
 1AXg==
X-Gm-Message-State: ACrzQf3Pb3Ql+0Nx/+P9f7PfGuuY42BbPoVt7p6UIqda0hCbN1Ch2QSE
 sl9tbZwmB994j+W5sjjnZpZKOdeVIPVlGdXv02Yya1xlOvCme7pOGEhpaMvAVgt45f2rJ+gHnMW
 jzBpMdnOR9ncsyzxgRKF7FoGcU74t
X-Received: by 2002:ac8:5b4d:0:b0:35b:b5fa:5e24 with SMTP id
 n13-20020ac85b4d000000b0035bb5fa5e24mr13585979qtw.163.1663555035112; 
 Sun, 18 Sep 2022 19:37:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47VVKyCebEesRkuNHbGB2XW5rQsuVvwBSNGfwnQtWukFFfXPDSFto/cMMKiuqOMdgKSB2s4w==
X-Received: by 2002:ac8:5b4d:0:b0:35b:b5fa:5e24 with SMTP id
 n13-20020ac85b4d000000b0035bb5fa5e24mr13585954qtw.163.1663555034848; 
 Sun, 18 Sep 2022 19:37:14 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05620a291200b006cf19068261sm743253qkp.116.2022.09.18.19.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 19:37:14 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, aric.cyr@amd.com,
 Nevenko.Stupar@amd.com, Pavle.Kotarac@amd.com, mairacanal@riseup.net,
 aurabindo.pillai@amd.com, Bing.Guo@amd.com, hamza.mahfooz@amd.com,
 nicholas.kazlauskas@amd.com, agustin.gutierrez@amd.com, nathan@kernel.org,
 mdaenzer@redhat.com, Charlene.Liu@amd.com
Subject: [PATCH] drm/amd/display: remove redundant CalculateTWait's
Date: Sun, 18 Sep 2022 22:37:09 -0400
Message-Id: <20220919023709.3447570-1-trix@redhat.com>
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

There are several copies of CalculateTwait.
Reduce to one instance and change local variable name to match common usage.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        | 16 +++++++-------
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 21 ++-----------------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 19 +----------------
 .../dc/dml/dcn30/display_mode_vba_30.c        | 18 +---------------
 .../dc/dml/dcn31/display_mode_vba_31.c        | 13 +-----------
 .../dc/dml/dcn314/display_mode_vba_314.c      | 13 +-----------
 6 files changed, 14 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 6e9d7e2b5243..4ca080950924 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -153,10 +153,10 @@ static unsigned int CalculateVMAndRowBytes(
 		bool *PTEBufferSizeNotExceeded,
 		unsigned int *dpte_row_height,
 		unsigned int *meta_row_height);
-static double CalculateTWait(
+double CalculateTWait(
 		unsigned int PrefetchMode,
 		double DRAMClockChangeLatency,
-		double UrgentLatencyPixelDataOnly,
+		double UrgentLatency,
 		double SREnterPlusExitTime);
 static double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
@@ -2892,20 +2892,20 @@ static void dml20_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 	}
 }
 
-static double CalculateTWait(
+double CalculateTWait(
 		unsigned int PrefetchMode,
 		double DRAMClockChangeLatency,
-		double UrgentLatencyPixelDataOnly,
+		double UrgentLatency,
 		double SREnterPlusExitTime)
 {
 	if (PrefetchMode == 0) {
 		return dml_max(
-				DRAMClockChangeLatency + UrgentLatencyPixelDataOnly,
-				dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly));
+				DRAMClockChangeLatency + UrgentLatency,
+				dml_max(SREnterPlusExitTime, UrgentLatency));
 	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly);
+		return dml_max(SREnterPlusExitTime, UrgentLatency);
 	} else {
-		return UrgentLatencyPixelDataOnly;
+		return UrgentLatency;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index b02dda8ce70f..2b4dcae4e432 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -177,10 +177,10 @@ static unsigned int CalculateVMAndRowBytes(
 		bool *PTEBufferSizeNotExceeded,
 		unsigned int *dpte_row_height,
 		unsigned int *meta_row_height);
-static double CalculateTWait(
+double CalculateTWait(
 		unsigned int PrefetchMode,
 		double DRAMClockChangeLatency,
-		double UrgentLatencyPixelDataOnly,
+		double UrgentLatency,
 		double SREnterPlusExitTime);
 static double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
@@ -2967,23 +2967,6 @@ static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 	}
 }
 
-static double CalculateTWait(
-		unsigned int PrefetchMode,
-		double DRAMClockChangeLatency,
-		double UrgentLatencyPixelDataOnly,
-		double SREnterPlusExitTime)
-{
-	if (PrefetchMode == 0) {
-		return dml_max(
-				DRAMClockChangeLatency + UrgentLatencyPixelDataOnly,
-				dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly));
-	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly);
-	} else {
-		return UrgentLatencyPixelDataOnly;
-	}
-}
-
 static double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 6be14f55c78d..a3ef3638d979 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -205,7 +205,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *DPDE0BytesFrame,
 		unsigned int *MetaPTEBytesFrame);
 
-static double CalculateTWait(
+double CalculateTWait(
 		unsigned int PrefetchMode,
 		double DRAMClockChangeLatency,
 		double UrgentLatency,
@@ -2980,23 +2980,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 	}
 }
 
-static double CalculateTWait(
-		unsigned int PrefetchMode,
-		double DRAMClockChangeLatency,
-		double UrgentLatency,
-		double SREnterPlusExitTime)
-{
-	if (PrefetchMode == 0) {
-		return dml_max(
-				DRAMClockChangeLatency + UrgentLatency,
-				dml_max(SREnterPlusExitTime, UrgentLatency));
-	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatency);
-	} else {
-		return UrgentLatency;
-	}
-}
-
 static double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 229548733177..74f5d9742f59 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -216,7 +216,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *PTERequestSize,
 		unsigned int *DPDE0BytesFrame,
 		unsigned int *MetaPTEBytesFrame);
-static double CalculateTWait(
+double CalculateTWait(
 		unsigned int PrefetchMode,
 		double DRAMClockChangeLatency,
 		double UrgentLatency,
@@ -3191,22 +3191,6 @@ void dml30_CalculateBytePerPixelAnd256BBlockSizes(
 	}
 }
 
-static double CalculateTWait(
-		unsigned int PrefetchMode,
-		double DRAMClockChangeLatency,
-		double UrgentLatency,
-		double SREnterPlusExitTime)
-{
-	if (PrefetchMode == 0) {
-		return dml_max(DRAMClockChangeLatency + UrgentLatency,
-				dml_max(SREnterPlusExitTime, UrgentLatency));
-	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatency);
-	} else {
-		return UrgentLatency;
-	}
-}
-
 double dml30_CalculateWriteBackDISPCLK(
 		enum source_format_class WritebackPixelFormat,
 		double PixelClock,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 58dc4c046cf4..4563342275f1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -230,7 +230,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *PTERequestSize,
 		int *DPDE0BytesFrame,
 		int *MetaPTEBytesFrame);
-static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
+double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
 static void CalculateRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
@@ -3323,17 +3323,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 			&dummysinglestring);
 }
 
-static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
-{
-	if (PrefetchMode == 0) {
-		return dml_max(DRAMClockChangeLatency + UrgentLatency, dml_max(SREnterPlusExitTime, UrgentLatency));
-	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatency);
-	} else {
-		return UrgentLatency;
-	}
-}
-
 double dml31_CalculateWriteBackDISPCLK(
 		enum source_format_class WritebackPixelFormat,
 		double PixelClock,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 7024412fe441..89a80eef42f4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -244,7 +244,7 @@ static unsigned int CalculateVMAndRowBytes(
 		unsigned int *PTERequestSize,
 		int *DPDE0BytesFrame,
 		int *MetaPTEBytesFrame);
-static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
+double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
 static void CalculateRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
@@ -3547,17 +3547,6 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
 	return true;
 }
 
-static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
-{
-	if (PrefetchMode == 0) {
-		return dml_max(DRAMClockChangeLatency + UrgentLatency, dml_max(SREnterPlusExitTime, UrgentLatency));
-	} else if (PrefetchMode == 1) {
-		return dml_max(SREnterPlusExitTime, UrgentLatency);
-	} else {
-		return UrgentLatency;
-	}
-}
-
 double dml314_CalculateWriteBackDISPCLK(
 		enum source_format_class WritebackPixelFormat,
 		double PixelClock,
-- 
2.27.0

