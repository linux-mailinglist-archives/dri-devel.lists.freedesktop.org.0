Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6EF3F421C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E22E89FAD;
	Sun, 22 Aug 2021 22:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8BD89EFF;
 Sun, 22 Aug 2021 22:20:56 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 t1-20020a4a54010000b02902638ef0f883so4818422ooa.11; 
 Sun, 22 Aug 2021 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ni3xpdDB8GNK9rWlWBqu7x4KSLePVRdyQjYMRMyg+sQ=;
 b=ITF1mY6xsorBFKwlhUEO+A76vVdmszAinrXETKotnURFjNZTS/FKpzv1ydJWQq4zla
 I2fF5JDyjIXuzRNWC7eM4jO1Vb4Pjj51d2LPeuK/v8BEjP4tIKA6cmNyCYakWaE6rCZI
 2SnN7IO6sRavuiIgtSzAMAXbsLvTgwe3t7rrKPBuXLD02ayAxgQhH+Lli6KXew4EcjVf
 9ExgyGs5ig/Lfr+GYONVbxf+5vig2oR4j5muzdSYp7lTz6T/oRcQDZKc8ZKKTJseqLtI
 Bf27w3grpW7rol1YfrFb4jMQmKQckke/jPr17gxZLV5vxZYkcQrLcoTKKFu1tk+6VIt1
 3jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ni3xpdDB8GNK9rWlWBqu7x4KSLePVRdyQjYMRMyg+sQ=;
 b=OepJkK0qhoJT1PeaVHKwo0xqpOdOUjkS4/iUl+U2dtMABbUgzDjTJwporqQHmtYCKC
 uvcVoHzGB24cySYV5XQZJXJvPv93sTdznOO1nV5WmyYWmOvTKyMWOQTLBxUQueszKkes
 iiINBfM8PjsWz0HNOdnvZpsG2fL+BMB2cgtJ2hs7fbuP8JVWjddGx+W2g05qz1ZkwrbU
 kVG+I54KHAzTGEcUUBqpMJjB0VNqZDVTytg2Y5BMThkAy3Fx5s1crrDqvBV0FznQvsRI
 5aEy/dEMI99Uz8AnAS71JlwZR/aq8gBBdh7ofPCgG+UfPrcdJQ+gfA8fC6ugrdmVd0KQ
 DpcQ==
X-Gm-Message-State: AOAM530E2047YAETAza/ZJ8wRooqQ+uJbvEmrj3KodZBm181DshS+pHB
 poT0bTzTVuvpkHv995sZlYU=
X-Google-Smtp-Source: ABdhPJz404u/1g2+oJbV9V75M6/ioujQS6ZTGZExEausMuc7tZu1OAuPN0oNjiVT1+1okKn9GpbvQg==
X-Received: by 2002:a4a:44:: with SMTP id 65mr23591498ooh.40.1629670855570;
 Sun, 22 Aug 2021 15:20:55 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 08/11] amdgpu_ucode: reduce number of pr_debug calls
Date: Sun, 22 Aug 2021 16:20:06 -0600
Message-Id: <20210822222009.2035788-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are blocks of DRM_DEBUG calls, consolidate their args into
single calls.  With dynamic-debug in use, each callsite consumes 56
bytes of ro callsite data, and this patch removes about 65 calls, so
it saves ~3.5kb.

no functional changes.

