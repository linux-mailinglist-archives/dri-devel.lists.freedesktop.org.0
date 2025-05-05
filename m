Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD3AA9F76
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591010E463;
	Mon,  5 May 2025 22:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AtBhl5QZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81F210E461;
 Mon,  5 May 2025 22:23:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 06E8849F22;
 Mon,  5 May 2025 22:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCBCC4CEE4;
 Mon,  5 May 2025 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483838;
 bh=hCFiE0D1eQdV+kal9Pml7UWOvkzVV1cn5Kgk9o95lzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AtBhl5QZs85XtcpxDp0zUa2Yj5spHsAotPcGcjXu8p4kq0XHhjVY7vUsu9vuzG5aK
 1UCz/93J6NncBCAjHB4cg1e4HIMB+eiSjG3dgGm5IyAkV+LPQ4J8JegkWksdF3MdN2
 RgJn6F7RCxSBnd8YH52oI/iC/ugy0k60HYEfGsuxi6JpWWIEWl6vbazWSoj5Y1n0e3
 vYN2Ssa0XnkOLCn4HcxSAS2KAcRf5XAcjmrANJX2Ga1uAeDL2H8NifU0EZgTFl0Lig
 LxqoRCcTEQn5VNH0rhRVg5zG7iIl+La6VQtaRFTpzDOq/fw6TrL/YEn+eR5yk5eoWb
 wH7TO02RJX4lQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 245/642] drm/xe: Disambiguate GMDID-based IP names
Date: Mon,  5 May 2025 18:07:41 -0400
Message-Id: <20250505221419.2672473-245-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

[ Upstream commit 0695c746f55c875f4cf20bab92533a800a0fe4d6 ]

The name of an IP is a function of its version. As such, given an IP
version, it should be clear to identify the name of that IP release.

With the current code, we keep that mapping clear for pre-GMDID IPs, but
ambiguous for GMDID-based ones. That causes two types of inconveniences:

 1. The end user, who might not have all the necessary mapping at hand,
    might be confused when seeing different possible IP names in the
    dmesg log.

 2. It makes a developer who is not familiar with the "IP version" to
    "Release name" need to resort to looking at the specs to understand
    see what version maps to what. While the specs should be the
    authority on the mapping, we should make our lives easier by
    reflecting that mapping in the source code.

Thus, since the IP name is tied to the version, let's  remove the
ambiguity by using a "name" field in struct gmdid_map instead of
accumulating names in the descriptor instances.

This does result in the code having IP name being defined in
different structs (gmdid_map, xe_graphics_desc, xe_media_desc), but that
will be resolved in upcoming changes.

A side-effect of this change is that media_xe2 exactly matches
media_xelpmp now, so we just re-use the latter.

v2:
  - Drop media_xe2 and re-use media_xelpmp. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250221-xe-unify-ip-descriptors-v2-2-5bc0c6d0c13f@intel.com
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_pci.c       | 36 +++++++++++--------------------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 +
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 39be74848e447..9b8813a518d72 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -150,7 +150,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
-	.name = "Xe_LPG",
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0),
@@ -174,8 +173,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 
 static const struct xe_graphics_desc graphics_xe2 = {
-	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
-
 	XE2_GFX_FEATURES,
 };
 
@@ -200,15 +197,6 @@ static const struct xe_media_desc media_xehpm = {
 };
 
 static const struct xe_media_desc media_xelpmp = {
-	.name = "Xe_LPM+",
-	.hw_engine_mask =
-		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
-		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-		BIT(XE_HW_ENGINE_GSCCS0)
-};
-
-static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -357,21 +345,21 @@ __diag_pop();
 
 /* Map of GMD_ID values to graphics IP */
 static const struct gmdid_map graphics_ip_map[] = {
-	{ 1270, &graphics_xelpg },
-	{ 1271, &graphics_xelpg },
-	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
-	{ 2004, &graphics_xe2 },
-	{ 3000, &graphics_xe2 },
-	{ 3001, &graphics_xe2 },
+	{ 1270, "Xe_LPG", &graphics_xelpg },
+	{ 1271, "Xe_LPG", &graphics_xelpg },
+	{ 1274, "Xe_LPG+", &graphics_xelpg },
+	{ 2001, "Xe2_HPG", &graphics_xe2 },
+	{ 2004, "Xe2_LPG", &graphics_xe2 },
+	{ 3000, "Xe3_LPG", &graphics_xe2 },
+	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
 /* Map of GMD_ID values to media IP */
 static const struct gmdid_map media_ip_map[] = {
-	{ 1300, &media_xelpmp },
-	{ 1301, &media_xe2 },
-	{ 2000, &media_xe2 },
-	{ 3000, &media_xe2 },
+	{ 1300, "Xe_LPM+", &media_xelpmp },
+	{ 1301, "Xe2_HPM", &media_xelpmp },
+	{ 2000, "Xe2_LPM", &media_xelpmp },
+	{ 3000, "Xe3_LPM", &media_xelpmp },
 };
 
 /*
@@ -566,6 +554,7 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
+			xe->info.graphics_name = graphics_ip_map[i].name;
 			*graphics = graphics_ip_map[i].ip;
 
 			break;
@@ -586,6 +575,7 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
+			xe->info.media_name = media_ip_map[i].name;
 			*media = media_ip_map[i].ip;
 
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 79b0f80376a4d..665b4447b2ebc 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -44,6 +44,7 @@ struct xe_media_desc {
 
 struct gmdid_map {
 	unsigned int ver;
+	const char *name;
 	const void *ip;
 };
 
-- 
2.39.5

