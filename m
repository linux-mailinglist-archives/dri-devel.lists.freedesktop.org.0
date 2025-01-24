Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0141A1B2A2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE85010E418;
	Fri, 24 Jan 2025 09:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T7sGEjIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4910E220;
 Fri, 24 Jan 2025 04:08:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ee76befe58so3060480a91.2; 
 Thu, 23 Jan 2025 20:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737691727; x=1738296527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D6e6R/iD1t4ReAa9KfZ1qSPqX0t3TQNshzKeYKkD9yY=;
 b=T7sGEjIGhF2uQVyVyilN8b2cSvd6im2obRj7geVlvH3UYHslJ7GyjGaoP6bID2vibE
 +FEfC0cRDz3DexT4O+jnQJNnXNCUajpuKC3yc1Jf7W9omgnoei/XavrsRvkTkJc186xe
 FOibf3tyS1weQGC4T5v1LyagzD1GDfd9LKUgrd5C4QEuF5tbRB5vjsetiyuspHUaDjbJ
 cZo4YRW2UZcolzOKDHE5kYuxhUkl+G6ijecMn8dRmU2TlMD6FHx7gJbDhTSXeCIocZ8D
 zyLy1JWRsCNt8W0bxa4zGFWXeUx+TYrnhUTgcfY9+im64u423A/GKcc/wyOdV1dJXATx
 rEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737691727; x=1738296527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6e6R/iD1t4ReAa9KfZ1qSPqX0t3TQNshzKeYKkD9yY=;
 b=D1NlCoEvoMdiBjJKJhU9EEwVCIdzoRGrk+uKMDJo5TLNnSl2bo+MEhSnbifykJxbD+
 dHwHHx1yTacs8Pf0HowjjCA1pmeDHpbjcCnMAy3lqz+OXgqdQmHULF4Otzvo/xTAhw0C
 YDs+D8GB/Gk0IuK4GiXA62frzVh4i4ufDN+GbsI/b/UDCMQI8me/r5QpsJpKbfAdvCix
 EAWxWR/7xlrQT7MhhmwT2bQNY0nHZ/0e3KI2JBYiq0oCfIEalWgsDO2yxrsF7s9azb7O
 G9rlpXudAbcVoChB2Gp0W6G2gofKZSc2BUIrqyRvJB/7l+fa7QsbGc5HNiHA7Waqvr/w
 zQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVERHqS8FEhgfYU5I8Nvh83xrUSQ2mUy1/Bb/Azh0p0lKA+f4HV7ZSsLtPQJYkl6zfeJu/a778XFLMY@lists.freedesktop.org,
 AJvYcCVT2wyqZ/rLRj39ZuYbhZHWxuIeJqm/e98jFwAvDSw8GFqKr4LyF7G7NCHowsOUf39cR7Uw9nEw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcNJuKunRfjWdY/A5U9jBEhR/16ho3XRptrx0unufoVkc61PZ+
 0/G0gMYwtvuOeXuWAyh3JlzSDw75ckm+vasnZ9Hijh/EiIVoQSzN
X-Gm-Gg: ASbGncswSHvlADefllCLgQtQbvfIi0iBBIOnYSWIlele/3uZj1NbvljGR25oiRHxCll
 K8tI3hc4NW6O6Aqpak6IS09cOfEbdnQd4csE/SjLME7uFdL9/HW1Odmso/tu2QtmP/PSAuZUSL7
 ny0PJyFxk6Y42r02HlOwECk2u70i3S24VW32URLApIkAZzzwoNIxx1iB26LjxxjOZU6Rnt8ZxNo
 lX8DdVzXgio7GYBZDHvaqQz4hISPPY8iM/y8PJIA9v6c1JVPMgPRcsoPZXpshqu5LIW7RGXNmN9
 ptfOOi8rDdLSu5IV3XiWfVuSrW2sBACodK8hmAt+
X-Google-Smtp-Source: AGHT+IGKwqK3FeAP7M3pDG/EPu8XOfZtrxx0RtjPTD4kt8b1n6567njef2h1tCvlNFusMRPQtdbLkw==
X-Received: by 2002:a17:90b:2808:b0:2ee:d433:7c54 with SMTP id
 98e67ed59e1d1-2f782cb61bemr40425091a91.19.1737691727590; 
 Thu, 23 Jan 2025 20:08:47 -0800 (PST)
