Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914BA6E769
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 01:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D165610E1B4;
	Tue, 25 Mar 2025 00:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vzf/nyeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C8D10E1B4;
 Tue, 25 Mar 2025 00:07:41 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e643f0933afso4794276276.1; 
 Mon, 24 Mar 2025 17:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742861260; x=1743466060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ueS3sg0skiZ5B94RVJ8gfXnjlig17yFC1p5JvUHrHSQ=;
 b=Vzf/nyeRCQbFSfN8ixGpJN9kZq/x+tDq3Jb26uLX0rF6JtQGKnWwuTb0mWj1vJb42n
 oU0O9tzCovNRM4fah/9vWt4CQSbyt5M3HTx/IzTYwPkkINNBT7jvB0HerIE7QiavW9I4
 y8foZ87Rm9aqPyFR3uODCcGL8y4SPqOJ+9zEFJnlnourf9fcqEV4J18Ui6eHBBUVYn+u
 2qu10YxrXCPvj5YePe44H3IjV5JDOibGJ2fa8HQZPMXj/MiZDAt+HJlezxkSMRo8tdY8
 75GrAwEmqi75L4uzT+0JauhBpe9+N6s5uMgPmrReTWR45cAAe+MJdtJOhyY26vN1wDSy
 ZSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742861260; x=1743466060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ueS3sg0skiZ5B94RVJ8gfXnjlig17yFC1p5JvUHrHSQ=;
 b=YsitEP/qiAoThPBDasHPBB0UNLAeDKcr4MJghljfng3OX+K2ImoBih1g9AXYxc8H1X
 0Rp9oJMcQmRxlpI189X1wa47RpD4rbAd0PEQeqmEUJFX1e3RpKsBYtXHPbcKeG+vIwHu
 36g/jZ0mitX50uZrvbKXz/o/BED5qGdzoG0sU1OmJoYCi92Fpb0kMbxoMfQU9FdqK1+R
 +45UJRdo6s5scaXm1DL8b5VqQ/RownTLvm+PvByvvUZGL6apaLNqUvpSk06OjM5p8Gz8
 vqH5PPFZlWiTirOvLRBUPvgOkuLi0RuCHhxSca4vwZw6IH+tgXHQXEE6g5oiT/GYrA7M
 ljmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwXi8kekSPQK7mWMAAuV/wVHeVr072LGgdz6M+VQ52Hsby0Sn+NOpG9JKIf7P7NODH3+kUQO3trG1m@lists.freedesktop.org,
 AJvYcCXzSMY2TGPkVvEBPSqE39BUSHpsr9Xctz7zRU14akFbEPTJdxNQXuU28DzqzInjNMfU02WKW+yF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFrLZ8DNZgEl8mKGH5VFpjyvaRAcr+Uxo756rtbNlMl0e/2+3k
 Ax+vdvdG1jeK0d5Y8Vk+Vc8kGSWvmGGiRykvcVokmbsu0IYuBdhr
X-Gm-Gg: ASbGncu9WD8I7QDArJSka4aGi+nasdkKpW/pKrT0FZnBfz2sM9aX9ZalvOliYkcHTgo
 FdjgJWIYevZOzTB4Uot9Avtety6xanxQjs0bCVYJu9JngIezS90EeYj0H7S8Vo/job6cXEXxMm5
 Ahb5kUedf47drP36MqmFlIsvNTyEfjhQdrivAcL/i1w1XqMJKWFhvoJv1yQJ9VWKJ3N2Ow78q1D
 PMdqzifwZUvi5UywaswotL/MlZVgAGAhWMiWPfw8LZjjkvUBsx24P9wCIr4YvtoTOZeujj+0Egq
 HvoxKnJD/THF9jid4BD7zxTykqn/XvyeB6k0DQiG3NSkMw==
X-Google-Smtp-Source: AGHT+IHNi/jAQcmpGL9LBE7dNmmgPZDCX+FC7T8JhHmV1cxK77RRmvhsjnVqb5X/bnsEaxoAKK3TXA==
X-Received: by 2002:a05:6902:278a:b0:e60:8cb8:a8da with SMTP id
 3f1490d57ef6-e6690dedd06mr26655181276.7.1742861260398; 
 Mon, 24 Mar 2025 17:07:40 -0700 (PDT)