RFC: this creates multi-line log messages, does that break any syslog
conventions ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 293 ++++++++++++----------
 1 file changed, 158 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 2834981f8c08..14a9fef1f4c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -30,17 +30,26 @@
 
 static void amdgpu_ucode_print_common_hdr(const struct common_firmware_header *hdr)
 {
-	DRM_DEBUG("size_bytes: %u\n", le32_to_cpu(hdr->size_bytes));
-	DRM_DEBUG("header_size_bytes: %u\n", le32_to_cpu(hdr->header_size_bytes));
-	DRM_DEBUG("header_version_major: %u\n", le16_to_cpu(hdr->header_version_major));
-	DRM_DEBUG("header_version_minor: %u\n", le16_to_cpu(hdr->header_version_minor));
-	DRM_DEBUG("ip_version_major: %u\n", le16_to_cpu(hdr->ip_version_major));
-	DRM_DEBUG("ip_version_minor: %u\n", le16_to_cpu(hdr->ip_version_minor));
-	DRM_DEBUG("ucode_version: 0x%08x\n", le32_to_cpu(hdr->ucode_version));
-	DRM_DEBUG("ucode_size_bytes: %u\n", le32_to_cpu(hdr->ucode_size_bytes));
-	DRM_DEBUG("ucode_array_offset_bytes: %u\n",
-		  le32_to_cpu(hdr->ucode_array_offset_bytes));
-	DRM_DEBUG("crc32: 0x%08x\n", le32_to_cpu(hdr->crc32));
+	DRM_DEBUG("size_bytes: %u\n"
+		  "header_size_bytes: %u\n"
+		  "header_version_major: %u\n"
+		  "header_version_minor: %u\n"
+		  "ip_version_major: %u\n"
+		  "ip_version_minor: %u\n"
+		  "ucode_version: 0x%08x\n"
+		  "ucode_size_bytes: %u\n"
+		  "ucode_array_offset_bytes: %u\n"
+		  "crc32: 0x%08x\n",
+		  le32_to_cpu(hdr->size_bytes),
+		  le32_to_cpu(hdr->header_size_bytes),
+		  le16_to_cpu(hdr->header_version_major),
+		  le16_to_cpu(hdr->header_version_minor),
+		  le16_to_cpu(hdr->ip_version_major),
+		  le16_to_cpu(hdr->ip_version_minor),
+		  le32_to_cpu(hdr->ucode_version),
+		  le32_to_cpu(hdr->ucode_size_bytes),
+		  le32_to_cpu(hdr->ucode_array_offset_bytes),
+		  le32_to_cpu(hdr->crc32));
 }
 
 void amdgpu_ucode_print_mc_hdr(const struct common_firmware_header *hdr)
@@ -55,9 +64,9 @@ void amdgpu_ucode_print_mc_hdr(const struct common_firmware_header *hdr)
 		const struct mc_firmware_header_v1_0 *mc_hdr =
 			container_of(hdr, struct mc_firmware_header_v1_0, header);
 
-		DRM_DEBUG("io_debug_size_bytes: %u\n",
-			  le32_to_cpu(mc_hdr->io_debug_size_bytes));
-		DRM_DEBUG("io_debug_array_offset_bytes: %u\n",
+		DRM_DEBUG("io_debug_size_bytes: %u\n"
+			  "io_debug_array_offset_bytes: %u\n",
+			  le32_to_cpu(mc_hdr->io_debug_size_bytes),
 			  le32_to_cpu(mc_hdr->io_debug_array_offset_bytes));
 	} else {
 		DRM_ERROR("Unknown MC ucode version: %u.%u\n", version_major, version_minor);
@@ -82,13 +91,17 @@ void amdgpu_ucode_print_smc_hdr(const struct common_firmware_header *hdr)
 		switch (version_minor) {
 		case 0:
 			v2_0_hdr = container_of(hdr, struct smc_firmware_header_v2_0, v1_0.header);
-			DRM_DEBUG("ppt_offset_bytes: %u\n", le32_to_cpu(v2_0_hdr->ppt_offset_bytes));
-			DRM_DEBUG("ppt_size_bytes: %u\n", le32_to_cpu(v2_0_hdr->ppt_size_bytes));
+			DRM_DEBUG("ppt_offset_bytes: %u\n"
+				  "ppt_size_bytes: %u\n",
+				  le32_to_cpu(v2_0_hdr->ppt_offset_bytes),
+				  le32_to_cpu(v2_0_hdr->ppt_size_bytes));
 			break;
 		case 1:
 			v2_1_hdr = container_of(hdr, struct smc_firmware_header_v2_1, v1_0.header);
-			DRM_DEBUG("pptable_count: %u\n", le32_to_cpu(v2_1_hdr->pptable_count));
-			DRM_DEBUG("pptable_entry_offset: %u\n", le32_to_cpu(v2_1_hdr->pptable_entry_offset));
+			DRM_DEBUG("pptable_count: %u\n"
+				  "pptable_entry_offset: %u\n",
+				  le32_to_cpu(v2_1_hdr->pptable_count),
+				  le32_to_cpu(v2_1_hdr->pptable_entry_offset));
 			break;
 		default:
 			break;
@@ -111,10 +124,12 @@ void amdgpu_ucode_print_gfx_hdr(const struct common_firmware_header *hdr)
 		const struct gfx_firmware_header_v1_0 *gfx_hdr =
 			container_of(hdr, struct gfx_firmware_header_v1_0, header);
 
-		DRM_DEBUG("ucode_feature_version: %u\n",
-			  le32_to_cpu(gfx_hdr->ucode_feature_version));
-		DRM_DEBUG("jt_offset: %u\n", le32_to_cpu(gfx_hdr->jt_offset));
-		DRM_DEBUG("jt_size: %u\n", le32_to_cpu(gfx_hdr->jt_size));
+		DRM_DEBUG("ucode_feature_version: %u\n"
+			  "jt_offset: %u\n"
+			  "jt_size: %u\n",
+			  le32_to_cpu(gfx_hdr->ucode_feature_version),
+			  le32_to_cpu(gfx_hdr->jt_offset),
+			  le32_to_cpu(gfx_hdr->jt_size));
 	} else {
 		DRM_ERROR("Unknown GFX ucode version: %u.%u\n", version_major, version_minor);
 	}
@@ -132,82 +147,88 @@ void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr)
 		const struct rlc_firmware_header_v1_0 *rlc_hdr =
 			container_of(hdr, struct rlc_firmware_header_v1_0, header);
 
