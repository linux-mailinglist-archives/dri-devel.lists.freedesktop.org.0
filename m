Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AED66D0DB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D2F10E07B;
	Mon, 16 Jan 2023 21:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E918F10E07B;
 Mon, 16 Jan 2023 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hD+7uyKw33Lwp0YuzHiWz1RVxGMk3M97nmlFr3nsiy0=; b=RR7YSsL2Zew/yJY78gvwuev6uJ
 Y7FQZ4PHmPi6WGa1pr+y6JLtN4LXDx4UhBxF9sEdIQwAg5utxZ2w8wbMwtFBXFsqhvFMWjPgCEWZ0
 Qb9Ef6TY0lyKeQr66I36jy7QwaBZOtJy/h2Hcv5OYaLY/NuDTD369uw9+P1a8T1Jt5wb2ubk7xcpI
 an1tD/FsR95WH8ihnHrcYxoZuwt+/xiBuUJN4LtTDmCTuUOqtRvyb8V4mFeD0ZHmSUpwrGuUXYk2V
 FILEbfAkyZWJvkj68fcfyeO5GxOmw/GkY2fo+lHVH/Td2D6g3qozjKpKaq8gjNOOOaJskDTfWjyQM
 VfPt6GnQ==;
Received: from [187.56.70.205] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHWuF-00A8mQ-HP; Mon, 16 Jan 2023 22:20:40 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking code
Date: Mon, 16 Jan 2023 18:20:03 -0300
Message-Id: <20230116212004.860968-2-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116212004.860968-1-gpiccoli@igalia.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Lazar Lijo <Lijo.Lazar@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently both conditionals checked to enable indirect SRAM are
repeated for all HW/IP models. Let's just simplify it a bit so
code is more compact and readable.

While at it, add the legacy names as a comment per case block, to
help whoever is reading the code and doesn't have much experience
with the name/number mapping.

Cc: James Zhu <James.Zhu@amd.com>
Cc: Lazar Lijo <Lijo.Lazar@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Sonny Jiang <sonny.jiang@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


Hi folks, first of all thanks in advance for reviews/comments!

This work is based on agd5f/amd-staging-drm-next branch - there is this
patch from Mario that refactored the amdgpu_vcn.c, and since it dropped
the legacy names from the switch cases, I've decided to also include them
here as comments.

I'm not sure if that's a good idea, feels good for somebody not so
used to the code read the codenames instead of purely numbers, but
if you wanna move away from the legacy names for good, lemme know
and I can rework without these comments.

Cheers,


Guilherme


 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 84 +++++--------------------
 1 file changed, 16 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 1b1a3c9e1863..1f880e162d9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -111,78 +111,26 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
 
 	switch (adev->ip_versions[UVD_HWIP][0]) {
-	case IP_VERSION(1, 0, 0):
-	case IP_VERSION(1, 0, 1):
-	case IP_VERSION(2, 5, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 2, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 6, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 0, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 0):
-	case IP_VERSION(3, 0, 64):
-	case IP_VERSION(3, 0, 192):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 16):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 33):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 1, 1):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
+	case IP_VERSION(1, 0, 0):	/* Raven (1/2) / Picasso */
+	case IP_VERSION(1, 0, 1):	/* Raven (1/2) / Picasso */
+	case IP_VERSION(2, 0, 0):	/* Navi10 */
+	case IP_VERSION(2, 0, 2):	/* Navi12 / Navi14 */
+	case IP_VERSION(2, 2, 0):	/* Renoir / Green Sardine */
+	case IP_VERSION(2, 5, 0):	/* Arcturus */
+	case IP_VERSION(2, 6, 0):	/* Aldebaran */
+	case IP_VERSION(3, 0, 0):	/* Sienna Cichlid / Navy Flounder */
+	case IP_VERSION(3, 0, 2):	/* Vangogh */
+	case IP_VERSION(3, 0, 64):	/* Sienna Cichlid / Navy Flounder */
+	case IP_VERSION(3, 0, 16):	/* Dimgray Cavefish */
+	case IP_VERSION(3, 0, 33):	/* Beige Goby */
+	case IP_VERSION(3, 0, 192):	/* Sienna Cichlid / Navy Flounder */
+	case IP_VERSION(3, 1, 1):	/* Yellow Carp */
 	case IP_VERSION(3, 1, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(4, 0, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
+	case IP_VERSION(4, 0, 0):	/* Vega10 */
 	case IP_VERSION(4, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
 	case IP_VERSION(4, 0, 4):
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
+		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	default:
-- 
2.39.0