Received: from velo.. ([191.104.150.128]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e66a442e19esm1824519276.36.2025.03.24.17.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 17:07:40 -0700 (PDT)
From: Andres Urian Florez <andres.emb.sys@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com, arnd@arndb.de,
 Tim.Huang@amd.com
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>, skhan@linuxfoundation.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Replace deprecated function strcpy() with
 strscpy()
Date: Mon, 24 Mar 2025 19:07:21 -0500
Message-ID: <20250325000723.366365-1-andres.emb.sys@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Instead of using the strcpy() deprecated function to populate the
fw_name, use the strscpy() function

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index 68bce6a6d09d..525e53c94f4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 		if (!adev->pm.fw) {
 			switch (adev->asic_type) {
 			case CHIP_TAHITI:
-				strcpy(fw_name, "radeon/tahiti_smc.bin");
+				strscpy(fw_name, "radeon/tahiti_smc.bin");
 				break;
 			case CHIP_PITCAIRN:
 				if ((adev->pdev->revision == 0x81) &&
 				    ((adev->pdev->device == 0x6810) ||
 				    (adev->pdev->device == 0x6811))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "radeon/pitcairn_k_smc.bin");
+					strscpy(fw_name, "radeon/pitcairn_k_smc.bin");
 				} else {
-					strcpy(fw_name, "radeon/pitcairn_smc.bin");
+					strscpy(fw_name, "radeon/pitcairn_smc.bin");
 				}
 				break;
 			case CHIP_VERDE:
@@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 					((adev->pdev->device == 0x6823) ||
 					(adev->pdev->device == 0x682b)))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "radeon/verde_k_smc.bin");
+					strscpy(fw_name, "radeon/verde_k_smc.bin");
 				} else {
-					strcpy(fw_name, "radeon/verde_smc.bin");
+					strscpy(fw_name, "radeon/verde_smc.bin");
 				}
 				break;
 			case CHIP_OLAND:
@@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 				    ((adev->pdev->revision == 0x83) &&
 					(adev->pdev->device == 0x6610))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "radeon/oland_k_smc.bin");
+					strscpy(fw_name, "radeon/oland_k_smc.bin");
 				} else {
-					strcpy(fw_name, "radeon/oland_smc.bin");
+					strscpy(fw_name, "radeon/oland_smc.bin");
 				}
 				break;
 			case CHIP_HAINAN:
@@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 					(adev->pdev->device == 0x6665) ||
 					 (adev->pdev->device == 0x6667)))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "radeon/hainan_k_smc.bin");
+					strscpy(fw_name, "radeon/hainan_k_smc.bin");
 				} else if ((adev->pdev->revision == 0xc3) &&
 					 (adev->pdev->device == 0x6665)) {
 					info->is_kicker = true;
-					strcpy(fw_name, "radeon/banks_k_2_smc.bin");
+					strscpy(fw_name, "radeon/banks_k_2_smc.bin");
 				} else {
-					strcpy(fw_name, "radeon/hainan_smc.bin");
+					strscpy(fw_name, "radeon/hainan_smc.bin");
 				}
 				break;
 			case CHIP_BONAIRE:
@@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 					(adev->pdev->revision == 0x81) ||
 					(adev->pdev->device == 0x665f)) {
 					info->is_kicker = true;
-					strcpy(fw_name, "amdgpu/bonaire_k_smc.bin");
+					strscpy(fw_name, "amdgpu/bonaire_k_smc.bin");
 				} else {
-					strcpy(fw_name, "amdgpu/bonaire_smc.bin");
+					strscpy(fw_name, "amdgpu/bonaire_smc.bin");
 				}
 				break;
 			case CHIP_HAWAII:
 				if (adev->pdev->revision == 0x80) {
 					info->is_kicker = true;
-					strcpy(fw_name, "amdgpu/hawaii_k_smc.bin");
+					strscpy(fw_name, "amdgpu/hawaii_k_smc.bin");
 				} else {
-					strcpy(fw_name, "amdgpu/hawaii_smc.bin");
+					strscpy(fw_name, "amdgpu/hawaii_smc.bin");
 				}
 				break;
 			case CHIP_TOPAZ:
@@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 				    ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD1)) ||
 				    ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD3))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "amdgpu/topaz_k_smc.bin");
+					strscpy(fw_name, "amdgpu/topaz_k_smc.bin");
 				} else