-		DRM_DEBUG("ucode_feature_version: %u\n",
-			  le32_to_cpu(rlc_hdr->ucode_feature_version));
-		DRM_DEBUG("save_and_restore_offset: %u\n",
-			  le32_to_cpu(rlc_hdr->save_and_restore_offset));
-		DRM_DEBUG("clear_state_descriptor_offset: %u\n",
-			  le32_to_cpu(rlc_hdr->clear_state_descriptor_offset));
-		DRM_DEBUG("avail_scratch_ram_locations: %u\n",
-			  le32_to_cpu(rlc_hdr->avail_scratch_ram_locations));
-		DRM_DEBUG("master_pkt_description_offset: %u\n",
+		DRM_DEBUG("ucode_feature_version: %u\n"
+			  "save_and_restore_offset: %u\n"
+			  "clear_state_descriptor_offset: %u\n"
+			  "avail_scratch_ram_locations: %u\n"
+			  "master_pkt_description_offset: %u\n",
+			  le32_to_cpu(rlc_hdr->ucode_feature_version),
+			  le32_to_cpu(rlc_hdr->save_and_restore_offset),
+			  le32_to_cpu(rlc_hdr->clear_state_descriptor_offset),
+			  le32_to_cpu(rlc_hdr->avail_scratch_ram_locations),
 			  le32_to_cpu(rlc_hdr->master_pkt_description_offset));
+
 	} else if (version_major == 2) {
 		const struct rlc_firmware_header_v2_0 *rlc_hdr =
 			container_of(hdr, struct rlc_firmware_header_v2_0, header);
 
-		DRM_DEBUG("ucode_feature_version: %u\n",
-			  le32_to_cpu(rlc_hdr->ucode_feature_version));
-		DRM_DEBUG("jt_offset: %u\n", le32_to_cpu(rlc_hdr->jt_offset));
-		DRM_DEBUG("jt_size: %u\n", le32_to_cpu(rlc_hdr->jt_size));
-		DRM_DEBUG("save_and_restore_offset: %u\n",
-			  le32_to_cpu(rlc_hdr->save_and_restore_offset));
-		DRM_DEBUG("clear_state_descriptor_offset: %u\n",
-			  le32_to_cpu(rlc_hdr->clear_state_descriptor_offset));
-		DRM_DEBUG("avail_scratch_ram_locations: %u\n",
-			  le32_to_cpu(rlc_hdr->avail_scratch_ram_locations));
-		DRM_DEBUG("reg_restore_list_size: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_restore_list_size));
-		DRM_DEBUG("reg_list_format_start: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_format_start));
-		DRM_DEBUG("reg_list_format_separate_start: %u\n",
+		DRM_DEBUG("ucode_feature_version: %u\n"
+			  "jt_offset: %u\n"
+			  "jt_size: %u\n"
+			  "save_and_restore_offset: %u\n"
+			  "clear_state_descriptor_offset: %u\n"
+			  "avail_scratch_ram_locations: %u\n"
+			  "reg_restore_list_size: %u\n"
+			  "reg_list_format_start: %u\n"
+			  "reg_list_format_separate_start: %u\n",
+			  le32_to_cpu(rlc_hdr->ucode_feature_version),
+			  le32_to_cpu(rlc_hdr->jt_offset),
+			  le32_to_cpu(rlc_hdr->jt_size),
+			  le32_to_cpu(rlc_hdr->save_and_restore_offset),
+			  le32_to_cpu(rlc_hdr->clear_state_descriptor_offset),
+			  le32_to_cpu(rlc_hdr->avail_scratch_ram_locations),
+			  le32_to_cpu(rlc_hdr->reg_restore_list_size),
+			  le32_to_cpu(rlc_hdr->reg_list_format_start),
 			  le32_to_cpu(rlc_hdr->reg_list_format_separate_start));
-		DRM_DEBUG("starting_offsets_start: %u\n",
-			  le32_to_cpu(rlc_hdr->starting_offsets_start));
-		DRM_DEBUG("reg_list_format_size_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_format_size_bytes));
-		DRM_DEBUG("reg_list_format_array_offset_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_format_array_offset_bytes));
-		DRM_DEBUG("reg_list_size_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_size_bytes));
-		DRM_DEBUG("reg_list_array_offset_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_array_offset_bytes));
-		DRM_DEBUG("reg_list_format_separate_size_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_format_separate_size_bytes));
-		DRM_DEBUG("reg_list_format_separate_array_offset_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_format_separate_array_offset_bytes));
-		DRM_DEBUG("reg_list_separate_size_bytes: %u\n",
-			  le32_to_cpu(rlc_hdr->reg_list_separate_size_bytes));
-		DRM_DEBUG("reg_list_separate_array_offset_bytes: %u\n",
+
+		DRM_DEBUG("starting_offsets_start: %u\n"
+			  "reg_list_format_size_bytes: %u\n"
+			  "reg_list_format_array_offset_bytes: %u\n"
+			  "reg_list_size_bytes: %u\n"
+			  "reg_list_array_offset_bytes: %u\n"
+			  "reg_list_format_separate_size_bytes: %u\n"
+			  "reg_list_format_separate_array_offset_bytes: %u\n"
+			  "reg_list_separate_size_bytes: %u\n"
+			  "reg_list_separate_array_offset_bytes: %u\n",
+			  le32_to_cpu(rlc_hdr->starting_offsets_start),
+			  le32_to_cpu(rlc_hdr->reg_list_format_size_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_format_array_offset_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_size_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_array_offset_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_format_separate_size_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_format_separate_array_offset_bytes),
+			  le32_to_cpu(rlc_hdr->reg_list_separate_size_bytes),
 			  le32_to_cpu(rlc_hdr->reg_list_separate_array_offset_bytes));
+
 		if (version_minor == 1) {
 			const struct rlc_firmware_header_v2_1 *v2_1 =
 				container_of(rlc_hdr, struct rlc_firmware_header_v2_1, v2_0);
-			DRM_DEBUG("reg_list_format_direct_reg_list_length: %u\n",
-				  le32_to_cpu(v2_1->reg_list_format_direct_reg_list_length));
-			DRM_DEBUG("save_restore_list_cntl_ucode_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_cntl_ucode_ver));
-			DRM_DEBUG("save_restore_list_cntl_feature_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_cntl_feature_ver));
-			DRM_DEBUG("save_restore_list_cntl_size_bytes %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_cntl_size_bytes));
-			DRM_DEBUG("save_restore_list_cntl_offset_bytes: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_cntl_offset_bytes));
-			DRM_DEBUG("save_restore_list_gpm_ucode_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_gpm_ucode_ver));
-			DRM_DEBUG("save_restore_list_gpm_feature_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_gpm_feature_ver));
-			DRM_DEBUG("save_restore_list_gpm_size_bytes %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_gpm_size_bytes));
-			DRM_DEBUG("save_restore_list_gpm_offset_bytes: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_gpm_offset_bytes));
-			DRM_DEBUG("save_restore_list_srm_ucode_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_srm_ucode_ver));
-			DRM_DEBUG("save_restore_list_srm_feature_ver: %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_srm_feature_ver));
-			DRM_DEBUG("save_restore_list_srm_size_bytes %u\n",
-				  le32_to_cpu(v2_1->save_restore_list_srm_size_bytes));
-			DRM_DEBUG("save_restore_list_srm_offset_bytes: %u\n",
+
+			DRM_DEBUG("reg_list_format_direct_reg_list_length: %u\n"
+				  "save_restore_list_cntl_ucode_ver: %u\n"
+				  "save_restore_list_cntl_feature_ver: %u\n"
+				  "save_restore_list_cntl_size_bytes %u\n"
+				  "save_restore_list_cntl_offset_bytes: %u\n"
+				  "save_restore_list_gpm_ucode_ver: %u\n"
+				  "save_restore_list_gpm_feature_ver: %u\n"
+				  "save_restore_list_gpm_size_bytes %u\n"
+				  "save_restore_list_gpm_offset_bytes: %u\n"
+				  "save_restore_list_srm_ucode_ver: %u\n"
+				  "save_restore_list_srm_feature_ver: %u\n"
+				  "save_restore_list_srm_size_bytes %u\n"
+				  "save_restore_list_srm_offset_bytes: %u\n",
+				  le32_to_cpu(v2_1->reg_list_format_direct_reg_list_length),
+				  le32_to_cpu(v2_1->save_restore_list_cntl_ucode_ver),
+				  le32_to_cpu(v2_1->save_restore_list_cntl_feature_ver),
+				  le32_to_cpu(v2_1->save_restore_list_cntl_size_bytes),
+				  le32_to_cpu(v2_1->save_restore_list_cntl_offset_bytes),
+				  le32_to_cpu(v2_1->save_restore_list_gpm_ucode_ver),
+				  le32_to_cpu(v2_1->save_restore_list_gpm_feature_ver),
+				  le32_to_cpu(v2_1->save_restore_list_gpm_size_bytes),
+				  le32_to_cpu(v2_1->save_restore_list_gpm_offset_bytes),
+				  le32_to_cpu(v2_1->save_restore_list_srm_ucode_ver),
+				  le32_to_cpu(v2_1->save_restore_list_srm_feature_ver),
+				  le32_to_cpu(v2_1->save_restore_list_srm_size_bytes),
 				  le32_to_cpu(v2_1->save_restore_list_srm_offset_bytes));
 		}
 	} else {
@@ -227,12 +248,14 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr)
 		const struct sdma_firmware_header_v1_0 *sdma_hdr =
 			container_of(hdr, struct sdma_firmware_header_v1_0, header);
 
-		DRM_DEBUG("ucode_feature_version: %u\n",
-			  le32_to_cpu(sdma_hdr->ucode_feature_version));
-		DRM_DEBUG("ucode_change_version: %u\n",
-			  le32_to_cpu(sdma_hdr->ucode_change_version));
-		DRM_DEBUG("jt_offset: %u\n", le32_to_cpu(sdma_hdr->jt_offset));
-		DRM_DEBUG("jt_size: %u\n", le32_to_cpu(sdma_hdr->jt_size));
+		DRM_DEBUG("ucode_feature_version: %u\n"
+			  "ucode_change_version: %u\n"
+			  "jt_offset: %u\n"
+			  "jt_size: %u\n",
+			  le32_to_cpu(sdma_hdr->ucode_feature_version),
+			  le32_to_cpu(sdma_hdr->ucode_change_version),
+			  le32_to_cpu(sdma_hdr->jt_offset),
+			  le32_to_cpu(sdma_hdr->jt_size));
 		if (version_minor >= 1) {
 			const struct sdma_firmware_header_v1_1 *sdma_v1_1_hdr =
 				container_of(sdma_hdr, struct sdma_firmware_header_v1_1, v1_0);
@@ -256,36 +279,36 @@ void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr)
 		const struct psp_firmware_header_v1_0 *psp_hdr =
 			container_of(hdr, struct psp_firmware_header_v1_0, header);
 
-		DRM_DEBUG("ucode_feature_version: %u\n",
-			  le32_to_cpu(psp_hdr->sos.fw_version));
-		DRM_DEBUG("sos_offset_bytes: %u\n",
-			  le32_to_cpu(psp_hdr->sos.offset_bytes));
-		DRM_DEBUG("sos_size_bytes: %u\n",
+		DRM_DEBUG("ucode_feature_version: %u\n"
+			  "sos_offset_bytes: %u\n"
+			  "sos_size_bytes: %u\n",
+			  le32_to_cpu(psp_hdr->sos.fw_version),
+			  le32_to_cpu(psp_hdr->sos.offset_bytes),
 			  le32_to_cpu(psp_hdr->sos.size_bytes));
 		if (version_minor == 1) {
 			const struct psp_firmware_header_v1_1 *psp_hdr_v1_1 =
 				container_of(psp_hdr, struct psp_firmware_header_v1_1, v1_0);
-			DRM_DEBUG("toc_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_1->toc.fw_version));
-			DRM_DEBUG("toc_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_1->toc.offset_bytes));
-			DRM_DEBUG("toc_size_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_1->toc.size_bytes));
-			DRM_DEBUG("kdb_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_1->kdb.fw_version));
-			DRM_DEBUG("kdb_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_1->kdb.offset_bytes));
-			DRM_DEBUG("kdb_size_bytes: %u\n",
+			DRM_DEBUG("toc_header_version: %u\n"
+				  "toc_offset_bytes: %u\n"
+				  "toc_size_bytes: %u\n"
+				  "kdb_header_version: %u\n"
+				  "kdb_offset_bytes: %u\n"
+				  "kdb_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_1->toc.fw_version),
+				  le32_to_cpu(psp_hdr_v1_1->toc.offset_bytes),
+				  le32_to_cpu(psp_hdr_v1_1->toc.size_bytes),
+				  le32_to_cpu(psp_hdr_v1_1->kdb.fw_version),
+				  le32_to_cpu(psp_hdr_v1_1->kdb.offset_bytes),
 				  le32_to_cpu(psp_hdr_v1_1->kdb.size_bytes));
 		}
 		if (version_minor == 2) {
 			const struct psp_firmware_header_v1_2 *psp_hdr_v1_2 =
 				container_of(psp_hdr, struct psp_firmware_header_v1_2, v1_0);
-			DRM_DEBUG("kdb_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_2->kdb.fw_version));
-			DRM_DEBUG("kdb_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_2->kdb.offset_bytes));
-			DRM_DEBUG("kdb_size_bytes: %u\n",
+			DRM_DEBUG("kdb_header_version: %u\n"
+				  "kdb_offset_bytes: %u\n"
+				  "kdb_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_2->kdb.fw_version),
+				  le32_to_cpu(psp_hdr_v1_2->kdb.offset_bytes),
 				  le32_to_cpu(psp_hdr_v1_2->kdb.size_bytes));
 		}
 		if (version_minor == 3) {
@@ -293,23 +316,23 @@ void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr)
 				container_of(psp_hdr, struct psp_firmware_header_v1_1, v1_0);
 			const struct psp_firmware_header_v1_3 *psp_hdr_v1_3 =
 				container_of(psp_hdr_v1_1, struct psp_firmware_header_v1_3, v1_1);
-			DRM_DEBUG("toc_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.fw_version));
-			DRM_DEBUG("toc_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.offset_bytes));
-			DRM_DEBUG("toc_size_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.size_bytes));
-			DRM_DEBUG("kdb_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.fw_version));
-			DRM_DEBUG("kdb_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.offset_bytes));
-			DRM_DEBUG("kdb_size_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.size_bytes));
-			DRM_DEBUG("spl_header_version: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->spl.fw_version));
-			DRM_DEBUG("spl_offset_bytes: %u\n",
-				  le32_to_cpu(psp_hdr_v1_3->spl.offset_bytes));
-			DRM_DEBUG("spl_size_bytes: %u\n",
+			DRM_DEBUG("toc_header_version: %u\n"
+				  "toc_offset_bytes: %u\n"
+				  "toc_size_bytes: %u\n"
+				  "kdb_header_version: %u\n"
+				  "kdb_offset_bytes: %u\n"
+				  "kdb_size_bytes: %u\n"
+				  "spl_header_version: %u\n"
+				  "spl_offset_bytes: %u\n"
+				  "spl_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.fw_version),
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.offset_bytes),
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc.size_bytes),
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.fw_version),
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.offset_bytes),
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb.size_bytes),
+				  le32_to_cpu(psp_hdr_v1_3->spl.fw_version),
+				  le32_to_cpu(psp_hdr_v1_3->spl.offset_bytes),
 				  le32_to_cpu(psp_hdr_v1_3->spl.size_bytes));
 		}
 	} else {
@@ -330,9 +353,9 @@ void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr)
 		const struct gpu_info_firmware_header_v1_0 *gpu_info_hdr =
 			container_of(hdr, struct gpu_info_firmware_header_v1_0, header);
 
-		DRM_DEBUG("version_major: %u\n",
-			  le16_to_cpu(gpu_info_hdr->version_major));
-		DRM_DEBUG("version_minor: %u\n",
+		DRM_DEBUG("version_major: %u\n"
+			  "version_minor: %u\n",
+			  le16_to_cpu(gpu_info_hdr->version_major),
 			  le16_to_cpu(gpu_info_hdr->version_minor));
 	} else {
 		DRM_ERROR("Unknown gpu_info ucode version: %u.%u\n", version_major, version_minor);
-- 
2.31.1