Received: from jren-d3.localdomain ([221.222.59.195])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa455c0sm562670a91.3.2025.01.23.20.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 20:08:47 -0800 (PST)
From: Imkanmod Khan <imkanmodkhan@gmail.com>
To: stable@vger.kernel.org
Cc: patches@lists.linux.dev, alexander.deucher@amd.com, daniel.wheeler@amd.com,
 mario.limonciello@amd.com, josip.pavic@amd.com, aurabindo.pillai@amd.com,
 sohaib.nadeem@amd.com, gregkh@linuxfoundation.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, wayne.lin@amd.com,
 sashal@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, charlene.liu@amd.com, gabe.teeger@amd.com,
 amd-gfx@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com,
 Imkanmod Khan <imkanmodkhan@gmail.com>
Subject: [PATCH 6.1.y] drm/amd/display: fixed integer types and null check
 locations
Date: Fri, 24 Jan 2025 12:08:36 +0800
Message-ID: <20250124040836.7603-1-imkanmodkhan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Jan 2025 09:31:16 +0000
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

From: Sohaib Nadeem <sohaib.nadeem@amd.com>

[ Upstream commit 0484e05d048b66d01d1f3c1d2306010bb57d8738 ]

[why]:
issues fixed:
- comparison with wider integer type in loop condition which can cause
infinite loops
- pointer dereference before null check

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Josip Pavic <josip.pavic@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Sohaib Nadeem <sohaib.nadeem@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Imkanmod Khan <imkanmodkhan@gmail.com>
---
 .../gpu/drm/amd/display/dc/bios/bios_parser2.c   | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 4d2590964a20..75e44d8a7b40 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1862,19 +1862,21 @@ static enum bp_result get_firmware_info_v3_2(
 		/* Vega12 */
 		smu_info_v3_2 = GET_IMAGE(struct atom_smu_info_v3_2,
 							DATA_TABLES(smu_info));
-		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_2->gpuclk_ss_percentage);
 		if (!smu_info_v3_2)
 			return BP_RESULT_BADBIOSTABLE;
 
+		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_2->gpuclk_ss_percentage);
+
 		info->default_engine_clk = smu_info_v3_2->bootup_dcefclk_10khz * 10;
 	} else if (revision.minor == 3) {
 		/* Vega20 */
 		smu_info_v3_3 = GET_IMAGE(struct atom_smu_info_v3_3,
 							DATA_TABLES(smu_info));
-		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_3->gpuclk_ss_percentage);
 		if (!smu_info_v3_3)
 			return BP_RESULT_BADBIOSTABLE;
 
+		DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", smu_info_v3_3->gpuclk_ss_percentage);
+
 		info->default_engine_clk = smu_info_v3_3->bootup_dcefclk_10khz * 10;
 	}
 
@@ -2439,10 +2441,11 @@ static enum bp_result get_integrated_info_v11(
 	info_v11 = GET_IMAGE(struct atom_integrated_system_info_v1_11,
 					DATA_TABLES(integratedsysteminfo));
 
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v11->gpuclk_ss_percentage);
 	if (info_v11 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v11->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v11->gpucapinfo);
 	/*
@@ -2654,11 +2657,12 @@ static enum bp_result get_integrated_info_v2_1(
 
 	info_v2_1 = GET_IMAGE(struct atom_integrated_system_info_v2_1,
 					DATA_TABLES(integratedsysteminfo));
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_1->gpuclk_ss_percentage);
 
 	if (info_v2_1 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_1->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v2_1->gpucapinfo);
 	/*
@@ -2816,11 +2820,11 @@ static enum bp_result get_integrated_info_v2_2(
 	info_v2_2 = GET_IMAGE(struct atom_integrated_system_info_v2_2,
 					DATA_TABLES(integratedsysteminfo));
 
-	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_2->gpuclk_ss_percentage);
-
 	if (info_v2_2 == NULL)
 		return BP_RESULT_BADBIOSTABLE;
 
+	DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", info_v2_2->gpuclk_ss_percentage);
+
 	info->gpu_cap_info =
 	le32_to_cpu(info_v2_2->gpucapinfo);
 	/*
-- 
2.25.1