-					strcpy(fw_name, "amdgpu/topaz_smc.bin");
+					strscpy(fw_name, "amdgpu/topaz_smc.bin");
 				break;
 			case CHIP_TONGA:
 				if (((adev->pdev->device == 0x6939) && (adev->pdev->revision == 0xf1)) ||
 				    ((adev->pdev->device == 0x6938) && (adev->pdev->revision == 0xf1))) {
 					info->is_kicker = true;
-					strcpy(fw_name, "amdgpu/tonga_k_smc.bin");
+					strscpy(fw_name, "amdgpu/tonga_k_smc.bin");
 				} else
-					strcpy(fw_name, "amdgpu/tonga_smc.bin");
+					strscpy(fw_name, "amdgpu/tonga_smc.bin");
 				break;
 			case CHIP_FIJI:
-				strcpy(fw_name, "amdgpu/fiji_smc.bin");
+				strscpy(fw_name, "amdgpu/fiji_smc.bin");
 				break;
 			case CHIP_POLARIS11:
 				if (type == CGS_UCODE_ID_SMU) {
 					if (ASICID_IS_P21(adev->pdev->device, adev->pdev->revision)) {
 						info->is_kicker = true;
-						strcpy(fw_name, "amdgpu/polaris11_k_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris11_k_smc.bin");
 					} else if (ASICID_IS_P31(adev->pdev->device, adev->pdev->revision)) {
 						info->is_kicker = true;
-						strcpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
 					} else {
-						strcpy(fw_name, "amdgpu/polaris11_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris11_smc.bin");
 					}
 				} else if (type == CGS_UCODE_ID_SMU_SK) {
-					strcpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
+					strscpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
 				}
 				break;
 			case CHIP_POLARIS10:
 				if (type == CGS_UCODE_ID_SMU) {
 					if (ASICID_IS_P20(adev->pdev->device, adev->pdev->revision)) {
 						info->is_kicker = true;
-						strcpy(fw_name, "amdgpu/polaris10_k_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris10_k_smc.bin");
 					} else if (ASICID_IS_P30(adev->pdev->device, adev->pdev->revision)) {
 						info->is_kicker = true;
-						strcpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
 					} else {
-						strcpy(fw_name, "amdgpu/polaris10_smc.bin");
+						strscpy(fw_name, "amdgpu/polaris10_smc.bin");
 					}
 				} else if (type == CGS_UCODE_ID_SMU_SK) {
-					strcpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
+					strscpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
 				}
 				break;
 			case CHIP_POLARIS12:
 				if (ASICID_IS_P23(adev->pdev->device, adev->pdev->revision)) {
 					info->is_kicker = true;
-					strcpy(fw_name, "amdgpu/polaris12_k_smc.bin");
+					strscpy(fw_name, "amdgpu/polaris12_k_smc.bin");
 				} else {
-					strcpy(fw_name, "amdgpu/polaris12_smc.bin");
+					strscpy(fw_name, "amdgpu/polaris12_smc.bin");
 				}
 				break;
 			case CHIP_VEGAM:
-				strcpy(fw_name, "amdgpu/vegam_smc.bin");
+				strscpy(fw_name, "amdgpu/vegam_smc.bin");
 				break;
 			case CHIP_VEGA10:
 				if ((adev->pdev->device == 0x687f) &&
 					((adev->pdev->revision == 0xc0) ||
 					(adev->pdev->revision == 0xc1) ||
 					(adev->pdev->revision == 0xc3)))
-					strcpy(fw_name, "amdgpu/vega10_acg_smc.bin");
+					strscpy(fw_name, "amdgpu/vega10_acg_smc.bin");
 				else
-					strcpy(fw_name, "amdgpu/vega10_smc.bin");
+					strscpy(fw_name, "amdgpu/vega10_smc.bin");
 				break;
 			case CHIP_VEGA12:
-				strcpy(fw_name, "amdgpu/vega12_smc.bin");
+				strscpy(fw_name, "amdgpu/vega12_smc.bin");
 				break;
 			case CHIP_VEGA20:
-				strcpy(fw_name, "amdgpu/vega20_smc.bin");
+				strscpy(fw_name, "amdgpu/vega20_smc.bin");
 				break;
 			default:
 				DRM_ERROR("SMC firmware not supported\n");
-- 
2.43.0

